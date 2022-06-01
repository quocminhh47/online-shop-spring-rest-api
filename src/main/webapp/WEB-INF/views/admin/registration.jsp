<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/user/menu.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up For Admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<c:url value='/registration/fonts/material-icon/css/material-design-iconic-font.min.css'/>">

    <!-- Main css -->
    <link rel="stylesheet" href="<c:url value='/registration/css/style.css'/>">
    <%--Ajax--%>
    <script type="text/javascript">
        function register(){
            let firstName = document.getElementById("firstName").value;
            let lastName = document.getElementById("lastName").value;
            let email = document.getElementById("email").value;
            let password = document.getElementById("pass").value;

            if(firstName != "" || lastName != "" || email != "" || password != ""){
                let information ={
                    firstName : firstName,
                    lastName: lastName,
                    email: email,
                    password: password
                }
                console.log(information);
                $.ajax({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    type: 'POST',
                    url: 'http://localhost:8080/v1/api/registration',
                    data: JSON.stringify(information),
                    success : function (notification) {
                        var sign = notification.response;
                        if(sign == "OK") {
                            alert("Success!! Confirm mail to complete");
                            // location.reload();
                            window.location.href = "http://localhost:8080/login";
                        }
                        else{alert("Register failed, try again. Make sure that email is not registered yet!")
                        }
                    },
                    error: function (error) {
                        alert("Register failed, try again. Make sure that email is not registered yet!")
                    }
                })
            } else {
                alert("Please provide fully information!!")
            }

        }

        function redirect(){
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                type: 'GET',
                url: 'http://localhost:8080/login',
                /*data: JSON.stringify(information),*/
                error: function (error) {
                    console.log(error)
                }
            })
        }

    </script>
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up for new member</h2>
                        ${mess}
                        <form  class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="firstName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="firstName" id="firstName" placeholder="Your First Name" required ="required"/>
                            </div>
                            <div class="form-group">
                                <label for="lastName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="lastName" id="lastName" placeholder="Your Last Name" required="required"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"  required="required"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <%--<div class="form-group">
                                <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>--%>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"  required="required" checked/>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                               <%-- <input  name="signup" id="signup" class="form-submit" value="Register" onclick="register()"/>--%>
                                <%--<button class="form-submit" onclick="register()">Register</button>--%>
                            </div>
                        </form>
                        <button class="form-submit" onclick="register()">Register</button>
                    </div>
                    <div class="signup-image">
                        <figure><img src="<c:url value='/registration/images/signup.jpg'/>" alt="sing up image"></figure>
                        <a href="${pageContext.request.contextPath}/login" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sing in  Form -->
     

    </div>

    <!-- JS -->
    <script src="<c:url value='/registration/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/registration/js/main.js'/>"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>