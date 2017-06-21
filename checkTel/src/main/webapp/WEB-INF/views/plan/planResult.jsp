<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


$(function() {
	$("#passR").click(function() {		
		$.ajax({
			url : '../plan/Result.do',
			method : "post",			
			success : function(data) {
				console.log("ajax전송");
				location.href="../blog/myBlogShow.do?planNo="+data.planNo;
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	});
});
</script>
<%-- selCity : ${selCity } <br>
selDay : ${selDay } <br>
selCategory1 : ${selCategory1 } <br>
selCategory2 : ${selCategory2 } <br>
selCategory3 : ${selCategory3} <br>
selCategory4 : ${selCategory4 } <br>
selCategory5 : ${selCategory5 } <br>
selCategory6 : ${selCategory6 } <br>
selCategory7 : ${selCategory7 } <br> --%>

<body>
<div class="container">
		<div class="heading heading-center">
		<div class="col-md" style="margin-top: 100px;">
				<div class="image-box circle-image small">
					<img src="../images/man.jpg" alt="">
				</div>
				<div class="image-box-description text-center">
					<h3>조장님</h3>
					<p class="subtitle">추천 일정이 완성되었습니다.</p>					
				</div>
			</div>
			<hr><br>
			
		<div class="row">
			<div class="col-md-3">
				<div class="image-box">
					<img src="../images/test/1.jpg" alt="">
				</div>
				<div class="image-box-description ">
					<h4>${selCity}</h4>
					<p class="subtitle">${selDay-1}박 ${selDay}일</p>
					<hr class="line">					
					<div class="social-icons social-icons-border m-t-10">
						<a <%-- href="../blog/myBlogShow.do?planNo=${planNo}" --%> id="passR" class="myButton">일정 상세보기</a>						
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="image-box">
					<img src="../images/test/2.jpg" alt="">
				</div>
				<div class="image-box-description ">
					<h4>어디</h4>
					<p class="subtitle">1박 2일</p>
					<hr class="line">					
					<div class="social-icons social-icons-border m-t-10">
						<a href="#" class="myButton">일정 상세보기</a>						
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="image-box">
					<img src="../images/test/1.jpg" alt="">
				</div>
				<div class="image-box-description ">
					<h4>서</h4>
					<p class="subtitle">1박 2일</p>
					<hr class="line">					
					<div class="social-icons social-icons-border m-t-10">
						<a href="#" class="myButton">일정 상세보기</a>						
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="image-box">
					<img src="../images/test/3.jpg" alt="">
				</div>
				<div class="image-box-description ">
					<h4>모름</h4>
					<p class="subtitle">1박 2일</p>
					<hr class="line">					
					<div class="social-icons social-icons-border m-t-10">
						<a href="#" class="myButton">일정 상세보기</a>						
					</div>
				</div>
			</div>
			<hr>
		</div>
		<a href="" class="myButton" style="font-size:15px; padding:10px 15px;" onclick="goBack()">처음부터 새로 만들기</a>
	</div>
</div>


selCity : ${selCity } <br>
selDay : ${selDay } <br>
selCategory1 : ${selCategory1 } <br>
selCategory2 : ${selCategory2 } <br>
selCategory3 : ${selCategory3 } <br>
selCategory4 : ${selCategory4 } <br>
selCategory5 : ${selCategory5 } <br>
selCategory6 : ${selCategory6 } <br>
selCategory7 : ${selCategory7 } <br>



</body>
</html>