<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>RestFull indexPage</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- 제이쿼리  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        
        <!-- 부트 스트랩  -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fawtmt0h7b&submodules=geocoder"></script>
		<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
		 --%>
		 <style>
			.contents-left{
				width:45%;
				height:600px;
				float:left;
				
			}
			
			.image-editor{
				height:85%;
				border:1px;
			}
		</style>
</head>
<body>

<form action="<%=request.getContextPath() %>/write" method="post">
	<input type="hidden" name="boardlist_numbers" value="<c:out value='1'/>">
	<div class="container" style="width:100%; height:700px">  
		<!-- 왼쪽 컨텐츠 -->  

			<br/><br/>
		
		    <!-- Button to Open the Modal -->
		    <!-- Data-toggle="modal" : 모달 기능을 수행하겠다는 의미, data-target 속성 : 해당 태그를 클릭했을 때 (지금은 버튼 클릭했을 때) 모달로 띄울 target -->
		    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mapModal"> 위치 추가하기 </button>
		    <hr/>
		  
		    <!-- The Modal for location fix -->
		    <div class="modal" id="mapModal">
		      <div class="modal-dialog modal-lg modal-dialog-scrollable">
		        <div class="modal-content">
		        
		          <!-- Modal Header -->
					<div class="modal-header">
						<p class="modal-title">위치 추가하기</p>
		            	<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
		          
		          <!-- Modal body -->
					<div class="modal-body">
		                <div class="search" style="">
		                    <input id="address" type="text" >
		                    <input id="submit" type="button" value="주소 검색">
		                </div>
		                <div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden;">
		                <script>
		                    var map = new naver.maps.Map("map", {
		                    center: new naver.maps.LatLng(37.3595316, 127.1052133),
		                    zoom: 15,
		                    mapTypeControl: true
		                    });
		
		                    var infoWindow = new naver.maps.InfoWindow({
		                    anchorSkew: true
		                    });
		
		                    map.setCursor('pointer');
		                   
		                    function searchCoordinateToAddress(latlng) {
		
		                    infoWindow.close();
		
		                    naver.maps.Service.reverseGeocode({
		                        coords: latlng,
		                        orders: [
		                        naver.maps.Service.OrderType.ADDR,
		                        naver.maps.Service.OrderType.ROAD_ADDR
		                        ].join(',')
		                    }, function(status, response) {
		                        if (status === naver.maps.Service.Status.ERROR) {
		                        if (!latlng) {
		                            return alert('ReverseGeocode Error, Please check latlng');
		                        }
		                        if (latlng.toString) {
		                            return alert('ReverseGeocode Error, latlng:' + latlng.toString());
		                        }
		                        if (latlng.x && latlng.y) {
		                            return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
		                        }
		                        return alert('ReverseGeocode Error, Please check latlng');
		                        }
		
		                        var address = response.v2.address,
		                            htmlAddresses = [];
		
		
		                        if (address.jibunAddress !== '') {
		                            htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
		                        }
		
		                        if (address.roadAddress !== '') {
		                            htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
		                        }
		
		                        infoWindow.setContent([
		                        '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                        '<h4 style="margin-top:5px;">검색 좌표</h4>',
		                        '<button type="button" onclick="setAddressIntoBox(' + '\'' + address.jibunAddress + '\'' + ')">입력</button><br />',
		                        htmlAddresses.join('<br />'),
		        	          	'<input id="x" type="hidden" value="'+ latlng.x + '"> ',
		        	          	'<input id="y" type="hidden" value="'+ latlng.y + '"> ',
		                        '</div>'
		                        ].join('\n'));
		                        
		                        console.log(" 좌표 검색  latlngs " + latlng.x + ", " + latlng.y);
		                        
		                        infoWindow.open(map, latlng);
		                    });
		                    }
		
		                    function searchAddressToCoordinate(address) {
		                    naver.maps.Service.geocode({
		                        query: address
		                    }, function(status, response) {
		                        if (status === naver.maps.Service.Status.ERROR) {
		                        if (!address) {
		                            return alert('Geocode Error, Please check address');
		                        }
		                        return alert('Geocode Error, address:' + address);
		                        }
		
		                        if (response.v2.meta.totalCount === 0) {
		                        return alert('No result.');
		                        }
		
		                        var htmlAddresses = [],
		                        item = response.v2.addresses[0],
		                        point = new naver.maps.Point(item.x, item.y);
		
		                        if (item.roadAddress) {
		                        htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		                        }
		
		                        if (item.jibunAddress) {
		                        htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		                        }
		
		                        if (item.englishAddress) {
		                        htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		                        }
								
		                        infoWindow.setContent([
		                        '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                        '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4>',
		                        '<button type="button" onclick="setAddressIntoBox(' + '\''
		                        		+ item.jibunAddress + '\'' + ')">입력</button><br />',
		                        htmlAddresses.join('<br />'),
		        	          	'<input id="x" type="hidden" value="'+ item.x + '"> ',
		        	          	'<input id="y" type="hidden" value="'+ item.y + '"> ',
		                        '</div>'
		                        ].join('\n'));
									                        
		                        map.setCenter(point);
		                        infoWindow.open(map, point);
		                    });
		                    }
		
		
							function setAddressIntoBox(item) {
		                    	console.log("setAddressIntoBox called()  " + item);
		                    	document.getElementById("mainAddr").value = item;
		                    };
		
		                    function initGeocoder() {
		                    if (!map.isStyleMapReady) {
		                        return;
		                    }
		
		                    map.addListener('click', function(e) {
		                        searchCoordinateToAddress(e.coord);
		                    });
		
		                    $('#address').on('keydown', function(e) {
		                        var keyCode = e.which;
		
		                        if (keyCode === 13) { // Enter Key
		                        searchAddressToCoordinate($('#address').val());
		                        }
		                    });
		
		                    $('#submit').on('click', function(e) {
		                        e.preventDefault();
		
		                        searchAddressToCoordinate($('#address').val());
		                    });
		
		                    
		                    }
		
		                    naver.maps.onJSContentLoaded = initGeocoder;
		                    naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
		                    </script>
		          		</div>
		          		<!-- 입력할 주소 출력 -->
						<div>
							mainAddr : <input id="mainAddr" type="text" style="width:50%" >
			          		detail Addr : <input id="details" type="text" style="width:50%">
			          	</div>
					</div>
					
		          <!-- Modal footer -->
					<div class="modal-footer">
			            <button id="complete" type="button" class="btn btn-success" data-dismiss="modal">확인</button>
			            <!-- data-dismiss 속성 : 모달 닫기 기능 적용 -->
		          	</div>
		          
			          <script>
			          $("#complete").on("click", function(e) {
			        	  e.preventDefault();
				          var mainAddr = $("#mainAddr").val(); 
				          var details = $("#details").val(); 
						  var x= $("#x").val();
						  var y= $("#y").val();
						  
				          //주소 정보 모아서 배열 객체로 저장...
			 	          var addr = {
				        	  "mainAddr":mainAddr,
				        	  "detailAddr" : details,
				        	  "x" : x,
				        	  "y" : y		        	  
				          };
				          
				          console.log("test1 - mainAddr " + mainAddr + " x : "+x+" y : "+y);
				          console.log("주소 정보 객체화 되었는지 test2 - addr.mainAddr는 " + addr.mainAddr);
				          
				          document.getElementById("savedAddress").value = mainAddr.concat(" ", details);
				          var info = document.getElementById("locationInfo");
				          
				          $(info).append('<input type="hidden" name="address" value="'+mainAddr+'"/>')
				          $(info).append('<input type="hidden" name="details" value="'+details+'"/>')
				          $(info).append('<input type="hidden" name="lat" value="'+x+'"/>')
				          $(info).append('<input type="hidden" name="lng" value="'+y+'"/>')
			          });
			          </script>
		        </div>
		      </div>
		    </div>
	
			<div id="locationInfo">
				
				입력된 위치 정보 : <br/><input type="text" id="savedAddress" name="location" style="width:90%">
			</div>
		  </div>
			
			
	<br>
	
	
	<input type="text" name="title">
	<textarea cols="30" rows="30" name="contents">
	
	</textarea>
	<input type="submit" id="submit" value="완료" style="position:absolute;"/>
</form>
</body>
</html>