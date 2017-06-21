<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#short {        
    overflow : hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    
    width:300px;
}

section{
	padding-top: 0px;
}
.shadow{
    background-color: white;
    box-shadow: 5px 5px 5px grey;
    width: 300px;
}
span {
	height: 40px;
	width: 40px;
	display: block;
	position: relative;
}

.demoSpan1 {
	overflow: hidden;
	height: 25px;
}

.demoSpan1:before {
	content: '';
	height: 20px;
	width: 20px;
	display: block;
	border: 5px solid pink;
	border-right-width: 0;
	border-top-width: 0;
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	position: absolute;
	bottom: 7px;
	left: 7px;
}
</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 투어플랜비 -->
<script
	src="https://api.dabeeo.com/api/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM="></script>
<script>
var num=0;
	var map;
	var places;
	var markerGroup;
	var dayPath = new Array(); // 날짜별 지도 위,경도 정보 저장
	var pathColor = ['red','green','blue','black','white'];
	var p_lat;	// 위도
	var p_lng;	// 경도
	var pre_idx = 0;	//비교 인덱스
	var idx = 1;		//인덱스
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
		
		//생성된 지도에 패스 그리기
		for(var i=0; i < dayPath.length;i++){
			var drawPath = bm.polyline(dayPath[i],{
			      color: pathColor[i],
			      opacity: 0.5,
			      weight: 2
			    });
			drawPath.addTo(map);
		}
		console.log(dayPath);
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
	
	//일차 생성
/* $(function() {	
	var a = '${plan.planPeriod}';
	$("#planCreate").append('<div class="post-item">'
			+'<div class="post-content-details">'
			+'<div class="post-meta">'
			+'<div class="post-date">'
			+'	<span class="post-date-day">1<a class="post-date-month">일차</a></span>'
			+'</div>'
			+'<div class="post-comments" id="opener">'
			+'	<a href="#"> <i class="fa fa-share-alt"></i>'
			+'		<span class="post-comments-number">지도 경로</span>	</a>'
			+'</div>'
			+'</div>'
			+'<div class="post-title">'
			+'<h4><b>일정1</b> <small> 서울 어딘가</small></h4>'
			+'</div>'
			+'<div class="post-image">'
			+'	<a href="#"> <img alt="" src="../images/test/1.jpg" style="width: 500px; height: 350px;"></a>'
			+'</div><br>'
			+a+'</div>'
	+'</div>')
}); */
	
function mapClick(id) {
	var lng = document.getElementById("lng"+id).value;
	var lat = document.getElementById("lat"+id).value;
	var loc = {"lat": lat, "lng": lng};
	map.setView(loc)
}
function mapOver(id) {
	var lng = document.getElementById("lng"+id).value;
	var lat = document.getElementById("lat"+id).value;
	var loc = {"lat": lat, "lng": lng};
	map.setView(loc)
}
$(function(){
	/* 	if(user.memberNo !=) {
			$("#btnReviewDel").
			document.getElementById('btnReviewDel').setAttribute('hidden','hidden');
		} */
		
		//페이지 로딩 후에 댓글 목록 조회
		var param = {planNo:"${plan.planNo}"}
		$.getJSON("../review/review.do", param, function(data){
			for(i=0; i<data.length; i++){				
				var btn3 ="";
				if(data[i].memberNo=="${user.memberNo}") {
				 btn3="<button class='btn' id='btnReviewDel'"+(num)+">삭제</button><input type='hidden' id='hiddenId' value='"+data[i].reviewNo+"'/>";
				}
				$("#comments").append("<div class='comment'><div class='media-body'><h4 class='media-heading'>"
									+data[i].memberNick+"</h4><p class='time'>"+data[i].reviewDates+"</p><p>"
									+data[i].reviewContent+"</p>" + btn3 +"</div></div>");

				/* $("#comments").append("<div class='comment'><div class='media-body'><h4 class='media-heading'>"+data[i].memberNick+"</h4><p class='time'>"+data[i].reviewDates+"</p><p>"+data[i].reviewContent+"</p><button class='btn' id='btnReviewDel'"+(num)+">삭제</button><input type='hidden' id='hiddenId' value='"+data[i].reviewNo+"'/></div></div>"); */
			}
		})
		$("#btnReviewIns").click(function(event){
			// 댓글 등록
			event.preventDefault();
			var param = $("#frmReview").serialize();
			$.getJSON("../review/reviewInsert.do", param,  function(data){				
				var btn3 ="";
				if(data.memberNo=="${user.memberNo}") {
				 btn3="<button class='btn' id='btnReviewDel"+(num++)+"'>삭제</button><input type='hidden' id='hiddenId' value='"+data.reviewNo+"'/>";
				}
				$("#comments").append("<div class='comment'><div class='media-body'><h4 class='media-heading'>"
									+data.memberNick+"</h4><p class='time'>"+data.reviewDates+"</p><p>"
									+data.reviewContent+"</p>" + btn3 +"</div></div>");

			});
		});
		
		// 댓글 삭제
		/* $("#btnReviewDel").click(function(){ */
		$(document).on("click","#btnReviewDel",function(event){
			event.preventDefault();
			var param = $(this).parent().children('#hiddenId').val()+"";
			console.log(param);
			/* param.slice(0,-1); */
			$(this).parents(".comment").remove();
			$.getJSON("../review/reviewDel.do?reviewNo="+param, function(data){
				/* $(".comment").remove(); */
				/* console.log($(this).parents(".comment").text()); */
			});
			
		});	
		
	});

function Navi(id) { //길찾기
	var no = id+1;
	var before = document.getElementById("latlng"+id).value;
	var after = document.getElementById("latlng"+no).value;
	console.log(no)
	console.log(id+":"+before+","+no+":"+after);
	window
			.open(
					"https://www.google.co.kr/maps/dir/"
							+before+"/"+after+"/am=t",
					"길찾기",
					"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}
</script>
</head>

<body class="boxed-simple">
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
		<div id="planCreate"></div>
	<div class="container">
		<div class="page-title col-md-8">
			<br />
			<h3>${plan.blogTitle}</h3><br>
			<br />
			<h1>${plan.blogTitle}</h1>
		</div>
		<br />
	</div>
	<div class="row"></div>
	<hr class="space">
	<div class="row"
		style="margin: 0px; padding: 0px; width: 100%; background-color: white;">
		<div class="col-md-6 center"
			style="text-align: center; background-color: white;">
			<ul class="nav nav-pills nav-justified">
				<li><a href="${pageContext.request.contextPath }/main/mainCopy.do?planNo=${plan.planNo}">일정 복사</a></li>				
				<li><a href="#commentsTop">댓글</a></li>				
				<li><a href="${pageContext.request.contextPath }/blog/blogDelete.do?planNo=${plan.planNo}">삭제</a></li><!--자기꺼만 지우기 -->
				<li><a href="#">다운로드</a></li>				
			</ul>
		</div>
	</div>
	</section>
	<!-- END: PAGE TITLE -->
	<!-- CONTENT -->

<!-- 	<div id="dialog1">
		<div class="fullscreen no-padding">
			<div id='BeeMap'
				class="mainFullLayer beemap-container beemap-fade-anim"
				style="width: 100%; height: 100%; border: 0px;"></div>
		</div>
	</div> -->
	
	<!-- SECTION -->
	<section class="content">
	
	<div class="container" style="margin-left: 50px; margin-top: 30px;">

	<div>
		<!-- Blog post-->
		<div class="post-content post-content-single post-modern" style="width: 50%">
			<!-- Post item-->
			<c:forEach var="planPeriod" begin="1" end="${plan.planPeriod }" step="1" varStatus="pcnt">
			 <c:set var="decr" value="${planPeriod}"/>
			<div class="post-item">
			<h2><c:if test="${pcnt.first }">
								${plan.planStarts}+1
							</c:if></h2>
				<!-- 일차 -->
				<div class="post-content-details">
					<div class="post-meta">
						<div class="post-date">
							
							<span class="post-date-day"><c:out value="${decr}"/> <%-- ${pcnt.count} --%> <a class="post-date-month">일차</a>
							</span>
							
						
						</div>						
						
					</div>					
					<!--일정 순서  -->
					<c:forEach var="planList" items="${planList}" varStatus="status">
					<c:if test= "${planList.dayNo eq decr}">
					<div class="post-title shadow" id="${planList.dayVisit}" onclick="mapClick(${planList.dayVisit})" onmouseover="mapOver(${planList.dayVisit})">
					<input type="hidden" id="lat${planList.dayVisit}" value="${planList.lat}">
					<input type="hidden" id="lng${planList.dayVisit}" value="${planList.lng}">
						<h3 id="short"><b>${status.index+1}</b> <small>${planList.spotName }</small></h3>
						<input type="hidden" id="latlng${status.index+1}" value="${planList.lat},${planList.lng}">
						<a href="#"> <img alt="" src="${planList.spotFurl }" style="width: 300px; height: 150px;"></a>
					</div>
					<div style="padding-left: 135px;">
					<!--화살표 -->
					<c:if test="${!status.last }">
					<br>
						<span class="demoSpan1"></span><button onclick="Navi(${status.index+1})">${status.index+1}</button>
					</c:if>					
					</div><br>	
					</c:if>
					<script>
						//일정에서 위, 경도 데이터 배열에 저장
						if(pre_idx == 0) {
							dayPath[pre_idx] = new Array();
						} 
						pre_idx = ${planList.dayNo}
						if(pre_idx != idx) {
							dayPath[pre_idx - 1] = new Array();
						}
						p_lat=${planList.lat};
						p_lng=${planList.lng};
						dayPath[pre_idx-1].push({lat : p_lat, lng : p_lng});
						idx = ${planList.dayNo};
					</script>
					</c:forEach>		
				</div>
			</div>	
			</c:forEach>		
		</div>
	</div>
		<div class="post-comments" id="opener" style='float:right; right:520px; top :380px; border: 1px; position:fixed; '>
			<i class="fa fa-share-alt"></i> 
			<span class="post-comments-number">경로</span>
		</div>
		<div class="container" id='BeeMap' style='float:right; right:20px; top :380px;width: 500px; height: 378px; border: 1px; position:fixed; '></div>

			<!-- Comments-->
			<div class="comments" style="clear: both; ">
				<div class="heading" id="commentsTop">
					<h4 class="comments-title">댓글 보기<small class="number"></small></h4>
				</div>
			</div>

			<div class="comments" id="comments">
				<div class="comment">
					<a href="#" class="pull-left"> <img alt="" src="../images/team/1.jpg" class="avatar"></a>
					<div class="media-body">
						<h4 class="media-heading">박성익</h4>
						<p class="time">2017/06/11 오전 11:51</p>
						<p>안해</p>
								
					</div>
				</div>
	

			</div>
			<div class="comment-form">
				<div class="heading">
					<h4>댓글 쓰기</h4>
				</div>
				<form class="form-gray-fields" id="frmReview" >
				<input type="hidden" name="planNo" value="${plan.planNo}">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group" >
								<label for="name" class="upper">이름</label>
									<input type="text" aria-required="true" 
										placeholder="${user.memberNick}" value="${user.memberNick}" class="form-control required">
								<label for="name" class="upper"></label>
									<input type="hidden" aria-required="true" id="name"
										placeholder="박성익" name="memberNo" value="${user.memberNo}" class="form-control required">									
							</div>
						</div>		
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
								<button class="btn btn-primary" id="btnReviewIns" >
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