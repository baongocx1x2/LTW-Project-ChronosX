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
                    <c:if test="${not empty param.error}">
                        <div class="alert alert-danger">${param.error}</div>
                    </c:if>
                    <c:if test="${param.success == '1'}">
                        <div class="alert alert-success">Đăng ký thành công, hãy đăng nhập!</div>
                    </c:if>

                    <!-- Form đăng ký -->
                    <form action="auth" method="post" id="registerForm">
                        <input type="hidden" name="action" value="register"/>

                        <div class="mb-3">
                            <label class="form-label">Tên đăng nhập</label>
                            <input type="text" name="username" id="username" class="form-control" 
                                   placeholder="3-20 ký tự, chỉ chữ cái, số và dấu gạch dưới" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" name="fullname" id="fullname" class="form-control" 
                                   placeholder="Nhập họ và tên đầy đủ" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" id="email" class="form-control" 
                                   placeholder="example@email.com" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mật khẩu</label>
                            <input type="password" name="password" id="password" class="form-control" 
                                   placeholder="Tối thiểu 6 ký tự" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Xác nhận mật khẩu</label>
                            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" 
                                   placeholder="Nhập lại mật khẩu" required>
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

<script src="js/validation.js"></script>
<%@ include file="footer.jsp"%>