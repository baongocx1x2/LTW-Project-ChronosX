<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Sửa sản phẩm</h2>
    <form action="updateProduct" method="post">
        <input type="hidden" name="id" value="${product.id}">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" class="form-control" value="${product.name}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" name="price" class="form-control" value="${product.price}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" required>${product.description}</textarea>
        </div>
        <button type="submit" class="btn btn-success">Cập nhật</button>
        <a href="admin.jsp" class="btn btn-secondary">Hủy</a>
    </form>
</div>

<%@ include file="footer.jsp" %>