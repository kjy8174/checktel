<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../sweetalert-master/dist/sweetalert.css">
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
	padding-bottom: 0px;
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
.dayFlag {
	background: url("../img/icon_day_flag.png");
	background-position-x: center;
    background-position-y: center;
    background-size: initial;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: transparent;
}
</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 투어플랜비 -->
<script
	src="https://api.dabeeo.com/api/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM="></script>
<script>

var like = Number('${plan.hit}');
var num=0;
var num1 = 0;
	var map;
	var places;
	var markerGroup;
	var dayPath = new Array(); // 날짜별 지도 위,경도 정보 저장
	var dayContent = new Array();
	var drawPath = new Array();
	var pathColor = ['red','green','blue','black','white'];
	var p_lat;	// 위도
	var p_lng;	// 경도
	var pre_idx = 0;	//비교 인덱스
	var idx = 1;		//인덱스
	// 지도 생성
	bm.ready(function() {
		var maxZoom = 18;
		var minZoom = 10;
		var defZoom = 14;
		// sample geolocation
		var curLat = dayPath[0][0].lat;
		var curLng = dayPath[0][0].lng;
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
/* 		getContents(map.getBounds(), map.getZoom());
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
		}); */
		
		//생성된 지도에 패스 그리기
 		for(var i=0; i < dayPath.length;i++){

 			
 			drawPath[i] = bm.polyline(dayPath[i],{
			      color: 'grey',
			      opacity: 0.5,
			      weight: 2
			    });
 			

 			for(var j=0; j<dayPath[i].length;j++) {
 	 			var myIcon = bm.divIcon({
 	 				html : '<img src="'+dayContent[i][j].spotFurl+'" style="width:47px; height:47px; border-radius:50%;"/><div class="dayFlag" style="margin-top: -78px; margin-left: -12px; width:69px; height: 49px; z-index: 50; position : absolute; display : block; "><div style="font-size: 1em; color:white; font-weight: bold; padding: 15px 0px 0px 12px;">Day '+(i+1)+'</div></div>' ,
 	 				className : "dayFlag_plan",
 	 				iconAnchor : [23,42],
 	 				iconSize : [47,47]
 	 			});
 				var contentIcon = bm.divIcon({
 	 				html : '<img src="'+dayContent[i][j].spotFurl+'" style="width:47px; height:47px; border-radius:50%;"/></div> ',
 	 				className : "dayContent", 
 	 				iconAnchor : [23,42],
 	 				iconSize : [47,47]
 	 			});
 				if(j==0) {
 					bm.marker(dayPath[i][0],{icon : myIcon}).addTo(map);		
 				} else {
 					bm.marker(dayPath[i][j],{icon : contentIcon}).addTo(map);	
 				}
 					
 			}
 			
			drawPath[i].addTo(map);
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
function mapOver(id,no) {
	var lng = document.getElementById("lng"+id).value;
	var lat = document.getElementById("lat"+id).value;
	var loc = {"lat": lat, "lng": lng};
	map.setView(loc)
	
	for(var i = 0; i < dayPath.length; i++) {
		if((no-1) == i) {
			map.removeLayer(drawPath[i]);
			drawPath[i] = bm.polyline(dayPath[i],{
			      color: 'red',
			      opacity: 0.5,
			      weight: 2
			    });
			drawPath[i].addTo(map);
		} else {
			map.removeLayer(drawPath[i]);
			drawPath[i] = bm.polyline(dayPath[i],{
			      color: 'grey',
			      opacity: 0.5,
			      weight: 2
			    });
			drawPath[i].addTo(map);
		}
	}
}
$(function(){
	//페이지 로딩 후에 댓글 목록 조회
	var param = {planNo:"${plan.planNo}"}
	$.getJSON("../review/review.do", param, function(data){
		for(i=0; i<data.length; i++){				
			var btn3 ="";
			var btn4 ="";
			var img5 ="";
			img5="<a class='pull-left'><img src='${pageContext.request.contextPath}/profile_img/"+data[i].memberImg+"' class='avatar' style='width: 100px; height: 100px;'></a>";
			if(data[i].memberNo=="${user.memberNo}") {
			 btn3="<button style='margin-right:10px; float:right;' class='btn' id='btnReviewDel'"+(num)+">삭제</button><input type='hidden' id='hiddenId' value='"+data[i].reviewNo+"'/>";
			 btn4="<button style='margin-right:10px; float:right;' class='btn' id='btnReviewUpd'"+(num1)+">수정</button><input type='hidden' id='hiddenId1' value='"+data[i].reviewNo+"'/>";
			 
			}
			$("#comments").append("<div class='comment'>"+ img5 +"<div class='media-body'><h4 class='media-heading'>"
								+data[i].memberNick+"</h4><p class='time'>"+data[i].reviewDates+"</p><p id='updRview'>"
								+data[i].reviewContent+"</p>" + btn4 + btn3 +"</div></div>");

		}
	})
	
	// 댓글 등록
	$("#btnReviewIns").click(function(event){
		if('${user}'){
			event.preventDefault();
			swal({
				  title: "댓글을 등록하시겠습니까?",
				  text: "",
				  type: "success",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "등록!",
				  cancelButtonText: "취소!",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm){
				  if (isConfirm) {
						event.preventDefault();
						var param = $("#frmReview").serialize();
						
						$.getJSON("../review/reviewInsert.do", param,  function(data){				
							var btn3 ="";
							var btn4 ="";
							var img5 ="";
							img5="<a class='pull-left'><img src='${pageContext.request.contextPath}/profile_img/"+data.memberImg+"' class='avatar' style='width: 100px; height: 100px;'></a>";
							if(data.memberNo=="${user.memberNo}") {
							 btn3="<button style='margin-right:10px; float:right;' class='btn' id='btnReviewDel'"+(num++)+"'>삭제</button><input type='hidden' id='hiddenId' value='"+data.reviewNo+"'/>";
							 btn4="<button style='margin-right:10px; float:right;' class='btn' id='btnReviewUpd'"+(num1++)+">수정</button><input type='hidden' id='hiddenId1' value='"+data.reviewNo+"'/>";
							 
							}
							$("#comments").append("<div class='comment'>"+ img5 +"<div class='media-body'><h4 class='media-heading'>"
												+data.memberNick+"</h4><p class='time'>"+data.reviewDates+"</p><p id='updRview'>"
												+data.reviewContent+"</p>" + btn4 + btn3 +"</div></div>");
			
						});
						swal("댓글 작성", "완료", "success");
					} else {
						swal("댓글 작성", "취소", "error");
						event.preventDefault();
						return;
					}
				});				
		}
		else{
			event.preventDefault();
			swal("로그인 하세여")
		}
	});
	
	// 댓글 삭제
	$(document).on("click","#btnReviewDel",function(event){	
		var param = $(this).parent().children('#hiddenId').val()+"";
		var dd = $(this).parents(".comment");
		console.log(param);		
		swal({
			title: "댓글을 삭제하시겠습니까?",
			  text: "",
			  type: "success",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "삭제!",
			  cancelButtonText: "취소!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){				
				if('${user}'){
			  if (isConfirm) {
				  event.preventDefault(); 
					$.getJSON("../review/reviewDel.do?reviewNo="+param, function(data){	
						dd.remove();
						});
			  } 
			  swal("댓글 삭제", "완료", "success");
				} else {
				  swal("댓글 삭제", "취소", "error");
			    e.preventDefault(); 
				return;
			  }
			});
	});

	// 댓글 수정
	$(document).on("click","#btnReviewUpd",function(event){
		var param = $(this).parent().children('#hiddenId1').val()+"";
		var updtext = $(this).parent().children('#updRview').text();
		var updtext2 = $(this).siblings('#updRview').text();
		var updtag = "<textarea style='margin:10px;' aria-required='true' id='Rupd' placeholder='수정할 내용을 입력하세요' rows='5' name='reviewContent' class='form-control required'>"+updtext+"</textarea><button class='btn' style='margin-right:10px; float:right;' id='RUpdbtn'>수정 등록</button>"
		console.log(param);
		console.log(updtext);
		console.log(updtext2);
		var appp = $(this).parents(".comment").children('div');
		
		swal({
			  title: "댓글 수정 하시겠습니까?",
			  text: "",
			  type: "success",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "수정",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) {
				  event.preventDefault();
					
					appp.append(updtag);
					$(document).on("click","#RUpdbtn", function(event) {			
						event.preventDefault();
						var Rupd = $("#Rupd").val();
						console.log(Rupd);
						$(this).siblings('#updRview').text(Rupd);
						
						$.getJSON("../review/reviewUpd.do?reviewNo="+param+"&reviewContent="+Rupd, function(data){
							$("#Rupd").remove();
							$("#RUpdbtn").remove();
							});
					});
					swal("내용을 수정해주세요");
			  } else {				
			    swal("댓글 수정", "취소", "error");
			    e.preventDefault(); 
				return;
			  }
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
	

	$(function(){
		$("#pCopy").click(function(e){
			e.preventDefault();
			swal({
				  title: "일정 복사 하시겠습니까?",
				  text: "일정 복사해드림!",
				  type: "success",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, copy it!",
				  cancelButtonText: "No, cancel plx!",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm){
				  if (isConfirm) {
				    $(location).attr('href', '${pageContext.request.contextPath }/main/mainCopy.do?planNo=${plan.planNo}')
				  } else {
				    swal("Cancelled", "You not copy the plan :)", "error");
				    e.preventDefault(); 
					return;
				  }
				});
		});
		
		$("#pUpd").click(function(e){
			e.preventDefault();
			swal({
				  title: "일정 수정 하시겠습니까?",
				  text: "일정 수정!",
				  type: "success",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, modify it!",
				  cancelButtonText: "No, cancel plx!",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm){
				  if (isConfirm) {
				    $(location).attr('href', '${pageContext.request.contextPath }/blog/blogUpdate.do?planNo=${plan.planNo}')
				  } else {
				    swal("Cancelled", "You not modified the plan :)", "error");
				    e.preventDefault(); 
					return;
				  }
				});
		});
		$("#pDelete").click(function(e){
			e.preventDefault();
			swal({
				  title: "일정 삭제 하시겠습니까?",
				  text: "일정 삭제!ㅜㅜ",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, delete it!",
				  cancelButtonText: "No, cancel plx!",
				  closeOnConfirm: false,
				  closeOnCancel: false
				},
				function(isConfirm){
				  if (isConfirm) {
				    $(location).attr('href', '${pageContext.request.contextPath }/blog/blogDelete.do?planNo=${plan.planNo}')
				  } else {
				    swal("Cancelled", "You not delete the plan :)", "error");
				    e.preventDefault(); 
					return;
				  }
				});
		});
		$("#pLike").on("click",function(e){	
			if('${user}'){
			if(like!=0){
				like = 0; 
				console.log(like)
				e.preventDefault();
				swal("좋아요 취소")
				$("#eLike").attr("src","../img/empHeart.png");	
				var fir = { "planNo": '${plan.planNo}', "memberNo":'${user.memberNo}'};
				var jsonData = JSON.stringify(fir);
				$.ajax({
					url : '../blog/blogHitDel.do',
					method : "post",
					contentType: "application/json",
					data : jsonData,
					success : function(data){
						console.log("전송")	
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
				});
			}
			else{
				like = like + 1;
				console.log(like)
				e.preventDefault();
				swal("좋아요")
				$("#eLike").attr("src","../img/redHeart.png");
				var fir = { "planNo": '${plan.planNo}', "memberNo":'${user.memberNo}'};
				var jsonData = JSON.stringify(fir);
				$.ajax({
					url : '../blog/blogHit.do',
					method : "post",
					contentType: "application/json",
					data : jsonData,
					success : function(data){
						console.log("전송")	
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
				});
			}
			
		}
			else{
				swal("로그인 하세요!")
			}
		});
	});
    

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
		style="background-image:url(../images/blog/1.jpg);padding-top: 0px;	padding-bottom: 0px">
		<div id="planCreate"></div>
	<div class="container">
		<div class="page-title col-md-8">
			<br />
			<h3> </h3><br>
			<br/>
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
			<c:if test="${!empty user}">
				<li><a href="#" id="pCopy">일정 복사</a></li>
			</c:if>
			<c:if test="${user.memberNo eq plan.memberNo}">
			<li><a href="#" id="pUpd">일정 수정</a></li>
			</c:if>
				<li><a href="#commentsTop">댓글</a></li>	
			<c:if test="${user.memberNo eq plan.memberNo}">
				<li><a href="#" id="pDelete">삭제</a></li><!--자기꺼만 지우기 -->
			</c:if>
				<li><a href="${pageContext.request.contextPath }/report.do?planNo=${plan.planNo}">다운로드</a></li>
			<c:if test="${plan.hit eq 0}">
				<li><a href="#" id="pLike">좋아요 <img id="eLike" src="../img/empHeart.png" style="width:28px; height: 26px;"></a></li>	
			</c:if>
			<c:if test="${plan.hit ne 0}">
				<li><a href="#" id="pLike">좋아요 <img id="eLike" src="../img/redHeart.png" style="width:28px; height: 26px;"></a></li>	
			</c:if>			
			<%-- <c:if test="${plan.hit ne null}">
				<li><a href="#" id="pLike">좋아요 <img id="eLike" src="../img/empHeart.png" style="width:28px; height: 26px;"></a></li>	
			</c:if>	 --%>
			
			<!-- <li><a href="#" id="pLike">좋아요 <img id="rLike" src="../img/redHeart.png" style="width:28px; height: 26px;"></a></li> -->		
			</ul>
		</div>
	</div>
	</section>
	<!-- END: PAGE TITLE -->
	<!-- CONTENT -->
	
	<!-- SECTION -->
	<section class="content">
	
	<div class="container" style="margin-left: 50px; margin-top: 30px; width: 900px;">

	<div>
		<!-- Blog post-->
		<div class="post-content post-content-single post-modern" style="width: 50%">
			<!-- Post item-->
			<c:forEach var="planPeriod" begin="1" end="${plan.planPeriod }" step="1" varStatus="pcnt">
			 <c:set var="decr" value="${planPeriod}"/>
			<div class="post-item">
			<h2 id="day${decr}">
			<%-- <c:if test="${pcnt.first }">
								${plan.planStarts}+1
							</c:if> --%>
			<script>
			//날짜 계산
			var str = '${plan.planStart}';
			var str1 = '${plan.planStarts}';
			var decr = Number('${decr}');
			    var res1 = str1.substring(5, 7); //월
			    var res2 = str.substring(8, 10); //일
			    var res3 = str.substring(24, 28); //년
			    var date = new Date(res3, res1, res2);  // date로 변경
			var s =
			        leadingZeros(date.getFullYear(), 4) + '년' +
			        leadingZeros(date.getMonth() + 1, 2) + '월' +
			        leadingZeros(date.getDate(), 2) + '일'; 
			    console.log(s)
			   	document.getElementById("day"+'${decr}').innerHTML = date_add(s,(decr-1));			 

			function leadingZeros(n, digits) {
				var zero = '';
				n = n.toString();
				
				if (n.length < digits) {
				    for (i = 0; i < digits - n.length; i++)
				        zero += '0';
				}
				return zero + n;	
			}
			    
			    //날짜 더하기
			    function date_add(sDate, nDays) {
			        var yy = parseInt(sDate.substr(0, 4), 10);
			        var mm = parseInt(sDate.substr(5, 2), 10);
			        var dd = parseInt(sDate.substr(8), 10);
			     
			        d = new Date(yy, mm - 1, dd + nDays);
			     
			        yy = d.getFullYear();
			        mm = d.getMonth(); mm = (mm < 10) ? '0' + mm : mm;
			        dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
			     
			        return '' + yy + '년' +  mm  + '월' + dd + '일';
			    }
			</script>
							</h2>
				<!-- 일차 -->
				<div class="post-content-details">
					<div class="post-meta">
						<div class="post-date">
							
							<span class="post-date-day"><c:out value="${decr}"/> <%-- ${pcnt.count} --%> <a class="post-date-month">일차</a>
							</span>
							
						
						</div>						
						
					</div>					
					<c:forEach var="planList" items="${planList}" varStatus="status">
					<c:if test= "${planList.dayNo eq decr}">
					<div class="post-title shadow" id="${planList.dayVisit}" onclick="mapClick(${planList.dayVisit})" onmouseover="mapOver(${planList.dayVisit},${planList.dayNo })">
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
						<span class="demoSpan1"></span><button onclick="Navi(${status.index+1})">길찾기</button>
					</c:if>					
					</div><br>	
					</c:if>
					<script>
						//일정에서 위, 경도 데이터 배열에 저장
						if(pre_idx == 0) {
							dayPath[pre_idx] = new Array();
							dayContent[pre_idx] = new Array();
						} 
						pre_idx = ${planList.dayNo}
						if(pre_idx != idx) {
							dayPath[pre_idx - 1] = new Array();
							dayContent[pre_idx - 1] = new Array();
						}
						p_lat=${planList.lat};
						p_lng=${planList.lng};
						var spotName = '${planList.spotName}';
						var spotFurl = '${planList.spotFurl}';
						var categoryId = '${planList.categoryId}';
						dayPath[pre_idx-1].push({lat : p_lat, lng : p_lng});
						dayContent[pre_idx-1].push({spotName : spotName, spotFurl : spotFurl, categoryId : categoryId});
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
				<div class="heading">
					<h4 class="comments-title">댓글<small class="number"></small></h4>
				</div>
			</div>			
			
			<div class="comments" id="comments">   <!-- 댓글들이 들어가는 부분 -->   </div>
			
			<div class="comment-form" id="commentsTop">
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
										placeholder="${user.memberNick}" value="${user.memberNick}" class="form-control required" readonly="readonly">
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