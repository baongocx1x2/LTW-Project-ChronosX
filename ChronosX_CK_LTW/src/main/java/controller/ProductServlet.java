package controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ProductDAO;
import model.Product;
import java.util.List;

public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProducts();
        request.setAttribute("products", products);
        RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
        rd.forward(request, response);
    }
}