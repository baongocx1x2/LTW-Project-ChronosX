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
    </c:if>
</div>

<%@ include file="footer.jsp" %>