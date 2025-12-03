<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <div class="alert alert-info text-center">
        <h2>Khuyến mãi cuối năm 🎉</h2>
        <p>Giảm giá tới 30% cho các mẫu đồng hồ mới nhất!</p>
    </div>

    <h2 class="mb-4">Sản phẩm nổi bật</h2>
    <div class="row">
        <c:forEach var="p" items="${products}">
            <div class="col-md-3 mb-4">
                <div class="card h-100">
                    <img src="${p.image}" class="card-img-top" alt="${p.name}">
                    <div class="card-body">
                        <h5 class="card-title">${p.name}</h5>
                        <p class="card-text">Thương hiệu: ${p.brand}</p>
                        <p class="card-text text-danger fw-bold">${p.price} VND</p>
                        <form action="cart" method="post">
                            <input type="hidden" name="productId" value="${p.id}" />
                            <input type="number" name="quantity" value="1" min="1" class="form-control mb-2"/>
                            <button type="submit" class="btn btn-primary w-100">Thêm vào giỏ</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>