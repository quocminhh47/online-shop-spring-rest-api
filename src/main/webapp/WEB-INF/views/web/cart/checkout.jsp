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
    <title>Checkout</title>

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
                    <span>Shopping Cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <form action="user/bill" class="checkout__form">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <div class="checkout__order">
                        <h5>Cart of <security:authorize access="isAuthenticated()">
                            <security:authentication property="principal.username"/>
                        </security:authorize></h5>
                        <div class="checkout__order__product">
                            <div class="row m-b-1">
                                <div class="col-lg-3"><strong>Product Name</strong></div>
                                <div class="col-lg-2">
                                    <strong>Quantity</strong>
                                </div>
                                <div class="col-lg-3"><strong>Price</strong></div>
                                <div class="col-lg-2"><strong>Delete Item</strong></div>
                                <div class="col-lg-2"><strong>Edit Quantity</strong></div>
                            </div>
                            <c:forEach items="${cartDetails}" var="item" varStatus="count">
                                <div class="row">
                                    <div class="col-lg-3">${item.product.getName()}</div>
                                    <div class="col-lg-2">
                                        <input style="max-width: 2rem;" class="quantity" type="number"
                                               value="${item.quantity}"/>
                                    </div>
                                    <div class="col-lg-3"><span id="priceAfter">${item.price}</span> VND</div>
                                    <div class="col-lg-23 ">
                                        <button
                                                <security:authorize access="isAuthenticated()">
                                                    data-username="<security:authentication
                                                        property="principal.username"/>"
                                                </security:authorize>
                                                data-product-id="${item.product.getID()}"
                                                type="button"
                                                class="btn btn-success cart-item-delete">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                    <div class="col-lg-2 ">
                                        <button
                                                <security:authorize access="isAuthenticated()">
                                                    data-username="<security:authentication
                                                        property="principal.username"/>"
                                                </security:authorize>
                                                data-product-id="${item.product.getID()}"
                                                data-quantity="${item.quantity}"

                                                type="button"
                                                class="btn btn-success cart-item-edit">
                                            <i class="fa fa-edit" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="checkout__order__total">
                            <ul>
                                <li>Total: <span id="totalPrice">${totalPrice}</span> VND</li>
                            </ul>
                        </div>
                        <button type="submit" class="site-btn">Place Oder</button>
                    </div>
                </div>
                <div class="col-lg-3"></div>
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
    $(".cart-item-delete").click(function () {
        const productId = $(this).attr("data-product-id");
        const username = $(this).attr("data-username");

        let cartDetails = {
            product: {
                id: productId
            },
        }
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
                alert("Error!" + error)
            }
        })
    });
    $(".cart-item-edit").click(function () {
        const productId = $(this).attr("data-product-id");
        const username = $(this).attr("data-username");
        const price = $("#priceAfter").text();
        const quantity = $(this).closest(".row").find(".quantity").val();
        let cartDetails = {
            product: {
                id: productId
            },
            quantity: quantity,
            price: price
        }
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

</html>