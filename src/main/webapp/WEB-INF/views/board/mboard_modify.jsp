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
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>I CAMP DO IT</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/font.css" type="text/css">
    <!-- Price Slider Stylesheets -->
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

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
	<!-- Font Awesome Icons -->
	<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
	<!-- Material Icons -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
	<!-- CSS Files -->
	<link rel="stylesheet" href="./resources/bootstrap-5/html/summernote/summernote-lite.css" />
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
	                  <a class="dropdown-item" href="./mboardlist.do">게시판</a><a class="dropdown-item" href="./hboardview.do">혼캠 자료실</a>
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
    
	<section class="pt-5">
	    <div class="container px-lg-6">      	
	      <!-- Breadcrumbs -->
	      <h1 class="hero-heading mb-0" style="font-family: 'Recipekorea';">글 수정</h1>
	      <p></p>
	    </div>
    </section>

	<!-- Write Section-->
	<section class=" pb-7">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-12">
            <div class="p-3 position-relative mt-4 pb-2 z-index-2">
              <div class="bg-primary border-radius-lg pt-4 pb-3 px-3" style="border-radius: 10px;">
				 <!-- 게시판종류 드롭박스 -->
				 <div class="me-2">
					<select class="selectpicker bg-gray-100" name="sort"
						id="form_sort" data-style="btn-selectpicker" title="말머리">
						<option value="sortBy_0" id="subject1" href="#">자유</option>
						<option value="sortBy_1" id="subject2" disabled href="#">후기</option>
						<option value="sortBy_2" id="subject3" disabled href="#">중고</option>
					</select>
				 </div>
              </div>
            </div>
          <div class="card-header p-4 border-0 px-print-0" style="background-color: white">
            <div class="mb-4">
              <div class="row">
                <div class="col-lg-12">
                  <a class="form-text small text-primary" href="#"></a> 
                  <input class="form-control" name="title" id="title" type="title" placeholder="제목을 입력해주세요." />
                </div>
              </div>
            </div>
              <div id="summernote"></div>
            </div>
          </div>
        </div>
     <!-- Write Section-->


		<!-- 목록 시작 -->
		<div class="row">
		  <div class="col-lg-8">
	        <input type="button" value="목록" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='mboardlist.do?cpage='" />
	      </div>
	      <div class="col-lg-4 text-lg-end">
	        <input type="button" value="수정" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='mboardmodifyOk.do?cpage=&seq='" /> 
	        <input type="button" value="취소" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='mboardlist.do?cpage='" />
	      </div>
		</div>
		<!-- 목록 끝 -->
	
        </div>
	  </div>
	</section>

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
	$(function(){
		  
		  var subject1 = $( '#subject1' );
		  var subject2 = $( '#subject2' );
		  var subject3 = $( '#subject3' );
		  // if (TO의 subject 값 = id 값) 
		  //subject1.option = disabled; //..? 맞나
	 	  //아니면 $("select option[id='subject1']").prop('disabled', true); 이 방식도 있음
		});
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
	<script> var basePath = '' </script>
	<!-- Main Theme JS file    -->
	<script src="./resources/bootstrap-5/html/js/theme.js"></script>
	<!-- Map-->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
	<!-- Available tile layers-->
	<script src="./resources/bootstrap-5/html/js/map-layers.js"></script>
	<script src="./resources/bootstrap-5/html/js/map-detail.js"></script>


	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- summernote -->
	<script src="./resources/bootstrap-5/html/summernote/summernote-lite.js"></script>
	<script src="./resources/bootstrap-5/html/summernote/lang/summernote-ko-KR.js"></script>

	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}

		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder : 'Hello bootstrap 5',
				minHeight : null,
				maxHeight : null,
				tabsize : 2,
				height : 550,
				width : 1250,
				lang : 'ko-KR'

			});
		});
	</script>
  </body>
</html>