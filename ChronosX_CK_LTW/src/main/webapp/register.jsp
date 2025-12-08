<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp"%>

<div class="container mt-5">
	<h2 class="mb-4">Đăng ký tài khoản</h2>
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="register" method="post">
						<!-- 🔴 THÊM MỚI: Form đăng ký -->
						<div class="mb-3">
							<label class="form-label">Họ và tên</label> <input type="text"
								name="fullname" class="form-control" required>
						</div>
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control" required>
						</div>
						<div class="mb-3">
							<label class="form-label">Mật khẩu</label> <input type="password"
								name="password" class="form-control" required>
						</div>
						<div class="mb-3">
							<label class="form-label">Xác nhận mật khẩu</label> <input
								type="password" name="confirmPassword" class="form-control"
								required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Đăng
							ký</button>
						<!-- 🔴 THÊM MỚI KẾT THÚC -->
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