<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.shadow{
    width: 170px;
    height: 90px;
    background-color: white;
    box-shadow: 5px 5px 5px grey;
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
	width: 260px;
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
    width:260px; /* optional, though better have one */
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
  
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src='https://api.dabeeo.com/api/?k=ZGI2NWZhODhjYWE5NjQ1Yjc1MzE1NzUzMzk0MjQ0YWM='></script>

  <script type='text/javascript'>
  $( function() { //검색 자동완성
	    /* var availableTags = [
	      "ActionScript",
	      "AppleScript",
	      "Asp",
	      "BASIC",
	      "C",
	      "C++",
	      "Clojure",
	      "COBOL",
	      "ColdFusion",
	      "Erlang",
	      "Fortran",
	      "Groovy",
	      "Haskell",
	      "Java",
	      "JavaScript",
	      "Lisp",
	      "Perl",
	      "PHP",
	      "Python",
	      "Ruby",
	      "Scala",
	      "Scheme"
	    ]; */
	    
	    $( "#serch" ).autocomplete({
	      source: availableTags
	    });
  });
  var availableTags = [];
  var flightPlanCoordinates = []; //경로 만들 때 위도 경도
  var city_array = new Array();
  var curPlace;
  var mIdx;
  var div =0;
  var a = 1;
  var dayClick=1;
  var map;
  var places;
  var markerGroup;
  // 지도 생성
  bm.ready(function () {
      var maxZoom = 18;
      var minZoom = 4;
      var defZoom = 14;
      // sample geolocation
      var curLat = 37.57315;
      var curLng = 126.9944;
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
	  								'<div class="image imgteaser" id="img'+mIdx+'"><img src="src/main/webapp/img/no_image.png"; style="max-width: 280px;">'
	  										+ '<div class="text">' + '<span class="desc"><span style="font-size: 15px;  top:0px; left:0px;">'
	  										+ city_array[mIdx].CountryName_ko+'</span><strong>'
	  										+ city_array[mIdx].CityName_ko
	  										+ '</strong></span></div></div><br>');
	  			} else {
	  				$('#list')
	  						.append(
	  								'<div class="image imgteaser" id="img'+mIdx+'"><img src="src/main/webapp/img/no_image.png"; style="max-width: 280px;">'
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
    		marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div style=" width: 100px;"><div style="background-color: white; width: auto;">'+city_array[mIdx].Title+'</div></div>'})}).bindPopup(city_array[mIdx].Title).addTo(markerGroup);				
   		  } else if(city_array[mIdx].Furl == null&&city_array[mIdx].Mode!="City") {
   			marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div style=" width: 100px;"><img src="src/main/webapp/img/icon_category_'+city_array[mIdx].CategoryIdx+'.png" style="width: 80px; height: 80px;"><br>'+'<div style="background-color: white; width: auto;">'+city_array[mIdx].Title+'</div></div>'})}).bindPopup(city_array[mIdx].Title).addTo(markerGroup);				
   		  } 
   		  else if (city_array[mIdx].Furl == null&&city_array[mIdx].Mode=="City"){
        	  marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div style="width: 100px;"><div style="background-color: white; width: auto;">'+city_array[mIdx].CityName_ko+'</div></div>'})}).bindPopup(city_array[mIdx].CityName_ko).addTo(markerGroup);
          }

          else if (city_array[mIdx].Mode=="City"){
        	  marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div style="width: 100px;"><img src="'+city_array[mIdx].Furl+' " style="width: 80px; height: 80px;"><br>'+'<div style="background-color: white; width: auto;">'+city_array[mIdx].CityName_ko+'</div></div>'})}).bindPopup(city_array[mIdx].CityName_ko).addTo(markerGroup);
          }
   		  else{
   			marker = bm.marker([city_array[mIdx].Lat, city_array[mIdx].Lng],{icon: bm.divIcon({html: '<div style="width: 100px;"><img src="'+city_array[mIdx].Furl+' " style="width: 80px; height: 80px;"><br>'+'<div style="background-color: white; width: auto;">'+city_array[mIdx].Title+'</div></div>'})}).bindPopup(city_array[mIdx].Title).addTo(markerGroup);
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
	
	console.log(loc);
	 $('#info').show();
	$('#info').empty();
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
	});
	$("#addPlan"+a).click(function() {
		console.log(a)
		  flightPlanCoordinates.push({lat: city_array[mIdx].Lat, lng: city_array[mIdx].Lng}); //경로 그리기
		  var flightPath = bm.polyline(flightPlanCoordinates,{
		      color: '#FF0000',
		      opacity: 1.0,
		      weight: 2
		    });
		  flightPath.addTo(map);
		  
		$('#smallIdx').val(city_array[mIdx].Idx);
		$('#smallLat').val(city_array[mIdx].Lat);
		$('#smallLng').val(city_array[mIdx].Lng);
		if(city_array[mIdx].Furl == null && city_array[mIdx].CategoryIdx >9) {
			$('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'"><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right">'+ '<div id="'+city_array[mIdx].Idx+'">'+ city_array[mIdx].Title+'</div></div>');
 		  }else if(city_array[mIdx].Furl == null) {
 			$('#smallImg'+(div+1))
 			.append(
 					'<img src="src/main/webapp/img/icon_category_'+city_array[mIdx].CategoryIdx+'.png" style="max-width: 45px; max-height: 45px; margin-right:3px;">');		
 			$('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
 					'<img style="width: 45px; height: 45px;" src="src/main/webapp/img/icon_category_'+city_array[mIdx].CategoryIdx+'.png"><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right"><div>'+ city_array[mIdx].Title+'</div></div>');
 			} 
 		  else{
 			$('#smallImg'+(div+1))
 			.append(
 					'<img src=' + city_array[mIdx].Furl + ' style="max-width: 45px; max-height: 45px; margin-right:3px;">');
 			$('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
 					'<img style="width: 45px; height: 45px;" src="'+ city_array[mIdx].Furl +'"><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right"><div>'+ city_array[mIdx].Title+'</div></div>');
 		  }
		$('#detailPlan'+(div+1))
		.append(' <input type=button value="길찾기" onclick="openWin('+mIdx+');">');
		$("#"+city_array[mIdx].Idx).click(function() {
			showInfoImg(mIdx);
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
	});
	$("#addPlan"+a).click(function() {
		console.log(a)
		flightPlanCoordinates.push({lat: city_array[mIdx].Lat, lng: city_array[mIdx].Lng}); //경로 그리기
		  var flightPath = bm.polyline(flightPlanCoordinates,{
		      color: '#FF0000',
		      opacity: 1.0,
		      weight: 2
		    });
		  flightPath.addTo(map);
		  
		$('#smallIdx').val(city_array[mIdx].Idx);
		$('#smallLat').val(city_array[mIdx].Lat);
		$('#smallLng').val(city_array[mIdx].Lng);
		  if(city_array[mIdx].Furl == null && city_array[mIdx].CategoryIdx >9) {
			  $('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'"><img class="delete" src="${pageContext.request.contextPath }/images/icon_delete_n.png" style="float:right">'+
	 					'<div>'+ city_array[mIdx].Title+'</div></div>');
   		  } else if(city_array[mIdx].Furl == null) {
   			$('#smallImg'+(div+1))
   			.append(
   					'<img src="./img/icon_category_'+city_array[mIdx].CategoryIdx+'.png" style="max-width: 45px; max-height: 45px; margin-right:3px;">');		
   			$('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
   					'<img style="width: 45px; height: 45px;" src="src/main/webapp/img/icon_category_'+city_array[mIdx].CategoryIdx+'.png"><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right"><div>'+ city_array[mIdx].Title+'</div></div>');
   			} 
   		  else{
   			$('#smallImg'+(div+1))
   			.append(
   					'<img src=' + city_array[mIdx].Furl + ' style="max-width: 45px; max-height: 45px; margin-right:3px;">');
   			$('#detailPlan'+(div+1)).append('<div class="shadow" id="'+city_array[mIdx].Idx+'">'+
   					'<img style="width: 45px; height: 45px;" src="'+ city_array[mIdx].Furl +'"><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right"><div>'+ city_array[mIdx].Title+'</div></div>');
   		  }
		$('#detailPlan'+(div+1))
		.append(' <input type=button value="길찾기" onclick="openWin('+mIdx+');">');
		$("#"+city_array[mIdx].Idx).click(function() {
			showInfoImg(mIdx);
		});
	});
}

function openWin(mIdx) { //길찾기
	window
			.open(
					"https://www.google.co.kr/maps/dir/"
							+city_array[mIdx].Lat+","+city_array[mIdx].Lng +"/37.5365,126.9771/am=t",
					"길찾기",
					"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}
function addDay(){ //일정 늘리기
	$("#plan").append('<div id="allPlan'+(++a)+'" class="allPlan" style="border:solid #22becc 2px; background-color:white;">'+
	'<b>DAY'+(a)+'</b><img class="delete" src="src/main/webapp/img/icon_delete_n.png" style="float:right"><br>'+
	'<div id="cal'+(a)+
	'"></div>'+
	'<div id="smallImg'+(a)+'">'+
	'</div></div>');
	console.log(a);
	console.log(div)
	
	$("#detail").append('<div id="detailPlan'+a+'" style="position: fixed; overflow: scroll; width: 195px; height: 90%; top: 78px; left: 170px; background-color: #f1f2f6;"><h2><b>DAY'+a+'</b></h2></div>');
		
	$( function() {
	    $(".allPlan").click(function() {
	    	 div = $(".allPlan").index(this);
	    	 cut=div+1;
	    	 if(cut<a){
	    		 for(i=cut;i<=a;i++){
		    		 $("#detailPlan"+i).hide();
		    	 }
	    	 }		    
	    	 $("#detailPlan"+(div+1)).show();
	    });
	});
}


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
  
  </script>
</head>
<body>
<div id='BeeMap' style='width: 100%; height: 100%; border: 0;'></div>

<div id="tabs" style="position: fixed; width: 300px; top: 75px; right: 0px;">
  <ul>
    <li><a href="#list">장소</a></li>
    <li><a href="#info">상세보기</a></li>
  </ul>
		<div id='list'
			style='padding-left:10px; position: fixed; overflow: scroll; width: 300px; height: 600px; height: 86%; top: 120px; right: 0px; background-color: white;'>
			
		</div>
		<div id='info' style='padding-left:10px; position: fixed; overflow:scroll; width: 300px; height:600px; height: 86%; top: 120px; right: 0px; background-color: white;'>
	</div>
</div>
<div style="position: fixed; width: 170px; overflow:scroll; height: 90%; top: 78px; left: 0px; background-color:#616265;">
<div id="plan">
		<button class="button2 button1" onclick="addDay();">+일정 추가</button><br>
		<input type="button" class="button2 button1" id="datepicker" value="출발일 수정">
		<!-- 전체 일정  -->
		<div id="allPlan" class="allPlan" style="border:solid #22becc 2px; background-color: white;">
			<b>DAY1</b><img class="delete" src="${pageContext.request.contextPath}/img/icon_delete_n.png" style="float:right"><br>
			<div id="cal">
			</div>
			<div id="smallImg1">
			</div>
		</div>
	</div>
	<button class="button2 button1"><a href="../main/mainUpd.do">전체 삭제</a></button>
	<form action="../blog/myBlogShow.do">
		<input type="text" name="spotNo" id="spotNo" placeholder="장소번호">
		<input type="text" name="cityNo" id="cityNo" placeholder="도시번호">
		<input type="text" name="smallIdx" id="smallIdx" placeholder="idx">
		<input type="text" name="smallLat" id="smallLat" placeholder="위도">
		<input type="text" name="smallLng" id="smallLng" placeholder="경도">
		<input type="text" name="dayVisit" id="dayVisit" placeholder="방문순서">
		<!-- <input type="text" name="planNo" id="planNo"> -->
		<input type="text" name="dayNo" id="dayNo" placeholder="날짜번호">
		<button class="button2 button1">일정 저장</button>
	</form>
</div>
	<!-- 일정 상세보기  -->
<div id = "detail">
	<div id="detailPlan1"
		style="position: fixed; overflow: scroll; width: 195px; height: 90%; top: 78px; left: 170px; background-color: #f1f2f6;'">
		<h2><b>DAY1</b></h2>
	</div>
</div>
	
</body>
</html>