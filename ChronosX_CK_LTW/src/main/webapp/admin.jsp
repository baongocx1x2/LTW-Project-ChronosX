<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <h2 class="mb-4">Quản trị sản phẩm</h2>

    <!-- Form thêm sản phẩm -->
    <div class="card mb-4">
        <div class="card-header">Thêm sản phẩm mới</div>
        <div class="card-body">
            <form action="admin" method="post">
                <input type="hidden" name="action" value="add"/>
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm</label>
                    <input type="text" name="name" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Thương hiệu</label>
                    <input type="text" name="brand" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Giá</label>
                    <input type="number" name="price" step="0.01" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea name="description" class="form-control"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ảnh (URL)</label>
                    <input type="text" name="image" class="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
            </form>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <h3>Danh sách sản phẩm</h3>
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên</th>
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
                    <td><img src="${p.image}" alt="${p.name}" style="height:50px;"/></td>
                    <td>
                        <form action="admin" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="id" value="${p.id}"/>
                            <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                        </form>
                        <!-- Có thể thêm nút sửa sau -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>