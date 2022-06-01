<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <!-- <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"> -->
    <link rel="stylesheet" href="<c:url value='/admin/fonts/material-icon/css/material-design-iconic-font.min.css'/>"/>

    <!-- <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css"> -->
    <link rel="stylesheet" href="<c:url value='/admin/vendor/nouislider/nouislider.min.css'/>"/>

    <!-- Main css -->
    <!-- <link rel="stylesheet" href="css/style.css"> -->
    <link rel="stylesheet" href="<c:url value='/admin/css/style.css'/>"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="getDetailComment()">

    <script type="text/javascript">
        function getDetailComment(){

            $.ajax({
                type:"GET",
                url:"http://localhost:8080/api/comment/detail-comment-${id}",

                success: function (data){
                    console.log(data);
                    fillData(data);
                }
            })
        }

        function fillData(a){
            document.getElementById("commentID").value = a.id;
            document.getElementById("productName").value = a.product.name;
            document.getElementById("username").value= a.usersComment.username;
            document.getElementById("content").value = a.noiDung;
            document.getElementById("time").value= a.cmt_time;

        }

        function deleteComment(){

            let comment={
                 id : document.getElementById("commentID").value,
                 product : document.getElementById("productName").value,
                 usersComment : document.getElementById("username").value,
                 noiDung : document.getElementById("content").value,
                 cmt_time : document.getElementById("time").value,

            }
            if(confirm("Ban co chac chac muon xoa khong?")){
                $.ajax({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    type:"DELETE",
                    url:"http://localhost:8080/admin/api/product/delete-comment-${id}",
                    data: JSON.stringify(comment),
                    success: function (notification) {
                        var sign = notification.response;
                        if(sign == "OK") {
                            alert("Delete success!!");
                            window.location.href="http://localhost:8080/admin/comment";
                            //location.reload();
                        }
                        else {alert("Delete failed, try again");}
                    },
                    error: function (error) {
                     alert("Delete failed, try again")
                    }
                })
            }

        }
    </script>

    <div class="main">

        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img style="max-width: 100%;height: 80%;margin-top: 30px;" src="<c:url value='/admin/images/form-img.jpg'/>" alt="">
                    <div class="signup-img-content">
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>
                </div>
                <div class="signup-form">
                    <form class="edit-form" id="edit-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="commentID" class="required">Comment ID</label>
                                    <input type="text" name="commentID" id="commentID" disabled/>
                                </div>
                                <div class="form-input">
                                    <label for="productName" class="required">Product Name</label>
                                    <input type="text" name="productName" id="productName" disabled/>
                                </div>
                                <div class="form-input">
                                    <label for="username" class="required">Username</label>
                                    <input type="text" name="username" id="username" disabled/>
                                </div>
                                <div class="form-input">
                                    <label for="content" class="required">Content</label>
                                    <input type="text" name="content" id="content" disabled/>
                                </div>
                                <div class="form-input">
                                    <label for="time" class="required">Time</label>
                                    <input type="text" name="time" id="time" disabled/>
                                </div>


                            </div>

                        </div>


                    </form>
                    <div class="form-submit">
                            <input type="submit" value="Delete" class="submit" onclick="deleteComment()" id="submit" name="submit" />

                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- JS -->
    <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
    <script src="<c:url value='/admin/vendor/jquery/jquery.min.js'/>"></script>

    <!-- <script src="vendor/nouislider/nouislider.min.js"></script> -->
    <script src="<c:url value='/admin/vendor/nouislider/nouislider.min.js'/>"></script>

    <!-- <script src="vendor/wnumb/wNumb.js"></script> -->
    <script src="<c:url value='/admin/vendor/wnumb/wNumb.js'/>"></script>

    <!-- <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script> -->
    <script src="<c:url value='/admin/vendor/jquery-validation/dist/jquery.validate.min.js'/>"></script>

    <!-- <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script> -->
    <script src="<c:url value='/admin/vendor/jquery-validation/dist/additional-methods.min.js'/>"></script>

    <!-- <script src="js/main.js"></script> -->
    <script src="<c:url value='/admin/js/main.js'/>"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>