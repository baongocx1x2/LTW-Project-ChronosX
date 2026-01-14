package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import dao.ProductDAO;
import model.Product;
import util.ValidationUtil;

public class AdminServlet extends HttpServlet {
    private ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // 🔴 THÊM MỚI: Lấy sản phẩm theo id để hiển thị form edit
            String idParam = request.getParameter("id");
            ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(idParam);
            
            if (!idResult.isValid()) {
                request.setAttribute("error", idResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }
            
            int id = Integer.parseInt(idParam);
            Product p = dao.getProductById(id);
            
            if (p == null) {
                request.setAttribute("error", "Sản phẩm không tồn tại");
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }
            
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
            String priceStr = request.getParameter("price");
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            // Validation
            ValidationUtil.ValidationResult nameResult = ValidationUtil.validateProductName(name);
            if (!nameResult.isValid()) {
                request.setAttribute("error", nameResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult brandResult = ValidationUtil.validateBrand(brand);
            if (!brandResult.isValid()) {
                request.setAttribute("error", brandResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult priceResult = ValidationUtil.validatePrice(priceStr);
            if (!priceResult.isValid()) {
                request.setAttribute("error", priceResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult descResult = ValidationUtil.validateDescription(description);
            if (!descResult.isValid()) {
                request.setAttribute("error", descResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            double price = Double.parseDouble(priceStr.trim());
            Product p = new Product();
            p.setName(name.trim());
            p.setBrand(brand.trim());
            p.setPrice(price);
            p.setDescription(description.trim());
            p.setImage(image != null ? image.trim() : "");

            dao.addProduct(p);

        } else if ("delete".equals(action)) {
            String idParam = request.getParameter("id");
            ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(idParam);
            
            if (!idResult.isValid()) {
                request.setAttribute("error", idResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }
            
            int id = Integer.parseInt(idParam);
            dao.deleteProduct(id);

        } else if ("update".equals(action)) {
            // 🔴 THÊM MỚI: Cập nhật sản phẩm
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String brand = request.getParameter("brand");
            String priceStr = request.getParameter("price");
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            // Validation ID
            ValidationUtil.ValidationResult idResult = ValidationUtil.validateId(idParam);
            if (!idResult.isValid()) {
                request.setAttribute("error", idResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            // Validation các trường khác
            ValidationUtil.ValidationResult nameResult = ValidationUtil.validateProductName(name);
            if (!nameResult.isValid()) {
                request.setAttribute("error", nameResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult brandResult = ValidationUtil.validateBrand(brand);
            if (!brandResult.isValid()) {
                request.setAttribute("error", brandResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult priceResult = ValidationUtil.validatePrice(priceStr);
            if (!priceResult.isValid()) {
                request.setAttribute("error", priceResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            ValidationUtil.ValidationResult descResult = ValidationUtil.validateDescription(description);
            if (!descResult.isValid()) {
                request.setAttribute("error", descResult.getErrorMessage());
                List<Product> products = dao.getAllProducts();
                request.setAttribute("products", products);
                RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                rd.forward(request, response);
                return;
            }

            int id = Integer.parseInt(idParam);
            double price = Double.parseDouble(priceStr.trim());
            Product p = new Product();
            p.setId(id);
            p.setName(name.trim());
            p.setBrand(brand.trim());
            p.setPrice(price);
            p.setDescription(description.trim());
            p.setImage(image != null ? image.trim() : "");

            dao.updateProduct(p);
        }

        response.sendRedirect("admin");
    }
}