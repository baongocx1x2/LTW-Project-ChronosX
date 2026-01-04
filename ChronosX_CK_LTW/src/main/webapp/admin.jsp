<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Quản lý sản phẩm</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Mô tả</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.price}</td>
                    <td>${p.description}</td>
                    <td>
                        <a href="editProduct?id=${p.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="deleteProduct?id=${p.id}" class="btn btn-danger btn-sm">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="addProduct.jsp" class="btn btn-primary">Thêm sản phẩm</a>
</div>

<%@ include file="footer.jsp" %>