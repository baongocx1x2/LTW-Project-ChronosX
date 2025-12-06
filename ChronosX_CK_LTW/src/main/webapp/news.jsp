<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <h2 class="mb-4">Tin tức về đồng hồ</h2>
    <div class="row">
        <c:forEach var="n" items="${newsList}">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <c:if test="${not empty n.image}">
                        <img src="${n.image}" class="card-img-top" alt="News Image">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${n.title}</h5>
                        <p class="card-text">${n.description}</p>
                        <a href="${n.url}" target="_blank" class="btn btn-primary">Đọc thêm</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>