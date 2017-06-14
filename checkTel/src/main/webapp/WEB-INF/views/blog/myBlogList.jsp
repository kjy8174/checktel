<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

		function addUser() {
			var valid = true;
			allFields.removeClass("ui-state-error");

			valid = valid && checkLength(name, "username", 3, 16);
			valid = valid && checkLength(email, "email", 6, 80);
			valid = valid && checkLength(password, "password", 5, 16);

			valid = valid
					&& checkRegexp(
							name,
							/^[a-z]([0-9a-z_\s])+$/i,
							"Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter.");
			valid = valid
					&& checkRegexp(email, emailRegex, "eg. ui@jquery.com");
			valid = valid
					&& checkRegexp(password, /^([0-9a-zA-Z])+$/,
							"Password field only allow : a-z 0-9");

			if (valid) {
				$("#users tbody").append(
						"<tr>" + "<td>" + name.val() + "</td>" + "<td>"
								+ email.val() + "</td>" + "<td>"
								+ password.val() + "</td>" + "</tr>");
				dialog.dialog("close");
			}
			return valid;
		}

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 700,
			width : 500,
			modal : true,
			buttons : {
				"저장" : addUser,
				취소 : function() {
					dialog.dialog("close");
				}
			},
			close : function() {
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});

		form = dialog.find("form").on("submit", function(event) {
			event.preventDefault();
			addUser();
		});

		$("#create-use").button().on("click", function() {
			dialog.dialog("open");
		});
	});

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
	});
	$(function() {
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
	});
	$(function() {
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
	});
	$(function() {
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
	});
	$(function() {
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
	});
	$(function() {
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
	});
	$(function() {
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
	});

	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

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
<!--   모달 end -->
<!-- 셀렉트 메뉴 -->
<script>
	$(function() {

		$("#number").selectmenu().selectmenu("menuWidget").addClass("overflow");
	});
</script>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="boxed-simple">

	<!--트래블로그: HEADER -->
	<br>
	<section id="page-title"
		class="page-title-parallax page-title-center text-dark"
		style="background-image:url(../images/Desert.jpg);">
	<div class="container">
		<div class="page-title col-md-8">
			<table >
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
							<img src="../img/userface.png">
						</div>
					</td>
					<td>
						<div>
							<span style="font-size: 25px; font-weight: bold;">호진</span> 님의
							트래블로그 <br> <br> <input type="button" id="create-use"
								value="프로필 수정">
						</div>
					</td>
				</tr>
			</table>


		</div>
	</div>
	</section>

	<div class="demo" style="margin-left: 450px;">
		<form action="#">

			<label for="number">도시별 검색</label> <select name="number" id="number">
				<option>제주</option>
				<option selected="selected">서울</option>
				<option>도쿄</option>
				<option>런던</option>
				<option>상하이</option>
				<option>파리</option>
				<option>방콕</option>
				<option>로스 엔젤레스</option>
				<option>홍콩</option>
				<option>로마</option>
				<option>하노이</option>
				<option>부산</option>
				<option>바르셀로나</option>
				<option>오사카</option>
				<option>싱가포르</option>
				<option>뉴욕</option>
				<option>베이징</option>
				<option>푸켓</option>
				<option>라스베이거스</option>
				<option>세부</option>
				<option>교토</option>
				<option>마카오</option>
				<option>타이베이</option>
				<option>시드니</option>
				<option>쿠알라 룸푸르</option>
			</select>

		</form>
	</div>
	<!--트래블로그:end HEADER -->

	<!-- CONTENT -->
	<section class="content">

	<div class="polaroid">
		<div class="container">
			<!-- Blog post-->
			<div class="post-content post-4-columns">
				<!-- Blog image post-->

				<div class="post-item">
					<div class="post-image">
						<a href="#"> <img alt="" src="../img/Desert.jpg">
						</a>
					</div>
					<div class="post-content-details">
						<div class="post-title">
							<h3>
								<a href="#">이호진님의 4박5일 여행</a>
							</h3>
						</div>
						<div class="post-info">
							<span class="post-autor">작성자: <a href="#">똑호진</a></span>
						</div>
					</div>

					<div class="post-meta">
						<div class="post-date">
							<span class="post-date-day">16</span> <span
								class="post-date-month">January</span> <span
								class="post-date-year">2015</span>
						</div>

						<div class="post-comments">
							<a href="#"> <i class="fa fa-comments-o"></i> <span
								class="post-comments-number">324</span>
							</a>
						</div>
						<div class="post-comments">
							<a href="#"> <i class="fa fa-share-alt"></i> <span
								class="post-comments-number">324</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="polaroid" style="float: left;">
		<div class="container">
			<!-- Blog post-->
			<div class="post-content post-4-columns">
				<!-- Blog image post-->

				<div class="post-item">
					<div class="post-image">
						<a href="#"> <img alt="" src="../img/Desert.jpg">
						</a>
					</div>
					<div class="post-content-details">
						<div class="post-title">
							<h3>
								<a href="#">이호진님의 4박5일 여행</a>
							</h3>
						</div>
						<div class="post-info">
							<span class="post-autor">작성자: <a href="#">똑호진</a></span>
						</div>
					</div>

					<div class="post-meta">
						<div class="post-date">
							<span class="post-date-day">16</span> <span
								class="post-date-month">January</span> <span
								class="post-date-year">2015</span>
						</div>

						<div class="post-comments">
							<a href="#"> <i class="fa fa-comments-o"></i> <span
								class="post-comments-number">324</span>
							</a>
						</div>
						<div class="post-comments">
							<a href="#"> <i class="fa fa-share-alt"></i> <span
								class="post-comments-number">324</span>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 모달 -->
	<div id="dialog-form" title="My page">
		<br> <br>
		<div class="w3-bar w3-black">
			<button class="w3-bar-item w3-button tablink w3-red"
				onclick="openCity(event,'Londo')">프로필</button>
			<button class="w3-bar-item w3-button tablink"
				onclick="openCity(event,'Pari')">계정 설정</button>

		</div>

		<div id="Londo" class="w3-container w3-border city">
			<div class="row">
				<table>
					<tr>
						<td>
							<form id="form1" runat="server">
								<input type='file' id="imgInp" /> <img id="blah"
									src="../img/Koala.jpg" style="width: 150px; height: 150px;" />
							</form>
						</td>
						<td>
							<div>이름</div>
							<div>닉네임</div>
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

		<div id="Pari" class="w3-container w3-border city"
			style="display: none">
			<br>
			<table style="border-collapse: separate;">
				<tbody>
					<tr height="50">
						<td width="110">이메일</td>
						<td>호진@naver.com</td>
					</tr>
					<tr height="50">
						<td width="110">닉네임</td>
						<td><input type="text" name="member_nick" value="호진" /></td>
					</tr>
					<tr height="50">
						<td width="110">비밀번호변경</td>
					</tr>
					<tr height="50">
						<td width="110">기존비밀번호</td>
						<td><input type="text" name="member_pw" value="" /></td>
					</tr>
					<tr height="50">
						<td width="110">새비밀번호</td>
						<td><input type="text" name="new_pk" value="" /></td>
					</tr>
					<tr height="50">
						<td width="150">새비밀번호 재입력</td>
						<td><input type="text" name="new_pkcon" value="" /></td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>

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
	</script> <!-- 모달 end -->
	<div class="text-center">
		<div class="pagination-wrap">
			<ul class="pagination">
				<li><a aria-label="Previous" href="#"> <span
						aria-hidden="true"><i class="fa fa-angle-left"></i></span>

				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li class="active"><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a aria-label="Next" href="#"> <span aria-hidden="true"><i
							class="fa fa-angle-right"></i></span>
				</a></li>
			</ul>
		</div>
	</div>
	</div>
	<!-- END: Blog post-->
	</div>
	</section>
	<!-- END: SECTION -->
	</div>
	<!-- END: WRAPPER -->

	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i
		class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="js/custom.js"></script>


</body>
</html>
