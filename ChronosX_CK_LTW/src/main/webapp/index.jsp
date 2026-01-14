<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="css/index.css">

<div class="index-page">
    <!-- HERO SECTION -->
    <section class="hero-section">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <span class="badge bg-warning text-dark mb-3 hero-badge">Ưu đãi cuối năm</span>
                    <h1 class="hero-title">ChronosX - Định hình phong cách với từng nhịp thời gian</h1>
                    <p class="hero-subtitle">
                        Bộ sưu tập đồng hồ chính hãng, thiết kế sang trọng, phù hợp cho cả công việc, dạo phố
                        và những sự kiện quan trọng.
                    </p>
                    <ul class="hero-highlights list-unstyled mb-4">
                        <li><i class="fa fa-check-circle text-success me-2"></i>Bảo hành chính hãng lên tới 5 năm</li>
                        <li><i class="fa fa-check-circle text-success me-2"></i>Miễn phí vận chuyển toàn quốc</li>
                        <li><i class="fa fa-check-circle text-success me-2"></i>Đổi trả trong 7 ngày nếu có lỗi từ NSX</li>
                    </ul>
                    <div class="d-flex flex-wrap gap-2">
                        <a href="products" class="btn btn-primary btn-lg">
                            Mua ngay
                            <i class="fa fa-arrow-right ms-2"></i>
                        </a>
                        <a href="news" class="btn btn-outline-light btn-lg">
                            Khám phá xu hướng
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div class="hero-image-wrapper hero-image-floating">
                        <img src="https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=800"
                             alt="Luxury watch" class="img-fluid hero-image">
                        <div class="hero-promo-card shadow-lg">
                            <h4 class="mb-1">Sale đến 30%</h4>
                            <p class="mb-0">Cho các mẫu đồng hồ 2025</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- BENEFIT STRIP -->
    <section class="benefit-strip">
        <div class="container py-4">
            <div class="row g-3 g-md-4 text-center text-md-start">
                <div class="col-6 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa fa-shield-halved"></i>
                        </div>
                        <h6>Bảo hành chính hãng</h6>
                        <p>Trung tâm bảo hành toàn quốc với kỹ thuật viên được ủy quyền.</p>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa fa-truck-fast"></i>
                        </div>
                        <h6>Giao hàng siêu tốc</h6>
                        <p>Giao trong 24h tại nội thành và 2–3 ngày cho tỉnh/thành khác.</p>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon">
                            <i class="fa fa-headset"></i>
                        </div>
                        <h6>Tư vấn 1:1</h6>
                        <p>Đội ngũ stylist hỗ trợ chọn mẫu phù hợp cá tính & ngân sách.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FEATURED PRODUCTS -->
    <section class="featured-section py-5">
        <div class="container">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end mb-4 gap-3">
                <div>
                    <h2 class="section-title mb-1">Sản phẩm nổi bật</h2>
                    <p class="text-muted mb-0">Lựa chọn được yêu thích nhất từ khách hàng của ChronosX</p>
                    <div class="featured-tags mt-2">
                        <span class="featured-tag">Luxury</span>
                        <span class="featured-tag">Classic</span>
                        <span class="featured-tag">Smartwatch</span>
                    </div>
                </div>
                <a href="products" class="btn btn-outline-primary d-none d-md-inline-flex align-items-center">
                    Xem tất cả
                    <i class="fa fa-arrow-right ms-2"></i>
                </a>
            </div>

          
            <c:choose>
                <c:when test="${not empty products}">
                    <div class="row g-4">
                        <c:forEach var="p" items="${products}">
                            <div class="col-6 col-md-4 col-lg-3">
                                <div class="product-card h-100 d-flex flex-column">
                                    <div class="product-image-wrapper">
                                        <c:choose>
                                            <c:when test="${not empty p.image}">
                                                <c:set var="imagePath" value="${p.image}" />
                                                <c:if test="${!p.image.startsWith('http') && !p.image.startsWith('/')}">
                                                    <c:set var="imagePath" value="${pageContext.request.contextPath}/${p.image}" />
                                                </c:if>
                                                <img src="${imagePath}" 
                                                     class="product-image" 
                                                     alt="${p.name}"
                                                     onerror="this.onerror=null; this.src='https://via.placeholder.com/400x400?text=No+Image';">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://via.placeholder.com/400x400?text=No+Image" class="product-image" alt="${p.name}">
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="product-tag">Hot</span>
                                    </div>
                                    <div class="product-content flex-grow-1 d-flex flex-column">
                                        <a href="products?id=${p.id}" class="text-decoration-none text-reset">
                                            <h5 class="product-title">${p.name}</h5>
                                            <p class="product-brand text-muted mb-1">Thương hiệu: ${p.brand}</p>
                                            <p class="product-price mb-3">
                                                <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0" /> VND
                                                <span class="product-price-note">Đã bao gồm VAT</span>
                                            </p>
                                        </a>
                                        <div class="mt-auto">
                                            <a href="products?id=${p.id}" class="btn btn-outline-primary w-100 btn-sm mb-2">
                                                <i class="fa fa-eye me-2"></i>Xem chi tiết
                                            </a>
                                            <form action="cart" method="post">
                                                <input type="hidden" name="productId" value="${p.id}" />
                                                <div class="d-flex align-items-center gap-2 mb-2">
                                                    <input type="number" name="quantity" value="1" min="1"
                                                           class="form-control form-control-sm text-center quantity-input"/>
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
                    <div class="featured-empty text-center py-5">
                        <h5>Hiện chưa có sản phẩm nổi bật</h5>
                        <p class="text-muted mb-3">
                            Chúng tôi đang cập nhật bộ sưu tập mới. Vui lòng quay lại sau hoặc xem toàn bộ sản phẩm.
                        </p>
                        <a href="products" class="btn btn-outline-primary">
                            Xem tất cả sản phẩm
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="text-center mt-4 d-md-none">
                <a href="products" class="btn btn-outline-primary btn-sm">
                    Xem tất cả sản phẩm
                </a>
            </div>
        </div>
    </section>

    <!-- CTA ĐĂNG KÝ NHẬN ƯU ĐÃI -->
    <section class="cta-subscribe-section">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="cta-subscribe-card">
                        <div class="row align-items-center g-3 g-md-4">
                            <div class="col-md-6">
                                <h3 class="cta-title">Đăng ký nhận ưu đãi độc quyền</h3>
                                <p class="cta-subtitle">
                                    Nhận thông tin sớm nhất về các đợt giảm giá, bộ sưu tập giới hạn và tips chọn đồng hồ.
                                </p>
                                <ul class="list-unstyled cta-list">
                                    <li><i class="fa fa-check me-2 text-success"></i>Không spam, chỉ gửi khi thực sự hữu ích</li>
                                    <li><i class="fa fa-check me-2 text-success"></i>Ưu đãi riêng cho thành viên email</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <form class="cta-subscribe-form">
                                    <div class="mb-2">
                                        <label for="ctaEmail" class="form-label">Email của bạn</label>
                                        <input type="email" id="ctaEmail" name="email"
                                               class="form-control form-control-lg"
                                               placeholder="nhapemail@vd.com">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-lg w-100">
                                        Đăng ký ngay
                                        <i class="fa fa-envelope-open-text ms-2"></i>
                                    </button>
                                    <p class="cta-note text-muted mt-2 mb-0">
                                        Bằng việc đăng ký, bạn đồng ý với chính sách bảo mật của ChronosX.
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

=======
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="css/index.css">

<div class="index-page">

    <!-- HERO SECTION -->
    <section class="hero-section">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <span class="badge bg-warning text-dark mb-3 hero-badge">
                        <fmt:message key="hero.badge"/>
                    </span>

                    <h1 class="hero-title">
                        <fmt:message key="hero.title"/>
                    </h1>

                    <p class="hero-subtitle">
                        <fmt:message key="hero.subtitle"/>
                    </p>

                    <ul class="hero-highlights list-unstyled mb-4">
                        <li><i class="fa fa-check-circle text-success me-2"></i>
                            <fmt:message key="hero.benefit1"/>
                        </li>
                        <li><i class="fa fa-check-circle text-success me-2"></i>
                            <fmt:message key="hero.benefit2"/>
                        </li>
                        <li><i class="fa fa-check-circle text-success me-2"></i>
                            <fmt:message key="hero.benefit3"/>
                        </li>
                    </ul>

                    <div class="d-flex flex-wrap gap-2">
                        <a href="products" class="btn btn-primary btn-lg">
                            <fmt:message key="hero.buy"/>
                            <i class="fa fa-arrow-right ms-2"></i>
                        </a>
                        <a href="news" class="btn btn-outline-light btn-lg">
                            <fmt:message key="hero.explore"/>
                        </a>
                    </div>
                </div>

                <div class="col-lg-6 text-center">
                    <div class="hero-image-wrapper hero-image-floating">
                        <img src="https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=800"
                             alt="Luxury watch" class="img-fluid hero-image">
                        <div class="hero-promo-card shadow-lg">
                            <h4 class="mb-1">
                                <fmt:message key="hero.sale"/>
                            </h4>
                            <p class="mb-0">
                                <fmt:message key="hero.sale.note"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- BENEFITS -->
    <section class="benefit-strip">
        <div class="container py-4">
            <div class="row g-3 g-md-4 text-center text-md-start">

                <div class="col-6 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon"><i class="fa fa-shield-halved"></i></div>
                        <h6><fmt:message key="benefit.warranty"/></h6>
                        <p><fmt:message key="benefit.warranty.desc"/></p>
                    </div>
                </div>

                <div class="col-6 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon"><i class="fa fa-truck-fast"></i></div>
                        <h6><fmt:message key="benefit.shipping"/></h6>
                        <p><fmt:message key="benefit.shipping.desc"/></p>
                    </div>
                </div>

                <div class="col-12 col-md-4">
                    <div class="benefit-item">
                        <div class="benefit-icon"><i class="fa fa-headset"></i></div>
                        <h6><fmt:message key="benefit.support"/></h6>
                        <p><fmt:message key="benefit.support.desc"/></p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- FEATURED PRODUCTS -->
    <section class="featured-section py-5">
        <div class="container">

            <h2 class="section-title mb-1">
                <fmt:message key="featured.title"/>
            </h2>
            <p class="text-muted mb-3">
                <fmt:message key="featured.subtitle"/>
            </p>

            <c:choose>
                <c:when test="${not empty products}">
                    <div class="row g-4">
                        <c:forEach var="p" items="${products}">
                            <div class="col-6 col-md-4 col-lg-3">
                                <div class="product-card h-100">

                                    <img src="${p.image}" class="product-image" alt="${p.name}">

                                    <h5>${p.name}</h5>

                                    <p class="text-muted">
                                        <fmt:message key="product.brand"/>: ${p.brand}
                                    </p>

                                    <p>
                                        <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/> VND
                                        <span class="text-muted">
                                            <fmt:message key="product.vat"/>
                                        </span>
                                    </p>

                                    <a href="products?id=${p.id}" class="btn btn-outline-primary w-100 btn-sm">
                                        <fmt:message key="product.view"/>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="text-center py-5">
                        <h5><fmt:message key="featured.empty.title"/></h5>
                        <p class="text-muted">
                            <fmt:message key="featured.empty.subtitle"/>
                        </p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </section>

</div>

>>>>>>> stash
<%@ include file="footer.jsp" %>