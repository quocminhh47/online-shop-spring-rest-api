<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/include/user/menu.jsp" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--<security:authorize access="isAuthenticated()">--%>
<%--    <security:authentication property="principal.username" />--%>
<%--</security:authorize>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thông tin sản phẩm</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="/details/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/details/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/details/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/details/css/style.css" type="text/css">

    <%--    Ajax--%>
    <script type="text/javascript">

        function getProductInfo() {
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/api/product/detail-${id}",
                success: function (data) {
                    console.log(data);
                    displayImg(data);
                    loadComments();
                }
            })
        }

        function displayImg(data) {
            $('#img1').attr("src", data.urlImage),
                $('#img2').attr("src", data.urlImage2),
                $('#img3').attr("src", data.urlImage3);
            $('#img4').attr("src", data.urlImage4);
            $('#big-img1').attr("src", data.urlImage),
                $('#big-img2').attr("src", data.urlImage2),
                $('#big-img3').attr("src", data.urlImage3);
            $('#big-img4').attr("src", data.urlImage4);
            document.getElementById("parent").innerHTML = 'Giá: <div class="product__details__price" value="' + data.price * (1 - data.discount) +'">' + '<div id="priceAfter" >'+data.price * (1 - data.discount) + '</div>'+ '<span>' + data.price + '</span></div>';
            document.getElementById("brand-name").innerText = data.brand.name;
            document.getElementById("type-name").innerText = data.category.name;
            document.getElementById("cc").innerText = data.cc + '(CC)';
            document.getElementById("status").innerText = data.status;
        }

        function saveComment() {
            let content = document.getElementById("cmt-content").value;
            let comment = {
                noiDung: content
            }
            console.log(comment);
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                type: 'POST',
                url: 'http://localhost:8080/api/comment/save-${id}',
                data: JSON.stringify(comment),
                success: function (notification) {
                    const sign = notification.response;
                    if(sign == "OK") {
                        alert("Comment success!!");
                        location.reload();
                    }
                    else {alert("Comment failed, try again");}
                },
                error: function (error) {
                 alert("Comment failed, try again")
                }
            })

        }

        function loadComments() {
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/api/comment/product-${id}",
                success: function (array) {
                    console.log(array);
                    let cmtContainer = document.getElementById("cmt-container");
                    for (let i = 0; i < array.length; i++) {
                        cmtContainer.innerHTML += '<div class="be-comment" >' +
                            '<div class="be-img-comment">' +
                            '<a href="blog-detail-2.html">' +
                            '<img src="https://64.media.tumblr.com/620152d47d79e0047a1a0752c1e70522/b88b022b2b8584d3-12/s1280x1920/e0ecc63b8207fea7b353807ecd3fa3dcca376f08.jpg"' +
                            'alt="" class="be-ava-comment">' +
                            ' </a>' +
                            '</div>' +
                            '<div class="be-comment-content" >' +
                            '<span class="be-comment-name">' + array[i].usersComment.username + '</span>' +
                            '<span class="be-comment-time" id="comment-time">' +
                            '<i class="fa fa-clock-o"></i>' +
                                '&ensp;' + array[i].cmt_time +
                            '</span>' +
                            '<p class="be-comment-text" id="content-comment">' + array[i].noiDung + ' </p>' +
                            '</div>' +
                            '</div>';

                    }
                }
            })
        }


    </script>
</head>

<body onload="getProductInfo()">

<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="${pageContext.request.contextPath}/home/index.htm"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Thông tin Laptop </a>
                    <span>${sp.tenSP }</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Breadcrumb End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__left product__thumb nice-scroll">
                        <a class="pt active">
                            <img id="img1" src="" alt="">
                        </a>
                        <a class="pt">
                            <img id="img2" src="" alt="">
                        </a>
                        <a class="pt">
                            <img id="img3" src="" alt="">
                        </a>
                        <a class="pt">
                            <img id="img4" src="" alt="">
                        </a>
                    </div>
                    <div class="product__details__slider__content">
                        <div class="product__details__pic__slider owl-carousel">
                            <img id="big-img1" class="product__big__img" src="" alt="">
                            <img id="big-img2" class="product__big__img" src="" alt="">
                            <img id="big-img3" class="product__big__img" src="" alt="">
                            <img id="big-img4" class="product__big__img" src="" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="product__details__text">
                    <h3 id="name-product">Tên sản phẩm - Thiếu</h3>
                    <span id="id-product">Mã SP: ${id}</span>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>

                    <div id="parent">
                    </div>

                    <p> • Nhấn order để đặt hàng </br>
                        • Điến thông tin , số lượng sản phẩm cần đặt</br>
                        • Điền thông tin cá nhân</br>
                        và sau đó nhân viên sẽ chủ động liên hệ bạn để xác nhận đơn hàng <3.</p>
                    <div class="product__details__button">
<%--                        <form action="order-${id}.htm">--%>
                            <ul>
                                <input id="quanlity" name="sl" class="form-control text-center me-3" min="1" max="100" type="number"
                                       value="1" style="max-width: 3rem" required="required"/>
                                </br>
                                <button class="cart-btn"
                                        <security:authorize access="isAuthenticated()">
                                            data-username="<security:authentication property="principal.username" />"
                                        </security:authorize>
                                        data-id="${id}" type="submit">Order</button>
                            </ul>
<%--                        </form>--%>
                    </div>

                    <div class="product__details__widget">
                        <ul>
                            <li>
                                <span> HÃNG:  </span>
                                <p id="brand-name">NULL</p>
                            </li>
                            <li>
                                <span>LOẠI XE: </span>
                                <p id="type-name">NULL</p>
                            </li>
                            <li>
                                <span>Dung tích xi-lanh: </span>
                                <p id="cc">NULL</p>
                            </li>
                            <li>
                                <span>TRẠNG THÁI: </span>
                                <p id="status">NULL</p>
                            </li>
                            <li>
                                <span>GIAO HÀNG: </span>
                                <p>Free shipping</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            ${mess }
            ${cmtSP }
            <div class="col-lg-12">

                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Comments</a>
                        </li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <h6>Description</h6>
                            <p>${sp.description }</p>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <h6>Comments</h6>

                            <%@include file="/WEB-INF/views/include/user/cmtBoxForm.jsp" %>
                            <%-- ${ cmtSP} --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

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

<script type="text/javascript">
    $(".cart-btn").click(function () {
        const productId = $(this).attr("data-id");
        const username = $(this).attr("data-username");
        const quanlity = $("#quanlity").val();
        const price = $("#priceAfter").text();

        let cartDetails = {
            product : {
                id: productId
            },
            quantity: quanlity,
            price: price
        }
        const url = 'http://localhost:8080/api/cart/'+username+'/cartDetails';

        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            type: 'POST',
            url: url,
            data: JSON.stringify(cartDetails),
            success: function () {
                alert("Thêm sản phẩm vào giỏ hàng thành công!")
            },
            error: function (error) {
                alert("Error!"+error)
            }
        })
    });

</script>
</body>

</html>