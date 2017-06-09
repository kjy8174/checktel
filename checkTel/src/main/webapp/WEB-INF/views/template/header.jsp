<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<!--HEADER-->
	<div id="header-wrap">
		<div class="container">

			<!--LOGO-->
			<div id="logo" style="position: fixed;">
				<a href="index.html" class="logo"
					data-dark-logo="images/logo-dark.png"> <img
					src="images/logo.png" alt="Polo Logo">
				</a>
			</div>
			<!--END: LOGO-->

			<!--MOBILE MENU -->
			<div class="nav-main-menu-responsive">
				<button class="lines-button x" type="button" data-toggle="collapse"
					data-target=".main-menu-collapse">
					<span class="lines"></span>
				</button>
			</div>
			<!--END: MOBILE MENU -->

			<!-- 로그인 모달 -->
			<div id="dialog-form" title="Create new user"
				class="col-md-3 center p-30 background-white">
				<h3>Login to your Account</h3>
				<form class="form-transparent-grey">
					<div class="form-group">
						<label class="sr-only">Username or Email</label> <input
							type="text" class="form-control" placeholder="Username or Email">
					</div>
					<div class="form-group m-b-5">
						<label class="sr-only">Password</label> <input type="password"
							class="form-control" placeholder="Password">
					</div>
					<div class="form-group form-inline text-left ">

						<div class="checkbox">
							<label> <input type="checkbox"><small>
									Remember me</small>
							</label>
						</div>
						<a href="#" class="right"><small>Lost your Password?</small></a>
					</div>
					<div class="text-left form-group">
						<button type="button" class="btn btn-primary">Login</button>

					</div>
				</form>
				<p class="text-left">
					Don't have an account yet? <a href="#">Register New Account</a>
				</p>
			</div>

			<!--TOP SEARCH -->
			<div id="top-search">
				<a id="top-search-trigger"> <i class="fa fa-search"></i><i
					class="fa fa-close"></i></a>
				<form action="search-results-page.html" method="get"
					data-toggle="validator">
					<input type="text" name="q" id="q" class="form-control" value=""
						placeholder="도시 이름을 검색해 주세요! &quot;Enter&quot;" required>
				</form>
			</div>
			<!-- END:TOP SEARCH -->

			<!--상단 메뉴바-->
			<div
				class="navbar-collapse collapse main-menu-collapse navigation-wrap">
				<div class="container">
					<nav class="main-menu mega-menu center" id="mainMenu">
					<ul class="main-menu nav nav-pills">
						<li class="dropdown"><a href="#section1" class="scroll-to"><i
								class="fa fa-home"></i></a></li>
						<li class="dropdown"><a href="#section2" class="scroll-to">일정만들기</a>
						</li>
						<li class="dropdown"><a href="#section3" class="scroll-to">스마트플랜</a>
						</li>
						<li class="dropdown"><a href="#section4" class="scroll-to">트래블로그</a>
						</li>
						<li class="dropdown"><a href="#section4" class="scroll-to">항공권</a>
						</li>
						<li class="dropdown"><a href="#section5" class="scroll-to">호텔</a>
						</li>
						<li class="dropdown"><a href="#section5" class="scroll-to">이용방법</a>
						</li>
					</ul>
					<!-- 로그인 이미지 --> <img id="create-user"
						src="http://static6.depositphotos.com/1005920/670/i/170/depositphotos_6707042-stock-photo-login-icon.jpg"
						style="width: 60px; height: 40px; margin: 10px;" align="right">
					</nav>
				</div>
			</div>
			<!--END: 상단 메뉴 바-->
		</div>
	</div>

	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath }/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="${pageContext.request.contextPath }/js/custom.js"></script>
</body>
</html>