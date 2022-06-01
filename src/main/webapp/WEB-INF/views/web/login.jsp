<%@ page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>
<%@include file="/WEB-INF/views/include/user/menu.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>API login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--===============================================================================================-->
    <%--	 <link rel="icon" type="image/png" href="<c:url value='/resources/loginFrm/images/icons/favicon.ico'/>"/>--%>
    <link rel="icon" type="image/png" href="<c:url value='/loginFrm/login/css'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/loginFrm/vendor/bootstrap/css/bootstrap.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/loginFrm/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/loginFrm/fonts/Linearicons-Free-v1.0.0/icon-font.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/loginFrm/vendor/animate/animate.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/loginFrm/vendor/css-hamburgers/hamburgers.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/loginFrm/vendor/select2/select2.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/loginFrm/vendor/daterangepicker/daterangepicker.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/loginFrm/css/util.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/loginFrm/css/main.css'/>">
    <!--===============================================================================================-->
    <script type="text/javascript">
        function login() {
            let email = document.getElementById("email").value;
            let pass = document.getElementById("password").value;

            let account = {
                usernameOrEmail: email,
                password: pass,

            }
            console.log(account);
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                type: 'POST',
                url: 'http://localhost:8080/user/login',
                data: JSON.stringify(account),
                success: function (response) {
                    var sign = response.response;
                    if(sign == "OK"){
                        alert("Login success");
                        window.location.href = "http://localhost:8080/home";
                    } else {
                        document.getElementById("notification").innerHTML="Email or password is wrong!"
                        alert("Login failed");
                    }
                } ,


                error: function (error) {
                    console.log(error)
                }
            })

        }

        function checkLogin(){

        }

    </script>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
            ${mess}
            <p id="notification" style="color: red;"></p>
            <form class="login100-form validate-form flex-sb flex-w"  id="form_id" >
                <span class="login100-form-title p-b-32">
						Account Login
					</span>

                <span class="txt1 p-b-11">
						Username
					</span>
                <div class="wrap-input100 validate-input m-b-36" data-validate="Email is required">
                    <input id="email" class="input100" type="text"  placeholder="Email"
                           required="required"/>
                    <span class="focus-input100"></span>
                </div>

                <span class="txt1 p-b-11">
						Password
					</span>
                <div class="wrap-input100 validate-input m-b-12" data-validate="Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
                    <input id="password" class="input100" type="password"  placeholder="Password"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="flex-sb-m w-full p-b-48">
                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="remember-me" type="checkbox" name="remember-me">
                        <label class="label-checkbox100" for="remember-me">

                        </label>
                    </div>

                    <div>
                        <a href="${pageContext.request.contextPath}/user/registration" class="txt3">
                           New here? Click to register!
                        </a>
                    </div>
                </div>

                <div class="container-login100-form-btn">
                   <%-- <button class="login100-form-btn" id="btnLogin" onclick="login()" >
                        Login
                    </button>--%>
                </div>

            </form>
                <button class="login100-form-btn" id="btnLogin" onclick="login()" >
                    Login
                </button>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<%--<!--===============================================================================================-->--%>
<script src="<c:url value='/loginFrm/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/vendor/animsition/js/animsition.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/vendor/bootstrap/js/popper.js'/>"></script>
<script src="<c:url value='/loginFrm/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/vendor/select2/select2.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/vendor/daterangepicker/moment.min.js'/>"></script>
<script src="<c:url value='/loginFrm/vendor/daterangepicker/daterangepicker.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/vendor/countdowntime/countdowntime.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/loginFrm/js/main.js'/>"></script>
<!-- Footer Section Begin -->
<%--<%@include file="/WEB-INF/views/include/footer.jsp" %>--%>
<!-- Footer Section End -->
</body>
</html>