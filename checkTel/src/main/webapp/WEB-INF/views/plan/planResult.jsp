<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.myButton {
	-moz-box-shadow: 5px 15px 5px -10px #276873;
	-webkit-box-shadow: 5px 15px 5px -10px #276873;
	box-shadow: 5px 15px 5px -10px #276873;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #599bb3), color-stop(1, #408c99));
	background:-moz-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-webkit-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-o-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-ms-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#599bb3', endColorstr='#408c99',GradientType=0);
	background-color:#599bb3;
	-moz-border-radius:42px;
	-webkit-border-radius:42px;
	border-radius:42px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Impact;
	font-size:12px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #408c99), color-stop(1, #599bb3));
	background:-moz-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-webkit-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-o-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-ms-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#408c99', endColorstr='#599bb3',GradientType=0);
	background-color:#408c99;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>


	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
	<link rel="shortcut icon" href="images/favicon.png">
	<title>POLO | The Multi-Purpose HTML5 Template</title>

	<!-- Bootstrap Core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
	<link href="vendor/animateit/animate.min.css" rel="stylesheet">

	<!-- Vendor css -->
	<link href="vendor/owlcarousel/owl.carousel.css" rel="stylesheet">

	<!-- Template base -->
	<link href="css/theme-base.css" rel="stylesheet">

	<!-- Template elements -->
	<link href="css/theme-elements.css" rel="stylesheet">	
    
    
	<!-- Responsive classes -->
	<link href="css/responsive.css" rel="stylesheet">		

	<!-- Template color -->
	<link href="css/color-variations/blue.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="stylesheet" type="text/css" href="css/custom.css" media="screen" />    

    <!--VENDOR SCRIPT-->
    <script src="vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="vendor/plugins-compressed.js"></script>

</head>
<script>


function goBack() {
    window.history.back();
}



/* 

이런 식의 쿼리문 결과의 카테고리count한 C1~C7중의 max값으로 수치 계산
ex)명소 2곳, 음식점 1곳, 나머지0일 경우     max=2    명소= 2/2*10으로 계산, 음식점은 1/2*10으로 계산
수치는 명소 10, 음식점 5, 나머지0             수치 계산 범위는 0~10임.
*/	

	
</script>
<body>
<div class="container">
		<div class="heading heading-center">
		<div class="col-md" style="margin-top: 100px;">
				<div class="image-box circle-image small">
					<img src="${pageContext.request.contextPath}/profile_img/${user.memberImg}" style="width: 110px; height: 110px;" alt="">
				</div>
				<div class="image-box-description text-center">
					<h3>${user.memberNick} 님</h3>
					<p class="subtitle">추천 일정이 완성되었습니다.</p>					
				</div>
			</div>
			<hr><br>
			
		<div class="row">
			<c:forEach var="prsList2" items="${prsList2}">	
			<div class="col-md-3">			
				<div class="image-box">
					<img src="${prsList2.spotFurl}" alt="">
				</div>
				<div class="image-box-description ">
					<h4>${prsList2.blogTitle}<small>(${prsList1.selCity})</small></h4>
					<p class="subtitle">${prsList1.selDay-1}박 ${prsList1.selDay}일</p>
					<hr class="line">
					<div class="social-icons social-icons-border m-t-10">
						<a href="../blog/myBlogShow.do?planNo=${prsList2.planNo}" class="myButton">일정 상세보기</a>						
					</div>
				</div>
			</div>
			</c:forEach>
			
			<hr>
		</div>
		<a href="" class="myButton" style="font-size:15px; padding:10px 15px;" onclick="goBack()">처음부터 새로 만들기</a>
	</div>
</div>
</body>
</html>