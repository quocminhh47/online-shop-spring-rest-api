<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vn">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>QLBX</title>

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
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-3 col-lg-2">
                <div class="header__logo">
                </div>
            </div>
            <div class="col-xl-6 col-lg-7">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="/home">Home</a></li>
                        <li><a href="/admin/home">Admin Page</a></li>
                        <li><a href="/user/bill">Your Bill</a></li>
                        <li><a href="/logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__right">
                    <div class="header__right__auth">
                        <security:authorize access="isAuthenticated()">
                            <security:authentication property="principal.username"/>
                        </security:authorize>
                    </div>
                    <ul class="header__right__widget">
                        <li><a href="/user/cart"><span class="icon_bag_alt"></span>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="canvas__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="/home"><i class="fa fa-home"></i> Home</a>
                    <span>Your Bill</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Cart Section Begin -->
<section class="shop-cart spad">
    <form action="bill" class="checkout__form" method="POST">
        <div class="container">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="shop__cart__table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Bill ID</th>
                                <th scope="col">Create Date</th>
                                <th scope="col">Discount Total</th>
                                <th scope="col">Price Total</th>
                                <th scope="col">Status</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bills}" varStatus="count" var="item">
                                <tr>
                                    <th scope="row">${count.count}</th>
                                    <td>${item.ID}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${item.createDate}" />
                                            </td>
                                    <td><fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${item.discountTotal}" /> VND</td>
                                    <td class="cart__price">
                                        <fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${item.priceTotal}" />
                                             VND</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.status == 0}">
                                                Not Approve
                                            </c:when>
                                            <c:otherwise>
                                                Approve
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="bill/${item.ID}">Detail</a>
                                    </td>
                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>

        </div>
        <input type="text" hidden value="${cart.id}" name="billID">
    </form>
</section>
<!-- Shop Cart Section End -->

<!-- Js Plugins -->
<script src="/details/js/jquery-3.3.1.min.js"></script>
<script src="/details/js/bootstrap.min.js"></script>
<script src="/details/js/jquery.magnific-popup.min.js"></script>
<script src="/details/js/jquery-ui.min.js"></script>
<script src="/details/js/mixitup.min.js"></script>
<script src="/details/js/jquery.countdown.min.js"></script>
<script src="/details/js/jquery.slicknav.js"></script>
<script src="/details/js/owl.carousel.min.js"></script>
<script src="/details/js/jquery.nicescroll.min.js"></script>
<script src="/details/js/main.js"></script>
<script>
</script>

</body>
</html>