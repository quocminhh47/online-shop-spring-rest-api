<%@ page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<%--<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/menu/css/style.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="/details/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/details/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/details/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/style.css" type="text/css">


</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Home</a>
            <div class="social-media order-lg-last">
                <p class="mb-0 d-flex">
                    <a href="/user/cart" class="d-flex align-items-center justify-content-center"><span
                            class="fa fa-shopping-bag"><i class="sr-only"></i></span></a>
                </p>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                    aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto mr-md-3">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/home" class="nav-link">Admin
                            Page</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/login" class="nav-link">LOG
                            IN</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/user/contact" class="nav-link">CONTACT
                            US</a></li>
                    </c:if>
                    <li class="nav-item"><a href="#" class="nav-link">ABOUT US</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/logout"
                                                class="nav-link">Logout</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/user/bill"
                                                class="nav-link">Your Bill</a></li>
                    </c:if>

                </ul>
            </div>
        </div>
    </nav>
    <!-- END nav -->
</div>
<script src="/menu/js/jquery.min.js"></script>
<script src="/menu/js/popper.js"></script>
<script src="/menu/js/bootstrap.min.js"></script>
<script src="/menu/js/main.js"></script>
</body>
</html>
