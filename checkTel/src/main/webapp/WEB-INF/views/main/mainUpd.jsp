<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.short {        
    overflow : hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    
    width:170px;
}

.shadow{
    width: 170px;
    height: 70px;
    background-color: white;
    box-shadow: 5px 5px 5px grey;
    margin-bottom: 10px;
}

.imgteaser .desc{ 
	display: block;
	font-size: 11px;
	font-family:"굴림";
	letter-spacing:-1px;
	line-height:140%;
	padding: 10px 0;
	background: #111;
	filter:alpha(opacity=75);
	opacity:.75;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=75)";
	color: #fff;
	position: absolute;
	padding: 10px;
	margin: 0;
	width: 280px;
	border-top: 1px solid #999;
}
.imgteaser .desc strong {
	color:#00FFFF;
	display: block;
	margin-bottom: 5px;
	font-size:16px;
	font-family:dotum;
	font-weight:bold;
}

.button2 {
	font-weight:bold;
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    height : 40px;
    width:95%;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
	font-weight:bold;
   background-color: #f44336;
    color: white;
}

.button1:hover {
	font-weight:bold;
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}
.image {
    position:relative;
    float:left; /* optional */
    margin-bottom: 10px;
}
.image .text {
    position:absolute;
    top:0px; /* in conjunction with left property, decides the text position */
    left:0px;
    width:280px; /* optional, though better have one */
    color: black;
    font-size: 24px;
    font-weight: bold;
    
}


 label, input { display:block; }
 input.text { margin-bottom:12px; width:95%; padding: .4em; }
 fieldset { padding:0; border:0; margin-top:25px; }
 h1 { font-size: 1.2em; margin: .6em 0; }
 div#users-contain { width: 350px; margin: 20px 0; }
 div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
 div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
 .ui-dialog .ui-state-error { padding: .3em; }
 .validateTips { border: 1px solid transparent; padding: 0.3em; }
.title {
 	padding:8px;
 	padding-right:5px;
 	box-shadow:0px 0px 8px 0px rgba(0,0,0,0.5);
 	transform:translate(0%, -50%);
 	margin-top:18%;
 	float:left;
 	position:relative;
 	background:rgba(255,255,255,0.9);
 	border:1px solid #ffffff;}

#floater {
	float:left;
	height:50%;
	margin-bottom:-10px;
}
#mid {
 	clear:both;
 	width:80px;
	position:relative;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
 }
 .main-no-img {
 	background: url("../img/no_image.png");
	background-position-x: center;
    background-position-y: center;
    background-size: initial;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: transparent;
    border-radius:50%;
    border: 1px solid white;
    font-size:18px;
    font-weight:bold;
    text-align:center;
    vertical-align:middle;
    color: black;
 }
 
button {
    outline: none;
}
button .side-btn {
    color: #222;
    font-weight: bold;
}
.side {
    background-color: #f1f2f6;
    width: 320px;
    height: 100%;
    position: fixed;
    top: 60px;
    right: -320px;
    z-index: 9999;
}
.side > .side-content {
    position: absolute;
    top: 0px;
    right: 0px;
    color: #f1f2f6;
}
.side button {
    background-color: #f1f2f6;
    display: block;
    position: absolute;
    top: 10px;
    right: 320px;
    width: 70px;
    height: 38px;
    line-height: 38px;
    text-align: center;
    margin: 0;
    padding: 0;
    border: none;
}  
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src='https://api.dabeeo.com/api/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM='></script>
	
	<!-- 메인 모달 이미지 슬라이드 -->	
    <link href="../css/thumbnail-slider.css" rel="stylesheet" type="text/css" />
    <link href="../css/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="../js/thumbnail-slider.js" type="text/javascript"></script>
    <script src="../js/ninja-slider.js" type="text/javascript"></script>
<script src="../sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../sweetalert-master/dist/sweetalert.css">
  <script type='text/javascript'>
  
  $( function() { //검색 자동완성
	    /* var availableTags = []; */
	    
	   /*  $( "#serch" ).autocomplete({
	      source: availableTags
	    }); */
  });
  var firstCityName;
  var pre_idx = 0;	//비교 인덱스
  var idx = 1;		//인덱스
  var flightPath = [];
  var delClick=0;
  var dayNo=1;
  var seq = 1;
  var availableTags = [];
  var flightPlanCoordinates = []; //경로 만들 때 위도 경도
  var city_array = new Array();
  var planSub = [];//new Array();
  var curPlace;
  var mIdx;
  var div =0;
  var a = '${plan.planPeriod}';
  var dayClick=1;
  var map;
  var places;
  var markerGroup;
  var cut = '${plan.planPeriod}';
  var flightPath = [];
  //flightPlanCoordinates[cut-1] = new Array();
  // 지도 생성
  bm.ready(function () {
      var maxZoom = 18;
      var minZoom = 4;
      var defZoom = 14;
      // sample geolocation
      var curLat = document.getElementById("fLat").value;
      var curLng = document.getElementById("fLng").value;
      // create a map
      map = new bm.Map('BeeMap', {
          center: [curLat, curLng]
          , zoom: defZoom
          , zoomControl: false
      });
      
      bm.tileLayer({
          maxZoom: maxZoom
          , minZoom: minZoom
      }).addTo(map);
      // 마커 그룹 관리를 위한 오브젝트 생성
      markerGroup = bm.layerGroup().addTo(map);
      // 현재 줌 레벨과 영역에 대한 장소정보 가져오기
      getContents(map.getBounds(), map.getZoom());
      map.on('zoomend dragend moveend', function (e) { // 지도 줌이 바뀔때마다 장소 정보 가져오기    	  
          $("#list").empty();
          getContents(map.getBounds(), map.getZoom());
      });	  
      
      for(var i=0; i < flightPlanCoordinates.length;i++){
    	  map.removeLayer(flightPath[i]);
			flightPath[i] = bm.polyline(flightPlanCoordinates[i],{
			      color: 'grey',
			      opacity: 1.0,
			      weight: 2
			    });
			flightPath[i].addTo(map);
			map.removeLayer(flightPath[cut-1]);
			flightPath[cut-1] = bm.polyline(flightPlanCoordinates[cut-1],{
			      color: '#FF0000',
			      opacity: 1.0,
			      weight: 2
			    });
			flightPath[cut-1].addTo(map);
		}
/*       for(var i=0;i<a;a++){
    	  flightPath[i] = bm.polyline(flightPlanCoordinates[i],{
		      color: '#FF0000',
		      opacity: 1.0,
		      weight: 2
		    });
		  flightPath[i].addTo(map);
      } */
      
     /*  for(var i=0;i<a;i++){
    	  flightPlanCoordinates[a-1]= [];
      } */
      
      
  });
  
  function getContents(bounds, zoom) {
      var xmlhttp = new XMLHttpRequest();
      // 투어플랜비 콘텐츠 API 호출
      var url = 'https://tourplanb.com:4443/place/map/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM=&zoom=' + zoom + '&nelat=' + bounds._northEast.lat + '&nelng=' + bounds._northEast.lng + '&swlat=' + bounds._southWest.lat + '&swlng=' + bounds._southWest.lng + '&lang=ko';
      xmlhttp.onreadystatechange = function () {
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
  
  function imgClick(places){	  
	  $("#list").empty();
	  for (var i = 0; i < places.length; i++) {
		  let placeIdx = i;
		  if(places[i].Mode!="City"){
	    	  mIdx = places[i].Idx;    		
	    	}
	    	else{
	    		mIdx = places[i].CityIdx;   
	    	}
    	  city_array[mIdx]=places[i];
		  availableTags.push(city_array[mIdx].Title);
		  //장소 리스트에 정보 출력
		  if (city_array[mIdx].Furl != null){
	        	 
				if (city_array[mIdx].Mode=="City") {
					$('#list')
							.append(
									'<div class="image imgteaser" id="img'+mIdx+'"><img src=' + city_array[mIdx].Furl + ' style="max-width: 280px; opacity:0.6;">'
									+ '<div class="text">' + '<span class="desc"><span style="font-size: 15px;  top:0px; left:0px;">'
										+ city_array[mIdx].CountryName_ko+'</span><strong>'
										+ city_array[mIdx].CityName_ko
										+ '</strong></span></div></div><br>');
				} else {
					$('#list')
							.append(
									'<div class="image imgteaser" id="img'+mIdx+'"><img src=' + city_array[mIdx].Furl + ' style="max-width: 280px; opacity:0.6;">'
											+ '<div class="text"><span class="desc"><strong>'
											+ city_array[mIdx].Title +'</strong><span style="float:right; font-size: 15px;">Rank '+city_array[mIdx].Rank+'</span></span>'
											+ '</div></div><br>');
				}
			}
	          else{
	        	  if (city_array[mIdx].Mode=="City") {
	  				$('#list')
	  						.append(
	  								'<div class="image imgteaser" id="img'+mIdx+'"><img src="../img/no_image.png"; style="max-width: 280px;">'
	  										+ '<div class="text">' + '<span class="desc"><span style="font-size: 15px;  top:0px; left:0px;">'
	  										+ city_array[mIdx].CountryName_ko+'</span><strong>'
	  										+ city_array[mIdx].CityName_ko
	  										+ '</strong></span></div></div><br>');
	  			} else {
	  				$('#list')
	  						.append(
	  								'<div class="image imgteaser" id="img'+mIdx+'"><img src="../img/no_image.png"; style="max-width: 280px;">'
			  								+ '<div class="text"><span class="desc"><strong>'
											+ city_array[mIdx].Title + '</strong><span style="float:right; font-size: 15px;">Rank '+city_array[mIdx].Rank+'</span></span>'
											+ '</div></div><br>');
	  			}        	  
	          }
			
			
		  $("#img"+mIdx).on('click', function(e) { // 리스트 클릭시 상세 정보 표시
				
				if (places[placeIdx].Mode!="City"){
					showInfoImg(places[placeIdx].Idx);
					}
				else{
					var loc = {"lat": places[placeIdx].Lat, "lng": places[placeIdx].Lng};
					if(map.getZoom()<14){
						map.setView(loc,14);
					}
					map.setView(loc);
				}
			});
	  }
	  
  }
  
  function createMarkers(places) { //마커 생성
      markerGroup.clearLayers();
      for (var i = 0; i < places.length; i++) {
    	  let placeIdx = i;
    	  let marker;
    	  
    	//장소 인덱스 저장
    	
    	if(places[i].Mode!="City"){
    	  mIdx = places[i].Idx;    		
    	}
    	else{
    		mIdx = places[i].CityIdx;   
    	}
    	  city_array[mIdx]=places[i];
    	  if(city_array[mIdx].Furl == null && city_array[mIdx].CategoryIdx >9&&city_array[mIdx].Mode!="City") {
    		marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div id="floater"></div><div id="mid">'+city_array[mIdx].Title+'</div>' , className : 'main-no-img', iconAnchor : [23,42], iconSize : [47,47]})}).bindPopup(city_array[mIdx].Title, {offset:[0,-30], className:'my-popup'}).addTo(markerGroup);				
   		  } else if(city_array[mIdx].Furl == null&&city_array[mIdx].Mode!="City") {
   			marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<img src="../img/icon_category_'+city_array[mIdx].CategoryIdx+'.png"  style="width:47px; height:47px;">', className : 'main-div-img', iconAnchor : [23,42], iconSize : [47,47]})}).bindPopup(city_array[mIdx].Title, {offset:[0,-30], className:'my-popup'}).addTo(markerGroup);				
   		  } 
   		  else if (city_array[mIdx].Furl == null&&city_array[mIdx].Mode=="City"){
        	  marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div id="floater"></div><div id="mid">'+city_array[mIdx].CityName_ko+'</div>', className : 'main-no-img', iconAnchor : [23,42], iconSize : [80,80]})}).bindPopup(city_array[mIdx].CityName_ko, {offset:[0,-30], className:'my-popup'}).addTo(markerGroup);
          }

          else if (city_array[mIdx].Mode=="City"){
        	  marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<img src="'+city_array[mIdx].Furl+' "  style="width:80px; height:80px; border: 1px solid white; border-radius:50%;">', className : 'main-div-img', iconAnchor : [23,42], iconSize : [47,47]})}).bindPopup(city_array[mIdx].CityName_ko, {offset:[0,-30], className:'my-popup'}).addTo(markerGroup);
          }
   		  else{
   			marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<img src="'+city_array[mIdx].Furl+' "  style="width:47px; height:47px; border: 1px solid white; border-radius:50%;">', className : 'main-div-img', iconAnchor : [23,42], iconSize : [47,47]})}).bindPopup(city_array[mIdx].Title, {offset:[0,-30], className:'my-popup'}).addTo(markerGroup);
   		  }
    	           
		marker.on('click', function(e) { // 마커 클릭시 상세 정보 표시
			if (places[placeIdx].Mode!="City"){				
				showInfo(places[placeIdx].Idx);
			}
			else{
				var loc = {"lat": places[placeIdx].Lat, "lng": places[placeIdx].Lng};
				if(map.getZoom()<14){
					map.setView(loc,14);
				}
			}
		});
	}
}  
 
function showInfo(mIdx) { //상세 정보 출력
	 //$("#list").empty();
	//해당 위치로 이동
	var loc = {"lat": city_array[mIdx].Lat, "lng": city_array[mIdx].Lng};
	if(map.getZoom()<14){
		map.setView(loc,14);
	}else{
		map.setView(loc);
	}
	
	 $('#info').show();
	$('#info').empty();
	$("#exTab a:last").tab("show");
	if (city_array[mIdx].Mode!="City"){
		if (city_array[mIdx].Furl != null){			
			$('#info')
					.append(
							'<img src=' + city_array[mIdx].Furl + ' style="max-width: 300px;">');
		}		
		$('#info').append('<p><h4><b>' + city_array[mIdx].Title + '</b></h4></p><hr>');
		$('#info').append(
				'<p><big><b>설명</b></big><br> ' + city_array[mIdx].Contents + '</p><hr>');
		$('#info').append('<p><big><b>랭킹</b></big><br> ' + city_array[mIdx].Rank + '</p><hr>');
	}
	$('#info').append(
	'<input type="button" class="button2 button1" id ="addPlan'+a+'" value="일정에 넣기">');
	$('#info').append(
		'<input class="button2 button1" type="button" id ="close" style="margin-left: 2px;" value="닫기">');
	$("#close").click(function() {
		$('#info').empty();
		$('#info').hide();
		$("#exTab a:first").tab("show");
	});
	$("#addPlan"+a).click(function() {
		var furl;
		if(city_array[mIdx].Furl==null){
			furl = "../img/no_image.png";
		}
		else{
			furl=city_array[mIdx].Furl;
		}
		if(city_array[mIdx].CategoryIdx>7){
			var plan = {"spotNo":city_array[mIdx].Idx,"spotName":city_array[mIdx].Title,"spotFurl":furl,"lat":city_array[mIdx].Lat,"lng":city_array[mIdx].Lng,"cityName":city_array[mIdx].CityName_ko,"dayVisit":(dayNo++),"categoryId":6,"dayNo":(cut)}; //json으로 배열 만듬
		}
		else{
			var plan = {"spotNo":city_array[mIdx].Idx,"spotName":city_array[mIdx].Title,"spotFurl":furl,"lat":city_array[mIdx].Lat,"lng":city_array[mIdx].Lng,"cityName":city_array[mIdx].CityName_ko,"dayVisit":(dayNo++),"categoryId":city_array[mIdx].CategoryIdx,"dayNo":(cut)}; //json으로 배열 만듬
		}
		
		planSub.push(plan);
		
		for(var i=0;i<planSub.length;i++){
	        if(planSub[i].dayNo==1){
	        	firstCityName = planSub[i].cityName;
	        }
        }
		
		  flightPlanCoordinates[cut-1].push({lat: city_array[mIdx].Lat, lng: city_array[mIdx].Lng , dayNum:dayNo}); //경로 그리기
		  map.removeLayer(flightPath[cut-1]);
		  flightPath[cut-1] = bm.polyline(flightPlanCoordinates[cut-1],{
		      color: '#FF0000',
		      opacity: 1.0,
		      weight: 2
		    });
		  flightPath[cut-1].addTo(map);
		  
		$('#smallIdx').val(city_array[mIdx].Idx);
		$('#smallLat').val(city_array[mIdx].Lat);
		$('#smallLng').val(city_array[mIdx].Lng);
		if(city_array[mIdx].Furl == null && city_array[mIdx].CategoryIdx >9) {
			$('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'"><img class="delete" src="../img/icon_delete_n.png" style="float:right">'+ '<div id="'+city_array[mIdx].Idx+'" class="short">'+ city_array[mIdx].Title+'</div></div>');
 		  }else if(city_array[mIdx].Furl == null) {
 			$('#smallImg'+(cut))
 			.append(
 					'<img id="'+dayNo+'" src="../img/icon_category_'+city_array[mIdx].CategoryIdx+'.png" style="max-width: 45px; max-height: 45px; margin-right:3px;">');		
 			$('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
 					'<img style="width: 45px; height: 45px;" src="../img/icon_category_'+city_array[mIdx].CategoryIdx+'.png"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan('+dayNo+');" src="../img/icon_delete_n.png" style="float:right"><div class="short">'+ city_array[mIdx].Title+'</div></div>');
 			} 
 		  else{
 			$('#smallImg'+(cut))
 			.append(
 					'<img id="'+dayNo+'" src=' + city_array[mIdx].Furl + ' style="max-width: 45px; max-height: 45px; margin-right:3px;">');
 			$('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
 					'<img style="width: 45px; height: 45px;" src="'+ city_array[mIdx].Furl +'"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan('+dayNo+');" src="../img/icon_delete_n.png" style="float:right"><div class="short">'+ city_array[mIdx].Title+'</div></div>');
 		  }
		
		$("#"+city_array[mIdx].Idx).click(function() {
			showInfo(mIdx);
		});
	});
}

function showInfoImg(mIdx) { //상세 정보 출력
	//해당 위치로 이동
	var loc = {"lat": city_array[mIdx].Lat, "lng": city_array[mIdx].Lng};
	if(map.getZoom()<14){
		map.setView(loc,14);
	}else{
		map.setView(loc);
	}
	
	$('#info').show();
	$('#info').empty();
	$("#exTab a:last").tab("show");
	if (city_array[mIdx].Mode!="City"){
		if (city_array[mIdx].Furl != null){
			$('#info')
					.append(
							'<img src=' + city_array[mIdx].Furl + ' style="max-width: 300px;">');
		}
		
		$('#info').append('<p><h4><b>' + city_array[mIdx].Title + '</b></h4></p><hr>');
		$('#info').append(
				'<p><big><b>설명</b></big><br>' + city_array[mIdx].Contents + '</p><hr>');
		$('#info').append('<p><big><b>랭킹</b></big><br>' + city_array[mIdx].Rank + '</p><hr>');
	}
	$('#info').append(
	'<input type="button" id ="addPlan'+a+'" class="button2 button1" value="일정에 넣기">');
	$('#info').append(
		'<input type="button" id ="close" class="button2 button1" value="닫기">');
	$("#close").click(function() {
		$('#info').empty();
		$('#info').hide();
		$("#exTab a:first").tab("show");
	});
	$("#addPlan"+a).click(function() {
		var furl;
		if(city_array[mIdx].Furl==null){
			furl = "../img/no_image.png";
		}
		else{
			furl=city_array[mIdx].Furl;
		}
		if(city_array[mIdx].CategoryIdx>7){
			var plan = {"spotNo":city_array[mIdx].Idx,"spotName":city_array[mIdx].Title,"spotFurl":furl,"lat":city_array[mIdx].Lat,"lng":city_array[mIdx].Lng,"cityName":city_array[mIdx].CityName_ko,"dayVisit":(dayNo++),"categoryId":6,"dayNo":(cut)}; //json으로 배열 만듬
		}
		else{
			var plan = {"spotNo":city_array[mIdx].Idx,"spotName":city_array[mIdx].Title,"spotFurl":furl,"lat":city_array[mIdx].Lat,"lng":city_array[mIdx].Lng,"cityName":city_array[mIdx].CityName_ko,"dayVisit":(dayNo++),"categoryId":city_array[mIdx].CategoryIdx,"dayNo":(cut)}; //json으로 배열 만듬
		}
		
		planSub.push(plan);
		
		for(var i=0;i<planSub.length;i++){
	        if(planSub[i].dayNo==1){
	        	firstCityName = planSub[i].cityName;
	        }
        }
		
		flightPlanCoordinates[cut-1].push({lat: city_array[mIdx].Lat, lng: city_array[mIdx].Lng , dayNum:dayNo}); //경로 그리기
		map.removeLayer(flightPath[cut-1]);  
		flightPath[cut-1] = bm.polyline(flightPlanCoordinates[cut-1],{
		      color: '#FF0000',
		      opacity: 1.0,
		      weight: 2
		    });
		  flightPath[cut-1].addTo(map);
		  
		$('#smallIdx').val(city_array[mIdx].Idx);
		$('#smallLat').val(city_array[mIdx].Lat);
		$('#smallLng').val(city_array[mIdx].Lng);
		  if(city_array[mIdx].Furl == null && city_array[mIdx].CategoryIdx >9) {
			  $('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan('+dayNo+');" src="${pageContext.request.contextPath }/images/icon_delete_n.png" style="float:right">'+
	 					'<div class="short">'+ city_array[mIdx].Title+'</div></div><br>');
   		  } else if(city_array[mIdx].Furl == null) {
   			$('#smallImg'+(cut))
   			.append(
   					'<img id="'+dayNo+'" src="../img/icon_category_'+city_array[mIdx].CategoryIdx+'.png" style="max-width: 45px; max-height: 45px; margin-right:3px;">');		
   			$('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
   					'<img style="width: 45px; height: 45px;" src="../img/icon_category_'+city_array[mIdx].CategoryIdx+'.png"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan('+dayNo+');" src="../img/icon_delete_n.png" style="float:right"><div class="short">'+ city_array[mIdx].Title+'</div></div>');
   			} 
   		  else{
   			$('#smallImg'+(cut))
   			.append(
   					'<img id="'+dayNo+'" src=' + city_array[mIdx].Furl + ' style="max-width: 45px; max-height: 45px; margin-right:3px;">');
   			$('#detailPlan'+(cut)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
   					'<img style="width: 45px; height: 45px;" src="'+ city_array[mIdx].Furl +'"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan('+dayNo+');" src="../img/icon_delete_n.png" style="float:right"><div class="short">'+ city_array[mIdx].Title+'</div></div>');
   		  }
		$("#"+city_array[mIdx].Idx).click(function() {
			showInfoImg(mIdx);
		});
	});
}

function addDay(){ //일정 늘리기
	cut=++a;
	$("#plan").append('<div id="allPlan'+(a)+'" class="allPlan" style="border:solid #22becc 2px; background-color:white;">'+
	'<b>DAY'+(a)+'</b><img class="delete" src="../img/icon_delete_n.png" style="float:right"><br>'+
	'<div id="cal'+(a)+
	'"></div>'+
	'<div id="smallImg'+(a)+'">'+
	'</div></div>');
	
	$("#detail").append('<div id="detailPlan'+a+'" style="position: fixed; overflow: scroll; width: 195px; height: 90%; top: 60px; left: 170px; background-color: #f1f2f6;"><h2><b>DAY'+a+'</b></h2></div>');
	 flightPlanCoordinates[a-1] = new Array();	
	 flightPath[a-1] = new Array();
	$( function() {
	    $(".allPlan").click(function() {
	    	 div = $(".allPlan").index(this);
	    	 cut=div+1;
	    	 if(cut<a){
	    		 for(i=cut;i<=a;i++){
		    		 $("#detailPlan"+i).hide();
		    	 }
	    	 }	
	    	//해당 경로만 빨간색
	    	 for(i=0;i<flightPath.length;i++){
	    		 console.log(cut)
	    		 map.removeLayer(flightPath[cut-1]);
	    		 map.removeLayer(flightPath[i]);
	 				flightPath[i] = bm.polyline(flightPlanCoordinates[i],{
					      color: 'grey',
					      opacity: 1.0,
					      weight: 2
					    });
	 				flightPath[i].addTo(map);
	 				 map.removeLayer(flightPath[cut-1]);
	 				flightPath[cut-1] = bm.polyline(flightPlanCoordinates[cut-1],{
					      color: '#FF0000',
					      opacity: 1.0,
					      weight: 2
					    });
	 				flightPath[cut-1].addTo(map);
	    	 }
	    	 
	    	 
	    	 $("#detailPlan"+(div+1)).show();
	    	 console.log("cut: " +cut);
	    });
	});
}
$( function() {
    $(".allPlan").click(function() {
    	 div = $(".allPlan").index(this);
    	 cut=div+1;
    	 if(cut<a){
    		 for(i=cut;i<=a;i++){
	    		 $("#detailPlan"+i).hide();
	    	 }
    	 }		
    	 
    	//해당 경로만 빨간색
    	 for(i=0;i<flightPath.length;i++){
    		 console.log(cut)
    		 map.removeLayer(flightPath[cut-1]);
    		 map.removeLayer(flightPath[i]);
 				flightPath[i] = bm.polyline(flightPlanCoordinates[i],{
				      color: 'grey',
				      opacity: 1.0,
				      weight: 2
				    });
 				flightPath[i].addTo(map);
 				 map.removeLayer(flightPath[cut-1]);
 				flightPath[cut-1] = bm.polyline(flightPlanCoordinates[cut-1],{
				      color: '#FF0000',
				      opacity: 1.0,
				      weight: 2
				    });
 				flightPath[cut-1].addTo(map);
    	 }
    	 
    	 $("#detailPlan"+(div+1)).show();
    });
});

/* $( function() { //x버튼 클릭 시 삭제
	$( ".delete" ).click(function() {
    	$(".delete").parents("div .allPlan").remove();
    });
    $( ".delete" ).click(function() {
    	$(".delete").parents("div .shadow").remove();
    });
  });
 */

$( function() { //탭 바
    $( "#tabs" ).tabs();
  } );
$( function() { //달력
    $( "#datepicker" ).datepicker({
		altField: "#cal", // 선택한 날짜 들어가는거
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		changeMonth: true,
		changeYear: true,
		yearSuffix: '년',
		onSelect : function(selectDate){ // 선택한 날짜 값 가져오기
			$("#cal").text(selectDate);
		}
	  });
  } );

$(function() {
	$("#planSave").click(function() {
		if('${user}'){
			if($("#cal").val()){
				for(var i=0;i<a;i++){
					console.log("planSub[i]"+planSub[i]);
					if((typeof planSub[i] == "undefined")){
						swal("비어있는 일정을 추가 하셈");
					return;
					}
				}
				swal({
					  title: "일정 생성 하시겠습니까?",
					  text: "일정 만듬!",
					  type: "success",
					  showCancelButton: true,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "Yes, create!",
					  closeOnConfirm: false
					},
					function(isConfirm){
						if(isConfirm){
				var pN = Number('${plan.planNo}')
				var fir = {"planNo":'${plan.planNo}',"planPeriod":a,"planStart":$("#cal").val(),"planEnd":3,"detail":planSub,"blogTitle":"${user.memberNick}님의 "+(a-1)+"박"+a+"일 여행("+firstCityName+")","blogHit":0,"memberNo":Number('${user.memberNo}'),"memberNick":'${user.memberNick}'};
				//var jsonData = JSON.stringify(planSub);
				var jsonData = JSON.stringify(fir);
				$.ajax({
					url : '../main/saveUpd.do',
					method : "post",	
					data : jsonData,
					contentType: "application/json",
					success : function(data) {
						location.href="../blog/myBlogShow.do?planNo="+'${plan.planNo}';
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
				});
					}
			});
	
				
		}
			else{
				swal("출발일 선택 하세여")
			}
	}
		else{
			swal("로그인 하세여")
		}
	});
});
//일정 삭제
function DeletePlan(id) {
	id.parentNode.remove();
}
function DeleteSmallPlan(id) {
	console.log(flightPlanCoordinates);
	var pId = document.getElementById(id);
	pId.remove();
 	for(i=0;i<planSub.length;i++){
 		if(planSub[i].dayVisit==(id)){
 			planSub.splice(i,1)
 		}
 	}
 	console.log(flightPlanCoordinates)
 	for (fnum=0;fnum<flightPlanCoordinates.length;fnum++){
 		for(jnum=0;jnum<flightPlanCoordinates[fnum].length;jnum++){
 			if(flightPlanCoordinates[fnum][jnum].dayNum==id){
 				console.log("fnum: "+fnum+"jnum: "+jnum+" id: "+id+" dayNum: "+flightPlanCoordinates[fnum][jnum].dayNum)
 				map.removeLayer(flightPath[fnum]);
		 		flightPlanCoordinates[fnum].splice(jnum,1);
 				console.log(flightPlanCoordinates);
 				flightPath[fnum] = bm.polyline(flightPlanCoordinates[fnum],{
				      color: '#FF0000',
				      opacity: 1.0,
				      weight: 2
				    }); 				
 				flightPath[fnum].addTo(map);
 				
 			}
/*  			else{
 				map.removeLayer(flightPath[fnum]);
 				flightPath[fnum] = bm.polyline(flightPlanCoordinates[fnum],{
				      color: '#FF0000',
				      opacity: 1.0,
				      weight: 2
				    }); 				
				flightPath[fnum].addTo(map);
 			} */
 		}
 	}
 	
}
//sidebar
$(function(){
    var duration = 300;
 
    var $sidebar = $('.side');
    var $sidebarButton = $sidebar.find('button').on('click', function(){
        $sidebar.toggleClass('open');
        if($sidebar.hasClass('open')){
            $sidebar.stop(true).animate({right: '0px'}, duration, 'easeOutBack');
            $sidebarButton.find('span').text('CLOSE');
        }else{
            $sidebar.stop(true).animate({right: '-320px'}, duration, 'easeInBack');
            $sidebarButton.find('span').text('OPEN');
        };
    });
});

</script>
</head>
<body>
<div id='BeeMap' style='width: 100%; height: 100%; border: 0;'></div>

<div class="side open" style="right: 0px;">	
<div id="exTab" class="container" >
	  <ul class="nav nav-pills" style="top:10px;">
	    <li class="active"><a href="#list" data-toggle="tab">장소</a></li>
	    <li><a href="#info" data-toggle="tab">상세보기</a></li>    
	  </ul>
	  <div class="tab-content clearfix">
		<div class="tab-pane active" id='list' 
			style='top:10px; padding:0px; overflow: scroll; width: 300px; height: 650px;'>
		</div>
		<div class="tab-pane" id='info' style='top:10px; overflow: scroll; width: 300px; height: 650px;'>
		</div>
	  </div>
</div>	
	<button><span class="side-btn">CLOSE</span></button>
</div>
<div style="position: fixed; width: 170px; overflow:scroll; height: 90%; top: 60px; left: 0px; background-color:#616265;">
<div id="plan">

<c:forEach var="planList" items="${planList}" varStatus="status">
<c:if test="${status.first }">
<input type="hidden" id="fLat">
<input type="hidden" id="fLng">
<script>
document.getElementById("fLat").value = '${planList.lat}';
document.getElementById("fLng").value = '${planList.lng}';
firstCityName = '${planList.cityName}'
</script>
</c:if>
<script>
		var plan = {"spotNo":'${planList.spotNo}',"spotName":'${planList.spotName}',"spotFurl":'${planList.spotFurl}',
		"lat":'${planList.lat}',"lng":'${planList.lng}',"cityName":'${planList.cityName}',
		"dayVisit":'${planList.dayVisit}',"categoryId":'${planList.categoryId}',"dayNo":'${planList.dayNo}'}; //json으로 배열 만듬
        planSub.push(plan);
		dayNo = '${planList.dayVisit+1}'		
			$(function() {	
				$("#"+'${planList.spotNo}').click(function() {
					var loc = {lat: '${planList.lat}', lng:'${planList.lng}'};
					if(map.getZoom()<14){
						map.setView(loc,14);
					}else{
						map.setView(loc);
					}
					//showInfo('${planList.spotNo}');
				});
			});
		
</script>
<c:if test="${status.last }">
<script>
dayNo = '${planList.dayVisit+1}';
</script>
</c:if>
</c:forEach>

    <!--end-->

		<button class="button2 button1" onclick="addDay();">+일정 추가</button><br>
		<input type="button" class="button2 button1" id="datepicker" value="출발일 수정">
		<!-- 전체 일정  -->
		
		<c:forEach var="planPeriod" begin="1" end="${plan.planPeriod}" step="1" varStatus="pcnt">
		<c:set var="decr" value="${planPeriod}"/>
		<div id="allPlan<c:out value="${decr}"/>" class="allPlan" style="border:solid #22becc 2px; background-color: white;">
			<b>DAY<c:out value="${decr}"/></b><img class="delete" src="${pageContext.request.contextPath}/img/icon_delete_n.png" style="float:right"><br>
			<div id="cal">
			</div>
		<div id="smallImg<c:out value="${decr}"/>">
		<c:forEach var="planList" items="${planList}" varStatus="status">

		<c:if test= "${planList.dayNo eq decr}">
			<img id="${planList.dayVisit }" src="${planList.spotFurl}" style="max-width: 45px; max-height: 45px; margin-right:3px;">
		</c:if>
		</c:forEach>
			</div>
		</div>
		</c:forEach>
		
	</div>
	<a href="../main/mainUpd.do"><button class="button2 button1">전체 삭제</button></a>
	<button class="button2 button1" id="planSave">일정 저장</button>
</div>

	<!-- 일정 상세보기  -->
<div id = "detail">
	<c:forEach var="planPeriod" begin="1" end="${plan.planPeriod}" step="1" varStatus="pcnt">
	<c:set var="decr" value="${planPeriod}"/>
	<div id="detailPlan<c:out value="${decr}"/>" style="position: fixed; overflow: scroll; width: 195px; height: 90%; top: 60px; left: 170px; background-color: #f1f2f6;">
	<h2><b>DAY<c:out value="${decr}"/></b></h2>
	<c:forEach var="planList" items="${planList}" varStatus="status">
	<script>
	/* console.log("visit:"+'${planList.dayVisit}'+"dayNo")
	var pDayno = Number('${planList.dayNo}')-1;
	flightPlanCoordinates[pDayno] = []
	console.log(pDayno)
	flightPlanCoordinates[pDayno].push({lat: '${planList.lat}', lng:'${planList.lng}' ,dayNum:'${planList.dayVisit}'}); //경로 그리기 */

		if(pre_idx == 0) {
			flightPlanCoordinates[pre_idx] = new Array();
			flightPath[pre_idx] = new Array();
		} 
		pre_idx = ${planList.dayNo}
		if(pre_idx != idx) {
			flightPlanCoordinates[pre_idx - 1] = new Array();
			flightPath[pre_idx - 1] = new Array();
		}
		p_lat=${planList.lat};
		p_lng=${planList.lng};
		var dayN = Number('${planList.dayVisit}');
		flightPlanCoordinates[pre_idx-1].push({lat: '${planList.lat}', lng:'${planList.lng}' ,dayNum:dayN});
		idx = ${planList.dayNo};
		
	</script>
	<c:if test= "${planList.dayNo eq decr}">
	<div class="shadow" id="${planList.spotNo }">
	<img style="width: 45px; height: 45px;" src="${planList.spotFurl}"><img class="delete" onclick="DeletePlan(this);DeleteSmallPlan(${planList.dayVisit});" src="../img/icon_delete_n.png" style="float:right"><div class="short">${planList.spotName }</div>
	</div>
	</c:if>
	</c:forEach>
	</div>	
	</c:forEach>	
</div>	
</body>
</html>