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



/* 쿼리문
 select p.plan_no,
 sum(case when category_id=1 then 1 else 0 end ) c1,
 sum(case when category_id=2 then 1 else 0 end ) c2,
 sum(case when category_id=3 then 1 else 0 end ) c3,
 sum(case when category_id=4 then 1 else 0 end ) c4,
 sum(case when category_id=5 then 1 else 0 end ) c5,
 sum(case when category_id=6 then 1 else 0 end ) c6,
 sum(case when category_id=7 then 1 else 0 end ) c7
from plan p, detail d
where p.plan_no=d.plan_no
and d.city_name='서울'
and p.plan_period=2
group by p.plan_no
order by p.plan_no asc;



select a.plan_no, b.blog_hit, selCategory1/cc*10 as c1, selCategory2/cc*10 as c2, selCategory3/cc*10 as c3, selCategory4/cc*10 as c4, selCategory5/cc*10 as c5, selCategory6/cc*10 as c6, selCategory7/cc*10 as c7
from (
      select plan_no, max(cc) as cc
      from (
              select p.plan_no, d.category_id, count(d.category_id) as cc
                from plan p, detail d
                where p.plan_no=d.plan_no	
                group by p.plan_no, d.category_id
                )
      group by plan_no
    ) a, 
   (
              SELECT * FROM(
                    SELECT P.PLAN_NO, P.BLOG_HIT,
                          SUM(CASE WHEN CATEGORY_ID=1 THEN 1 ELSE 0 END ) selCategory1,
                          SUM(CASE WHEN CATEGORY_ID=2 THEN 1 ELSE 0 END ) selCategory2,
                          SUM(CASE WHEN CATEGORY_ID=3 THEN 1 ELSE 0 END ) selCategory3,
                          SUM(CASE WHEN CATEGORY_ID=4 THEN 1 ELSE 0 END ) selCategory4,
                          SUM(CASE WHEN CATEGORY_ID=5 THEN 1 ELSE 0 END ) selCategory5,
                          SUM(CASE WHEN CATEGORY_ID=6 THEN 1 ELSE 0 END ) selCategory6,
                          SUM(CASE WHEN CATEGORY_ID=7 THEN 1 ELSE 0 END ) selCategory7
                from plan p, detail d
                where p.plan_no=d.plan_no
                and d.city_name='서울'
                and p.plan_period=2
                group by p.plan_no, p.blog_hit
                HAVING 	SUM(CASE WHEN CATEGORY_ID=1 THEN 1 ELSE 0 END ) = 1
                    AND 	SUM(CASE WHEN CATEGORY_ID=2 THEN 1 ELSE 0 END ) = 2
                    AND 	SUM(CASE WHEN CATEGORY_ID=3 THEN 1 ELSE 0 END ) = 0
                    AND 	SUM(CASE WHEN CATEGORY_ID=4 THEN 1 ELSE 0 END ) = 1
                    AND 	SUM(CASE WHEN CATEGORY_ID=5 THEN 1 ELSE 0 END ) = 2
                    AND 	SUM(CASE WHEN CATEGORY_ID=6 THEN 1 ELSE 0 END ) = 0
                    AND 	SUM(CASE WHEN CATEGORY_ID=7 THEN 1 ELSE 0 END ) = 0
                order by p.blog_hit desc, p.plan_no asc)
              WHERE ROWNUM BETWEEN 1 AND 4
       ) b       
where a.plan_no = b.plan_no;


이런 식의 쿼리문 결과의 카테고리count한 C1~C7중의 max값으로 수치 계산
ex)명소 2곳, 음식점 1곳, 나머지0일 경우     max=2    명소= 2/2*10으로 계산, 음식점은 1/2*10으로 계산
수치는 명소 10, 음식점 5, 나머지0

0~10


방법2. 카테고리 7가지 모두다 설정해서 조회

넘어온거의 plan_no를 클릭할때 넘겨서 그걸 조회한 상세페이지로!


참고 http://annehouse.tistory.com/416
★ 분석용 함수
RANK - 해당값에 대한 우선순위를 결정 (중복 우선순위 허용)
DENSE_RANK - 해당값에 대한 우선순위를 결정 (중복 우선순위 허용 안함)
ROW_NUMBER - 조건을 만족하는 모든 행의 번호를 제공
CUME_DIST - 분산값
PERCENT_RANK - 백분율
NTILE(n) - 전체 데이터 분포를 n-Buckets으로 나누어 표시
FIRST_VALUE - 정렬된 값중에서 첫번째 값을 반환.
LAST_VALUE - 정렬된 값중에서 마지막 값을 반환.
 
★ OVER() 에 사용되는 OPTION
1. PARTITION BY
2. ORDER BY DESC
3. NULLS FIRST : NULL 데이터를 먼저 출력.
4. NULLS LAST : NULL 데이터를 나중에 출력.





쿼리한 결과의 

	
	
	*/	

	
</script>
<body>
<div class="container">
		<div class="heading heading-center">
		<div class="col-md" style="margin-top: 100px;">
				<div class="image-box circle-image small">
					<img src="${pageContext.request.contextPath}/images/${user.memberImg}.jpg" alt="">
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
				
			
				
			
			<!-- <div class="col-md-3">
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
			</div> -->
			
			
			<hr>
		</div>
		<a href="" class="myButton" style="font-size:15px; padding:10px 15px;" onclick="goBack()">처음부터 새로 만들기</a>
	</div>
</div>


selCity : ${planRsVO.selCity } <br>
selDay : ${planRsVO.selDay } <br>
selCategory1 : ${planRsVO.selCategory1 } <br>
selCategory2 : ${planRsVO.selCategory2 } <br>
selCategory3 : ${planRsVO.selCategory3 } <br>
selCategory4 : ${planRsVO.selCategory4 } <br>
selCategory5 : ${planRsVO.selCategory5 } <br>
selCategory6 : ${planRsVO.selCategory6 } <br>
selCategory7 : ${planRsVO.selCategory7 } <br>


</body>
</html>