package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import model.CartItem;
import model.Product;
import dao.ProductDAO;
import util.ValidationUtil;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();
        
        // Xóa các item có product null (nếu có)
        cart.removeIf(item -> item.getProduct() == null);
        
        // Tính tổng tiền
        double total = 0;
        int totalItems = 0;
        for (CartItem item : cart) {
            if (item.getProduct() != null) {
                total += item.getTotalPrice();
                totalItems += item.getQuantity();
            }
        }
        
        request.setAttribute("cart", cart);
        request.setAttribute("cartTotal", total);
        request.setAttribute("cartTotalItems", totalItems);
        
        // Lấy thông báo từ session
        String success = (String) session.getAttribute("cartSuccess");
        String error = (String) session.getAttribute("cartError");
        if (success != null) {
            request.setAttribute("cartSuccess", success);
            session.removeAttribute("cartSuccess");
        }
        if (error != null) {
            request.setAttribute("cartError", error);
            session.removeAttribute("cartError");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        try {
            if ("add".equals(action)) {
                String productIdStr = request.getParameter("productId");
                String quantityStr = request.getParameter("quantity");
                
                // Validation: Product ID
                ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(productIdStr);
                if (!idResult.isValid()) {
                    session.setAttribute("cartError", idResult.getErrorMessage());
                    response.sendRedirect("cart");
                    return;
                }
                
                // Validation: Quantity
                ValidationUtil.ValidationResult qtyResult = ValidationUtil.validateQuantity(quantityStr);
                if (!qtyResult.isValid()) {
                    session.setAttribute("cartError", qtyResult.getErrorMessage());
                    response.sendRedirect("cart");
                    return;
                }
                
                int productId = Integer.parseInt(productIdStr);
                int quantity = Integer.parseInt(quantityStr);
                
                Product product = new ProductDAO().getProductById(productId);
                if (product == null) {
                    session.setAttribute("cartError", "Sản phẩm không tồn tại");
                    response.sendRedirect("cart");
                    return;
                }

                // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
                boolean found = false;
                for (CartItem item : cart) {
                    if (item.getProduct() != null && item.getProduct().getId() == productId) {
                        item.setQuantity(item.getQuantity() + quantity);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    cart.add(new CartItem(product, quantity));
                }
                
                session.setAttribute("cartSuccess", "Đã thêm sản phẩm vào giỏ hàng");

            } else if ("remove".equals(action)) {
                String productIdStr = request.getParameter("productId");
                ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(productIdStr);
                
                if (!idResult.isValid()) {
                    session.setAttribute("cartError", idResult.getErrorMessage());
                    response.sendRedirect("cart");
                    return;
                }
                
                int productId = Integer.parseInt(productIdStr);
                cart.removeIf(item -> item.getProduct() != null && item.getProduct().getId() == productId);
                session.setAttribute("cartSuccess", "Đã xóa sản phẩm khỏi giỏ hàng");

            } else if ("update".equals(action)) {
                String productIdStr = request.getParameter("productId");
                String quantityStr = request.getParameter("quantity");
                
                // Validation: Product ID
                ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(productIdStr);
                if (!idResult.isValid()) {
                    session.setAttribute("cartError", idResult.getErrorMessage());
                    response.sendRedirect("cart");
                    return;
                }
                
                // Validation: Quantity
                ValidationUtil.ValidationResult qtyResult = ValidationUtil.validateQuantity(quantityStr);
                if (!qtyResult.isValid()) {
                    session.setAttribute("cartError", qtyResult.getErrorMessage());
                    response.sendRedirect("cart");
                    return;
                }
                
                int productId = Integer.parseInt(productIdStr);
                int quantity = Integer.parseInt(quantityStr);
                
                boolean found = false;
                for (CartItem item : cart) {
                    if (item.getProduct() != null && item.getProduct().getId() == productId) {
                        item.setQuantity(quantity);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    session.setAttribute("cartError", "Không tìm thấy sản phẩm trong giỏ hàng");
                } else {
                    session.setAttribute("cartSuccess", "Đã cập nhật số lượng");
                }

            } else if ("clear".equals(action)) {
                cart.clear();
                session.setAttribute("cartSuccess", "Đã xóa tất cả sản phẩm khỏi giỏ hàng");
            }
            
            // Xóa các item có product null (nếu có)
            cart.removeIf(item -> item.getProduct() == null);

        } catch (NumberFormatException e) {
            session.setAttribute("cartError", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại thông tin nhập vào.");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("cartError", "Có lỗi xảy ra: " + e.getMessage());
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
}