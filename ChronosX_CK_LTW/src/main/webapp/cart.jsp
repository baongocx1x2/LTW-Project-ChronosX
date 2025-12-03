<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <h2 class="mb-4">Giỏ hàng của bạn</h2>

    <c:if test="${empty cart}">
        <div class="alert alert-warning">Giỏ hàng trống.</div>
    </c:if>

    <c:if test="${not empty cart}">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Tổng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>${item.product.price}</td>
                        <td>${item.totalPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-end">
            <button class="btn btn-primary">Thanh toán</button>
        </div>
    </c:if>
</div>

<%@ include file="footer.jsp" %>