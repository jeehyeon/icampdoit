<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Directory Theme by Bootstrapious</title>
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
    <link rel="shortcut icon" href="./resources/bootstrap-5/html/img/favicon.png">
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
	              	<a class="nav-link" href="./resources/bootstraop-5/html/about.jsp">About</a>
	              </li>
	              
	              <!-- Customer Care 페이지 -->
				  <li class="nav-item dropdown">
				  	<a class="nav-link dropdown-toggle" id="noticeDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Customer Care</a>
	                <div class="dropdown-menu" aria-labelledby="noticeDropdownMenuLink"><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/notice.jsp">공지사항</a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/faq.jsp">FAQ</a></div>
	              </li>
	              
	              <!-- Search 페이지 -->
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="searchDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Search</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="searchDropdownMenuLink">
	                  <a class="dropdown-item" href="./resources/bootstrap-5/html/docs/generalsearch.jsp">일반검색</a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/mapsearch.jsp">지도검색</a>
	                </div>
	              </li>
	              
	              <!-- Communication 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="communicationDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Communication</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="communicationDropdownMenuLink">
	                  <a class="dropdown-item" href="./resources/bootstrap-5/html/docs/board.jsp">게시판</a><a class="dropdown-item" href="./hboardlist.do">혼캠 자료실</a>
	                </div>
	              </li>
	              
	              <!-- MyPage 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="mypageDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   MyPage</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="mypageDropdownMenuLink">
	                  <a class="dropdown-item" href="./resources/bootstrap-5/html/docs/mypage.jsp">내 정보</a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/subscribe.jsp">찜한 목록</a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/mywritings.jsp">내가 쓴 글</a>
	                </div>
	              </li>
	            </ul>
         	</div>
         	
         	<form class="d-flex">
             	<button class="btn btn-outline-primary btn-sm" type="button" href="./resources/bootstrap-5/html/login.html">Sign in</button>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    
    <!-- 메인 검색 배경부분 -->
    <section class="hero-home">
      <div class="swiper-container hero-slider">
        <div class="swiper-wrapper dark-overlay">
          <div class="swiper-slide" style="background-image:url(./resources/bootstrap-5/html/img/photo/camping.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(./resources/bootstrap-5/html/img/photo/camping2.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(./resources/bootstrap-5/html/img/photo/camping3.jpg)"></div>
          <div class="swiper-slide" style="background-image:url(./resources/bootstrap-5/html/img/photo/camping4.jpg)"></div>
        </div>
      </div>   
      <div class="container py-6 py-md-7 text-white z-index-20">
        <div class="row">
          <div class="col-xl-10">
            <div class="text-center text-lg-start">
              <h1 class="display-3 fw-bold text-shadow">I Camp Do It</h1>
            </div>           
            <div class="search-bar mt-5 p-3 p-lg-1 ps-lg-4">
              <form action="#">
                <div class="row">
                  <div class="col-lg-7 d-flex align-items-center form-group">
                    <input class="form-control border-0 shadow-0" type="text" name="search" placeholder="키워드 검색">
                  </div>
                  <div class="col-lg-3 d-flex align-items-center form-group no-divider">
                    <button type="button" class="btn btn-outline-light text-dark" id="filteringButton" data-style="btn-form-control" data-bs-toggle="modal" data-bs-target="#filteringModal">
                      캠핑장 상세 조건 검색
                    </button>
                  </div>
                  <div class="col-lg-2 d-grid">
                    <button class="btn btn-primary rounded-pill h-100" type="submit">검색하기 </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 상세보기 팝업 -->
    <div class="modal fade" id="filteringModal">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
					
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">캠핑장 상세조건을 설정해주세요</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
					
				<!-- Modal body -->
				<div class="modal-body">
					<form id="campSearchForm" action="./resources/bootstraop-5/html/generalsearch.jsp" method="get">
						<div class="detailSearch">
							<ul>
								<li><strong>지역</strong></li>
									<select class="form-select" id="sido">
										<option>서울시</option>
										<option>인천시</option>
										<option>경기도</option>
									</select>
									<select class="form-select" id="gugun">
										<option>서울시</option>
										<option>인천시</option>
										<option>경기도2</option>
									</select>
								</li>
								
							</ul>
						</div>
					</form>
				</div>
					
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">검색하기</button>
				</div>
					
			</div>
		</div>
	</div>
<!-- 소연 시작 -->
	<section class="py-6">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary" style="font-family: 'Recipekorea';"><font size=-1>MOST POPULAR CAMPSITES</font></p>
            <h2 style="font-family: 'Recipekorea';">캠핑장 조회수 TOP 5</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./resources/bootstrap-5/html/category.html" style="font-family: 'Recipekorea';">
               더 많은 캠핑장 보러가기<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="swiper-container guides-slider mx-n2 pt-3">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/top1예시.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h5 class="card-title text-shadow text-uppercase" style="font-family: 'Recipekorea';">대궐 오토캠핑장</h5>
                  <p class="card-text text-sm" style="font-family: 'BMJUA';">경기도 포천시</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/top2예시.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h5 class="card-title text-shadow text-uppercase" style="font-family: 'Recipekorea';">도마치 캠핑장</h5>
                  <p class="card-text text-sm" style="font-family: 'BMJUA';">경기도 포천시</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/top3예시.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h5 class="card-title text-shadow text-uppercase" style="font-family: 'Recipekorea';">대장금 테마파크</h5>
                  <p class="card-text text-sm" style="font-family: 'BMJUA';">경기도 용인시</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/top4예시.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h5 class="card-title text-shadow text-uppercase" style="font-family: 'Recipekorea';">용인 자연휴양림</h5>
                  <p class="card-text text-sm" style="font-family: 'BMJUA';">경기도 용인시</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/top5예시.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h5 class="card-title text-shadow text-uppercase" style="font-family: 'Recipekorea';">마장호수 휴 캠핑장</h5>
                  <p class="card-text text-sm" style="font-family: 'BMJUA';">경기도 파주시</p>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-pagination d-md-none"> </div>
        </div>
      </div>
    </section>
    <!-- Our picks section-->
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary">THE STARRY NIGHT</font></p>
            <h2 style="font-family: 'Recipekorea';">별보기 좋은 캠핑장 Best 5</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category-3-rooms.html" style="font-family: 'Recipekorea';">
               더 많은 캠핑장 보러가기<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" data-bs-toggle="tooltip" title="경기도 양주" style="background: center center url(./resources/bootstrap-5/html/img/photo/해피캠핑장.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0" style="font-family: 'Recipekorea';">해피 캠핑장</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" data-bs-toggle="tooltip" title="경기도 연천" style="background: center center url(./resources/bootstrap-5/html/img/photo/한탄강캠핑장.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0" style="font-family: 'Recipekorea';">한탄강 오토캠핑장</h3>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" data-bs-toggle="tooltip" data-bs-placement="bottom" title="경기도 포천" style="background: center center url(./resources/bootstrap-5/html/img/photo/광릉숲이야기캠핑장.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0" style="font-family: 'Recipekorea';">광릉숲이야기 캠핑장</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" data-bs-toggle="tooltip" data-bs-placement="bottom" title="경기도 가평" style="background: center center url(./resources/bootstrap-5/html/img/photo/자라섬캠핑장.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="./campview.do"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0" style="font-family: 'Recipekorea';">자라섬 캠핑장</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" data-bs-toggle="tooltip" data-bs-placement="bottom" title="경기도 양평" style="background: center center url(./resources/bootstrap-5/html/img/photo/중미산자연휴양림.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0" style="font-family: 'Recipekorea';">중미산 자연휴양림</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>



<!-- 컨텐츠추천 시작 -->
    <section class="py-6">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary">Stay and chill at camping</p>
            <h2 style="font-family: 'Recipekorea';">혼캠족을 위한 컨텐츠 추천</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./hboardlist.do">
               혼캠 자료실<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="swiper-container guides-slider mx-n2 pt-3">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="https://www.youtube.com/watch?v=saXEu2GNeY0"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/원플리1.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Late Spring breeze</h6>
                  <p class="card-text text-sm"># Playlist</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="https://www.youtube.com/watch?v=tOI-csUHoP8"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/원플리2.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Park & Picnic Mood</h6>
                  <p class="card-text text-sm"># Playlist</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="https://www.youtube.com/watch?v=D5TRWi6y8DI"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/원플리3.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Chill Vibe</h6>
                  <p class="card-text text-sm"># Playlist</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%98%81%ED%99%94+%EC%9D%B8%ED%84%B4"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/인턴.png" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Intern</h6>
                  <p class="card-text text-sm"># Movie</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%98%81%ED%99%94+%EB%84%88%EC%9D%98%EC%9D%B4%EB%A6%84%EC%9D%80&oquery=%EC%98%81%ED%99%94+%EC%9D%B8%ED%84%B4&tqi=hW%2B0BsprvmZssOgHNcsssssssdZ-107965"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/너의이름은.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase" style="font-family: 'BMJUA';">너의 이름은</h6>
                  <p class="card-text text-sm"># Movie</p>
                </div>
              </div>
            </div>  
          </div>
          <div class="swiper-pagination d-md-none"> </div>
		</div>
      </div>
    </section>
    <!-- 컨텐츠추천 끝 -->
    
    <!-- 설문목록 시작 -->  
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row mb-lg-6">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Survey</p>
            <h2 class="mb-md-0" style="font-family: 'Recipekorea';">설문조사 결과를 참고하세요!</h2>
          </div>
         
        </div>
        <div class="row">
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/여가.jpg" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title" style="font-family: 'BMJUA';">여가시간 추천</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/혼캠장점.jpg" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title" style="font-family: 'BMJUA';">혼캠 장점</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/준비물.jpg" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title" style="font-family: 'BMJUA';">챙겨가면 좋은 준비물</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/캠핑종류.jpg" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title" style="font-family: 'BMJUA';">선호하는 캠핑 종류</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">    </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 설문목록 끝 -->
    
    
    <!-- 날씨 -->
    <section class="py-6 " >
      <div class="container">
        <h3 class="text-left text-uppercase letter-spacing-3 mb-5" style="font-family: 'Recipekorea';">주간 예보</h3>
        <!-- Brands Slider-->
        <div class="swiper-container brands-slider">
          <div class="swiper-wrapper pb-5">
            <!-- today -->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
			   	<div class="tit_weather"> <strong>7.26</strong><br/>화</div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB01.png"/>
			   	25°C/32°C<br/>
			    강수 : 10%
		   	</div>
		   	
            <!-- today+1-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	           <div class="tit_weather"> <strong>7.27</strong><br/>수</div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB01.png"/>
			   	23°C/33°C<br/>
			   	강수 : 30%
            </div>
            
            <!--  today+2-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	            <div class="tit_weather"><strong>7.28</strong><br/>목 </div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB03.png"/>
			   	25°C/34°C<br/>
			   	강수 : 0%
            </div>
            
            <!--  today+3-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	            <div class="tit_weather"><strong>7.29</strong><br/>금 </div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB03.png"/>
			   	22°C/30°C<br/>
			   	강수 : 50%
            </div>
            
            <!--  today+4-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	            <div class="tit_weather"><strong>7.30</strong> <br/>토</div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB03.png"/>
			   	25°C/32°C<br/>
			   	강수 : 50%
            </div>
            
            <!--  today+5-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	            <div class="tit_weather"><strong>7.31</strong><br/>일 </div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB01.png"/>
			   	23°C/33°C<br/>
			   	강수 : 0%
            </div>
            
            <!--  today+6-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center">
	            <div class="tit_weather"><strong>8.01</strong> <br/>월</div>
			   	<img class="weatherimage" src="./resources/bootstrap-5/html/img/weathericon/NB01.png"/>
			   	25°C/34°C<br/>
			   	강수 : 10%
            </div>
            
            
            
          </div>
        </div>
      </div>
    </section>
    
    
    <!-- 팀원소개 시작 -->  
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row mb-lg-6">
          <div class="col-md-8">
            <p class="subtitle text-primary">WHO ARE WE?</p>
            <h2 class="mb-md-0" style="font-family: 'Recipekorea';">Meet our team</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./resources/bootstrap-5/html/team.html">
               Meet us all<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/리나.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Rina</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Backend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/병찬.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Byeong Chan</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Backend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/소연.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">So Yeon</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Frontend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/지현.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Jee Hyeon</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Frontend    </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 팀원소개 끝 -->
    
    

    
   
    
    
    
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