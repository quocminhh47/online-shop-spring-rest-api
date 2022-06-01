<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
                    <span>Shopping cart</span>
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
            <div class="col-lg-12">
                <div class="shop__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cartDetails}" var="item" varStatus="count">
                            <tr>
                                <td class="cart__product__item">
                                    <img style="max-width: 20%;" src="${item.product.getUrlImage()}" alt="">
                                    <div class="cart__product__item__title">
                                        <h6>${item.product.getName()}</h6>
                                    </div>
                                </td>
                                <td class="cart__price"><span hidden class="price_item">${item.price}</span><span >
                                        <fmt:formatNumber type = "number"
                                                          maxIntegerDigits = "15" value = "${item.price}" />
                                        </span> VND</td>
                                <td class="cart__quantity">
                                    <div class="pro-qty">
                                        <input class="quantity_item" value="${item.quantity}" type="number" value="1">
                                    </div>
                                </td>
                                <td
                                        <security:authorize access="isAuthenticated()">
                                            data-username="<security:authentication
                                                property="principal.username"/>"
                                        </security:authorize>
                                        data-product-id="${item.product.getID()}"
                                        class="cart__close cart-item-delete"><span class="icon_close"></span></td>
                                <td
                                        <security:authorize access="isAuthenticated()">
                                            data-username="<security:authentication
                                                property="principal.username"/>"
                                        </security:authorize>
                                        data-product-id="${item.product.getID()}"
                                        data-quantity="${item.quantity}"
                                        class="cart__close cart-item-edit"><span class="fa fa-edit"></span>
                                </td>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="cart__btn">
                    <a href="/home">Continue Shopping</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
            </div>
            <div class="col-lg-4 offset-lg-2">
                <div class="cart__total__procced">
                    <h6>Cart total</h6>
                    <ul>
                        <li>Total <span><fmt:formatNumber type = "number"
                                                          maxIntegerDigits = "15" value = "${totalPrice}" /> VND</span> </li>
                    </ul>
                    <button type="submit" class="site-btn">Place Oder</button>
                </div>
            </div>
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
    $(".cart-item-delete").click(function () {
        const productId = $(this).attr("data-product-id");
        const username = $(this).attr("data-username");
        let cartDetails = {
            product: {
                id: productId
            },
        }
        console.log(JSON.stringify(cartDetails));
        const url = 'http://localhost:8080/api/cart/' + username + '/cartDetails';
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            type: 'DELETE',
            url: url,
            data: JSON.stringify(cartDetails),
            success: function () {
                alert("Delete Cart Item Successful!")
                location.reload();
            },
            error: function (error) {
                alert("Error!")
            }
        })
    });
    $(".cart-item-edit").click(function () {
        const productId = $(this).attr("data-product-id");
        const username = $(this).attr("data-username");
        const price = $(this).closest("tr").find(".price_item").text();
        const quantity = $(this).closest("tr").find(".quantity_item").val();
        let cartDetails = {
            product: {
                id: productId
            },
            quantity: quantity,
            price: price
        }
        console.log(JSON.stringify(cartDetails));
        const url = 'http://localhost:8080/api/cart/' + username + '/cartDetails';

        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            type: 'POST',
            url: url,
            data: JSON.stringify(cartDetails),
            success: function () {
                alert("Edit successful!")
                location.reload();
            },
            error: function (error) {
                alert("Error!" + error)
            }
        })
    });
</script>


</body>

</html>