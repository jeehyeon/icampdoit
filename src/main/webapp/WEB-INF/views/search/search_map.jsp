<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//session 값 가져오기
int ucode = -1;
String id ="";
if(session.getAttribute("id") != null){
	ucode = (int)session.getAttribute("ucode");
	id = (String)session.getAttribute("id");
}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>I Camp Do It</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/font.css" type="text/css">
    <!-- Price Slider Stylesheets -->
    <!--<link rel="stylesheet" href="vendor/nouislider/nouislider.css"> -->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/style.green.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="./resources/bootstrap-5/html/img/logo2.svg">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dde53cc9d654a3a8d8b78783aa5cbfc&libraries=services"></script>
  
  	<style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 100px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 10px;height: 75px;}
	    .info .link {color: #5085BB;}
	</style>
  </head>
  <body style="padding-top: 72px;">
    <header class="header">
    
      <!-- Navbar 로고부분-->
      <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
          	<a class="navbar-brand py-1" href="./home.do"><img src="./resources/bootstrap-5/html/img/logo.svg" alt="Directory logo"></a>          
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          
          <div class="collapse navbar-collapse justify-content-center" id="navbarCollapse">      
	          <ul class="navbar-nav">
	          
	              <!-- About 페이지 링크 -->
	              <li class="nav-item">
	              	<a class="nav-link" href="./about.do">About</a>
	              </li>
	              
	              <!-- Customer Care 페이지 -->
				  <li class="nav-item dropdown">
				  	<a class="nav-link dropdown-toggle" id="noticeDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Customer Care</a>
	                <div class="dropdown-menu" aria-labelledby="noticeDropdownMenuLink"><a class="dropdown-item" href="./notice.do">공지사항</a><a class="dropdown-item" href="/faq.do">FAQ</a></div>
	              </li>
	              
	              <!-- Search 페이지 -->
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="searchDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Search</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="searchDropdownMenuLink">
	                  <a class="dropdown-item" href="./searchkey.do">일반검색</a><a class="dropdown-item" href="./searchmap.do">지도검색</a>
	                </div>
	              </li>
	              
	              <!-- Communication 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="communicationDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Communication</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="communicationDropdownMenuLink">
	                  <a class="dropdown-item" href="./mboardlist.do">게시판</a><a class="dropdown-item" href="./hboardlist.do">혼캠 자료실</a>
	                </div>
	              </li>
	              
	              <!-- MyPage 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="mypageDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   MyPage</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="mypageDropdownMenuLink">
	                  <a class="dropdown-item" href="./mypage.do">내 정보</a><a class="dropdown-item" href="./mypagesub.do">찜한 목록</a><a class="dropdown-item" href="./mypagemylist.do">내가 쓴 글</a>
	                </div>
	              </li>
	            </ul>
         	</div>
         	
			<form class="d-flex">
         		<%if(ucode == -1){ %>
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./login.do'">Login</button>
             	<%}else{ %>
             	<span class="mx-2"><strong><%=id%></strong>님 </span>
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./logout.do'">Logout</button>
             	<%}; %>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6 py-4 p-xl-5">
          <p class="subtitle text-sm text-primary">Search    </p>
          <h1 class="mb-4" style="font-family: 'Recipekorea';">지도 검색</h1>
          <hr class="my-4">
          <form action="#" autocomplete="off">
            <div class="row">
              <div class="col-xl-4 col-md-6 mb-4">
                <label class="form-label" for="form_guests">전체/시,도</label>
                <select class="selectpicker form-control" name="guests" id="sido" data-style="btn-selectpicker" title=" ">
                  <option value="seoul">서울시    </option>
                  <option value="incheon">인천시    </option>
                  <option value="gyeonggi">경기도    </option>
                </select>
              </div>
              <div class="col-xl-4 col-md-6 mb-4">
                <label class="form-label" for="form_type">전체/시,구</label>
                <select class="selectpicker form-control" name="type" id="gugun" multiple data-style="btn-selectpicker" data-none-selected-text="">
                  <option value="type_0">Entire place    </option>
                  <option value="type_1">Private room    </option>
                  <option value="type_2">Shared room    </option>
                </select>
              </div>
              <div class="col-sm-6 mb-4">
                <button class="btn btn-primary" type="submit"> <i class="fas fa-search me-1"></i>Search                </button>
              </div>
            </div>  
          </form>
          <hr class="my-4">
          <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
            <div class="me-3">
              <p class="mb-3 mb-md-0">총  <strong>12</strong> 건</p>
            </div>
          </div>
          <div class="row">
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- place item-->
            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 map-side-lg pe-lg-0">
          <div class="map-full shadow-left" id="map"></div>
          
          
        </div>
      </div>
    </div>
    <!-- Footer - 관리자 페이지 이동 부분 넣을 곳 -->
    <footer class="position-relative z-index-10 d-print-none">
           
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2022, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
             <!-- 관리자페이지 바로가기 -->
             	
              	<ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><a class="text-muted text-sm" href="./admin.do" >
              	관리자 페이지</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script>
				var mapContainer = document.getElementById('map'), //지도 표시할 div id
					mapOptions = {
						center: new kakao.maps.LatLng(37.5817426, 127.4838359), //center = 지도 중심 좌표
						level: 3 //지도 확대 레벨. 기본값=3
					};
		
				var map = new kakao.maps.Map(mapContainer, mapOptions); //지도를 표시할 div와 지도 옵션으로 지도를 생성함

				
				// 마커가 표시될 위치입니다 
				//var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
				
				// 마커를 생성합니다
				//var marker = new kakao.maps.Marker({
				//    position: markerPosition
				//});

				// 마커가 지도 위에 표시되도록 설정합니다
				//marker.setMap(map);
				
				//마커 여러개 생성
				/*
				var positions = [
					{
						title: '가평사계절캠핑장',
						latlng: new kakao.maps.LatLng(37.8833509, 127.5489707)
					},
					{
						title: '가평 사과나무 캠핑장',
						latlng: new kakao.maps.LatLng(37.7895015, 127.358428)
					},
					{
						title: '가평 운악홀리데이 캠핑장',
						latlng: new kakao.maps.LatLng(37.8536510, 127.5102426)
					},
					{
						title: '구름게곡캠핑장',
						latlng: new kakao.maps.LatLng(37.8879007, 127.5387410)
					},
					{
						title: '국립유명산자연휴양림',
						latlng: new kakao.maps.LatLng(37.5817426, 127.4838359)
					}
				];
				*/
				
				var arr = new Array();
				arr[0] = ["가평사계절캠핑장", 37.8833509, 127.5489707, "주소주소", "./campview.do?facltNm=001" ];
				arr[1] = ["가평 사과나무 캠핑장", 37.7895015, 127.358428, "주소주소", "./campview.do?facltNm=001" ];
				arr[2] = ["가평 운악홀리데이 캠핑장", 37.8536510, 127.5102426, "주소주소", "./campview.do?facltNm=001" ];
				arr[3] = ["구름게곡캠핑장", 37.8879007, 127.5387410, "주소주소", "./campview.do?facltNm=001" ];
				arr[4] = ["국립유명산자연휴양림", 37.5817426, 127.4838359, "주소주소", "./campview.do?facltNm=001" ];
				
				
				//var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				/*
				for ( var i=0; i<positions.length; i++ ){
					
					//var imageSize = new kakao.maps.Size(24, 35); 
					//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					
					var marker = new kakao.maps.Marker({
						map: map, //마커를 표시할 지도
						position: positions[i].latlng, //마커표시할 위치
						title : positions[i].title, //마커에 마우스 올리면 표시되는 타이틀.. 표시하기
						//image : markerImage
					});
				}
				*/
				
				for (var i=0; i<arr.length; i++ ){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng( arr[i][1], arr[i][2] ),
						title: arr[i][0],
						map: map
					});
					
					//커스텀오버레이에 표시할 컨텐츠
					//사용자가 자유롭게 구성하고 이번트 제어할 수 있음.
					var content = '<div class="wrap">' +
					  '	<div class="info">' +
					  '		<div class="title">' +
					  		arr[i][0] +
					  '			<div class="close" onclick="closeOverlay()" title="닫기"></div>'	+
					  '		</div>' +
					  '		<div class="body">' +
					  '			<div class="desc">' +
					  '        		<div class="ellipsis">' + arr[i][3] + '</div>' + 
			          '        		<div><a href="./campview.do" target="_blank" class="link">상세보기</a></div>' + 
			          '      	</div>' + 
			          '     </div>' + 
			          ' </div>' +    
			          '</div>';

			        
					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var overlay = new kakao.maps.CustomOverlay({
						content: content,
						map: map,
						position: new kakao.maps.LatLng( arr[i][1], arr[i][2] )
					});
					
					//customOverlay.setMap(null); // 지도에서 제거한다.         
				}
					     
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    overlay.setMap(map);
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
				    overlay.setMap(null);     
				}
					          
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);
				
				
			</script>
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="./resources/bootstrap-5/html/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="./resources/bootstrap-5/html/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="./resources/bootstrap-5/html/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="./resources/bootstrap-5/html/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="./resources/bootstrap-5/html/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="./resources/bootstrap-5/html/js/theme.js"></script>
  </body>
</html>