<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
<style>
 #custom-handle {
    width: 3em;
    height: 1.6em;
    top: 50%;
    margin-top: -.8em;
    text-align: center;
    line-height: 1.6em;
  }
  #slider .ui-slider-range { background: #ef2929; }
  #slider .ui-slider-handle { border-color: #ef2929; }
.imgteaser .desc {	display: none; }
.imgteaser:hover .desc{ /*ĸ�� �ؽ�Ʈ*/
	display: block;
	font-size: 11px;
	font-family:;
	letter-spacing:-1px;
	line-height:140%;
	padding: 10px 0;
	background: #111;
	filter:alpha(opacity=75);/*�ͽ��� ������ ����*/
	opacity:.75;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=75)"; /*--�ͽ�8�� ������ ����--*/
	color: #fff;
	position: absolute;
	bottom: 20px;
	left: 43px;
	padding: 10px;
	margin: 0;
	width: 141px; /*�̹��� ������� -20�� ��*/
	border-top: 1px solid #999;
}
.imgteaser:hover .desc strong {  /*ĸ�� ���� �ؽ�Ʈ*/
	color:#00FFFF;
	display: block;
	margin-bottom: 5px;
	font-size:16px;
	font-family:dotum;
	font-weight:bold;
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    height : 60px;
    width:140px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    padding-left: 27px;
    padding-top: 16px;
}

.button1 {
   background-color: #f44336;
    color: white;
}

.button1:hover {
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}
</style>
	<link rel="shortcut icon" href="images/favicon.png">
	<title>POLO | The Multi-Purpose HTML5 Template</title>

	<!-- Bootstrap Core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
	<link href="vendor/animateit/animate.min.css" rel="stylesheet">

	<!-- Vendor css -->
	<link href="vendor/owlcarousel/owl.carousel.css" rel="stylesheet">
	<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

	<!-- Template base -->
	<link href="css/theme-base.css" rel="stylesheet">

	<!-- Template elements -->
	<link href="css/theme-elements.css" rel="stylesheet">	
	
<!-- Responsive classes -->
	<link href="css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->	


	<!-- Template color -->
	<link href="css/color-variations/blue.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="stylesheet" type="text/css" href="css/custom.css" media="screen" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">  
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
    <!--VENDOR SCRIPT-->
    <script src="vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="vendor/plugins-compressed.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	var handle = $("#custom-handle");
	$("#slider").slider({
		 range: "min",
	      min: 1,
	      max: 7,
	      value: 1,
		create : function() {
			handle.text($(this).slider("value")+"day");
			$("#selDay").val("1")
		},
		slide : function(event, ui) {
			handle.text(ui.value+"day");
			$("#selDay").val(ui.value)
		}
	});
});
$(function() {
	$("#slider-vertical1").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount1").val(ui.value);
			$("#selCategory1").val(ui.value);
		}
	});
	$("#amount1").val($("#slider-vertical1").slider("value"));
});
$(function() {
	$("#slider-vertical2").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount2").val(ui.value);
			$("#selCategory2").val(ui.value);
		}
	});
	$("#amount2").val($("#slider-vertical2").slider("value"));
});
$(function() {
	$("#slider-vertical3").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount3").val(ui.value);
			$("#selCategory3").val(ui.value);
		}
	});
	$("#amount3").val($("#slider-vertical3").slider("value"));
});
$(function() {
	$("#slider-vertical4").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount4").val(ui.value);
			$("#selCategory4").val(ui.value);
		}
	});
	$("#amount4").val($("#slider-vertical4").slider("value"));
});
$(function() {
	$("#slider-vertical5").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount5").val(ui.value);
			$("#selCategory5").val(ui.value);
		}
	});
	$("#amount5").val($("#slider-vertical5").slider("value"));
});
$(function() {
	$("#slider-vertical6").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value :0,
		slide : function(event, ui) {
			$("#amount6").val(ui.value);
			$("#selCategory6").val(ui.value);
		}
	});
	$("#amount6").val($("#slider-vertical6").slider("value"));
});
$(function() {
	$("#slider-vertical7").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 10,
		value : 0,
		slide : function(event, ui) {
			$("#amount7").val(ui.value);
			$("#selCategory7").val(ui.value);
		}
	});
	$("#amount7").val($("#slider-vertical7").slider("value"));
});
/* $(function() {
	 $("#planResult").on('click', function() {
		 if($("#selCity").val()==null&&$("#selCity").val().equals("sel")){
			 alert("값을 설정하세요");
			 
		 }
		});
}); */

$(function() {
	$("#city").change(function(){
		$("#selCity").val($("#city option:selected").val());
	});
});

/* $(function() {
	
		$("#city"+i).on('click', function(e) { // 리스트 클릭시 상세 정보 표시
				console.log($("#city"+i+" strong"));
		});
		console.log(i)
	}
});
 */
 //이미지 클릭 시 드롭박스 값 선택
 $( function() {
	    $(".imgteaser").click(function() {
	    	 div = $(".imgteaser").index(this);
	    	 $("#city").val($("#city"+(div+1)+" .desc strong").text()).attr("selected","selected")
	    	 $("#selCity").val($("#city"+(div+1)+" .desc strong").text());
	    });
	});
 
</script>
</head>

<body class="wide">
	

	<!-- WRAPPER -->
	<div class="wrapper">
		
		<!-- CLIENTS -->
		<section>
			<div class="container">
				<div class="heading text-left">
					<h2>STEP1<br>여행도시</h2>
					<span class="lead">마음속에 이미 갈곳을 정해두셨다면?<br> 여행일정을 추천 받을 도시는 선택해주시면 선택하신 도시에서의 여행일정을
			추천해드려요~^^</span>
				</div>
				<ul class="grid grid-5-columns">
					<li>
						<div class="imgteaser" id="city1">
						<img src="../img/loading.jpg" alt="">
						<span class="desc"> <strong>서울</strong> 대한민국
						</span>
						</div>
						</li>
					<li>
						<div class="imgteaser" id="city2">
						<img src="../img/loading (1).jpg" alt="">
						<span class="desc"> <strong>제주</strong> 대한민국
						</span>
						</div>
					</li>
					<li>
						<div class="imgteaser" id="city3">
						<img src="../img/loading (2).jpg" alt="">
						<span class="desc"> <strong>도쿄</strong> 일본
						</span>
						</div>
					</li>
					<li>
						<div class="imgteaser" id="city4">
						<img src="../img/loading (3).jpg" alt="">
						<span class="desc"> <strong>런던</strong> 영국
						</span>
						</div>
					</li>
					<li>
						<div class="imgteaser" id="city5">
						<img src="../img/loading (4).jpg" alt="">
						<span class="desc"> <strong>상하이</strong> 중국
						</span>
						</div>
					</li>
					<li>
						<div class="imgteaser" id="city6">
						<img src="../img/loading (5).jpg" alt="">	
						<span class="desc"> <strong>파리</strong> 프랑스
						</span>
						</div>			
					</li>
					<li>
						<div class="imgteaser" id="city7">
						<img src="../img/loading (6).jpg" alt="">
						<span class="desc"> <strong>방콕</strong> 태국
						</span>
						</div>
					</li>
					<li>
						<div class="imgteaser" id="city8">
						<img src="../img/loading (7).jpg" alt="">	
						<span class="desc"> <strong>로스 앤젤레스</strong> 미국
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city9">
						<img src="../img/loading (8).jpg" alt="">
						<span class="desc"> <strong>홍콩</strong> 홍콩
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city10">
						<img src="../img/loading (9).jpg" alt="">
						<span class="desc"> <strong>로마</strong> 이탈리아
						</span>
						</div>
						</li>
					<li>
						<div class="imgteaser" id="city11">
						<img src="../img/loading (10).jpg" alt="">	
						<span class="desc"> <strong>바르셀로나</strong> 스페인
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city12">
						<img src="../img/loading (11).jpg" alt="">	
						<span class="desc"> <strong>오사카</strong> 일본
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city13">
						<img src="../img/loading (12).jpg" alt="">	
						<span class="desc"> <strong>싱가포르</strong> 싱가포르
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city14">
						<img src="../img/loading (13).jpg" alt="">				
						<span class="desc"> <strong>뉴욕</strong> 미국
						</span>
						</div>
						</li>	
					<li>
						<div class="imgteaser" id="city15">
						<img src="../img/loading (14).jpg" alt="">		
						<span class="desc"> <strong>베이징</strong> 중국
						</span>
						</div>			
					</li>										
					
				</ul>
				<a href=#none onclick=this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';>
	<h3 style="color: red; font-weight: bold;">더보기</h3>
	</a><DIV style='display:none'>
					<ul class="grid grid-5-columns">
						<li>
							<div class="imgteaser" id="city16">
								<img src="../img/loading (15).jpg" alt=""> <span class="desc">
									<strong>푸켓</strong> 태국
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city17">
								<img src="../img/loading (16).jpg" alt=""> <span class="desc">
									<strong>라스 베이거스</strong> 미국
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city18">
								<img src="../img/loading (17).jpg" alt=""> <span class="desc">
									<strong>세부</strong> 필리핀
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city19">
								<img src="../img/loading (18).jpg" alt=""> <span class="desc">
									<strong>교토</strong> 일본
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city20">
								<img src="../img/loading (19).jpg" alt=""> <span class="desc">
									<strong>마카오</strong> 홍콩
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city21">
								<img src="../img/loading (20).jpg" alt=""> <span class="desc">
									<strong>타이베이</strong> 대만
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city22">
								<img src="../img/loading (21).jpg" alt=""> <span class="desc">
									<strong>시드니</strong> 오스트레일리아
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city23">
								<img src="../img/loading (22).jpg" alt=""> <span class="desc">
									<strong>쿠알라 룸푸르</strong> 말레이시아
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city24">
								<img src="../img/loading (23).jpg" alt=""> <span class="desc">
									<strong>마닐라</strong> 필리핀
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city25">
								<img src="../img/loading (24).jpg" alt=""> <span class="desc">
									<strong>하노이</strong> 베트남
								</span>
							</div>
						</li>
						<li>
							<div class="imgteaser" id="city26">
								<img src="../img/loading (25).jpg" alt=""> <span class="desc">
									<strong>부산</strong> 대한민국
								</span>
							</div>
						</li>
					</ul>
			</DIV>
			<select name='city' id="city">
				<option value='sel' selected>--도시 선택 --</option>
				<option value='서울'>서울</option>
				<option value='제주'>제주</option>
				<option value='도쿄'>도쿄</option>
				<option value='런던'>런던</option>
				<option value='상하이'>상하이</option>
				<option value='파리'>파리</option>
				<option value='방콕'>방콕</option>
				<option value='로스 앤젤레스'>로스 앤젤레스</option>
				<option value='홍콩'>홍콩</option>
				<option value='로마'>로마</option>
				<option value='바르셀로나'>바르셀로나</option>
				<option value='오사카'>오사카</option>
				<option value='싱가포르'>싱가포르</option>
				<option value='뉴욕'>뉴욕</option>
				<option value='베이징'>베이징</option>
				<option value='푸켓'>푸켓</option>
				<option value='라스 베이거스'>라스 베이거스</option>
				<option value='세부'>세부</option>
				<option value='교토'>교토</option>
				<option value='마카오'>마카오</option>
				<option value='타이베이'>타이베이</option>
				<option value='시드니'>시드니</option>
				<option value='쿠알라 룸푸르'>쿠알라 룸푸르</option>
				<option value='마닐라'>마닐라</option>
				<option value='하노이'>하노이</option>
				<option value='부산'>부산</option>
			</select>
		</div>
		</section>
		
		<!-- CLIENTS -->
		<div class="seperator p-b-0 p-t-0">
			<i class="fa fa-chevron-down"></i>
		</div>
		<!-- COUNTERS -->
		<section class="background-grey text-dark">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="heading heading text-left">
							<h2>STEP2<br>여행일정</h2>
							<span class="lead">여행일정이 정해지셨다면?<br>2박3일, 3박4일?! 여행일정이 정해지셨다면 머무실 기간을 <br>선택하시면, 기간에
		맞는 일정을 추천해드립니다.</span>
						</div>
					</div><br><br><br><br>
					<div class="col-md-5">
						<div id="startU" class="startUp" style="float: left; background-image:url('../img/icon_calendar_w.png'); background-repeat:no-repeat; background-color:pink; width: 32px; height: 33px;">
						</div>
						<div id="slider" style="width: 400px; height: 30px; margin-left:35px; background: pink;">
						  <div id="custom-handle" class="ui-slider-handle" style="background: white;"></div>
						</div>	
						<span>머무실 기간을 선택해 주세요.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(최대 7일 기간 선택이 가능합니다.)</span>
					</div>
				</div>
			</div>
		</section>
		<!-- END: COUNTERS -->
		<div class="seperator p-b-0 p-t-0">
			<i class="fa fa-chevron-down"></i>
		</div>
		<!-- SERVICES -->
		<section>
			<div class="container">
				<div class="heading text-left">
					<h2>STEP3<br>개인 여행 성향</h2>
					<span class="lead">여행성향에 꼭 맞는 여행일정만들기를 위한 필수단계!!<br>추천받을 여행의 성향을 조정 할
			수 있어요~!!</span>
				</div>

				<div class="row">
					<div class="col-md-5" data-animation="flipInY" data-animation-delay="0"   style="margin-left: 300px;">
			<div class="center">
			여행 성향 <br>
			<div>
			<img src="../img/icon_category_1_b.png" style="margin-right: 12px"/>
			<img src="../img/icon_category_2_b.png" style="margin-right: 12px"/>
			<img src="../img/icon_category_3_b.png" style="margin-right: 11px"/>
			<img src="../img/icon_category_4_b.png" style="margin-right: 10px"/>
			<img src="../img/icon_category_5_b.png" style="margin-right: 10px"/>
			<img src="../img/icon_category_6_b.png" style="margin-right: 10px"/>
			<img src="../img/icon_category_7_b.png"/>
			</div>
			<br>
			<div style="float: left;">
				<div id="slider-vertical1" style="height: 200px;  float: left; margin-left:20px; margin-right: 50px"></div>
				<div id="slider-vertical2" style="height: 200px;  float: left; margin-right: 50px"></div>				
				<div id="slider-vertical3" style="height: 200px;  float: left; margin-right: 50px"></div>
				<div id="slider-vertical4" style="height: 200px; float: left; margin-right: 50px"></div>
				<div id="slider-vertical5" style="height: 200px; float: left; margin-right: 50px"></div>
				<div id="slider-vertical6" style="height: 200px; float: left; margin-right: 50px"></div>
				<div id="slider-vertical7" style="height: 200px; float: left; margin-right: 50px"></div>
			</div>
			<div style="clear: both;">
			<label for="amount1">명소:</label> <input type="text" id="amount1"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount2">쇼핑:</label> <input type="text" id="amount2"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount3">문화:</label> <input type="text" id="amount3"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount4">역사:</label> <input type="text" id="amount4"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount5">자연:</label> <input type="text" id="amount5"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount6">기타:</label> <input type="text" id="amount6"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
				<label for="amount7">음식점:</label> <input type="text" id="amount7"
					readonly
					style="border: 0; color: #f6931f; font-weight: bold; width: 14px;">
			</div>
		</div>
					</div>
				</div>
			</div>

		</section>
		<!-- END: SERVICES -->

		
		
	</div>
	<!-- END: WRAPPER -->
	<div style="position: fixed; right: 0px; top: 300px;">
		<form action="../plan/planResult.do" method="post">
		선택 도시 <input type="text" id="selCity" name="selCity" readonly="readonly" size="11" style="text-align: center;" required>
		<br>
		선택 기간  <input type="text" id="selDay" name="selDay" readonly="readonly" size="1"style="text-align: center;" required>
		<!-- 서울 2 / 1 2 0 1 2 0 0  -->
		<input type="hidden" id="selCategory1" name="selCategory1" value="0" >
		<input type="hidden" id="selCategory2" name="selCategory2" value="0" >
		<input type="hidden" id="selCategory3" name="selCategory3" value="0" >
		<input type="hidden" id="selCategory4" name="selCategory4" value="0" >
		<input type="hidden" id="selCategory5" name="selCategory5" value="0" >
		<input type="hidden" id="selCategory6" name="selCategory6" value="0" >
		<input type="hidden" id="selCategory7" name="selCategory7" value="0" >
		<br>
		<button class="button button1" id="planResult">나만의 추천 <br>일정 만들기</button>
		</form>
	</div>
	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="js/custom.js"></script>



</body>

</html>
