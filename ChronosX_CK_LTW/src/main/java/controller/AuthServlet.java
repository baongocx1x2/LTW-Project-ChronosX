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
import util.EmailService;
import util.ValidationUtil;

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

            // Validation: Username
            ValidationUtil.ValidationResult usernameResult = ValidationUtil.validateUsername(username);
            if (!usernameResult.isValid()) {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(usernameResult.getErrorMessage(), "UTF-8"));
                return;
            }

            // Validation: Email
            ValidationUtil.ValidationResult emailResult = ValidationUtil.validateEmail(email);
            if (!emailResult.isValid()) {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(emailResult.getErrorMessage(), "UTF-8"));
                return;
            }

            // Validation: Fullname
            ValidationUtil.ValidationResult fullnameResult = ValidationUtil.validateFullname(fullname);
            if (!fullnameResult.isValid()) {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(fullnameResult.getErrorMessage(), "UTF-8"));
                return;
            }

            // Validation: Password
            ValidationUtil.ValidationResult passwordResult = ValidationUtil.validatePassword(password);
            if (!passwordResult.isValid()) {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(passwordResult.getErrorMessage(), "UTF-8"));
                return;
            }

            // Validation: Confirm Password
            ValidationUtil.ValidationResult confirmResult = ValidationUtil.validatePasswordConfirm(password, confirm);
            if (!confirmResult.isValid()) {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(confirmResult.getErrorMessage(), "UTF-8"));
                return;
            }

            // Hash mật khẩu trước khi lưu
            String hashed = hashPassword(password);

            User u = new User();
            u.setFullname(fullname.trim());
            u.setEmail(email.trim());
            u.setUsername(username.trim());
            u.setPassword(hashed);

            if (dao.register(u)) {
                // Gửi email chào mừng (không làm gián đoạn quá trình đăng ký nếu có lỗi)
                try {
                    EmailService.sendWelcomeEmail(email, fullname);
                } catch (Throwable e) {
                    // Bắt tất cả lỗi (kể cả NoClassDefFoundError) và không làm gián đoạn đăng ký
                    System.err.println("Lỗi khi gửi email chào mừng (không ảnh hưởng đến đăng ký): " + e.getMessage());
                    e.printStackTrace();
                }
                response.sendRedirect("login.jsp?success=1");
            } else {
                response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode("Đăng ký thất bại, tên đăng nhập hoặc email có thể đã tồn tại", "UTF-8"));
            }

        } else if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Validation: Username không được rỗng
            if (ValidationUtil.isEmpty(username)) {
                response.sendRedirect("login.jsp?error=" + java.net.URLEncoder.encode("Tên đăng nhập không được để trống", "UTF-8"));
                return;
            }

            // Validation: Password không được rỗng
            if (ValidationUtil.isEmpty(password)) {
                response.sendRedirect("login.jsp?error=" + java.net.URLEncoder.encode("Mật khẩu không được để trống", "UTF-8"));
                return;
            }

            // Hash mật khẩu để so khớp với DB
            String hashed = hashPassword(password);

            User u = dao.login(username.trim(), hashed);
            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("login.jsp?error=" + java.net.URLEncoder.encode("Tên đăng nhập hoặc mật khẩu không đúng", "UTF-8"));
            }
        }
    }
}