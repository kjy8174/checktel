<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

	// 경로 모달
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
	
$(function() {	
	$("#planCreate").append('<div class="post-date">'
			+'<span class="post-date-day">1<a class="post-date-month">일차</a></span>'
			+'</div>')
});
</script>
</head>

<body class="boxed-simple">
<div id='BeeMap'
				class="mainFullLayer beemap-container beemap-fade-anim"
				style="width: 100%; height: 100%; border: 0px;"></div>

<div id="dialog1">
		<div class="fullscreen no-padding">
			<div id='BeeMap'
				class="mainFullLayer beemap-container beemap-fade-anim"
				style="width: 100%; height: 100%; border: 0px;"></div>
		</div>
	</div>

	<!--SITE LOADER-->
	<div class="loader-wrapper">
		<div class="loader">
			<img width="40" src="../images/svg-loaders/puff.svg" alt=""> <span
				class="loader-title">Page is loading, just a sec...</span>
		</div>
	</div>
	<!--END: SITE LOADER-->

	<!-- PAGE TITLE -->
	<section id="page-title"
		class="page-title-parallax page-title-center text-dark"
		style="background-image:url(../images/blog/1.jpg); padding:0px;">
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
				<li><a href="#">일정 복사</a></li>				
				<li><a href="#commentsM">댓글</a></li>				
				<li><a href="#">삭제</a></li>
				<li><a href="#">다운로드</a></li>				
			</ul>
		</div>
	</div>
	</section>
	<!-- END: PAGE TITLE -->
	<!-- CONTENT -->

	
	<!-- SECTION -->
	<section class="content">
	<div class="container">

		<!-- Blog post-->
		<div id="planCreate" class="post-content post-content-single post-modern">
			<!-- Post item-->
			<!-- 1일차 -->
			<div class="post-item">
				<div class="post-content-details">
					<div class="post-meta">
						<div class="post-date">
							<span class="post-date-day">1<a class="post-date-month">일차</a></span>
						</div>

						
						<div class="post-comments" id="opener">
							<a href="#"> <i class="fa fa-share-alt"></i>
								<span class="post-comments-number">지도 경로</span>	</a>
						</div>
					</div>
					<div class="post-title">
						<h4><b>일정1</b> <small> 서울 어딘가</small></h4>
					</div>
					<div class="post-image">
						<a href="#"> <img alt="" src="../images/test/1.jpg" style="width: 500px; height: 350px;"></a>
					</div><br>			
				</div>
			</div>
		</div>

			<!-- Comments-->
			<div id="comments" class="comments">
				<div class="heading">
					<h4 class="comments-title">댓글 보기<small class="number"></small></h4>
				</div>
				<div class="comment">
					<a href="#" class="pull-left"> <img alt="" src="../images/team/2.jpg" class="avatar"></a>
					<div class="media-body">
						<h4 class="media-heading">이호진</h4>
						<p class="time">2017/06/11 오전 11:33</p>
						<p>어렵다</p>
						<a href="#" class="comment-reply pull-right"><i	class="fa fa-reply"></i>댓글쓰기</a>
					</div>
					
					<div class="comment comment-replied">
						<a href="#" class="pull-left"> <img alt="" src="../images/team/1.jpg" class="avatar"></a>
						<div class="media-body">
							<h4 class="media-heading">박성익</h4>
							<p class="time">2017/06/11 오전 11:34</p>
							<p>나도</p>
							<a href="#" class="comment-reply pull-right"><i	class="fa fa-reply"></i>댓글쓰기</a>
						</div>
					</div>
				</div>				

			</div>
			<div class="comment-form">
				<div class="heading">
					<h4>댓글 쓰기</h4>
				</div>
				<form class="form-gray-fields" action="./blog/reViewAdd.do">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="name" class="upper">이름</label>
									<input type="text" aria-required="true" id="name"
										placeholder="박성익" name="memberNo" class="form-control required">
							</div>
						</div>						

						<!-- <div class="col-md-4">
							<div class="form-group">
								<label for="phone" class="upper">Your Phone</label> <input
									type="text" aria-required="true" id="phone"
									placeholder="Enter phone" name="phone"
									class="form-control required">
							</div>
						</div> -->

					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="comment" class="upper">내용</label>
								<textarea aria-required="true" id="comment"
									placeholder="Enter comment" rows="9" name="reviewContent"
									class="form-control required"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group text-center">
								<button class="btn btn-primary">
									<i class="fa fa-paper-plane"></i>&nbsp; 댓글 등록하기
								</button>
							</div>
						</div>
					</div>

				</form>
			</div>
			<!-- END: Comments-->
		</div>
		<!-- END: Blog post-->

	</section>
	<!-- END: SECTION -->
	<!-- END: WRAPPER -->

</body>
</html>