<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Sản phẩm ChronosX</title></head>
<body>
<h2>Danh sách sản phẩm</h2>
<c:forEach var="p" items="${products}">
    <div>
        <img src="${p.image}" width="100"/>
        <h3>${p.name}</h3>
        <p>Thương hiệu: ${p.brand}</p>
        <p>Giá: ${p.price} VND</p>
        <p>${p.description}</p>
    </div>
</c:forEach>
</body>
</html>