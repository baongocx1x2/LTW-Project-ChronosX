<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-5">
    <h2 class="mb-4">Quản lý sản phẩm</h2>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Thương hiệu</th>
                <th>Giá</th>
                <th>Mô tả</th>
                <th>Ảnh</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.brand}</td>
                    <td>${p.price}</td>
                    <td>${p.description}</td>
                    <td>
                        <c:if test="${not empty p.image}">
                            <img src="${pageContext.request.contextPath}/${p.image}" 
                                 alt="${p.name}" width="80" height="80"
                                 onerror="this.onerror=null; this.src='https://via.placeholder.com/80x80?text=No+Image';">
                        </c:if>
                    </td>
                    <td>
                        <a href="editProduct?id=${p.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="deleteProduct?id=${p.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="addProduct.jsp" class="btn btn-primary">Thêm sản phẩm</a>
</div>

<%@ include file="footer.jsp" %>