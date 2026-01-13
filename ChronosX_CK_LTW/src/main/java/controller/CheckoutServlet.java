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
import model.CartItem;
import model.User;

public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp?error=empty");
            return;
        }

        double total = 0;
        for (CartItem item : cart) {
            total += item.getTotalPrice();
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

            // 3. Xóa giỏ hàng trong session
            session.removeAttribute("cart");

            // 4. Redirect tới trang xác nhận
            response.sendRedirect("orderSuccess.jsp?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?error=checkout");
        }
    }
}