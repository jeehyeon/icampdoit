<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
             	<button class="btn btn-outline-primary btn-sm" type="button"><a href="./login.do">Sign in</a></button>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
        
    <section class="py-5 p-print-0 mb-5">
      <div class="container">
      	<!--
        <div class="row mb-4 d-print-none">
          <div class="col-lg-6">
            <ol class="breadcrumb ps-0  justify-content-start">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item"><a href="user-account.html">Account</a></li>
              <li class="breadcrumb-item active">Invoice 202009001   </li>
            </ol>
          </div>
          <div class="col-lg-6 text-lg-end">
            <button class="btn btn-primary me-2"><i class="far fa-file-pdf me-2"></i> Download PDF</button>
            <button class="btn" onclick="window.print()"><i class="fas fa-print me-2"></i> Print</button>
          </div>
        </div>
        -->
        <div>
          <div class="mb-5 mt-6 border-0" style="background-color: white" align="center">
            <h1 style="font-family: 'Recipekorea';">NOTICE</h1>
          </div>
          <!-- 
          <div class="card-header bg-gray-100 p-5 border-0 px-print-0">
            <div class="row">
              <div class="col-6 d-flex align-items-center"><img src="./resources/bootstrap-5/html/img/logo2.svg" alt="Directory"></div>
              <div class="col-6 text-end">
                <h3 class="mb-0">Invoice 202009001</h3>
                <p class="mb-0">Issued on Sep 01, 2020</p>
              </div>
            </div>
          </div>
          -->
          <div class="card-body p-5 p-print-0">
            <div class="row">
              <div class="col-sm-6 mt-3 pe-lg-3">
                <h2 class="h6 text-uppercase mb-4">전체: 7 건</h2>
              </div>
            </div>
            
            <!-- 목록 -->
            <div class="table-responsive text-sm mb-3">
              <table class="table">
              	<thead class="bg-gray-100">
                  <tr class="border-0">
                    <th class="text-center">No</th>
                    <th class="text-center">제목</th>
                    <th></th>
                    <th class="text-end">작성자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-end">작성날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-end">조회수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">1</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">2</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">3</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">4</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">5</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">6</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr>
                    <td class="text-center">7</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          
          <!-- 페이징 -->
          <div class="card-footer bg-white p-5 px-print-0 border-0 text-end text-sm">
            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
                <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
              </ul>
            </nav>  
          </div>
        </div>
      </div>
    </section>
    <!-- 
	<section class="py-6">
	
	</section>
	-->
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