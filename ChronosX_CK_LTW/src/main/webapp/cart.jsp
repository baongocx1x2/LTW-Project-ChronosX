<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- CSS riêng cho trang giỏ hàng -->
<link rel="stylesheet" href="css/cart.css">

<div class="cart-page">
    <section class="cart-header-section">
        <div class="container py-4">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                <div>
                    <h2 class="cart-title mb-1">Giỏ hàng của bạn</h2>
                    <p class="text-muted mb-0">Kiểm tra lại sản phẩm trước khi thanh toán.</p>
                </div>
                <div class="cart-steps d-flex align-items-center gap-2">
                    <span class="cart-step active">1. Giỏ hàng</span>
                    <span class="cart-step-separator"></span>
                    <span class="cart-step">2. Thông tin giao hàng</span>
                    <span class="cart-step-separator"></span>
                    <span class="cart-step">3. Thanh toán</span>
                </div>
            </div>
        </div>
    </section>

    <section class="cart-content-section py-4">
        <div class="container">
            <!-- Thông báo -->
            <c:if test="${not empty cartSuccess}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fa fa-check-circle me-2"></i>${cartSuccess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty cartError}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fa fa-exclamation-circle me-2"></i>${cartError}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fa fa-exclamation-circle me-2"></i>${param.error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${empty cart}">
                <div class="cart-empty text-center py-5">
                    <div class="cart-empty-icon mb-3">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <h5 class="mb-3">Giỏ hàng của bạn đang trống</h5>
                    <p class="text-muted mb-4">Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm.</p>
                    <a href="products" class="btn btn-primary btn-lg">
                        <i class="fa fa-shopping-bag me-2"></i>Bắt đầu mua sắm
                    </a>
                </div>
            </c:if>

            <c:if test="${not empty cart}">
                <div class="row g-4">
                    <!-- Danh sách sản phẩm -->
                    <div class="col-lg-8">
                        <div class="cart-table-wrapper">
                            <table class="table align-middle cart-table mb-0">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-end">Đơn giá</th>
                                        <th class="text-end">Thành tiền</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${cart}">
                                        <c:if test="${not empty item.product}">
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center gap-3">
                                                        <div class="cart-item-thumb">
                                                            <c:choose>
                                                                <c:when test="${not empty item.product.image}">
                                                                    <c:set var="imagePath" value="${item.product.image}" />
                                                                    <c:if test="${!item.product.image.startsWith('http') && !item.product.image.startsWith('/')}">
                                                                        <c:set var="imagePath" value="${pageContext.request.contextPath}/${item.product.image}" />
                                                                    </c:if>
                                                                    <img src="${imagePath}" 
                                                                         alt="${item.product.name}" 
                                                                         onerror="this.onerror=null; this.src='https://via.placeholder.com/60x60?text=No+Image';">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="https://via.placeholder.com/60x60?text=No+Image" alt="${item.product.name}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div>
                                                            <div class="cart-item-name">${item.product.name}</div>
                                                            <div class="text-muted small">${item.product.brand}</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <form action="cart" method="post" class="d-inline-flex align-items-center gap-2">
                                                        <input type="hidden" name="action" value="update"/>
                                                        <input type="hidden" name="productId" value="${item.product.id}"/>
                                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="9999"
                                                               class="form-control form-control-sm text-center cart-quantity-input" 
                                                               style="width:70px" required>
                                                        <button type="submit" class="btn btn-sm btn-outline-primary" title="Cập nhật">
                                                            <i class="fa fa-sync-alt"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                                <td class="text-end">
                                                    <fmt:formatNumber value="${item.product.price}" type="number" maxFractionDigits="0" /> VND
                                                </td>
                                                <td class="text-end fw-bold">
                                                    <fmt:formatNumber value="${item.totalPrice}" type="number" maxFractionDigits="0" /> VND
                                                </td>
                                                <td class="text-center">
                                                    <form action="cart" method="post" class="d-inline">
                                                        <input type="hidden" name="action" value="remove"/>
                                                        <input type="hidden" name="productId" value="${item.product.id}"/>
                                                        <button type="submit" class="btn btn-sm btn-outline-danger" title="Xóa"
                                                                onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Nút xóa tất cả -->
                        <div class="mt-3">
                            <form action="cart" method="post" class="d-inline">
                                <input type="hidden" name="action" value="clear"/>
                                <button type="submit" class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('Bạn có chắc muốn xóa tất cả sản phẩm khỏi giỏ hàng?');">
                                    <i class="fa fa-trash-alt me-2"></i>Xóa tất cả
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- Tóm tắt đơn hàng -->
                    <div class="col-lg-4">
                        <div class="cart-summary-card">
                            <h5 class="mb-4">Tóm tắt đơn hàng</h5>
                            
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Số lượng sản phẩm:</span>
                                <span class="fw-bold">${cartTotalItems}</span>
                            </div>
                            
                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">Tổng tiền:</span>
                                <span class="fw-bold text-primary fs-5">
                                    <fmt:formatNumber value="${cartTotal}" type="number" maxFractionDigits="0" /> VND
                                </span>
                            </div>
                            
                            <hr>
                            
                            <div class="d-flex justify-content-between mb-4">
                                <span class="fw-bold">Thành tiền:</span>
                                <span class="fw-bold text-primary fs-4">
                                    <fmt:formatNumber value="${cartTotal}" type="number" maxFractionDigits="0" /> VND
                                </span>
                            </div>
                            
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <form action="checkout" method="post">
                                        <button type="submit" class="btn btn-primary w-100 btn-lg">
                                            <i class="fa fa-credit-card me-2"></i>Thanh toán
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <a href="login.jsp" class="btn btn-primary w-100 btn-lg">
                                        <i class="fa fa-sign-in-alt me-2"></i>Đăng nhập để thanh toán
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            
                            <a href="products" class="btn btn-outline-primary w-100 mt-2">
                                <i class="fa fa-arrow-left me-2"></i>Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</div>

<script src="js/validation.js"></script>
<%@ include file="footer.jsp" %>
