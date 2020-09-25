<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RestFuLL | 글작성페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <!-- 제이쿼리  -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
     <!-- 부트 스트랩  -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fawtmt0h7b&submodules=geocoder"></script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-right">
                <button type="button" class="login-panel">
                 <a href="./LoginPage.html">로그인</a>  
                 </button>
                </div>
            </div>
         </div>
         
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="./index.html">
                                <img src="img/LOGOsmall.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 search-top">
                        <div class="advanced-search">
                            <div class="input-group">
                                <input type="text" placeholder="어느 지역으로 여행을 가시나요?">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./index.html">Home</a></li>
                        <li><a href="#">글작성</a></li>
                        <li><a href="#">여행코스작성</a></li>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">자주하는질문</a></li>
                        
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Write Section Begin -->
    <section class="write-section spad">
        <div class="container">
            <div class="row">
                <!--ajax로 받아야하는 부분-마이페이지 start-->
                <div class="col-lg-7 order-1 order-lg-1">
                    <div class="row">
                       
                            <div class="col-lg-12 col-sm-12">
                                <div class="write-pic">
                                    <div class="bi-pic">
                                        <img src="img/blog/blog-2.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="write-loc">
                                 <div class="bi-text">
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
				          
				          var info = document.getElementById("locationInfo");
				          
				          $(info).append('<input type="hidden" name="address" value="'+mainAddr+'"/>')
				          $(info).append('<input type="hidden" name="details" value="'+details+'"/>')
				          $(info).append('<input type="hidden" name="lat" value="'+x+'"/>')
				          $(info).append('<input type="hidden" name="lng" value="'+y+'"/>')
				          $(info).append('입력된 위치 정보 : <input type="text" name="location" value="'+mainAddr.concat(" ", details)+'" readonly/>')
			          });
			          </script>
		        </div>
		      </div>
		    </div>
	
			<div id="locationInfo">
			</div>
		  </div>
			
			
	<br>
	</form>
                                 </div>
                             </div>
                        
                    </div>
                </div>
                <div class="col-lg-5 col-md-8 col-sm-9 order-2 order-lg-2">
                    <div class="write-right">
                        <div class="write-title">
                            <h4>제목</h4>
                            <input type="text" id="title">
                        </div>
                        
                        <div class="write-content">
                            <input type="textarea" id="content" placeholder="내용을 입력하세요." maxlength="500">
                         </div>

                        <div class="write-btn">
                            <button type="button" class="finish-btn">
                                 <a href="#">완료</a>  
                             </button>
                        </div>
                                
                    </div>
                </div>

            </div>
        </div>
    </section>
   <!--ajax로 받아야하는 부분-마이페이지 start-->



    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="img/LOGOsmall.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello.colorlib@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">운영정책</a></li>
                            <li><a href="#">여행지등록</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">청소년보호방침</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>새로운 소식 받기</h5>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Enter Your Mail">
                            <button type="button">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> 2020 RestFuLL. All rights reserved.
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>