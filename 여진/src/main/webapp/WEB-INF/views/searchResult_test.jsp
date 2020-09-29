<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>    
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fawtmt0h7b"></script>
	 -->
</head>
<body>
<div class="search-again">
	<form action="${pageContext.request.contextPath}/search">
		<input type="hidden" name="boardlist_numbers" value="<c:out value='1'/>">
	
		<input type="text" name="searchWord" placeholder="지역 입력" id="search" value="${searchWord}">
		<button type="submit">search</button>
	</form>
</div>

<a href="${pageContext.request.contextPath}/write_view">글쓰러가기</a>
<hr/>
<div class="contents">
	<!-- 게시물 list -->
	<div style="width:50%; height:500px; float:left">
	<!-- 추후 테이블이 아닌 다른 양식으로 바꿔야함 -->
		<table border="1">
				<tr>
					<td>주소</td>
					<td>x좌표</td>
					<td>y좌표</td>
				</tr>
				<c:forEach items="${boardlist}" var="vo">
				<tr>
					<td class="location">${vo.address}</td>
					<td class="lat">${vo.lat}</td>
					<td class="lng">${vo.lng}</td>
				</tr>
				</c:forEach>
		</table>
	</div>
	
	<!-- 지도 -->
	<div id="map" style="width:50%; height:500px; float:right"></div>
	
	<!-- 
	<script>
	
	//1. 지도 세팅.임시로 지도의 센터를 첫 게시물의 좌표에 맞춰둠(검색했을 때 지도 중심을 어디로 놓아야 될지, 어떻게 해야될지 의논...)
	//1-1. 지도 세팅을 위한 center 좌표 가져오기
	var centerX = document.getElementsByClassName('lat')[0].innerText,
		centerY = document.getElementsByClassName('lng')[0].innerText;
	//1-2. 지도 생성. center에 지도 중앙 좌표 입력
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(centerX, centerY),
	    zoom: 15
	}); 
	
	//2. 마커 찍기.
	//2-1. 마커를 찍을 좌표 리스트를 뽑기 위한 레코드 수 계산(x,y 좌표 분리)
	var records = document.getElementsByClassName('lat').length;
	
	console.log("test 출력 : " + document.getElementsByClassName('lat')[0].innerText);
	
	//2-2. 다수의 마커를 배열로 생성
	var latlngs = [];
	
	for(var i=0; i < records; i++){
	  	var lat = document.getElementsByClassName('lat')[i].innerText,
			lng = document.getElementsByClassName('lng')[i].innerText;
		
		console.log(i + "번째 좌표 : " + lat + "," + lng);
		
		latlngs.push(new naver.maps.LatLng(lat, lng)); 
	}
	
	console.log("test 출력 - 좌표들 : "+latlngs);
	
	//2-3. 좌표 배열(latlngs배열)을 마커의 position으로 지정하여 배열 수만큼 마커를 생성함
	for (var i=0, ii=latlngs.length; i<ii; i++) {
	    var marker = new naver.maps.Marker({
	            position: latlngs[i],
	            map: map
	        });
	}
	</script> -->
</div>
</body>
</html>