<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Detail</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/details/css/bootstrap.min.css?version=44" type="text/css">
    <link rel="stylesheet" href="/details/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/details/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/details/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/style.css" type="text/css">
    <style>
        body{
            background-color: #F6F6F6;
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
            background-color: #6c757d;
            padding: 10px 40px;
        }
        .logo{
            width: 50%;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;
        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
</head>
<body>
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
<hr>
<div class="container">
    <div class="brand-section">
        <div class="row">
            <div class="col-6">
                <h1 class="text-white">QLBX</h1>
            </div>
            <div class="col-6">
                <div class="company-details">
                    <p class="text-white">Contact</p>
                    <p class="text-white">+84123456789</p>
                </div>
            </div>
        </div>
    </div>

    <div class="body-section">
        <div class="row">
            <div class="col-6">
                <h2 class="heading">Invoice No.: ${bill.ID}</h2>
                <h2 class="heading">Status: <c:choose>
                    <c:when test="${bill.status == 0}">
                        Not Approve
                    </c:when>
                    <c:otherwise>
                        Approve
                    </c:otherwise>
                </c:choose>
                </h2>
                <p class="sub-heading">Order Date: <fmt:formatDate pattern="dd/MM/yyyy" value="${bill.createDate}" /> </p>
                <p class="sub-heading">Email Address: ${bill.user.getUsername()}</p>
            </div>
            <div class="col-6">
                <p class="sub-heading">Full Name:  ${bill.user.getFirst_name()} ${bill.user.getLast_name()}</p>
                <p class="sub-heading">Address:  Jakatar, New York</p>
            </div>
        </div>
    </div>

    <div class="body-section">
        <h3 class="heading">Ordered Items</h3>
        <br>
        <table class="table-bordered">
            <thead>
            <tr>
                <th>Product</th>
                <th class="w-20">Price</th>
                <th class="w-20">Quantity</th>
                <th class="w-20">Price Total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${billDetails}" var="item" varStatus="count">
                <tr>
                    <td>${item.product.getName()}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price * item.quantity}</td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="3" class="text-right">Discount Total</td>
                <td>
                    <fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${bill.discountTotal}" />
                    VND
                </td>
            </tr>
            <tr>
                <td colspan="3" class="text-right">Price Total</td>
                <td>
                    <fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${bill.priceTotal}" />
                    VND
                </td>
            </tr>
            </tbody>
        </table>
        <br>
    </div>

</div>
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
</body>
</html>