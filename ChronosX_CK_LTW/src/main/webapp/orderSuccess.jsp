<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h2>Đặt hàng thành công!</h2>
    <p>Mã đơn hàng của bạn: ${param.orderId}</p>
    <p>Cảm ơn bạn đã mua sắm tại ChronosX.</p>
    <a href="products" class="btn btn-primary">Tiếp tục mua sắm</a>
</div>

<%@ include file="footer.jsp" %>