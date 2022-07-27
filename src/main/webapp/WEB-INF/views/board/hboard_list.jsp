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
      <!-- Navbar-->
      <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
          <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="./resources/bootstrap-5/html/index.html"><img src="./resources/bootstrap-5/html/img/logo.svg" alt="Directory logo"></a>
            <form class="form-inline d-none d-sm-flex" action="#" id="search">
              <div class="input-label-absolute input-label-absolute-left input-expand ms-lg-2 ms-xl-3"> 
                <label class="label-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="search_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
          </div>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
              <div class="input-label-absolute input-label-absolute-left w-100">
                <label class="label-absolute" for="searchcollapsed_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="homeDropdownMenuLink" href="./resources/bootstrap-5/html/index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Home</a>
                <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="./resources/bootstrap-5/html/index.html">Rooms</a><a class="dropdown-item" href="./resources/bootstrap-5/html/index-2.html">Restaurants</a><a class="dropdown-item" href="./resources/bootstrap-5/html/index-3.html">Travel</a><a class="dropdown-item" href="./resources/bootstrap-5/html/index-4.html">Real Estate <span class="badge badge-info-light ms-1 mt-n1">New</span></a></div>
              </li>
              <!-- Megamenu-->
              <li class="nav-item dropdown position-static"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Template</a>
                <div class="dropdown-menu megamenu py-lg-0">
                  <div class="row">
                    <div class="col-lg-9">
                      <div class="row p-3 pe-lg-0 ps-lg-5 pt-lg-5">
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Homepage</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/index.html">Rooms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/index-2.html">Restaurants   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/index-3.html">Travel   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/index-4.html">Real estate <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Restaurants</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category.html">Category - Map on the top   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category-2.html">Category - Map on the right   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category-3.html">Category - no map   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/detail.html">Restaurant detail   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Rooms</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category-rooms.html">Category - Map on the top   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category-2-rooms.html">Category - Map on the right   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/category-3-rooms.html">Category - no map   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/detail-rooms.html">Room detail   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Blog</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/blog.html">Blog   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/post.html">Post   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Pages</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/compare.html">Comparison   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/team.html">Team   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/contact.html">Contact   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Pages</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/pricing.html">Pricing   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/text.html">Text page   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/faq.html">F.A.Q.s   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/coming-soon.html">Coming soon   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/404.html">404 page   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/knowledge-base.html">Knowledge Base  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/knowledge-base-topic.html">Knowledge Base  &mdash; Topic<span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/terms.html">Terms & Conditions  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">Host</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-add-0.html">Add new listing - 6 pages   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-list.html">Bookings &mdash; list view   </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3">
                          <!-- Megamenu list-->
                          <h6 class="text-uppercase">User</h6>
                          <ul class="megamenu-list list-unstyled">
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-profile.html">Profile   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-account.html">Account   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-personal.html">Personal info - forms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-security.html">Password & security - forms   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/login.html">Sign in   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/signup.html">Sign up   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-booking-1.html">Booking process - 4 pages   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-grid.html">Bookings &mdash; grid view   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-booking-detail.html">Booking detail   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-invoice.html">Invoice  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-messages.html">Messages <span class="badge badge-info-light ms-1">New</span>   </a></li>
                            <li class="megamenu-list-item"><a class="megamenu-list-link" href="./resources/bootstrap-5/html/user-messages-detail.html">Message Detail  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                          </ul>
                        </div>
                      </div>
                      <div class="row megamenu-services d-none d-lg-flex ps-lg-5">
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#destination-map-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Best rentals</h6>
                              <p class="mb-0 text-muted text-sm">Find the perfect place</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#money-box-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Earn points</h6>
                              <p class="mb-0 text-muted text-sm">And get great rewards</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#customer-support-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">020-800-456-747</h6>
                              <p class="mb-0 text-muted text-sm">24/7 Available Support</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="megamenu-services-item">
                            <svg class="svg-icon megamenu-services-icon">
                              <use xlink:href="#secure-payment-1"> </use>
                            </svg>
                            <div>
                              <h6 class="text-uppercase">Secure Payment</h6>
                              <p class="mb-0 text-muted text-sm">Secure Payment</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 d-none d-lg-block position-relative"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/photo-1521170665346-3f21e2291d8b.jpg" alt=""></div>
                  </div>
                </div>
              </li>
              <!-- /Megamenu end-->
              <li class="nav-item"><a class="nav-link" href="./resources/bootstrap-5/html/contact.html">Contact</a>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="./resources/bootstrap-5/html/index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Docs</a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
                  <h6 class="dropdown-header fw-normal">Documentation</h6><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-introduction.html">Introduction </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-directory-structure.html">Directory structure </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-gulp.html">Gulp </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-customizing-css.html">Customizing CSS </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-credits.html">Credits </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/docs-changelog.html">Changelog </a>
                  <div class="dropdown-divider"></div>
                  <h6 class="dropdown-header fw-normal">Components</h6><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/components-bootstrap.html">Bootstrap </a><a class="dropdown-item" href="./resources/bootstrap-5/html/docs/components-directory.html">Theme </a>
                </div>
              </li>
              <li class="nav-item"><a class="nav-link" href="./resources/bootstrap-5/html/login.html">Sign in</a></li>
              <li class="nav-item"><a class="nav-link" href="./resources/bootstrap-5/html/signup.html">Sign up</a></li>
              <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="./resources/bootstrap-5/html/user-add-0.html">Add a listing</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- /Navbar -->
      
    <!-- 게시판 시작 -->  
    </header>
    <section class="position-relative py-6"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/자료실.png" alt="">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-body p-5"><strong class="text-uppercase text-secondary d-inline-block mb-2 text-sm" style="font-family: 'Recipekorea';">없는 거 빼고 다 있는</strong>
                <h2 class="mb-3" style="font-family: 'Recipekorea';">혼캠 자료실</h2>
                <p class="text-muted">여기에 무슨 내용을 쓰지?</p><a class="btn btn-link p-0" href="./resources/bootstrap-5/html/post.html">Continue reading <i class="fa fa-long-arrow-alt-right"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="py-6">
      <div class="container">
        <div class="row mb-5">
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/원플리1.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#"># playlist </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Late Spring breeze          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>July 26, 2022</p>
                <p class="my-2 text-muted text-sm">Pellentesque habitant morbi tristique senectus. Vestibulum tortor quam, feugiat vitae, ultricies ege...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/원플리2.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#"># playlist </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Park & Picnic Mood          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>July 26, 2022</p>
                <p class="my-2 text-muted text-sm">ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibu...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/원플리3.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#"># playlist </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Chill Vibe          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>July 26, 2022</p>
                <p class="my-2 text-muted text-sm">Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleif...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/인턴.png" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#"># movie </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Intern          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>July 26, 2022</p>
                <p class="my-2 text-muted text-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestib...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/너의이름은.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#"># movie </a>
                <h5 class="my-2" style="font-family: 'BMJUA';"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">너의 이름은          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>July 26, 2022</p>
                <p class="my-2 text-muted text-sm">Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleif...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
          <!-- blog item-->
          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
            <div class="card shadow border-0 h-100"><a href="./resources/bootstrap-5/html/post.html"><img class="img-fluid card-img-top" src="./resources/bootstrap-5/html/img/photo/photo-1514890547357-a9ee288728e0.jpg" alt="..."/></a>
              <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2" href="#">Guides </a>
                <h5 class="my-2"><a class="text-dark" href="./resources/bootstrap-5/html/post.html">Best of this year's Biennale          </a></h5>
                <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2016</p>
                <p class="my-2 text-muted text-sm">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestib...</p><a class="btn btn-link ps-0" href="./resources/bootstrap-5/html/post.html">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
              </div>
            </div>
          </div>
        </div>
        <!-- Pagination -->
        <nav aria-label="Blog pagination">
          <ul class="pagination justify-content-between mb-5">
            <li class="page-item"><a class="page-link text-sm rounded" href="#"> <i class="fa fa-chevron-left me-1"></i>Older posts</a></li>
            <li class="page-item disabled"><a class="page-link text-sm rounded" href="#" tabindex="-1">Newer posts  <i class="fa fa-chevron-right ms-1"></i></a></li>
          </ul>
        </nav>
      </div>
    </section>
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
      
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