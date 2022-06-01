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
    <link rel="stylesheet" href="<c:url value='/admin/css/style.css?version=51'/>"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="getDetailProduct()">

    <script type="text/javascript">
        function getDetailProduct(){

            $.ajax({
                type:"GET",
                url:"http://localhost:8080/api/product/detail-${id}",

                success: function (data){
                    console.log(data);
                    fillData(data);
                }
            })
        }

        function fillData(a){
            var id = document.getElementById("id");
            var name = document.getElementById("name");
            var cc = document.getElementById("cc");
            var price = document.getElementById("price");
            var discount = document.getElementById("discount");
            var quantity = document.getElementById("quantity");

            var status = document.getElementById("status");
            var photo = document.getElementById("photo");
            var photo2 = document.getElementById("photo2");
            var photo3 = document.getElementById("photo3");
            var photo4 = document.getElementById("photo4");
            var description = document.getElementById("description");

            getBrandID();
            getCategoryID();

            id.value = a.id;
            name.value = a.name;
            cc.value = a.cc;
            price.value = a.price;
            discount.value = a.discount;
            quantity.value = a.quantity;

            status.value = a.status;
            photo.value = a.urlImage;
            photo2.value = a.urlImage2;
            photo3.value = a.urlImage3;
            photo4.value = a.urlImage4;
            description.value = a.description;


        }

        function getBrandID(){
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/api/product/brand",
                success: function (data){
                    console.log(data);
                    var id = document.getElementById("brand-id");
                    for(let i=0; i<data.length; i++){
                        id.innerHTML += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
                    }
                }
            })
        }

        function getCategoryID(){
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/api/product/category",
                success: function (data){
                    console.log(data);
                    var id = document.getElementById("category-id");
                    for(let i=0; i<data.length; i++){
                        id.innerHTML += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
                    }
                }
            })
        }

        function update(){

            let product={
                 id : document.getElementById("id").value,
                 name : document.getElementById("name").value,
                 brand_id : document.getElementById("brand-id").value,
                 cc : document.getElementById("cc").value,
                 type_id : document.getElementById("category-id").value,
                 price : document.getElementById("price").value,
                 quantity : document.getElementById("quantity").value,
                 status : document.getElementById("status").value,
                 description : document.getElementById("description").value,
                 photo : document.getElementById("photo").value,
                 photo2 : document.getElementById("photo2").value,
                 photo3 : document.getElementById("photo3").value,
                 photo4 : document.getElementById("photo4").value,
                 discount : document.getElementById("discount").value
            }

            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                type:"PUT",
                url:"http://localhost:8080/admin/api/product/update-product",
                data: JSON.stringify(product),
                success: function (notification) {
                    var sign = notification.response;
                    if(sign == "OK") {
                        alert("Update success!!");
                        window.location.href="http://localhost:8080/admin/home";
                        //location.reload();
                    }
                    else {alert("Update failed, try again");}
                },
                error: function (error) {
                 alert("Update failed, try again")
                }
            })
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
                                    <label for="productID" class="required">Product ID</label>
                                    <input type="text" name="productID" id="id" disabled/>
                                </div>
                                <div class="form-input">
                                    <label for="productName" class="required">Product Name</label>
                                    <input type="text" name="productName" id="name" />
                                </div>
                                <div class="form-input">
                                    <label for="cc" class="required">CC</label>
                                    <input type="text" name="cc" id="cc" />
                                </div>
                                <div class="form-input">
                                    <label for="price" class="required">Price</label>
                                    <input type="text" name="price" id="price" />
                                </div>
                                <div class="form-input">
                                    <label for="discount" class="required">Discount</label>
                                    <input type="text" name="discount" id="discount" />
                                </div>
                                <div class="form-input">
                                    <label for="quantity" class="required">Quantity</label>
                                    <input type="number" min="1" name="quantity" id="quantity" />
                                </div>

                            </div>
                            <div class="form-group">
                                <div >
                                    <div class="label-flex">
                                        <label for="brand-name">Brand</label>
                                        <a href="#" class="form-link">Brand detail</a>
                                    </div>
                                    <div>
                                        <select class="form-select" aria-label="Default select example" name="brand_name" id="brand-id">

                                        </select>
                                    </div>
                                </div>

                                <div >
                                    <div class="label-flex">
                                        <label for="category-name">Category</label>
                                        <a href="#" class="form-link">Category detail</a>
                                    </div>
                                    <div>
                                        <select class="form-select" aria-label="Default select example" name="category_name" id="category-id">

                                        </select>
                                    </div>
                                </div>

                                <div class="from-input">
                                    <label for="chequeno">Status</label>
                                    <input type="text" name="status" id="status" />
                                </div>
                                <div class="form-input">
                                    <label for="chequeno">Photo</label>
                                    <input type="text" name="photo" id="photo" />
                                </div>
                                <div class="form-input">
                                    <label for="blank_name">Photo2</label>
                                    <input type="text" name="photo2" id="photo2" />
                                </div>
                                <div class="form-input">
                                    <label for="payable">Photo3</label>
                                    <input type="text" name="photo3" id="photo3" />
                                </div>
                                <div class="form-input">
                                     <label for="payable">Photo4</label>
                                     <input type="text" name="photo4" id="photo4" />
                                </div>
                            </div>
                        </div>
                        <div class="donate-us">
                            <label>Description</label>
                            <div >
                                <textarea id="description" name="description" rows="4" cols="120"></textarea>
                            </div>
                        </div>

                    </form>
                    <div class="form-submit">
                            <input type="submit" value="Update" class="submit" onclick="update()" id="submit" name="submit" />

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