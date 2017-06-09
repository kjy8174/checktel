<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>여행의 시작! Check_TEL</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/images/favicon.png">
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath }/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/vendor/fontawesome/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/vendor/animateit/animate.min.css"
	rel="stylesheet">

<!-- Vendor css -->
<link
	href="${pageContext.request.contextPath }/vendor/owlcarousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Template base -->
<link href="${pageContext.request.contextPath }/css/theme-base.css"
	rel="stylesheet">

<!-- Template elements -->
<link href="${pageContext.request.contextPath }/css/theme-elements.css"
	rel="stylesheet">

<!-- Responsive classes -->
<link href="${pageContext.request.contextPath }/css/responsive.css"
	rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->


<!-- Template color -->
<link
	href="${pageContext.request.contextPath }/css/color-variations/blue.css"
	rel="stylesheet" type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800"
	rel="stylesheet" type="text/css" />

<!-- SLIDER REVOLUTION 5.x CSS SETTINGS -->
<link rel="stylesheet" property="stylesheet"
	href="${pageContext.request.contextPath }/vendor/rs-plugin/css/settings.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/rs-plugin-styles.css"
	type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/custom.css"
	media="screen" />

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath }/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendor/plugins-compressed.js"></script>

<!-- SLIDER REVOLUTION 5.x SCRIPTS  -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

<!-- 로그인 모달 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	/* 로그인 모달 */
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
			height : 500,
			width : 400,
			modal : true,
			buttons : {
				"Create an account" : addUser,
				Cancel : function() {
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

		$("#create-user").on("click", function() {
			dialog.dialog("open");
		});
	});
</script>
</head>
<body class="wide">
	<!--SITE LOADER-->
	<div class="loader-wrapper">
		<div class="loader">
			<img width="40"
				src="${pageContext.request.contextPath }/images/svg-loaders/puff.svg"
				alt=""> <span class="loader-title">Page is loading,
				just a sec...</span>
		</div>
	</div>
	<!--END: SITE LOADER-->

	<!-- include_directive.jsp -->
	<div class="wrapper" style="position: fixed;">
		<header id="header" class="header-mini">
			<tiles:insertAttribute name="header" />
		</header>
		<section class="fullscreen no-padding">
			<tiles:insertAttribute name="content" />
		</section>
		<footer>
			<%-- 	<tiles:insertAttribute name="footer" /> --%>
		</footer>
	</div>

	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i
		class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath }/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="${pageContext.request.contextPath }/js/custom.js"></script>
</body>
</html>