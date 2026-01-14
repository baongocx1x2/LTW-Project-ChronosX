<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-5">
    <h2 class="mb-4">Sửa sản phẩm</h2>
    <form action="editProduct" method="post">
        <input type="hidden" name="id" value="${product.id}" />

        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" value="${product.name}" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Thương hiệu</label>
            <input type="text" name="brand" value="${product.brand}" class="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" step="0.01" name="price" value="${product.price}" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="4">${product.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh (URL hoặc đường dẫn)</label>
            <input type="text" name="image" value="${product.image}" class="form-control" />
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success">Lưu thay đổi</button>
            <a href="admin" class="btn btn-secondary">Hủy</a>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>