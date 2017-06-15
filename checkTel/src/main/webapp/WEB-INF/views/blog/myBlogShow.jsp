<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<link rel="shortcut icon" href="images/favicon.png">
<title>여행의 시작! Check_TEL</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome/css/font-awesome.min.css" type="text/css"
	rel="stylesheet">
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
<link href="css/color-variations/blue.css" rel="stylesheet"
	type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800"
	rel="stylesheet" type="text/css" />

<!-- SLIDER REVOLUTION 5.x CSS SETTINGS -->
<link rel="stylesheet" property="stylesheet"
	href="vendor/rs-plugin/css/settings.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/rs-plugin-styles.css" type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link rel="stylesheet" type="text/css" href="css/custom.css"
	media="screen" />

<!--VENDOR SCRIPT-->
<script src="vendor/jquery/jquery-1.11.2.min.js"></script>
<script src="vendor/plugins-compressed.js"></script>

<!-- SLIDER REVOLUTION 5.x SCRIPTS  -->
<script type="text/javascript"
	src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript"
	src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

<!-- 투어플랜비 -->
<script
	src="https://api.dabeeo.com/api/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM="></script>
<script>
	var map;
	var places;
	var markerGroup;
	// 지도 생성
	bm.ready(function() {
		var maxZoom = 18;
		var minZoom = 4;
		var defZoom = 14;
		// sample geolocation
		var curLat = 37.57315;
		var curLng = 126.9944;
		// create a map
		map = new bm.Map('BeeMap', {
			center : [ curLat, curLng ],
			zoom : defZoom,
			zoomControl : false
		});
		bm.tileLayer({
			maxZoom : maxZoom,
			minZoom : minZoom
		}).addTo(map);
		// 마커 그룹 관리를 위한 오브젝트 생성
		markerGroup = bm.layerGroup().addTo(map);
		// 현재 줌 레벨과 영역에 대한 장소정보 가져오기
		getContents(map.getBounds(), map.getZoom());
		map.on('zoomend', function(e) { // 지도 줌이 바뀔때마다 장소 정보 가져오기
			$("#list").empty();
			getContents(map.getBounds(), map.getZoom());
		});
		map.on('dragend', function(e) { // 지도가 드래그 될때마다 장소 정보 가져오기
			$("#list").empty();
			getContents(map.getBounds(), map.getZoom());
		});
		map.on('moveend', function(e) { // 지도가 이동 될때마다 장소 정보 가져오기
			$("#list").empty();
			getContents(map.getBounds(), map.getZoom());
		});
	});
	function imgClick(places) {
		$("#list").empty();
		for (var i = 0; i < places.length; i++) {
			let
			placeIdx = i;
			if (places[placeIdx].Furl != null) {

				if (places[placeIdx].Mode == "City") {
					$('#list')
							.append(
									'<div class="image" id="img'+placeIdx+'"><img src=' + places[placeIdx].Furl + ' style="max-width: 280px; opacity:0.6;">'
											+ '<div class="text">'
											+ '<span style="font-size: 15px; top:0px; left:0px;">'
											+ places[placeIdx].CountryName_ko
											+ '</span>'
											+ places[placeIdx].CityName_ko
											+ '</div></div><br>');
				} else {
					$('#list')
							.append(
									'<div class="image" id="img'+placeIdx+'"><img src=' + places[placeIdx].Furl + ' style="max-width: 280px; opacity:0.6;">'
											+ '<div class="text">'
											+ places[placeIdx].Title
											+ '<span style="float:right; font-size: 15px;">Rank '
											+ places[placeIdx].Rank
											+ '</span>'
											+ '</div></div><br>');
				}
			} else {
				if (places[placeIdx].Mode == "City") {
					$('#list')
							.append(
									'<div class="image" id="img'+placeIdx+'"><img src="./no_image.png"; style="max-width: 280px;">'
											+ '<div class="text">'
											+ '<span style="font-size: 15px;  top:0px; left:0px;">'
											+ places[placeIdx].CountryName_ko
											+ '</span>'
											+ places[placeIdx].CityName_ko
											+ '</div></div><br>');
				} else {
					$('#list')
							.append(
									'<div class="image" id="img'+placeIdx+'"><img src="./no_image.png"; style="max-width: 280px;">'
											+ '<div class="text">'
											+ places[placeIdx].Title
											+ '<span style="float:right; font-size: 15px;">Rank '
											+ places[placeIdx].Rank
											+ '</span>'
											+ '</div></div><br>');
				}
			}

			$("#img" + placeIdx).on('click', function(e) { // 리스트 클릭시 상세 정보 표시
				showInfoImg(placeIdx);
			});

		}
	}
	function getContents(bounds, zoom) {
		var xmlhttp = new XMLHttpRequest();
		// 투어플랜비 콘텐츠 API 호출
		var url = 'https://tourplanb.com:4443/place/map/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM=&zoom='
				+ zoom
				+ '&nelat='
				+ bounds._northEast.lat
				+ '&nelng='
				+ bounds._northEast.lng
				+ '&swlat='
				+ bounds._southWest.lat
				+ '&swlng=' + bounds._southWest.lng + '&lang=ko';
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				places = JSON.parse(this.responseText).data;
				if ($.isArray(places)) {
					// 마커 생성
					createMarkers(places);
					imgClick(places);
				}
			}
		};
		xmlhttp.open('GET', url, true);
		xmlhttp.send();
	}

	function createMarkers(places) {
		markerGroup.clearLayers();
		for (var i = 0; i < places.length; i++) {
			let
			placeIdx = i;
			let
			marker;
			if (places[i].Furl == null) {
				marker = bm
						.marker(
								[ places[i].Lat, places[i].Lng ],
								{
									icon : bm
											.divIcon({
												html : '<div style=" width: 100px;"><img src="./img/icon_category_'+places[i].CategoryIdx+'.png" style="width: 80px; height: 80px;"><br>'
														+ '<div style="background-color: white; width: auto;">'
														+ places[i].Title
														+ '</div></div>'
											})
								}).bindPopup(places[i].Title)
						.addTo(markerGroup);
			} else {
				marker = bm
						.marker(
								[ places[i].Lat, places[i].Lng ],
								{
									icon : bm
											.divIcon({
												html : '<div style="width: 100px;"><img src="'+places[i].Furl+' " style="width: 80px; height: 80px;"><br>'
														+ '<div style="background-color: white; width: auto;">'
														+ places[i].Title
														+ '</div></div>'
											})
								}).bindPopup(places[i].Title)
						.addTo(markerGroup);
			}

			if (places[placeIdx].Mode == "City") {
				marker = bm
						.marker(
								[ places[i].Lat, places[i].Lng ],
								{
									icon : bm
											.divIcon({
												html : '<div style="width: 100px;"><img src="'+places[i].Furl+' " style="width: 80px; height: 80px;"><br>'
														+ '<div style="background-color: white; width: auto;">'
														+ places[i].CityName_ko
														+ '</div></div>'
											})
								}).bindPopup(places[i].CityName_ko).addTo(
								markerGroup);
			}

			marker.on('click', function(e) { // 마커 클릭시 상세 정보 표시
				if (places[placeIdx].Mode != "City") {
					showInfo(placeIdx);
				} else {
					map.setZoom(14);
					var loc = {
						"lat" : places[placeIdx].Lat,
						"lng" : places[placeIdx].Lng
					};
					map.setView(loc);
					getContents(map.getBounds(), map.getZoom());
				}
			});
		}
	}

	function showInfo(placeIdx) {
		//$("#list").empty();
		$('#info').show();
		$('#info').empty();

		map.setZoom(14);
		var loc = {
			"lat" : places[placeIdx].Lat,
			"lng" : places[placeIdx].Lng
		};
		map.setView(loc);
		getContents(map.getBounds(), map.getZoom());

		if (places[placeIdx].Mode != "City") {
			if (places[placeIdx].Furl != null) {
				$('#info')
						.append(
								'<img src=' + places[placeIdx].Furl + ' style="max-width: 300px;">');
			}
			$('#info').append('<p>장소명: ' + places[placeIdx].Title + '</p>');
			$('#info').append('<p>설명: ' + places[placeIdx].Contents + '</p>');
			$('#info').append('<p>랭킹: ' + places[placeIdx].Rank + '</p>');
		}
		$('#info').append('<input type="button" id ="addPlan" value="일정 추가">');
		$('#info').append('<input type="button" id ="close" value="닫기">');
		$("#close").click(function() {
			$('#info').empty();
			$('#info').hide();
		});
		$("#addPlan")
				.click(
						function() {
							$('#day1')
									.append(
											'<img src=' + places[placeIdx].Furl + ' style="max-width: 50px; max-height: 50px;">');
						});
	}
</script>
</head>

<body class="boxed-simple">
	<div>
		json
		<hr>
		spotNo :${member.spotNo }<br>
	</div>
	<!--SITE LOADER-->
	<div class="loader-wrapper">
		<div class="loader">
			<img width="40" src="images/svg-loaders/puff.svg" alt=""> <span
				class="loader-title">Page is loading, just a sec...</span>
		</div>
	</div>
	<!--END: SITE LOADER-->

	<!-- PAGE TITLE -->
	<section id="page-title"
		class="page-title-parallax page-title-center text-dark"
		style="background-image:url(images/blog/1.jpg); padding:0px;">
	<div class="container">
		<div class="page-title col-md-8">
			<br />
			<h3>누구씨의 블로그</h3>
			<br />
			<h1>일정 이름</h1>
		</div>
		<br />
		<div class="breadcrumb col-md-4">
			<ul>
				<li><a href="#"><i class="fa fa-home"></i></a></li>
				<li><a href="#">Home</a></li>
				<li><a href="#">Page title</a></li>
				<li class="active"><a href="#">Page title version</a></li>
			</ul>
		</div>
	</div>
	<div class="row"></div>
	<hr class="space">
	<div class="row"
		style="margin: 0px; padding: 0px; width: 100%; background-color: white;">
		<div class="col-md-6 center"
			style="text-align: center; background-color: white;">
			<ul class="nav nav-pills nav-justified">
				<li><a href="#">일정</a></li>
				<li><a href="#">지도</a></li>
				<li><a href="#">댓글</a></li>
				<li><a href="#">수정하기</a></li>
				<li><a href="#">다운로드</a></li>
				<li><a href="#">복사하기</a></li>
			</ul>
		</div>
	</div>
	</section>
	<!-- END: PAGE TITLE -->
	<!-- CONTENT -->
	<!-- 로그인 모달 -->

	<script>
		$(function() {
			$("#dialog1").dialog({
				autoOpen : false,
				width : '500',
				height : '500',
				show : {
					effect : "blind",
					duration : 1000
				},
				hide : {
					effect : "explode",
					duration : 1000
				}
			});

			$("#opener").on("click", function() {
				$("#dialog1").dialog("open");
			});
		});
	</script>
</head>
<body>

	<div id="dialog1">
		<div class="fullscreen no-padding">
			<div id='BeeMap'
				class="mainFullLayer beemap-container beemap-fade-anim"
				style="width: 100%; height: 100%; border: 0px;"></div>
		</div>
	</div>
	<!-- SECTION -->
	<section class="content">
	<div class="container">

		<!-- Blog post-->
		<div class="post-content post-content-single post-modern">
			<!-- Post item-->
			<!-- 1일차 -->
			<div class="post-item">
				<div class="post-content-details">
					<div class="post-meta">
						<div class="post-date">
							<span class="post-date-day">1<a class="post-date-month">일차</a></span>
						</div>

						<div class="post-comments">
							<a href="#"> <i class="fa fa-comments-o"></i> <span
								class="post-comments-number">댓글<br>324
							</span>
							</a>
						</div>
						<div class="post-comments" id="opener">
							<a href="#"> <i class="fa fa-share-alt"></i> <span
								class="post-comments-number">경로</span>
							</a>
						</div>
					</div>
					<div class="post-image">
						<a href="#"> <img alt="" src="../images/portfolio/1.jpg">
						</a>
					</div>
					<div class="post-title">
						<h2>Vivamus luctus commodo dolor porta feugiat</h2>
					</div>
					<div class="post-info">
						<span class="post-autor">Post by: <a href="#">Alea
								Grande</a></span> <span class="post-category">in <a href="#">Productivity</a></span>
					</div>
					<div class="post-description">
						<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere
							ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id
							ligula pharetra laoreet. Ut nec metus a mi ullamcorper hendrerit.
							Nulla facilisi. Pellentesque sed nibh a quam accumsan dignissim
							quis quis urna. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Praesent id dolor dui, dapibus gravida elit.
							Donec consequat laoreet sagittis. Suspendisse ultricies ultrices
							viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum
							convallis metus.M</p>
						<blockquote>
							<p>The world is a dangerous place to live; not because of the
								people who are evil, but because of the people who don't do
								anything about it.</p>
							<small>by <cite>Albert Einstein</cite></small>
						</blockquote>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Praesent id dolor dui, dapibus gravida elit. Donec consequat
							laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi
							rhoncus laoreet tincidunt. Mauris interdum convallis metus.
							Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus
							sem, euismod eu vulputate eget, porta quis sapien. Donec tellus
							est, rhoncus vel scelerisque id, iaculis eu nibh.</p>


						<p>Donec posuere bibendum metus. Quisque gravida luctus
							volutpat. Mauris interdum, lectus in dapibus molestie, quam felis
							sollicitudin mauris, sit amet tempus velit lectus nec lorem.
							Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nullam vel enim dui. Cum sociis natoque
							penatibus et magnis dis parturient montes, nascetur ridiculus
							mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl
							sit amet imperdiet convallis, nunc tortor consequat tellus, vel
							molestie neque nulla non ligula. Proin tincidunt tellus ac porta
							volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales
							libero. Maecenas feugiat sit amet enim in accumsan.</p>

						<p>Duis vestibulum quis quam vel accumsan. Nunc a vulputate
							lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum.
							Vestibulum pretium blandit tellus, sodales volutpat sapien varius
							vel. Phasellus tristique cursus erat, a placerat tellus laoreet
							eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus
							sit amet lectus venenatis est rhoncus interdum a vitae velit.</p>
					</div>
					<hr>
					<div class="post-image">
						<a href="#"> <img alt="" src="../images/portfolio/1.jpg">
						</a>
					</div>
					<div class="post-content-details">
						<div class="post-title">
							<h2>Vivamus luctus commodo dolor porta feugiat</h2>
						</div>
						<div class="post-info">
							<span class="post-autor">Post by: <a href="#">Alea
									Grande</a></span> <span class="post-category">in <a href="#">Productivity</a></span>
						</div>
						<div class="post-description">
							<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere
								ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit
								id ligula pharetra laoreet. Ut nec metus a mi ullamcorper
								hendrerit. Nulla facilisi. Pellentesque sed nibh a quam accumsan
								dignissim quis quis urna. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Praesent id dolor dui, dapibus
								gravida elit. Donec consequat laoreet sagittis. Suspendisse
								ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt.
								Mauris interdum convallis metus.M</p>
							<blockquote>
								<p>The world is a dangerous place to live; not because of
									the people who are evil, but because of the people who don't do
									anything about it.</p>
								<small>by <cite>Albert Einstein</cite></small>
							</blockquote>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Praesent id dolor dui, dapibus gravida elit. Donec consequat
								laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi
								rhoncus laoreet tincidunt. Mauris interdum convallis metus.
								Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus
								sem, euismod eu vulputate eget, porta quis sapien. Donec tellus
								est, rhoncus vel scelerisque id, iaculis eu nibh.</p>


							<p>Donec posuere bibendum metus. Quisque gravida luctus
								volutpat. Mauris interdum, lectus in dapibus molestie, quam
								felis sollicitudin mauris, sit amet tempus velit lectus nec
								lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Nullam vel enim dui. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed
								sagittis, nisl sit amet imperdiet convallis, nunc tortor
								consequat tellus, vel molestie neque nulla non ligula. Proin
								tincidunt tellus ac porta volutpat. Cras mattis congue lacus id
								bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet
								enim in accumsan.</p>

							<p>Duis vestibulum quis quam vel accumsan. Nunc a vulputate
								lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum.
								Vestibulum pretium blandit tellus, sodales volutpat sapien
								varius vel. Phasellus tristique cursus erat, a placerat tellus
								laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis.
								Vivamus sit amet lectus venenatis est rhoncus interdum a vitae
								velit.</p>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<!-- 2일차꺼 -->
			<div class="post-item">
				<div class="post-content-details">
					<div class="post-meta">
						<div class="post-date">
							<span class="post-date-day">2<a class="post-date-month">일차</a></span>
						</div>

						<div class="post-comments">
							<a href="#"> <i class="fa fa-comments-o"></i> <span
								class="post-comments-number">댓글<br>324
							</span>
							</a>
						</div>
						<div class="post-comments">
							<a href="#"> <i class="fa fa-share-alt"></i> <span
								class="post-comments-number">경로</span>
							</a>
						</div>
					</div>
					<div class="post-image">
						<a href="#"> <img alt="" src="../images/portfolio/1.jpg">
						</a>
					</div>
					<div class="post-title">
						<h2>Vivamus luctus commodo dolor porta feugiat</h2>
					</div>
					<div class="post-info">
						<span class="post-autor">Post by: <a href="#">Alea
								Grande</a></span> <span class="post-category">in <a href="#">Productivity</a></span>
					</div>
					<div class="post-description">
						<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere
							ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id
							ligula pharetra laoreet. Ut nec metus a mi ullamcorper hendrerit.
							Nulla facilisi. Pellentesque sed nibh a quam accumsan dignissim
							quis quis urna. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Praesent id dolor dui, dapibus gravida elit.
							Donec consequat laoreet sagittis. Suspendisse ultricies ultrices
							viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum
							convallis metus.M</p>
						<blockquote>
							<p>The world is a dangerous place to live; not because of the
								people who are evil, but because of the people who don't do
								anything about it.</p>
							<small>by <cite>Albert Einstein</cite></small>
						</blockquote>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Praesent id dolor dui, dapibus gravida elit. Donec consequat
							laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi
							rhoncus laoreet tincidunt. Mauris interdum convallis metus.
							Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus
							sem, euismod eu vulputate eget, porta quis sapien. Donec tellus
							est, rhoncus vel scelerisque id, iaculis eu nibh.</p>


						<p>Donec posuere bibendum metus. Quisque gravida luctus
							volutpat. Mauris interdum, lectus in dapibus molestie, quam felis
							sollicitudin mauris, sit amet tempus velit lectus nec lorem.
							Nullam vel mollis neque. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nullam vel enim dui. Cum sociis natoque
							penatibus et magnis dis parturient montes, nascetur ridiculus
							mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl
							sit amet imperdiet convallis, nunc tortor consequat tellus, vel
							molestie neque nulla non ligula. Proin tincidunt tellus ac porta
							volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales
							libero. Maecenas feugiat sit amet enim in accumsan.</p>

						<p>Duis vestibulum quis quam vel accumsan. Nunc a vulputate
							lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum.
							Vestibulum pretium blandit tellus, sodales volutpat sapien varius
							vel. Phasellus tristique cursus erat, a placerat tellus laoreet
							eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus
							sit amet lectus venenatis est rhoncus interdum a vitae velit.</p>
					</div>
					<hr>
					<div class="post-image">
						<a href="#"> <img alt="" src="../images/portfolio/1.jpg">
						</a>
					</div>
					<div class="post-content-details">
						<div class="post-title">
							<h2>Vivamus luctus commodo dolor porta feugiat</h2>
						</div>
						<div class="post-info">
							<span class="post-autor">Post by: <a href="#">Alea
									Grande</a></span> <span class="post-category">in <a href="#">Productivity</a></span>
						</div>
						<div class="post-description">
							<p>Curabitur pulvinar euismod ante, ac sagittis ante posuere
								ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit
								id ligula pharetra laoreet. Ut nec metus a mi ullamcorper
								hendrerit. Nulla facilisi. Pellentesque sed nibh a quam accumsan
								dignissim quis quis urna. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Praesent id dolor dui, dapibus
								gravida elit. Donec consequat laoreet sagittis. Suspendisse
								ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt.
								Mauris interdum convallis metus.M</p>
							<blockquote>
								<p>The world is a dangerous place to live; not because of
									the people who are evil, but because of the people who don't do
									anything about it.</p>
								<small>by <cite>Albert Einstein</cite></small>
							</blockquote>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Praesent id dolor dui, dapibus gravida elit. Donec consequat
								laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi
								rhoncus laoreet tincidunt. Mauris interdum convallis metus.
								Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus
								sem, euismod eu vulputate eget, porta quis sapien. Donec tellus
								est, rhoncus vel scelerisque id, iaculis eu nibh.</p>


							<p>Donec posuere bibendum metus. Quisque gravida luctus
								volutpat. Mauris interdum, lectus in dapibus molestie, quam
								felis sollicitudin mauris, sit amet tempus velit lectus nec
								lorem. Nullam vel mollis neque. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Nullam vel enim dui. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed
								sagittis, nisl sit amet imperdiet convallis, nunc tortor
								consequat tellus, vel molestie neque nulla non ligula. Proin
								tincidunt tellus ac porta volutpat. Cras mattis congue lacus id
								bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet
								enim in accumsan.</p>

							<p>Duis vestibulum quis quam vel accumsan. Nunc a vulputate
								lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum.
								Vestibulum pretium blandit tellus, sodales volutpat sapien
								varius vel. Phasellus tristique cursus erat, a placerat tellus
								laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis.
								Vivamus sit amet lectus venenatis est rhoncus interdum a vitae
								velit.</p>
						</div>
						<hr>
					</div>
				</div>
			</div>

			<!-- Comments-->
			<div id="comments" class="comments">
				<div class="heading">
					<h4 class="comments-title">
						Comments <small class="number">(4)</small>
					</h4>
				</div>


				<div class="comment">
					<a href="#" class="pull-left"> <img alt=""
						src="images/team/1.jpg" class="avatar">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Alea Grande</h4>
						<p class="time">Feb 25, 2015 at 9:30 PM</p>
						<p>Maecenas nec iaculis turpis, eget congue massa. Ut ultrices
							consectetur eleifend. Nullam nisl dui, congue in mi non, dapibus
							adipiscing metus. Donec mollis semper rutrum. Lorem ipsum dolor
							sit amet, consectetur adipiscing elit. Maecenas sed euismod
							neque. Aliquam eget malesuada enim, eu interdum elit. Sed
							sagittis ornare velit a congue.</p>
						<a href="#" class="comment-reply pull-right"><i
							class="fa fa-reply"></i> Reply</a>
					</div>
				</div>

				<div class="comment">
					<a href="#" class="pull-left"> <img alt=""
						src="images/team/2.jpg" class="avatar">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Juna Smith</h4>
						<p class="time">Jan 18, 2015 at 10:30 PM</p>
						<p>Nullam nisl dui, congue in mi non, dapibus adipiscing
							metus. Donec mollis semper rutrum. Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Maecenas sed euismod neque. Aliquam
							eget malesuada enim, eu interdum elit. Sed sagittis ornare velit
							a congue.</p>
						<a href="#" class="comment-reply pull-right"><i
							class="fa fa-reply"></i> Reply</a>
					</div>



					<div class="comment comment-replied">
						<a href="#" class="pull-left"> <img alt=""
							src="images/team/3.jpg" class="avatar">
						</a>
						<div class="media-body">
							<h4 class="media-heading">Ariol Smith</h4>
							<p class="time">Jun 24, 2015 at 14:28 PM</p>
							<p>Ut ultrices consectetur eleifend. Nullam nisl dui, congue
								in mi non, dapibus adipiscing metus. Donec mollis semper rutrum.
								Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Maecenas sed euismod neque. Aliquam eget malesuada enim, eu
								interdum elit. Sed sagittis ornare velit a congue.</p>
							<a href="#" class="comment-reply pull-right"><i
								class="fa fa-reply"></i> Reply</a>
						</div>
					</div>
				</div>

				<div class="comment">
					<a href="#" class="pull-left"> <img alt=""
						src="images/team/4.jpg" class="avatar">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Dia Perry</h4>
						<p class="time">Jun 24, 2015 at 14:28 PM</p>
						<p>Donec mollis semper rutrum. Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Maecenas sed euismod neque. Aliquam
							eget malesuada enim, eu interdum elit. Donec mollis semper
							rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Maecenas sed euismod neque. Aliquam eget malesuada enim, eu
							interdum elit. Sed sagittis ornare velit a congue. Sed sagittis
							ornare velit a congue. Maecenas nec iaculis turpis, eget congue
							massa. Ut ultrices consectetur eleifend. Nullam nisl dui, congue
							in mi non, dapibus adipiscing metus.</p>
						<a href="#" class="comment-reply pull-right"><i
							class="fa fa-reply"></i> Reply</a>
					</div>
				</div>

			</div>
			<div class="comment-form">
				<div class="heading">
					<h4>Leave a comment</h4>
				</div>
				<form class="form-gray-fields">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="name" class="upper">Your Name</label> <input
									type="text" aria-required="true" id="name"
									placeholder="Enter name" name="senderName"
									class="form-control required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="email" class="upper">Your Email</label> <input
									type="email" aria-required="true" id="email"
									placeholder="Enter email" name="senderEmail"
									class="form-control required email">
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label for="phone" class="upper">Your Phone</label> <input
									type="text" aria-required="true" id="phone"
									placeholder="Enter phone" name="phone"
									class="form-control required">
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="comment" class="upper">Your comment</label>
								<textarea aria-required="true" id="comment"
									placeholder="Enter comment" rows="9" name="comment"
									class="form-control required"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-paper-plane"></i>&nbsp;Post comment
								</button>
							</div>
						</div>
					</div>

				</form>
			</div>
			<!-- END: Comments-->
		</div>
		<!-- END: Blog post-->

	</div>
	</section>
	<!-- END: SECTION -->
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