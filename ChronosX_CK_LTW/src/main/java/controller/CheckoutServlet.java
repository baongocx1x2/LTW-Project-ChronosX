package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.List;

import dao.DBConnection;
import dao.ProductDAO;
import model.CartItem;
import model.Product;
import model.User;
import util.EmailService;
import util.ValidationUtil;

public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // Validation: Kiểm tra user đã đăng nhập
        if (user == null) {
            response.sendRedirect("login.jsp?error=" + java.net.URLEncoder.encode("Vui lòng đăng nhập để thanh toán", "UTF-8"));
            return;
        }

        // Validation: Kiểm tra giỏ hàng
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp?error=" + java.net.URLEncoder.encode("Giỏ hàng của bạn đang trống", "UTF-8"));
            return;
        }

        // Validation: Kiểm tra các item trong giỏ hàng
        for (CartItem item : cart) {
            if (item.getProduct() == null) {
                response.sendRedirect("cart.jsp?error=" + java.net.URLEncoder.encode("Giỏ hàng chứa sản phẩm không hợp lệ", "UTF-8"));
                return;
            }
            
            if (item.getQuantity() <= 0) {
                response.sendRedirect("cart.jsp?error=" + java.net.URLEncoder.encode("Số lượng sản phẩm không hợp lệ", "UTF-8"));
                return;
            }
        }

        double total = 0;
        for (CartItem item : cart) {
            if (item.getProduct() != null) {
                total += item.getTotalPrice();
            }
        }

        // Validation: Kiểm tra tổng tiền hợp lệ
        if (total <= 0) {
            response.sendRedirect("cart.jsp?error=" + java.net.URLEncoder.encode("Tổng tiền không hợp lệ", "UTF-8"));
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // 1. Tạo đơn hàng trong bảng orders
            String sqlOrder = "INSERT INTO orders(user_id, total, status) VALUES(?,?,?)";
            PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, user.getId());
            psOrder.setDouble(2, total);
            psOrder.setString(3, "Pending");
            psOrder.executeUpdate();

            // Lấy order_id vừa tạo
            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // 2. Lưu chi tiết sản phẩm vào order_items
            String sqlItem = "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(?,?,?,?)";
            PreparedStatement psItem = conn.prepareStatement(sqlItem);

            for (CartItem item : cart) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProduct().getId());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getProduct().getPrice());
                psItem.addBatch();
            }
            psItem.executeBatch();

            // 3. Gửi email xác nhận đơn hàng
            if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
                try {
                    String orderDetailsHtml = buildOrderDetailsHtml(cart);
                    System.out.println("Đang gửi email xác nhận đơn hàng #" + orderId + " đến: " + user.getEmail());
                    boolean emailSent = EmailService.sendOrderConfirmationEmail(
                        user.getEmail(),
                        orderId,
                        user.getFullname() != null ? user.getFullname() : user.getUsername(),
                        orderDetailsHtml,
                        total
                    );
                    if (emailSent) {
                        System.out.println("✓ Email xác nhận đơn hàng #" + orderId + " đã được gửi thành công đến: " + user.getEmail());
                    } else {
                        System.out.println("✗ Không thể gửi email xác nhận đơn hàng #" + orderId + " (kiểm tra cấu hình email trong EmailConfig)");
                    }
                } catch (Throwable e) {
                    // Bắt tất cả lỗi (kể cả NoClassDefFoundError) và không làm gián đoạn checkout
                    System.err.println("✗ Lỗi khi gửi email xác nhận đơn hàng (không ảnh hưởng đến đơn hàng): " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("⚠ Không có email của người dùng, bỏ qua gửi email xác nhận đơn hàng #" + orderId);
            }

            // 4. Xóa giỏ hàng trong session
            session.removeAttribute("cart");

            // 5. Redirect tới trang xác nhận
            response.sendRedirect("orderSuccess.jsp?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?error=checkout");
        }
    }
    
    /**
     * Tạo HTML cho chi tiết đơn hàng trong email
     */
    private String buildOrderDetailsHtml(List<CartItem> cart) {
        StringBuilder html = new StringBuilder();
        html.append("<table>");
        html.append("<thead>");
        html.append("<tr>");
        html.append("<th>Sản phẩm</th>");
        html.append("<th>Số lượng</th>");
        html.append("<th>Đơn giá</th>");
        html.append("<th>Thành tiền</th>");
        html.append("</tr>");
        html.append("</thead>");
        html.append("<tbody>");
        
        for (CartItem item : cart) {
            Product product = item.getProduct();
            if (product == null) {
                // Nếu product null, bỏ qua item này
                continue;
            }
            
            html.append("<tr>");
            html.append("<td>").append(product.getName()).append("</td>");
            html.append("<td>").append(item.getQuantity()).append("</td>");
            html.append("<td>").append(String.format("%,.0f", product.getPrice())).append(" VND</td>");
            html.append("<td>").append(String.format("%,.0f", item.getTotalPrice())).append(" VND</td>");
            html.append("</tr>");
        }
        
        html.append("</tbody>");
        html.append("</table>");
        
        return html.toString();
    }
}