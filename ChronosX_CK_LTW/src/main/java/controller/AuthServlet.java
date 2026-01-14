package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import dao.UserDAO;
import model.User;

public class AuthServlet extends HttpServlet {
    private UserDAO dao = new UserDAO();

    // Hàm hash mật khẩu bằng SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirmPassword");

            // Kiểm tra confirmPassword
            if (!password.equals(confirm)) {
                response.sendRedirect("register.jsp?error=pass");
                return;
            }

            // Hash mật khẩu trước khi lưu
            String hashed = hashPassword(password);

            User u = new User();
            u.setFullname(fullname);
            u.setEmail(email);
            u.setUsername(username);
            u.setPassword(hashed);
            u.setRole("user");

            if (dao.register(u)) {
                response.sendRedirect("login.jsp?success=1");
            } else {
                response.sendRedirect("register.jsp?error=1");
            }

        } else if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Hash mật khẩu để so khớp với DB
            String hashed = hashPassword(password);

            User u = dao.login(username, hashed);
            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                session.setAttribute("userRole", u.getRole()); // thêm role vào session

                // Nếu là admin → vào trang admin
                if ("admin".equals(u.getRole())) {
                    response.sendRedirect("admin");
                } else {
                    // Nếu là user → vào trang index hoặc products
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        }
    }
}