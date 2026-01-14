<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Thêm sản phẩm mới</h2>
    <form action="addProduct" method="post">
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Thương hiệu</label>
            <input type="text" name="brand" class="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" step="0.01" name="price" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="4"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh (URL hoặc đường dẫn)</label>
            <input type="text" name="image" class="form-control" />
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
            <a href="admin.jsp" class="btn btn-secondary">Hủy</a>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>