<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<div class="container mt-4" style="max-width: 400px;">
    <h2 class="mb-4 text-center">Đăng nhập</h2>

    <!-- Hiển thị thông báo -->
    <c:if test="${param.error == '1'}">
        <div class="alert alert-danger">Tên đăng nhập hoặc mật khẩu không đúng!</div>
    </c:if>
    <c:if test="${param.success == '1'}">
        <div class="alert alert-success">Đăng ký thành công, hãy đăng nhập!</div>
    </c:if>
    <c:if test="${param.logout == '1'}">
        <div class="alert alert-info">Bạn đã đăng xuất thành công!</div>
    </c:if>

    <!-- Form đăng nhập -->
    <form action="auth" method="post">
        <input type="hidden" name="action" value="login"/>

        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username"
                   value="${param.username}" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password"
                   required autocomplete="off">
        </div>

        <button type="submit" class="btn btn-success w-100">Đăng nhập</button>
    </form>

    <p class="mt-3 text-center">
        Chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
    </p>
</div>

<%@ include file="footer.jsp" %>