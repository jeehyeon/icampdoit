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
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
    <!-- Leaflet Maps-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
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
    
    <div class="container-fluid pt-5 pb-3 border-bottom px-lg-5">
      <div class="row">
        <div class="col-xl-8">
          <h1 style="font-family: 'Recipekorea';">캠핑장 일반 검색    </h1>
          <p class="lead text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.</p>
        </div>
      </div>
    </div>
    
    <div class="container-fluid py-5 px-lg-5">
      <div class="row">
        <div class="col-lg-3 pt-3">
          <form class="pe-xl-3" action="#" autocomplete="off">
            <div class="mb-4">
              <label class="form-label" for="form_dates">Dates</label>
              <div class="datepicker-container datepicker-container-left">
                <input class="form-control" type="text" name="bookingDate" id="form_dates" placeholder="Choose your dates">
              </div>
            </div>
            <div class="mb-4">
              <label class="form-label" for="form_guests">Guests</label>
              <select class="selectpicker form-control" name="guests" id="form_guests" data-style="btn-selectpicker" title=" ">
                <option value="guests_0">1    </option>
                <option value="guests_1">2    </option>
                <option value="guests_2">3    </option>
                <option value="guests_3">4    </option>
                <option value="guests_4">5    </option>
              </select>
            </div>
            <div class="mb-4">
              <label class="form-label" for="form_type">Home type</label>
              <select class="selectpicker form-control" name="type" id="form_type" multiple data-style="btn-selectpicker" title="">
                <option value="type_0">Entire place    </option>
                <option value="type_1">Private room    </option>
                <option value="type_2">Shared room    </option>
              </select>
            </div>
            <div class="mb-4">
              <label class="form-label">Price range</label>
              <div class="text-primary" id="slider-snap"></div>
              <div class="nouislider-values">
                <div class="min">From $<span id="slider-snap-value-from"></span></div>
                <div class="max">To $<span id="slider-snap-value-to"></span></div>
              </div>
              <input type="hidden" name="pricefrom" id="slider-snap-input-from" value="40">
              <input type="hidden" name="priceto" id="slider-snap-input-to" value="110">
            </div>
            <div class="mb-4">
              <label class="form-label">Host and booking</label>
              <ul class="list-inline mb-0 mt-1">
                <li class="list-inline-item mb-2">
                  <div class="form-check form-switch">
                    <input class="form-check-input" id="instantBook" type="checkbox">
                    <label class="form-check-label" for="instantBook"> <span class="text-sm">Instant book</span></label>
                  </div>
                </li>
                <li class="list-inline-item">
                  <div class="form-check form-switch">
                    <input class="form-check-input" id="superhost" type="checkbox">
                    <label class="form-check-label" for="superhost"> <span class="text-sm">Superhost</span></label>
                  </div>
                </li>
              </ul>
            </div>
            <div class="pb-4">
              <div class="collapse" id="moreFilters">
                <div class="filter-block">
                  <h6 class="mb-3">Location</h6>
                  <div class="mb-4">
                    <label class="form-label" for="form_neighbourhood">Neighbourhood</label>
                    <select class="selectpicker form-control" name="neighbourhood" id="form_neighbourhood" multiple data-style="btn-selectpicker" data-live-search="true" data-selected-text-format="count &gt; 1" title="">
                      <option value="neighbourhood_0">Battery Park City    </option>
                      <option value="neighbourhood_1">Bowery    </option>
                      <option value="neighbourhood_2">Carnegie Hill    </option>
                      <option value="neighbourhood_3">Central Park    </option>
                      <option value="neighbourhood_4">Chelsea    </option>
                      <option value="neighbourhood_5">Chinatown    </option>
                      <option value="neighbourhood_6">Civic Center    </option>
                      <option value="neighbourhood_7">East Harlem    </option>
                      <option value="neighbourhood_8">Financial District    </option>
                      <option value="neighbourhood_9">Flatiron    </option>
                      <option value="neighbourhood_10">Garment District    </option>
                      <option value="neighbourhood_11">Gramercy Park    </option>
                      <option value="neighbourhood_12">Greenwich Village    </option>
                      <option value="neighbourhood_13">East Village    </option>
                      <option value="neighbourhood_14">West Village    </option>
                      <option value="neighbourhood_15">Hamilton Heights    </option>
                      <option value="neighbourhood_16">Harlem    </option>
                      <option value="neighbourhood_17">Hell's Kitchen / Clinton    </option>
                      <option value="neighbourhood_18">Inwood    </option>
                      <option value="neighbourhood_19">Kips Bay    </option>
                      <option value="neighbourhood_20">Lenox Hill    </option>
                      <option value="neighbourhood_21">Little Italy    </option>
                      <option value="neighbourhood_22">Lower Eastside    </option>
                      <option value="neighbourhood_23">Madison Square    </option>
                      <option value="neighbourhood_24">Manhattan Valley    </option>
                      <option value="neighbourhood_25">Meatpacking District    </option>
                      <option value="neighbourhood_26">Midtown    </option>
                      <option value="neighbourhood_27">Morningside Heights    </option>
                      <option value="neighbourhood_28">Murray Hill    </option>
                      <option value="neighbourhood_29">NoHo    </option>
                      <option value="neighbourhood_30">NoLita    </option>
                      <option value="neighbourhood_31">Roosevelt Island    </option>
                      <option value="neighbourhood_32">SoHo    </option>
                      <option value="neighbourhood_33">Stuyvesant Town (Stuyvesant Square)    </option>
                      <option value="neighbourhood_34">Sutton Place    </option>
                      <option value="neighbourhood_35">Times Square    </option>
                      <option value="neighbourhood_36">Tribeca    </option>
                      <option value="neighbourhood_37">Turtle Bay    </option>
                      <option value="neighbourhood_38">Upper Eastside    </option>
                      <option value="neighbourhood_39">Upper Westside    </option>
                      <option value="neighbourhood_40">Washington Heights    </option>
                      <option value="neighbourhood_41">Yorkville    </option>
                    </select>
                  </div>
                  <div class="mb-0">
                    <label class="form-label">Neighbourhood Tag</label>
                    <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="type_0" name="type[]">
                          <label class="form-check-label" for="type_0">Hipster                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="type_1" name="type[]">
                          <label class="form-check-label" for="type_1">Business                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="type_2" name="type[]">
                          <label class="form-check-label" for="type_2">Family                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="type_3" name="type[]">
                          <label class="form-check-label" for="type_3">Green                                            </label>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="filter-block">
                  <h6 class="mb-3">Rooms and beds</h6>
                  <div class="mb-2">
                    <label class="form-label">Beds</label>
                    <div class="d-flex align-items-center">
                      <div class="btn btn-items btn-items-decrease">-</div>
                      <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                      <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                  </div>
                  <div class="mb-2">
                    <label class="form-label">Bedrooms</label>
                    <div class="d-flex align-items-center">
                      <div class="btn btn-items btn-items-decrease">-</div>
                      <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                      <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                  </div>
                  <div class="mb-0">
                    <label class="form-label">Bathrooms</label>
                    <div class="d-flex align-items-center">
                      <div class="btn btn-items btn-items-decrease">-</div>
                      <input class="form-control input-items input-items-greaterthan" type="text" value="1+" disabled>
                      <div class="btn btn-items btn-items-increase">+</div>
                    </div>
                  </div>
                </div>
                <div class="filter-block"> 
                  <h6 class="mb-3">Trip type</h6>
                  <div class="mb-0">
                    <div class="form-check form-switch mb-2">
                      <input class="form-check-input" id="forfamilies" type="checkbox" name="forfamilies" aria-describedby="forfamiliesHelp">
                      <label class="form-check-label" for="forfamilies"> <span class="text-sm">For Families</span></label>
                    </div><small class="text-muted form-text" id="forfamiliesHelp">Explore entire homes with 5-star reviews from families and essentials like a kitchen and TV</small>
                  </div>
                  <div class="mb-0">
                    <div class="form-check form-switch mb-2">
                      <input class="form-check-input" id="forwork" type="checkbox" name="forwork" aria-describedby="forworkHelp">
                      <label class="form-check-label" for="forwork"> <span class="text-sm">For work</span></label>
                    </div><small class="text-muted form-text" id="forworkHelp">Explore top-rated homes with essentials like a workspace, wifi, and self check-in                                        </small>
                  </div>
                </div>
                <div class="filter-block"> 
                  <h6 class="mb-3">Amenities</h6>
                  <ul class="list-unstyled mb-0">
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_0" name="amenities[]">
                        <label class="form-check-label" for="amenities_0">Kitchen                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_1" name="amenities[]">
                        <label class="form-check-label" for="amenities_1">Shampoo                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_2" name="amenities[]">
                        <label class="form-check-label" for="amenities_2">Heating                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_3" name="amenities[]">
                        <label class="form-check-label" for="amenities_3">Air conditioning                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_4" name="amenities[]">
                        <label class="form-check-label" for="amenities_4">Washer                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_5" name="amenities[]">
                        <label class="form-check-label" for="amenities_5">Dryer                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_6" name="amenities[]">
                        <label class="form-check-label" for="amenities_6">Wifi                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_7" name="amenities[]">
                        <label class="form-check-label" for="amenities_7">Breakfast                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_8" name="amenities[]">
                        <label class="form-check-label" for="amenities_8">Indoor fireplace                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_9" name="amenities[]">
                        <label class="form-check-label" for="amenities_9">Buzzer/wireless intercom                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_10" name="amenities[]">
                        <label class="form-check-label" for="amenities_10">Doorman                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_11" name="amenities[]">
                        <label class="form-check-label" for="amenities_11">Hangers                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_12" name="amenities[]">
                        <label class="form-check-label" for="amenities_12">Iron                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_13" name="amenities[]">
                        <label class="form-check-label" for="amenities_13">Hair dryer                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="amenities_14" name="amenities[]">
                        <label class="form-check-label" for="amenities_14">Laptop friendly workspace                               </label>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="filter-block"> 
                  <h6 class="mb-3">Facilities</h6>
                  <ul class="list-unstyled mb-0">
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="facilities_0" name="facilities[]">
                        <label class="form-check-label" for="facilities_0">Free parking on premises             </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="facilities_1" name="facilities[]">
                        <label class="form-check-label" for="facilities_1">Gym             </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="facilities_2" name="facilities[]">
                        <label class="form-check-label" for="facilities_2">Hot tub             </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="facilities_3" name="facilities[]">
                        <label class="form-check-label" for="facilities_3">Pool             </label>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="mb-4">
                <button class="btn btn-link btn-collapse ps-0 text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#moreFilters" aria-expanded="false" aria-controls="moreFilters" data-expanded-text="Less filters" data-collapsed-text="More filters">More filters</button>
              </div>
              <div class="mb-4">
                <button class="btn btn-primary" type="submit"> <i class="fas fa-filter me-1"></i>Filter                </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-lg-9">
          <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
            <div class="me-3">
              <p class="mb-3 mb-md-0"><strong>12</strong> results found</p>
            </div>
          </div>
          <div class="row">
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern, Well-Appointed Room</a></h6>
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
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Cute Quirky Garden apt, NYC adjacent</a></h6>
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
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood!</a></h6>
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
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Sunny Private Studio-Apartment</a></h6>
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
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Mid-Century Modern Garden Paradise</a></h6>
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
            <!-- place item-->
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="detail-rooms.html"></a>
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
                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
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
          <!-- Pagination -->
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