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
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/style.default.css" id="theme-stylesheet">
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
          	<a class="navbar-brand py-1" href="./list.do"><img src="./resources/bootstrap-5/html/img/logo.svg" alt="Directory logo"></a>          
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
	                  <a class="dropdown-item" href="./resources/bootstrap-5/html/docs/board.jsp">게시판</a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/inventory.jsp">혼캠 자료실</a>
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
             	<button class="btn btn-outline-success btn-sm" type="button" href="./resources/bootstrap-5/html/login.html">Sign in</button>
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
                    <button class="btn btn-success rounded-pill h-100" type="submit">검색하기 </button>
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
										<option>경기도</option>
									</select>
								</li>
								
							</ul>
						</div>
					</form>
				</div>
					
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-bs-dismiss="modal">검색하기</button>
				</div>
					
			</div>
		</div>
	</div>

    <section class="py-6">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary">Stay and eat like a local</p>
            <h2>Our guides</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./resources/bootstrap-5/html/category.html">
               See all guides<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="swiper-container guides-slider mx-n2 pt-3">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/new-york.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">New York</h6>
                  <p class="card-text text-sm">The big apple</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/paris.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Paris</h6>
                  <p class="card-text text-sm">Artist capital of Europe</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/barcelona.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Barcelona</h6>
                  <p class="card-text text-sm">Dalí, Gaudí, Barrio Gotico</p>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0"><a class="tile-link" href="./resources/bootstrap-5/html/category.html"></a><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/prague.jpg" alt="Card image">
                <div class="card-body overlay-content">
                  <h6 class="card-title text-shadow text-uppercase">Prague</h6>
                  <p class="card-text text-sm">City of hundred towers</p>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-pagination d-md-none"> </div>
        </div>
      </div>
    </section>
    <section class="py-6 bg-gray-100"> 
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Hurry up, these are expiring soon.        </p>
            <h2>Last minute deals</h2>
          </div>
          <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./resources/bootstrap-5/html/category.html">
               See all deals<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <!-- Slider main container-->
        <div class="swiper-container swiper-container-mx-negative swiper-init pt-3" data-swiper="{&quot;slidesPerView&quot;:4,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-0.jpg" alt="Pamela"/>
                        <div>Pamela</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Modern, Well-Appointed Room</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Private room</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$80</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-7.jpg" alt="John"/>
                        <div>John</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Cute Quirky Garden apt, NYC adjacent</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Entire apartment</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$121</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-8.jpg" alt="Julie"/>
                        <div>Julie</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Modern Apt - Vibrant Neighborhood!</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Entire apartment</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$75</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-9.jpg" alt="Barbora"/>
                        <div>Barbora</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Sunny Private Studio-Apartment</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Shared room</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$93</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-10.jpg" alt="Jack"/>
                        <div>Jack</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Mid-Century Modern Garden Paradise</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Entire house</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$115</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <!-- place item-->
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="./resources/bootstrap-5/html/detail-rooms.html"></a>
                    <div class="card-img-overlay-bottom z-index-20">
                      <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="./resources/bootstrap-5/html/img/avatar/avatar-11.jpg" alt="Stuart"/>
                        <div>Stuart</div>
                      </div>
                    </div>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="./resources/bootstrap-5/html/detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
                      <div class="d-flex card-subtitle mb-3">
                        <p class="flex-grow-1 mb-0 text-muted text-sm">Private room</p>
                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                        </p>
                      </div>
                      <p class="card-text text-muted"><span class="h4 text-primary">$123</span> per night</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- If we need pagination-->
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>

    <section class="py-7">
      <div class="container">
        <div class="text-center">
          <p class="subtitle text-primary">Testimonials</p>
          <h2 class="mb-5">Our dear customers said about us</h2>
        </div>
        <!-- Slider main container-->
        <div class="swiper-container testimonials-slider testimonials">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pt-2 pb-5">
            <!-- Slides-->
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
            <div class="swiper-slide p-4">
              <div class="testimonial card rounded-3 shadow border-0">
                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="./resources/bootstrap-5/html/img/avatar/avatar-3.jpg" alt="..."></div>
                <div class="text">
                  <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                  <p class="testimonial-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p><strong>Jessica Watson</strong>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-pagination">     </div>
        </div>
      </div>
    </section>
    <section class="py-6 bg-gray-100"> 
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Stories from around the globe</p>
            <h2>From our travel blog</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="./resources/bootstrap-5/html/blog.html">
               See all articles<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Travel </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Autumn fashion tips and tricks          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">Pellentesque habitant morbi tristique senectus. Vestibulum tortor quam, feugiat vitae, ultricies ege...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Living </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Newest photo apps          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibu...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/photo-1482463084673-98272196658a.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Travel </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Best books about Photography          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleif...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">Read more<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Instagram
    <section>
      <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
          <div class="swiper-wrapper">
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-1.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-2.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-3.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-4.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-5.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-6.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-7.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-8.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-9.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-14.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="./resources/bootstrap-5/html/img/instagram/instagram-14.jpg" alt=" "></a></div>
          </div>
        </div>
      </div>
    </section>
    -->
    
    <!-- Footer - 관리자 페이지 이동 부분 넣을 곳 -->
    <footer class="position-relative z-index-10 d-print-none">
      <!-- Main block - menus, subscribe form-->
      <div class="py-6 bg-gray-200 text-muted"> 
        <div class="container">
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <div class="fw-bold text-uppercase text-dark mb-3">Directory</div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="vimeo"><i class="fab fa-vimeo"></i></a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="./list.do">Rooms</a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/category-rooms.html">Map on top</a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/category-2-rooms.html">Side map</a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/category-3-rooms.html">No map</a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/detail-rooms.html">Room detail</a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Pages</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="./resources/bootstrap-5/html/compare.html">Comparison                                   </a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/team.html">Team                                   </a></li>
                <li><a class="text-muted" href="./resources/bootstrap-5/html/contact.html">Contact                                   </a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
              <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
              <form action="#" id="newsletter-form">
                <div class="input-group mb-3">
                  <input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
                  <button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2022, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
              <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/western-union.svg" alt="..."></li>
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