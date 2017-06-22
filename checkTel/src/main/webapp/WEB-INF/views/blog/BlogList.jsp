<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!-- 페이징 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
  
<script>
	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/blog/getBlogList.do'/>";
		document.listForm.submit();
	}
</script>
<!-- 페이징 끝 -->



<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
div.polaroid {
	width: 300px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
	float: left;
	margin-left: 70px;
	margin-bottom: 50px;
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
<!-- 셀렉트 메뉴 -->
<script>
	$(function() {

		$("#number").selectmenu().selectmenu("menuWidget").addClass("overflow");
	});
</script>
<body class="boxed-simple">
	<!-- PAGE TITLE -->

	<!-- END: PAGE TITLE -->
	<!--트래블로그: HEADER -->
	<div id="travelLogBox" align="center">
		<section id="page-title"
			class="page-title-parallax page-title-center text-dark"
			style="background-image:url(../images/Lighthouse.jpg);">
		<div class="container">
			<div class="page-title col-md-8">
				<div style="line-height: 1px">

					<h1 class="travelTitle" style="line-height: 20px">
						<span align="center" style="font-size: 14px;">트래블로그</span><br>
						<img src="../img/title_travelog.png">
					</h1>

					<a href="${pageContext.request.contextPath}/blog/myBlogList.do">
						<div style="font-size: 13px; margin-left: 900px;">
							<span class="name" style="font-size: 20px; font-weight: bold;">호진</span></b>
							님의 트래블로그
						</div>
					</a>
				</div>

			</div>
			<div class="breadcrumb col-md-4"></div>
		</div>
		</section>

		<hr>
		<!--트래블로그:end HEADER -->
		<!-- CONTENT -->
		<div class="demo">
			<form action="#">
				<fieldset>
					<label for="number">도시별 검색</label> <select name="number"
						id="number">

						<option selected="selected">전체</option>
						<option>서울</option>
						<option>제주</option>
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
				</fieldset>
			</form>
		</div>

		<form name="listForm"
			action="<%=request.getContextPath()%>/getBlogList.do" method="post">

			<section class="content"> <input type="hidden"
				name="pageIndex" /> <c:forEach items="${planList}" var="plan">
				<div class="polaroid">
					<div class="container">
						<!-- Blog post-->
						<div class="post-content post-4-columns">
							<!-- Blog image post-->

							<div class="post-item">
								<div class="post-image">
									<a href="../blog/myBlogShow.do?planNo=${plan.planNo}"> <img
										alt="" src="${plan.spotFurl}">
									</a>
								</div>
								<div class="post-content-details">
									<div class="post-title">

										<h3>
											<a href="#">${plan.memberNick}님의 4박5일 여행</a>
										</h3>

									</div>
									<div class="post-info">
										<span class="post-autor">여행 도시: <a href="#">${plan.cityName}</a></span>
									</div>
								</div>

								<div class="post-meta">
									<div class="post-date">
										<span class="post-date-day">${plan.planStart}</span>
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
			</c:forEach> 
			</section>
		</form>

		<!-- 페이징 태그 출력  -->
		<my:paging paginationInfo="${paginationInfo}" />
		<!-- pagination nav -->


	</div>


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
