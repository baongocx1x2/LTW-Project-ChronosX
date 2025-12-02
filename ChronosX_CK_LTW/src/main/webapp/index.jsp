<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>ChronosX - Trang chủ</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<header>
		<h1>ChronosX</h1>
		<p>Website bán đồng hồ thời trang</p>
	</header>

	<nav>
		<a href="index.jsp">Trang chủ</a> <a href="products">Sản phẩm</a> <a
			href="cart">Giỏ hàng</a> <a href="login.jsp">Đăng nhập</a>
	</nav>

	<div class="banner">
		<h2>Khuyến mãi cuối năm 🎉</h2>
		<p>Giảm giá tới 30% cho các mẫu đồng hồ mới nhất!</p>
	</div>

	<h2>Sản phẩm nổi bật</h2>
	<div class="products">
		<c:forEach var="p" items="${products}">
			<div class="product">
				<img src="${p.image}" alt="${p.name}" />
				<h3>${p.name}</h3>
				<p>Thương hiệu: ${p.brand}</p>
				<p>Giá: ${p.price} VND</p>
				<form action="cart" method="post">
					<input type="hidden" name="productId" value="${p.id}" /> <input
						type="number" name="quantity" value="1" min="1" />
					<button type="submit">Thêm vào giỏ</button>
				</form>
			</div>
		</c:forEach>
	</div>
</body>