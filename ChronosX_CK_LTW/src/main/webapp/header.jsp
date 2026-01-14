<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session"/>
</c:if>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}"/>
<fmt:setBundle basename="messages"/>

<html>
<head>
    <title>ChronosX</title>

    <meta charset="UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/validation.css">
</head>

<body>

<header class="cx-header-top py-2">
    <div class="container d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-1">

        <a href="index.jsp" class="d-flex align-items-center gap-2 text-decoration-none text-reset">
            <span class="cx-logo-mark">CX</span>
            <div>
                <h1 class="h5 mb-0 fw-semibold">ChronosX</h1>
                <p class="mb-0 small text-secondary">
                    <fmt:message key="header.tagline"/>
                </p>
            </div>
        </a>

        <div class="cx-header-contact d-flex flex-wrap gap-3 justify-content-md-end mt-1 mt-md-0">
            <span>
                <i class="fa fa-phone me-1"></i>
                <fmt:message key="header.hotline"/>: 1900 123 456
            </span>
            <span>
                <i class="fa fa-clock me-1"></i>
                <fmt:message key="header.hours"/>
            </span>
        </div>

    </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light cx-navbar">
    <div class="container">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-lg-center">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <fmt:message key="nav.home"/>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="products">
                        <fmt:message key="nav.products"/>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link position-relative" href="cart">
                        <i class="fa fa-shopping-cart"></i>
                        <fmt:message key="nav.cart"/>

                        <c:if test="${not empty sessionScope.cart}">
                            <c:set var="cartItemCount" value="0"/>
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <c:set var="cartItemCount" value="${cartItemCount + item.quantity}"/>
                            </c:forEach>

                            <c:if test="${cartItemCount > 0}">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                      style="font-size:0.65rem">
                                    ${cartItemCount}
                                </span>
                            </c:if>
                        </c:if>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="news">
                        <i class="fa fa-newspaper"></i>
                        <fmt:message key="nav.news"/>
                    </a>
                </li>

                <!-- USER -->
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                ${sessionScope.user.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="profile.jsp"><fmt:message key="nav.profile"/></a></li>
                                <li><a class="dropdown-item" href="orders"><fmt:message key="nav.orders"/></a></li>
                                <li><a class="dropdown-item" href="logout"><fmt:message key="nav.logout"/></a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">
                                <i class="fa fa-user"></i>
                                <fmt:message key="nav.login"/>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <!-- LANGUAGE -->
                <li class="nav-item ms-lg-3">
                    <a href="?lang=vi" class="btn btn-sm btn-outline-secondary">🇻🇳 VI</a>
                    <a href="?lang=en" class="btn btn-sm btn-outline-secondary">🇬🇧 EN</a>
                </li>

            </ul>
        </div>
    </div>
</nav>