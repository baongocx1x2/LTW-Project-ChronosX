<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container mt-4" style="max-width: 400px;">
    <h2 class="mb-4 text-center">Đăng nhập</h2>
    <form action="auth" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Đăng nhập</button>
    </form>
    <p class="mt-3 text-center">Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
</div>

<%@ include file="footer.jsp" %>