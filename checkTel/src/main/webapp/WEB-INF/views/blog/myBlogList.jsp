<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 페이징 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<script>
	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/blog/myBlogList.do'/>";
		document.listForm.submit();
	}
</script>
<!-- 페이징 끝 -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!--VENDOR SCRIPT-->
<script src="vendor/jquery/jquery-1.11.2.min.js"></script>
<script src="vendor/plugins-compressed.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 모달 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
label, input {
	display: block;
}
section{
	padding-top: 0px;
}
input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}

div.polaroid {
	width: 300px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
	float: left;
	margin-left: 100px;
	margin-bottom: 30px;
}

fieldset {
	border: 0;
}

label {
	display: block;
	margin: 30px 0 0 0;
}

.overflow {
	height: 200px;
}

.modal-body img {
	width: auto;
	height: auto;
	max-width: 250px;
	max-height: 250px;
}
</style>

<script>
	$(function() {
		var dialog, form,

		// From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
		emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, name = $("#name"), email = $("#email"), password = $("#password"), allFields = $(
				[]).add(name).add(email).add(password), tips = $(".validateTips");

		function updateTips(t) {
			tips.text(t).addClass("ui-state-highlight");
			setTimeout(function() {
				tips.removeClass("ui-state-highlight", 1500);
			}, 500);
		}

		function checkLength(o, n, min, max) {
			if (o.val().length > max || o.val().length < min) {
				o.addClass("ui-state-error");
				updateTips("Length of " + n + " must be between " + min
						+ " and " + max + ".");
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp(o, regexp, n) {
			if (!(regexp.test(o.val()))) {
				o.addClass("ui-state-error");
				updateTips(n);
				return false;
			} else {
				return true;
			}
		}

		/*  	/* $("#btnIns").click(function(){   //버튼 주소 */
		// 파라미터 -> 쿼리문자열 만들기
		//var params = $("#updForm").serialize(); //폼태그 주소
		// 등록 ajax 요청
		/* $.post("/blogUpdate.do", params, function(data, status) { //서버 url주소
			var jData = eval("(" + data + ")"); //json으로 변환
			if (status == "success") {
				if (jData.length == 1) {
					alert("등록완료");
					var div = "<div id='"+jData[0].departmentId+"'>"
							+ "<span>" + jData[0].departmentId + "</span>"
							+ "<span>" + jData[0].departmentName
							+ "</span>" + "</div>"
					$(div).prependTo("#deptList");
				} else {
					alert("등록에러");
				}
			}
		});
		return false; //event.preventDefault()
		}   */

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 700,
			width : 500,
			modal : true,
			close : function() {
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});

		/* 		$("#create-use").button().on("click", function() {
		 dialog.dialog("open");
		 }); */

		/*----------------------------------------------
		파일첨부시 사진 미리보기  시작
		--------------------------------------------------*/
		$("#uploadFile").on('change', function() {
			if (typeof (FileReader) != "undefined") {
				var imgchange = $("#imgchange");
				imgchange.empty();
				var reader = new FileReader();
				reader.onload = function(e) {
					$("<img />", {
						"src" : e.target.result,
						"class" : "thumb-image",
					}).appendTo(imgchange)
				}
				imgchange.show();
				reader.readAsDataURL($(this)[0].files[0]);
			} else {
				alert("This browser does not support FileReader.");
			}
		});
	});

	/*----------------------------------
	 * 카테고리 보기
	 --------------------------------*/
	$(function() {
		$("#slider-vertical1").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount1").val(ui.value);
			}
		});
		$("#amount1").val($("#slider-vertical1").slider("value"));

		$("#slider-vertical2").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount2").val(ui.value);
			}
		});
		$("#amount2").val($("#slider-vertical2").slider("value"));

		$("#slider-vertical3").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount3").val(ui.value);
			}
		});
		$("#amount3").val($("#slider-vertical3").slider("value"));

		$("#slider-vertical4").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount4").val(ui.value);
			}
		});
		$("#amount4").val($("#slider-vertical4").slider("value"));

		$("#slider-vertical5").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount5").val(ui.value);
			}
		});
		$("#amount5").val($("#slider-vertical5").slider("value"));

		$("#slider-vertical6").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount6").val(ui.value);

			}
		});
		$("#amount6").val($("#slider-vertical6").slider("value"));

		$("#slider-vertical7").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 10,
			value : 6,
			slide : function(event, ui) {
				$("#amount7").val(ui.value);
			}
		});
		$("#amount7").val($("#slider-vertical7").slider("value"));

		$("#imgInp").on('change', function() {
			readURL(this);
		});

		/*--------------------
		   초기화
		-----------------------*/
		$("#number").selectmenu().selectmenu("menuWidget").addClass("overflow"); //

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 700,
			width : 500,
			modal : true,
			close : function() {
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});

		$("#create-use").button().on("click", function() {
			dialog.dialog("open");
		});

	});

	/*--------------------
	  계정 수정
	-----------------------*/
	function userUpd() {

		var f1 = document.forms["updFrofile"];
		var nick = f1.memberNick.value;
		var pw1 = f1.oldmemberPw.value;
		var pw2 = f1.memberPw.value;
		var pw3 = f1.pwd_confirm.value;
		
		
		if(!nick){
			document.getElementById('checkPwd').innerHTML = "Nickname을 입력하지 않으셨습니다";
			return;
		
		}if(!pw1){
			document.getElementById('checkPwd').innerHTML = "암호를 입력하지 않으셨습니다";
			return;
		
		}if(!pw2){
			document.getElementById('checkPwd').innerHTML = "암호를 입력하지 않으셨습니다";
			return;
		
		}if(!pw3){
			document.getElementById('checkPwd').innerHTML = "암호를 입력하지 않으셨습니다";
			return;
						
		}if(pw2 != pw3) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
			return;
			
		} else {
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
		}
		
		var jsonData = $("#updFrofile").serialize();//JSON.stringify();
		//console.log(jsonData)
		$.ajax({
			url : '../userProfileUpdate.do',
			method : "post",
			dataType : "json",
			data : jsonData,
			success : function(data) {
				if(data.result=="success"){
					
					alert("저장 되었습니다");
				}else{
					alert(data.errorMessage);
				}
				console.log("ajax전송");
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="boxed-simple">

	<!--트래블로그: HEADER -->
	<br>
	<section id="page-title"
		class="page-title-parallax page-title-center text-dark"
		style="background-image:url(../images/Desert.jpg); padding-top:0px;">
	<div class="container">
		<div class="page-title col-md-8">
			<table>
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/blog/getBlogList.do">
							<div>
								<span
									style="font-size: 50px; font-weight: bold; color: #d9dadf;"><</span>
							</div>
					</a></td>
					<td>
						<div>
							<img
								src="${pageContext.request.contextPath}/profile_img/${user.memberImg}"
								style="width: 200px; height: 200px;">
						</div>
					</td>
					<td>
						<div>
							<span style="font-size: 25px; font-weight: bold;">&nbsp; &nbsp;★${user.memberNick}</span>
							님의 트래블로그 <br> <br> <input type="button" id="create-use"
								value="프로필 수정">
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	</section>
	<!--트래블로그:end HEADER -->

<br>
<br>
<br>
<br>


	<!-- CONTENT -->
	<form name="listForm" action="<%=request.getContextPath()%>/myBlogList.do" method="post">
		<section class="content"> <input type="hidden"
			name="pageIndex" /> <c:forEach items="${plan}" var="plan">
			<div class="polaroid">
				<div class="container">
					<!-- Blog post-->
					<div class="post-content post-4-columns">
						<!-- Blog image post-->

						<div class="post-item">
							<div class="post-image">
								<a href="../blog/myBlogShow.do?planNo=${plan.planNo}"> <img
									alt="" src="${plan.spotFurl}" style="max-width:267px; max-height:150px;">
								</a>
							</div>
							<div class="post-content-details">
								<div class="post-title">
									<h3>
										<a href="#">${user.memberNick}님의 4박5일 여행</a>
									</h3>
								</div>
								<div class="post-info">
									<span class="post-autor">여행 도시: <a href="#">${plan.cityName}</a></span>
								</div>
							</div>

							<div class="post-meta">
								<div class="post-date">
									<span class="post-date-day">${plan.planStarts}</span>
								</div>
								<div class="post-comments">
									<a href="#"> <img src="../img/redHeartS.png"> <span
										class="post-comments-number">${plan.hitCount }</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach> </section>
	</form>
	<!-- 페이징 태그 출력  -->
	<my:paging paginationInfo="${paginationInfo}" />
	<!-- 모달 -->



	<!-- 프로필 수정 팝업 시작-->
	<div id="dialog-form" title="My page">
		<br>
		<div class="w3-bar w3-black">
			<button class="w3-bar-item w3-button tablink w3-red"
				onclick="openCity(event,'Londo')">프로필</button>
			<button class="w3-bar-item w3-button tablink"
				onclick="openCity(event,'Pari')">계정 설정</button>

		</div>
		<!-- 프로필 사진 수정 탭1 시작 -->
		<div id="Londo" class="w3-container w3-border city">
			<div class="row">
				<table>
					<tr>
						<td>
							<form
								action="${pageContext.request.contextPath}/profileUpdate.do"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="memberNo" value="${user.memberNo}">
								<div class="modal-body">
									<input type="hidden" id="img" name="img"> <img>
									<hr>
									<div id="imgchange"></div>
									<br> <br> <br> 프로필 사진: <input type="file"
										id="uploadFile" name="uploadFile" alt="이미지선택"><br>
								</div>
								<div class="modal-footer">
									<!-- <input type="button" class="btn btn-default btn-simple" data-dismiss="modal" value="취소"> -->
									<input type="button" class="close btn btn-warning"
										data-dismiss="modal" value="취소"
										onClick="window.location.reload()"> <input
										type="submit" class="btn btn-success" value="사진등록 및 변경">
								</div>
							</form>
						</td>
						<td>
							<div>이름 : ${user.memberName}</div>
							<div>닉네임 : ${user.memberNick}</div>
						</td>
					</tr>
				</table>
				<div class="col-md-5" data-animation="flipInY"
					data-animation-delay="0">
					<div class="center" style="width: 500px;">
						<br> <br> 나의 선호도 <br>
						<div>
							<img src="../img/icon_category_1_b.png"
								style="margin-right: 12px" /> <img
								src="../img/icon_category_2_b.png" style="margin-right: 12px" />
							<img src="../img/icon_category_3_b.png"
								style="margin-right: 11px" /> <img
								src="../img/icon_category_4_b.png" style="margin-right: 10px" />
							<img src="../img/icon_category_5_b.png"
								style="margin-right: 10px" /> <img
								src="../img/icon_category_6_b.png" style="margin-right: 10px" />
							<img src="../img/icon_category_7_b.png" />
						</div>
						<br>
						<div style="float: left; width: 550px;">
							<div id="slider-vertical1"
								style="height: 200px; float: left; margin-left: 20px; margin-right: 50px"></div>
							<div id="slider-vertical2"
								style="height: 200px; float: left; margin-right: 50px"></div>
							<div id="slider-vertical3"
								style="height: 200px; float: left; margin-right: 50px"></div>
							<div id="slider-vertical4"
								style="height: 200px; float: left; margin-right: 50px"></div>
							<div id="slider-vertical5"
								style="height: 200px; float: left; margin-right: 50px"></div>
							<div id="slider-vertical6"
								style="height: 200px; float: left; margin-right: 50px"></div>
							<div id="slider-vertical7"
								style="height: 200px; float: left; margin-right: 50px"></div>
						</div>
						<div style="clear: both;">
							<label for="amount1">기타:</label> <input type="text" id="amount1"
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
							<label for="amount6">이벤트:</label> <input type="text" id="amount6"
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
		<!-- 프로필 사진 수정 탭1 끝-->

		<!-- 계정수정 탭2 -->
		<div id="Pari" class="w3-container w3-border city"
			style="display: none">
			<form name="updFrofile" id="updFrofile">
			
 				<br>
				<table style="border-collapse: separate;">
					<tbody>
						<tr height="50">
							<td width="110">이메일</td>
							<td>${user.memberEmail}</td>
						</tr>
						<tr height="50">
							<td width="110">닉네임</td>
							<td>
								<input type="text" name="memberNick" value="${user.memberNick}" />
							</td>
						</tr>
						<tr>
						<td colspan="3"><hr></td>
						</tr>
						<tr height="50">
							<td width="110">비밀번호변경</td>
						</tr>
						<tr height="50">
							<td width="110">기존비밀번호</td>
							<td><input type="password" name="oldmemberPw"
								placeholder="Before Password" /></td>
						</tr>
						<tr height="50">
							<td width="110">새비밀번호</td>
							<td><input type="password" name="memberPw"
								placeholder="After Password" /></td>

						</tr>
						<tr height="50">
							<td width="150">새비밀번호 재입력</td>
							<td><input type="password" name="pwd_confirm"
								placeholder="Confirm Password" /></td>
						</tr>
						<tr>
							<td width="200" colspan="3"><div id="checkPwd" style="margin-left:20px;">동일한 암호를 입력하세요.</div></td>
							<td><br><br></td>
						</tr>
					
						<tr>
							<td colspan="2">
								<!-- <input type="button" class="btn btn-default btn-simple" data-dismiss="modal" value="취소"> -->
								<input type="button" class="close btn btn-warning" data-dismiss="modal" value="취소"
								onClick="window.location.reload()"> 
								<input type="button" onclick="userUpd()" class="btn btn-success" value="저장">

							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 계정수정 탭2 -->
	</div>
	<!-- 프로필 수정 팝업 끝-->

	<script>
		function openCity(evt, cityName) {
			var i, x, tablinks;
			x = document.getElementsByClassName("city");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < x.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" w3-red", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " w3-red";
		}
	</script>
	<!-- 모달 end -->
	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i
		class="fa fa-chevron-up"></i></a>
	<!-- Theme Base, Components and Settings -->
	<script src="js/theme-functions.js"></script>
	<!-- Custom js file -->
	<script src="js/custom.js"></script>
</body>
</html>