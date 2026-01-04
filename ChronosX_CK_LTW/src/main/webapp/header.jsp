<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>ChronosX</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (icon giỏ hàng, user...) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Header CSS chung -->
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<header class="cx-header-top py-2">
    <div class="container d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-1">
        <a href="index.jsp" class="d-flex align-items-center gap-2 text-decoration-none text-reset">
            <span class="cx-logo-mark">CX</span>
            <div>
                <h1 class="h5 mb-0 fw-semibold">ChronosX</h1>
                <p class="mb-0 small text-secondary">Thế giới đồng hồ chính hãng &amp; phong cách</p>
            </div>
        </a>
        <div class="cx-header-contact d-flex flex-wrap gap-3 justify-content-md-end mt-1 mt-md-0">
            <span><i class="fa fa-phone me-1"></i> Hotline: 1900 123 456</span>
            <span><i class="fa fa-clock me-1"></i> 8:00 - 21:00 (Tất cả các ngày)</span>
        </div>
    </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light cx-navbar">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
        <li class="nav-item"><a class="nav-link" href="products">Sản phẩm</a></li>
        <li class="nav-item"><a class="nav-link" href="cart"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
        <li class="nav-item"><a class="nav-link" href="news"><i class="fa fa-newspaper"></i> Tin tức</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fa fa-user"></i> Đăng nhập</a></li>
      </ul>
    </div>
  </div>
</nav>