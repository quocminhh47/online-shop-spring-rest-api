<%@ page  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@include file="/WEB-INF/views/include/user/menu.jsp" %>
<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<base href="${pageContext.servletContext.contextPath }/"> 
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact us</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
    <%--Ajax--%>
    
    <script type="text/javascript">
        function sendContact() {
            let email = document.getElementById("email").value;
            let phone = document.getElementById("sdt").value;
            let message = document.getElementById("nd").value;
            let contact = {
                email : email,
                telephone: phone,
                message: message
            }
            console.log(contact);
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                type: 'POST',
                url: 'http://localhost:8080/user/api/contact/send-contact',
                data: JSON.stringify(contact),
                success: function (msg) {
                    var sign = msg.response;
                    if(sign == "OK"){
                        alert("Send mail success");
                        location.reload();
                    } else alert("Send mail failed");

                },

                error: function (error) {
                    alert(result);
                    console.log(error)
                }
            })
        }
        
    </script>
    
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
                        <a href="${pageContext.request.contextPath}/home"><i class="fa fa-home"></i> Home</a>
                        <span>Contact  </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__content">
                        <div class="contact__address">
                            <h5>Contact info</h5>
                            <ul>
                                <li>
                                    <h6><i class="fa fa-map-marker"></i> Address</h6>
                                    <p> Đường Man Thiện, Phường Hiệp Phú, Quận 9, TP. Hồ Chí Minh</p>
                                </li>
                                <li>
                                    <h6><i class="fa fa-phone"></i> Phone</h6>
                                    <p><span>0896.212.313</span><span>0914.023.134</span></p>
                                </li>
                                <li>
                                    <h6><i class="fa fa-headphones"></i> Support</h6>
                                    <p>quocminhh47@gmail.com</p>
                                </li>
                            </ul>
                        </div>
                        <div class="contact__form">
                            <h5>SEND MESSAGE</h5>
                           <%--  <form:form  action = "home/user-contact.htm" method="post" modelAttribute="contactForm">
                                <form:input name="from" " type="email"  path="emailSender" placeholder="Email" required="required"/>
                                <form:input form:input  class="input1" type="text" path="sdt" placeholder="Phone number" required="required"/>
                                <form:input type="text" placeholder="Website">
                                <form:textarea name="body"  path="messages" placeholder="Message" required="required"/>
                                <button type="submit" class="site-btn">Send Message</button>
                            </form:form> --%>
                            <form  >
                                <input type="email" id = "email" placeholder="Email">
                                <input type="number" id="sdt" placeholder="SDT" maxlength="11">
                                <textarea placeholder="Message" id= "nd"></textarea>
<%--                                <button type="submit" class="site-btn" onclick="sendContact()">Send Message</button>--%>
                            </form>
                            <button type="submit" class="site-btn" onclick="sendContact()">Send Message</button>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__map">
                        <iframe
                        src="https://map.coccoc.com/map/1703894983542839?title=Ho%CC%A3c+vi%C3%AA%CC%A3n+C%C3%B4ng+ngh%C3%AA%CC%A3+B%C6%B0u+chi%CC%81nh+Vi%C3%AA%CC%83n+th%C3%B4ng&reqid=vMrXWkFa"
                        height="780" style="border:0" allowfullscreen="">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<!-- Footer Section Begin -->
<%--<%@include file="/WEB-INF/views/include/footer.jsp" %>--%>
<!-- Footer Section End -->
<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="<c:url value='/details/js/jquery-3.3.1.min.js'/>"></script>
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