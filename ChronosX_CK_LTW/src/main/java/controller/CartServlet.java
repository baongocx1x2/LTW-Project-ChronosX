package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import model.CartItem;
import model.Product;
import dao.ProductDAO;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();
        request.setAttribute("cart", cart);
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

        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Product product = new ProductDAO().getProductById(productId);

            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(item.getQuantity() + quantity);
                    found = true;
                    break;
                }
            }
            if (!found) cart.add(new CartItem(product, quantity));

        } else if ("remove".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            cart.removeIf(item -> item.getProduct().getId() == productId);

        } else if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            for (CartItem item : cart) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(quantity);
                    break;
                }
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
}