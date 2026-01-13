<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <h2 class="mb-4">Lịch sử đơn hàng</h2>

    <c:if test="${empty orders}">
        <div class="alert alert-info">Bạn chưa có đơn hàng nào.</div>
    </c:if>

    <c:if test="${not empty orders}">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.total}</td>
                        <td>${order.status}</td>
                        <td>
                            <a href="orderDetail?orderId=${order.id}" class="btn btn-sm btn-primary">
                                Xem chi tiết
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<%@ include file="footer.jsp" %>