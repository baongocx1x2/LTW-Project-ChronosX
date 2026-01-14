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
        String idParam = request.getParameter("id");
        ProductDAO dao = new ProductDAO();
        
        // Nếu có parameter "id" -> hiển thị chi tiết sản phẩm
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(idParam);
                Product product = dao.getProductById(productId);
                
                if (product != null) {
                    request.setAttribute("product", product);
                    // Lấy thêm danh sách sản phẩm liên quan (để hiển thị ở cuối trang)
                    List<Product> relatedProducts = dao.getAllProducts();
                    request.setAttribute("relatedProducts", relatedProducts);
                    RequestDispatcher rd = request.getRequestDispatcher("/product-detail.jsp");
                    rd.forward(request, response);
                } else {
                    // Sản phẩm không tồn tại
                    response.sendRedirect("products");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("products");
            }
        } else {
            // Không có id -> hiển thị danh sách sản phẩm
            List<Product> products = dao.getAllProducts();
            request.setAttribute("products", products);
            RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
            rd.forward(request, response);
        }
    }
}