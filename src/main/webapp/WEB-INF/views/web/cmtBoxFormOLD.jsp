<%@ page  pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/views/include/bootstrap-lib.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">
body{
   /*  margin-top:20px; */
   /*  background-color:#e9ebee; */
}

.be-comment-block {
    margin-bottom: 50px !important;
   border: 1px solid #edeff2;
    border-radius: 2px; 
    padding: 50px 70px;
    border:1px solid #ffffff;
}

.comments-title {
    font-size: 16px;
    color: #262626;
    margin-bottom: 15px;
    font-family: 'Conv_helveticaneuecyr-bold';
}

.be-img-comment {
    width: 60px;
    height: 60px;
    float: left;
    margin-bottom: 15px;
}

.be-ava-comment {
    width: 60px;
    height: 60px;
    border-radius: 50%;
}

.be-comment-content {
    margin-left: 80px;
}

.be-comment-content span {
    display: inline-block;
    width: 49%;
    margin-bottom: 15px;
}

.be-comment-name {
    font-size: 15px;
    font-family: 'Conv_helveticaneuecyr-bold';
}

.be-comment-content a {
    color: #383b43;
}

.be-comment-content span {
    display: inline-block;
    width: 49%;
    margin-bottom: 15px;
}

.be-comment-time {
    text-align: right;
}

.be-comment-time {
    font-size: 11px;
    color: #000000;
}

.be-comment-text {
    font-size: 13px;
    line-height: 18px;
    color: #7a8192;
    display: block;
    background: #f6f6f7;
    border: 1px solid #edeff2;
    padding: 15px 20px 20px 20px;
}

.form-group.fl_icon .icon {
    position: absolute;
    top: 1px;
    left: 16px;
    width: 48px;
    height: 48px;
    background: #f6f6f7;
    color: #000000;
    text-align: center;
    line-height: 50px;
    -webkit-border-top-left-radius: 2px;
    -webkit-border-bottom-left-radius: 2px;
    -moz-border-radius-topleft: 2px;
    -moz-border-radius-bottomleft: 2px;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
}

.form-group .form-input {
    font-size: 13px;
    line-height: 50px;
    font-weight: 400;
    color: #000000;
    width: 100%;
    height: 50px;
    padding-left: 20px;
    padding-right: 20px;
    border: 1px solid #edeff2;
    border-radius: 3px;
}

.form-group.fl_icon .form-input {
    padding-left: 70px;
}

.form-group textarea.form-input {
    height: 150px;
}

</style>
</head>
<body>

 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">

<c:forEach var="c" items="${cmt }">
	<div class="be-comment">
		<div class="be-img-comment">	
			<a href="blog-detail-2.html">
				<img src="https://64.media.tumblr.com/620152d47d79e0047a1a0752c1e70522/b88b022b2b8584d3-12/s1280x1920/e0ecc63b8207fea7b353807ecd3fa3dcca376f08.jpg" alt="" class="be-ava-comment">
			</a>
		</div>
		<div class="be-comment-content">
			<span class="be-comment-name">
				<a href="#">${c.ten}</a>
			</span>
			<span class="be-comment-time">
				<i class="fa fa-clock-o"></i>
				${c.cmtTime }
			</span>
			<p class="be-comment-text">
				${c.nd }
			</p>
		</div>
	</div>

</c:forEach>

</div>
<div class="be-comment-block">
	<form:form class="form-block"  id="form">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="form-group fl_icon">
					<div class="icon"><i class="fa fa-user"></i></div>
					<form:input class="form-input"  path="ten" type="text" placeholder="Your name" required="required" />
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 fl_icon">
				<div class="form-group fl_icon">
					<div class="icon"><i class="fa fa-envelope-o"></i></div>
					<form:input class="form-input" path="email" type="text" placeholder="Your email" required="required" />
				</div>
			</div>
			<div class="col-xs-12">									
				<div class="form-group">
					<form:textarea class="form-input"  path="nd" placeholder="Your text" required="required"/>
				</div>
			</div>
			<%--<button class="btn btn-primary pull-right" 	onclick="myFunction()">Comment</button>--%>
			<!-- <a class="btn btn-primary pull-right" type="commit">Comment</a> -->
		</div>
	</form:form>
	<button class="btn btn-primary pull-right" 	onclick="myFunction()">Comment</button>
</div>
<script>
function myFunction() {
	var frm = document.getElementsById("form");
    frm.reset();
    return false;
}
</script>


<script type="text/javascript">

</script>
</body>
</html>