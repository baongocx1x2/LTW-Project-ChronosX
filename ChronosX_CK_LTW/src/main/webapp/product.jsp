<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="css/product.css">

<div class="product-page">
	<section class="product-header-section">
		<div class="container py-4">
			<div
				class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
				<div>
					<h2 class="product-page-title mb-1">Danh sách sản phẩm</h2>
					<p class="text-muted mb-0">Khám phá bộ sưu tập đồng hồ đa dạng
						về phong cách và thương hiệu.</p>
				</div>
				<div class="product-toolbar d-flex flex-wrap gap-2">
					<div class="input-group input-group-sm product-search-group">
						<span class="input-group-text bg-white border-end-0"> <i
							class="fa fa-search text-muted"></i>
						</span> <input type="text" class="form-control border-start-0"
							placeholder="Tìm theo tên, thương hiệu...">
					</div>
					<select class="form-select form-select-sm product-sort-select">
						<option value="">Sắp xếp</option>
						<option value="price-asc">Giá tăng dần</option>
						<option value="price-desc">Giá giảm dần</option>
						<option value="newest">Mới nhất</option>
					</select>
				</div>
			</div>
		</div>
	</section>

	<section class="product-list-section py-4">
		<div class="container">
			<c:choose>
				<c:when test="${not empty products}">
					<div class="row g-4">
						<c:forEach var="p" items="${products}">
							<div class="col-6 col-md-4 col-lg-3">
								<div class="product-card h-100 d-flex flex-column">
									<div class="product-card-image-wrapper">
										<c:choose>
											<c:when test="${not empty p.image}">
												<c:set var="imagePath" value="${p.image}" />
												<c:if test="${!p.image.startsWith('http') && !p.image.startsWith('/')}">
													<c:set var="imagePath" value="${pageContext.request.contextPath}/${p.image}" />
												</c:if>
												<a href="products?id=${p.id}">
													<img src="${imagePath}" 
														 class="product-card-image" 
														 alt="${p.name}"
														 onerror="this.onerror=null; this.src='https://via.placeholder.com/400x400?text=No+Image';">
												</a>
											</c:when>
											<c:otherwise>
												<a href="products?id=${p.id}">
													<img src="https://via.placeholder.com/400x400?text=No+Image" class="product-card-image" alt="${p.name}">
												</a>
											</c:otherwise>
										</c:choose>
										<span class="product-card-tag">New</span>
									</div>
									<div class="product-card-body flex-grow-1 d-flex flex-column">
										<a href="products?id=${p.id}" class="text-decoration-none text-reset">
											<h5 class="product-card-title">${p.name}</h5>
											<p class="product-card-brand text-muted mb-1">${p.brand}</p>
											<p class="product-card-price mb-2">
												<fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0" /> VND
											</p>
											<div class="product-card-rating mb-2">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-alt"></i> <span
													class="rating-count text-muted">(123)</span>
											</div>
										</a>
										<div class="mt-auto">
											<a href="products?id=${p.id}" class="btn btn-outline-primary w-100 btn-sm mb-2">
												<i class="fa fa-eye me-2"></i>Xem chi tiết
											</a>
											<form action="cart" method="post">
												<input type="hidden" name="action" value="add" /> 
												<input type="hidden" name="productId" value="${p.id}" />
												<div class="d-flex align-items-center gap-2 mb-2">
													<input type="number" name="quantity" value="1" min="1"
														class="form-control form-control-sm text-center product-quantity-input" />
												</div>
												<button type="submit" class="btn btn-primary w-100 btn-sm">
													<i class="fa fa-cart-plus me-2"></i>Thêm vào giỏ
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row g-4 mb-4">
						<c:forEach begin="1" end="8" var="i">
							<div class="col-6 col-md-4 col-lg-3">
								<div
									class="product-card product-card-placeholder h-100 d-flex flex-column">
									<div class="product-card-image-wrapper placeholder-glow">
										<div class="placeholder placeholder-image"></div>
									</div>
									<div class="product-card-body flex-grow-1 d-flex flex-column">
										<div class="placeholder placeholder-title mb-2"></div>
										<div class="placeholder placeholder-text mb-1"></div>
										<div class="placeholder placeholder-text mb-3"></div>
										<div class="placeholder placeholder-btn mt-auto"></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="product-empty text-center py-4">

						<a href="index.jsp" class="btn btn-outline-primary"> Quay về
							trang chủ </a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</div>


<%@ include file="footer.jsp"%>