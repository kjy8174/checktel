<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="boxed-simple" >

   <!--트래블로그: HEADER -->
	<div id="travelLogBox" align="center">
		<h1 class="travelTitle">
			<span align="center" style="font-size: 14px;">트래블로그</span><br>
			 <img src="../img/title_travelog.png"> 
		</h1>
		<div class="w3-bar w3-black" style="width: 16%">
			<button class="w3-bar-item w3-button tablink w3-red"
				onclick="openCity(event,'London')">전체</button>
			<button class="w3-bar-item w3-button tablink"
				onclick="openCity(event,'Paris')">일정</button>
			<button class="w3-bar-item w3-button tablink"
				onclick="openCity(event,'Tokyo')">장소</button>
		</div>
		<a href="${pageContext.request.contextPath}/blog/myBlogList.do">
			<div
				style=" font-size: 13px; text-align: right;">
				<span class="name" style="font-size: 20px; font-weight: bold;">호진</span></b> 님의
				트래블로그
			</div>
		</a>
 <!--트래블로그:end HEADER -->
 
<!-- CONTENT -->
<section class="content"  >
	<div class="container" >
		<!-- Blog post-->
		<div class="post-content post-4-columns" >
			<!-- Blog image post-->
			<div id="London" class="w3-container w3-border city" >
			<div class="post-item">
				<div class="post-image">
					<a href="#">
						<img alt="" src="../img/Desert.jpg">
					</a>
				</div>
				<div class="post-content-details">
					<div class="post-title">
						<h3><a href="#">이호진님의 4박5일 여행</a></h3>
					</div>
					<div class="post-info">
						<span class="post-autor">작성자: <a href="#">똑호진</a></span>
					</div>
				</div>

				<div class="post-meta">
					<div class="post-date">
						<span class="post-date-day">16</span>
						<span class="post-date-month">January</span>
						<span class="post-date-year">2015</span>
					</div>

					<div class="post-comments">
						<a href="#">
							<i class="fa fa-comments-o"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
					<div class="post-comments">
						<a href="#">
							<i class="fa fa-share-alt"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
					</div>
				</div>
			</div>
			<!-- Blog image post-->
			<div id="Paris" class="w3-container w3-border city"
			style="display: none">
			<div class="post-item">
				<div class="post-image">
					<a href="#">
						<img alt="" src="images/blog/thumb/2.jpg">
					</a>
				</div>
				<div class="post-content-details">
					<div class="post-title">
						<h3><a href="#">Image post example</a></h3>
					</div>
					<div class="post-info">
						<span class="post-autor">Post by: <a href="#">Alea Grande</a></span>
						<span class="post-category">in <a href="#">Productivity</a></span>
					</div>
					<div class="post-description">
						<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>

						<div class="post-info">
							<a class="read-more" href="blog-post.html">read more <i class="fa fa-long-arrow-right"></i></a>
						</div>
					</div>
				</div>

				<div class="post-meta">
					<div class="post-date">
						<span class="post-date-day">16</span>
						<span class="post-date-month">January</span>
						<span class="post-date-year">2015</span>
					</div>

					<div class="post-comments">
						<a href="#">
							<i class="fa fa-comments-o"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
					<div class="post-comments">
						<a href="#">
							<i class="fa fa-share-alt"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
				</div>
			</div>
			</div>
			<!-- Blog image post-->
			<div id="Tokyo" class="w3-container w3-border city"
			style="display: none">
			<div class="post-item">
				<div class="post-image">
					<a href="#">
						<img alt="" src="images/blog/thumb/3.jpg">
					</a>
				</div>
				<div class="post-content-details">
					<div class="post-title">
						<h3><a href="#">Image post example</a></h3>
					</div>
					<div class="post-info">
						<span class="post-autor">Post by: <a href="#">Alea Grande</a></span>
						<span class="post-category">in <a href="#">Productivity</a></span>
					</div>
					<div class="post-description">
						<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>

						<div class="post-info">
							<a class="read-more" href="blog-post.html">read more <i class="fa fa-long-arrow-right"></i></a>
						</div>
					</div>
				</div>

				<div class="post-meta">
					<div class="post-date">
						<span class="post-date-day">16</span>
						<span class="post-date-month">January</span>
						<span class="post-date-year">2015</span>
					</div>

					<div class="post-comments">
						<a href="#">
							<i class="fa fa-comments-o"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
					<div class="post-comments">
						<a href="#">
							<i class="fa fa-share-alt"></i>
							<span class="post-comments-number">324</span>
						</a>
					</div>
				</div>
				</div>
			</div>
			
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
	</script>

			<!-- pagination nav -->
			<div class="text-center">
					<div class="pagination-wrap">
						<ul class="pagination">
							<li>
								<a aria-label="Previous" href="#">
									<span aria-hidden="true"><i class="fa fa-angle-left"></i></span>

								</a>
							</li>
							<li><a href="#">1</a>
							</li>
							<li><a href="#">2</a>
							</li>
							<li class="active"><a href="#">3</a>
							</li>
							<li><a href="#">4</a>
							</li>
							<li><a href="#">5</a>
							</li>
							<li>
								<a aria-label="Next" href="#">
									<span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
								</a>
							</li>
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
<a class="gototop gototop-button" href="#"><i class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="js/theme-functions.js"></script>

<!-- Custom js file -->
<script src="js/custom.js"></script>


</body>
</html>
