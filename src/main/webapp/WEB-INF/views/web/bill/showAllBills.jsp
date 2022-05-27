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
    <title>Show All Bills</title>

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
                    <span>Show All Bills</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <form action="#" class="checkout__form">
            <div class="row">Bill of </div>
            <div class="row">
                <div class="col-lg-12">
                    <table class="table">
                        <thead class="thead-dark">
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
                                <td>${item.createDate}</td>
                                <td>${item.discountTotal}</td>
                                <td>${item.priceTotal}</td>
                                <td>${item.status}</td>
                                <td>
                                    <a href="bill/${item.ID}">Details</a>
                                </td>
                            </tr>

                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </form>
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