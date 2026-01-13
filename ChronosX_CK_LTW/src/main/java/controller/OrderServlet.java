package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import dao.DBConnection;
import dao.OrderDAO;
import model.Order;
import model.User;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            OrderDAO dao = new OrderDAO(conn);
            List<Order> orders = dao.getOrdersByUser(user.getId());
            request.setAttribute("orders", orders);
            RequestDispatcher rd = request.getRequestDispatcher("/orders.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
}