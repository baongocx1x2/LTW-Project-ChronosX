<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>

<div class="container mt-5">
    <h2 class="mb-4">Đăng ký tài khoản</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">

                    <!-- Hiển thị thông báo -->
                    <c:if test="${param.error == 'pass'}">
                        <div class="alert alert-danger">Mật khẩu xác nhận không khớp!</div>
                    </c:if>
                    <c:if test="${param.error == '1'}">
                        <div class="alert alert-danger">Đăng ký thất bại, vui lòng thử lại!</div>
                    </c:if>
                    <c:if test="${param.success == '1'}">
                        <div class="alert alert-success">Đăng ký thành công, hãy đăng nhập!</div>
                    </c:if>

                    <!-- Form đăng ký -->
                    <form action="auth" method="post">
                        <input type="hidden" name="action" value="register"/>

                        <div class="mb-3">
                            <label class="form-label">Tên đăng nhập</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" name="fullname" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mật khẩu</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Xác nhận mật khẩu</label>
                            <input type="password" name="confirmPassword" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                    </form>

                    <p class="mt-3 text-center">
                        Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>