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
	<!-- login modal -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- 회원등록 modal -->
	<div id="regModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
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