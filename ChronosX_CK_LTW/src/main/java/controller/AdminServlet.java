package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import dao.ProductDAO;
import model.Product;

public class AdminServlet extends HttpServlet {
    private ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // 🔴 THÊM MỚI: Lấy sản phẩm theo id để hiển thị form edit
            int id = Integer.parseInt(request.getParameter("id"));
            Product p = dao.getProductById(id);
            request.setAttribute("product", p);
            RequestDispatcher rd = request.getRequestDispatcher("/editProduct.jsp");
            rd.forward(request, response);
        } else {
            // Mặc định: hiển thị danh sách sản phẩm
            List<Product> products = dao.getAllProducts();
            request.setAttribute("products", products);
            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String brand = request.getParameter("brand");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            Product p = new Product();
            p.setName(name);
            p.setBrand(brand);
            p.setPrice(price);
            p.setDescription(description);
            p.setImage(image);

            dao.addProduct(p);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteProduct(id);

        } else if ("update".equals(action)) {
            // 🔴 THÊM MỚI: Cập nhật sản phẩm
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String brand = request.getParameter("brand");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            Product p = new Product();
            p.setId(id);
            p.setName(name);
            p.setBrand(brand);
            p.setPrice(price);
            p.setDescription(description);
            p.setImage(image);

            dao.updateProduct(p);
        }

        response.sendRedirect("admin");
    }
}