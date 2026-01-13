<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <c:if test="${empty cart}">
                <!-- Khung giỏ hàng mẫu (placeholder) khi chưa có dữ liệu từ CSDL -->
                <div class="row g-4 mb-4">
                    <div class="col-lg-8">
                        <div class="cart-table-wrapper cart-table-placeholder">
                            <table class="table align-middle cart-table mb-0">
                                <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th class="text-center">Số lượng</th>
                                    <th class="text-end">Đơn giá</th>
                                    <th class="text-end">Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach begin="1" end="3" var="i">
                                    <tr class="cart-row-placeholder">
                                        <td>
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="cart-item-thumb">
                                                    <span class="cart-placeholder cart-placeholder-image"></span>
                                                </div>
                                                <div class="w-100">
                                                    <span class="cart-placeholder cart-placeholder-line w-75 mb-1 d-block"></span>
                                                    <span class="cart-placeholder cart-placeholder-line w-50 d-block"></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="cart-placeholder cart-placeholder-pill d-inline-block"></span>
                                        </td>
                                        <td class="text-end">
                                            <span class="cart-placeholder cart-placeholder-line w-50 d-inline-block"></span>
                                        </td>
                                        <td class="text-end">
                                            <span class="cart-placeholder cart-placeholder-line w-50 d-inline-block"></span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-summary-card cart-summary-placeholder">
                            <span class="cart-placeholder cart-placeholder-line w-50 mb-3 d-block"></span>
                            <span class="cart-placeholder cart-placeholder-line w-100 mb-2 d-block"></span>
                            <span class="cart-placeholder cart-placeholder-line w-75 mb-2 d-block"></span>
                            <span class="cart-placeholder cart-placeholder-line w-50 mb-3 d-block"></span>
                            <span class="cart-placeholder cart-placeholder-btn d-block"></span>
                        </div>
                    </div>
                </div>

                <div class="cart-empty text-center py-4">
                    <div class="cart-empty-icon mb-3">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <h5>Giỏ hàng của bạn đang trống</h5>
                    
                    <a href="products" class="btn btn-primary">
                        Bắt đầu mua sắm
                    </a>
                </div>
            </c:if>

    <c:if test="${not empty cart}">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Tổng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>
                            <!-- Form cập nhật số lượng -->
                            <form action="cart" method="post" class="d-flex">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="productId" value="${item.product.id}"/>
                                <input type="number" name="quantity" value="${item.quantity}" min="1"
                                       class="form-control me-2" style="width:80px"/>
                                <button type="submit" class="btn btn-sm btn-success">Cập nhật</button>
                            </form>
                        </td>
                        <td>${item.product.price}</td>
                        <td>${item.totalPrice}</td>
                        <td>
                            <!-- Form xóa sản phẩm -->
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="remove"/>
                                <input type="hidden" name="productId" value="${item.product.id}"/>
                                <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-end">
            <form action="checkout" method="post">
                <button type="submit" class="btn btn-primary">Thanh toán</button>
            </form>
        </div>
    </section>
</div>

<%@ include file="footer.jsp" %>