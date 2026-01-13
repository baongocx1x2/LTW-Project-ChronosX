<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="css/product-detail.css">

<div class="product-detail-page">
    <c:choose>
        <c:when test="${not empty product}">
            <!-- Breadcrumb -->
            <section class="breadcrumb-section">
                <div class="container py-2">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="products">Sản phẩm</a></li>
                            <li class="breadcrumb-item active">${product.name}</li>
                        </ol>
                    </nav>
                </div>
            </section>

            <!-- Product Detail -->
            <section class="product-detail-section py-4">
                <div class="container">
                    <div class="row g-4">
                        <!-- Product Image -->
                        <div class="col-lg-6">
                            <div class="product-detail-image-wrapper">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <c:set var="imagePath" value="${product.image}" />
                                        <c:if test="${!product.image.startsWith('http') && !product.image.startsWith('/')}">
                                            <c:set var="imagePath" value="${pageContext.request.contextPath}/${product.image}" />
                                        </c:if>
                                        <img src="${imagePath}" 
                                             alt="${product.name}" 
                                             class="product-detail-image"
                                             onerror="this.onerror=null; this.src='https://via.placeholder.com/600x600?text=No+Image';">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/600x600?text=No+Image" alt="${product.name}" class="product-detail-image">
                                    </c:otherwise>
                                </c:choose>
                                <span class="product-detail-badge">Hot</span>
                            </div>
                        </div>

                        <!-- Product Info -->
                        <div class="col-lg-6">
                            <div class="product-detail-info">
                                <h1 class="product-detail-title">${product.name}</h1>
                                <div class="product-detail-meta mb-3">
                                    <span class="product-detail-brand">
                                        <i class="fa fa-tag me-1"></i>Thương hiệu: ${product.brand}
                                    </span>
                                    <div class="product-detail-rating mt-2">
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star-half-alt text-warning"></i>
                                        <span class="rating-text ms-2">4.5 (123 đánh giá)</span>
                                    </div>
                                </div>

                                <div class="product-detail-price-section mb-4">
                                    <div class="product-detail-price">
                                        <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0" /> VND
                                    </div>
                                    <p class="product-detail-price-note mb-0">
                                        <i class="fa fa-check-circle text-success me-1"></i>Đã bao gồm VAT
                                    </p>
                                </div>

                                <div class="product-detail-description mb-4">
                                    <h6 class="mb-2">Mô tả sản phẩm</h6>
                                    <p class="text-muted">
                                        <c:choose>
                                            <c:when test="${not empty product.description}">
                                                ${product.description}
                                            </c:when>
                                            <c:otherwise>
                                                Sản phẩm chất lượng cao từ thương hiệu ${product.brand}. Được thiết kế với sự chú ý đến từng chi tiết, mang lại trải nghiệm tuyệt vời cho người dùng.
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>

                                <!-- Features -->
                                <div class="product-detail-features mb-4">
                                    <h6 class="mb-2">Đặc điểm nổi bật</h6>
                                    <ul class="list-unstyled">
                                        <li><i class="fa fa-check text-success me-2"></i>Bảo hành chính hãng 5 năm</li>
                                        <li><i class="fa fa-check text-success me-2"></i>Miễn phí vận chuyển toàn quốc</li>
                                        <li><i class="fa fa-check text-success me-2"></i>Đổi trả trong 7 ngày</li>
                                        <li><i class="fa fa-check text-success me-2"></i>Hỗ trợ tư vấn 24/7</li>
                                    </ul>
                                </div>

                                <!-- Add to Cart Form -->
                                <form action="cart" method="post" class="product-detail-form">
                                    <input type="hidden" name="productId" value="${product.id}" />
                                    <div class="row g-2 mb-3">
                                        <div class="col-auto">
                                            <label class="form-label">Số lượng</label>
                                            <input type="number" name="quantity" value="1" min="1" 
                                                   class="form-control product-detail-quantity" required>
                                        </div>
                                    </div>
                                    <div class="d-flex gap-2 flex-wrap">
                                        <button type="submit" class="btn btn-primary btn-lg flex-grow-1">
                                            <i class="fa fa-cart-plus me-2"></i>Thêm vào giỏ hàng
                                        </button>
                                        <button type="button" class="btn btn-outline-primary btn-lg">
                                            <i class="fa fa-heart me-2"></i>Yêu thích
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Related Products -->
            <section class="related-products-section py-5">
                <div class="container">
                    <h3 class="section-title mb-4">Sản phẩm liên quan</h3>
                    <div class="row g-4">
                        <c:forEach var="p" items="${relatedProducts}" varStatus="status">
                            <c:if test="${p.id != product.id && status.index < 4}">
                                <div class="col-6 col-md-3">
                                    <div class="related-product-card">
                                        <a href="products?id=${p.id}" class="text-decoration-none">
                                            <div class="related-product-image-wrapper">
                                                <c:choose>
                                                    <c:when test="${not empty p.image}">
                                                        <c:set var="relatedImagePath" value="${p.image}" />
                                                        <c:if test="${!p.image.startsWith('http') && !p.image.startsWith('/')}">
                                                            <c:set var="relatedImagePath" value="${pageContext.request.contextPath}/${p.image}" />
                                                        </c:if>
                                                        <img src="${relatedImagePath}" 
                                                             alt="${p.name}" 
                                                             class="related-product-image"
                                                             onerror="this.onerror=null; this.src='https://via.placeholder.com/300x300?text=No+Image';">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://via.placeholder.com/300x300?text=No+Image" alt="${p.name}" class="related-product-image">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="related-product-info">
                                                <h6 class="related-product-name">${p.name}</h6>
                                                <p class="related-product-brand text-muted mb-1">${p.brand}</p>
                                                <p class="related-product-price">
                                                    <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0" /> VND
                                                </p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:when>
        <c:otherwise>
            <!-- Product not found -->
            <section class="product-not-found py-5">
                <div class="container text-center">
                    <div class="product-not-found-icon mb-3">
                        <i class="fa fa-exclamation-triangle"></i>
                    </div>
                    <h3>Sản phẩm không tồn tại</h3>
                    <p class="text-muted mb-4">Sản phẩm bạn đang tìm kiếm không có trong hệ thống.</p>
                    <a href="products" class="btn btn-primary">Quay lại danh sách sản phẩm</a>
                </div>
            </section>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="footer.jsp" %>

