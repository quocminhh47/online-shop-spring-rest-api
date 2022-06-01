<%@ page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/user/menu.jsp" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%--<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>--%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script src="<c:url value='/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
    <%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--%>

    <script type="text/javascript">
        <!-- Ajax Begin -->
        let maSP = "";
        var firstPage = 1;
        var formatter = new Intl.NumberFormat(undefined, {
            style: 'currency',
            currency: 'VND',
        });

        function getAllProduct() {
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/api/product?brand=${brandName}",
                success: function (nal) {
                    document.getElementById("h5-id").innerText = 'SỐ LƯỢNG SẢN PHẨM:    ' + nal.length;
                    const parent = document.getElementById('parents');
                    console.log(nal)
                    display(nal);
                }
            })
        }

        function display(array) {
            const parent = document.getElementById('parents');

            for (let i = 0; i < array.length; i++) {
                var price = formatter.format(array[i].price * (1 - array[i].discount));
                var oldPrice = formatter.format(array[i].price);
                var url = array[i].urlImage;
                parent.innerHTML += '<div class="col-lg-3 col-md-4 col-sm-6 mix women " style="rounded;">' +
                    '   <div id="contain-div">' +
                    '' + '<div class="product__item">' +
                    ' <div class="product__item__pic set-bg"  data-setbg="' + url + '" style="background-image: url(' + url + ');">' +

                    '<div class="label new">STATUS</div>' +
                    ' <ul class="product__hover" >' +
                    ' <li><a href="' + url + ' " class="image-popup " target="_blank" rel="noopener noreferrer"><span class="arrow_expand"></span></a></li>' +
                    ' <li><a href="#"><span class="icon_heart_alt"></span></a></li>' +
                    '<li><a href="detail-item.htm"><span class="icon_bag_alt"></span></a></li>' +
                    ' </ul>' +
                    ' </div>' +
                    ' <div class="product__item__text">' +
                    ' <h6><a>Mã SP:' + array[i].id + ' </a></h6>' +
                    ' <h5><a href="detail-item-' + array[i].id + '.htm">' + array[i].name + '</a></h5>' +
                    ' <h6><a>Hãng: ' + array[i].brand.name + '</a></h6>' +
                    ' <div class="text-center">' +
                    '<p>Giá rẻ: <span class="product__price" id="cheap-price">' + price + '</span>' +
                    '</br>Giá gốc:  <span class="text-muted text-decoration-line-through" >' + oldPrice + '</span></p>' +
                    '</div>' +
                    '<div class="product__details__button" style="margin-bottom: 0px; margin-left:75px;">' +
                    '<a href="${pageContext.request.contextPath}/home/detail-' + array[i].id + '.htm" class="cart-btn"><span class="icon_bag_alt"></span> Mua</a>' +
                    ' </div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    ' </div>';
                //parent.appendChild(newDiv);
            }
        }


    </script>

    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value='/details/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/font-awesome.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/elegant-icons.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/jquery-ui.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/magnific-popup.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/owl.carousel.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/slicknav.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/details/css/style.css'/>" type="text/css">
</head>

<body onload="getAllProduct()">

<form action="/home" method="get" id="formID"></form>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<!-- Banner Section Begin -->
<section class="banner set-bg" data-setbg="<c:url value='/details/img/banner/banner2.jpg'/>">
    <div class="container">
        <div class="row">
            <div class="col-xl-7 col-lg-8 m-auto">
                <div class="banner__slider owl-carousel">
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>XE MÁY CHẤT LƯỢNG CAO</span>
                            <h1 style="color: rgba(173,16,35,0.82);">The MT COMPUTER</h1>
                            <a href="/home">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>LO LẮNG VẬN CHUYỂN?</span>
                            <h1 style="color: rgba(173,16,35,0.82);">FREE SHIP</h1>
                            <a href="/home">Shop now</a>
                        </div>
                    </div>
                    <div class="banner__item">
                        <div class="banner__text">
                            <span>NHÂN VIÊN TẬN TÌNH</span>
                            <h1 style="color: rgba(173,16,35,0.82);">HỖ TRỢ 24/24</h1>
                            <a href="/home">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
${mess }
<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="section-title">

                    <h5 id = "h5-id">SL SẢN PHẨM: </h5>
                </div>
            </div>
            <%--    <div class="col-lg-8 col-md-8">
                    <ul class="filter__controls">
                        Lọc theo giá : &nbsp; <a href="filter-by-gia-duoi-10-trieu.htm">
                        <li class="active">Dưới 20 triệu</li>
                    </a> &nbsp; &nbsp;
                        <a href="filter-by-gia-10-20-trieu.htm">
                            <li class="active">20 - 40 triệu</li>
                        </a> &nbsp; &nbsp;
                        <a href="filter-by-gia-20-30-trieu.htm">
                            <li class="active">40 - 60 triệu</li>
                        </a> &nbsp; &nbsp;
                        <a href="filter-by-gia-tren-30-trieu.htm">
                            <li class="active"> Trên 60 triệu</li>
                        </a>&nbsp; &nbsp;
                    </ul>

                </div>--%>
            </br>
            <div class="col-lg-8 col-md-8" style="text-align:center;">
                <ul class="filter__controls">
                    &nbsp; <a href="/home/product?brand=HONDA">
                    <li class="active">HONDA</li>
                </a> &nbsp; &nbsp;
                    <a href="/home/product?brand=SUZUKI">
                        <li class="active">SUZUKI</li>
                    </a> &nbsp; &nbsp;
                    <a href="/home/product?brand=YAMAHA">
                        <li class="active">YAMAHA</li>
                    </a> &nbsp; &nbsp;
                    <a href="/home/product?brand=SYM">
                        <li class="active">SYM</li>
                    </a>&nbsp; &nbsp;
                </ul>
            </div>
        </div>
        <input type="hidden" value="" id="page" name="page"/>
        <div class="row property__gallery" id="parents">


        </div>
        <div class="container">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="pagination"></ul>
            </nav>
        </div>
    </div>

</section>

<!-- Product Section End -->


<!-- Discount Section Begin -->
<section class="discount">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="discount__pic">
                    <img src="<c:url value='/details/img/discount.jpg'/>" alt=""/>
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="discount__text">
                    <div class="discount__text__title">
                        <span>Discount</span>
                        <h2>Spring 2022</h2>
                        <h5><span>Sale</span> 50%</h5>
                    </div>
                    <div class="discount__countdown" id="countdown-time">
                        <div class="countdown__item">
                            <span>22</span>
                            <p>Days</p>
                        </div>
                        <div class="countdown__item">
                            <span>18</span>
                            <p>Hour</p>
                        </div>
                        <div class="countdown__item">
                            <span>46</span>
                            <p>Min</p>
                        </div>
                        <div class="countdown__item">
                            <span>05</span>
                            <p>Sec</p>
                        </div>
                    </div>
                    <a href="#">Shop now</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Discount Section End -->

<!-- Services Section Begin -->
<section class="services spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-car"></i>
                    <h6>Free Shipping</h6>
                    <p>For all oder over $99</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-money"></i>
                    <h6>Money Back Guarantee</h6>
                    <p>If good have Problems</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-support"></i>
                    <h6>Online Support 24/7</h6>
                    <p>Dedicated support</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-headphones"></i>
                    <h6>Payment Secure</h6>
                    <p>100% secure payment</p>
                </div>
            </div>
        </div>
    </div>
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
</section>
<!-- Services Section End -->


<!-- Footer Section Begin -->
<%--<%@include file="/WEB-INF/views/include/footer.jsp" %>--%>
<!-- Footer Section End -->

<!-- Paging function Begin -->

<!-- Paging function End -->

<!-- Js Plugins -->
<%--    <script src="<c:url value='/details/js/jquery-3.3.1.min.js'/>"></script>--%>
<script src="<c:url value='/details/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/details/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/details/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/details/js/mixitup.min.js'/>"></script>
<script src="<c:url value='/details/js/jquery.countdown.min.js'/>"></script>
<script src="<c:url value='/details/js/jquery.slicknav.js'/>"></script>
<script src="<c:url value='/details/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/details/js/jquery.nicescroll.min.js'/>"></script>
<script src="<c:url value='/details/js/main.js'/>"></script>

</body>

</html>