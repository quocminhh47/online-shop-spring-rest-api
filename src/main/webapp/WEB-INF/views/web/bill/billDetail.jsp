<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bill</title>

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

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <span>Bill</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <div class="checkout__order">
                        <h5>Bill of <security:authorize access="isAuthenticated()">
                            <security:authentication property="principal.username"/>
                        </security:authorize> + ${bill.user.getUserame()}</h5>

                        <div class="checkout__order__product">
                            <div class="row m-b-1">
                                <div class="col-lg-3"><strong>Product Name</strong></div>
                                <div class="col-lg-2">
                                    <strong>Quantity</strong>
                                </div>
                                <div class="col-lg-3"><strong>Price</strong></div>
                            </div>
                            <c:forEach items="${billDetails}" var="item" varStatus="count">
                                <div class="row">
                                    <div class="col-lg-3">${item.product.getName()}</div>
                                    <div class="col-lg-2">
                                        <input style="max-width: 2rem;" class="quantity" type="number"
                                               value="${item.quantity}"/>
                                    </div>
                                    <div class="col-lg-3"><span id="priceAfter">${item.price}</span> VND</div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="checkout__order__total">
                            <ul>
                                <li>priceTotal: <span id="priceTotal">${bill.priceTotal}</span> VND</li>
                                <li>discountTotal: <span id="discountTotal">${bill.discountTotal}</span> VND</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3"></div>
            </div>
    </div>
</section>
<!-- Checkout Section End -->

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

<script type="text/javascript">


</script>

</html>