<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--HEADER-->
<div id="header-wrap">
	<div class="container">

		<!--LOGO-->
		<div id="logo" style="position: fixed;">
			<a href="index.html" class="logo"
				data-dark-logo="${pageContext.request.contextPath }/images/logo-dark.png">
				<img src="${pageContext.request.contextPath }/images/logo.png"
				alt="Polo Logo">
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
				</nav>
				<!-- login button -->
				<a data-toggle="modal" data-target="#loginModal" href="member/loginView.do" class="right btn btn-default" id="login" style="margin: -61px 60px 0px 0px;">Login</a>
			</div>
		</div>
		<!--END: 상단 메뉴 바-->
	</div>
</div>
