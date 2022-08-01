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
    
	<!-- FAQ 시작 -->
    <section class="hero py-5 py-lg-7"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/어바웃4.jpg">
      <div class="container position-relative text-white">
        <h1 class="hero-heading mb-0" style="font-family: 'Recipekorea';">FAQ</h1>
      </div>
    </section>
    
    <!-- FAQ 내용 -->
    <section class="py-6">
      <div class="container">
        <div class="row">   
          <div class="col-xl-8 col-lg-10 mx-auto">
            <div class="text-content">
              <h3 class="text-primary" style="font-family: 'GmarketSansMedium';">1. 혼캠, 정말 유행인가요?</h3>
              <p>This website, <a href="https://example.com">https://www.gukjenews.com/news/articleView.html?idxno=2413424</a>, is operated by Jack Flag and Bootstrapious. Throughout the site, the termsefer to Jack Flag and Bootstrapious. We offer혻this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.</p>
              <p>By visiting our site and/ or purchasing something from us, you engage in our  and agree to be bound by the following terms and conditions (), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply 혻to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p>
              <p>Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do혻not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.</p>
              <p>The materials contained in this website are protected by applicable copyright and trademark law.</p>
              <h3 class="text-primary" style="font-family: 'GmarketSansMedium';">2. 안전하고 편리한 캠핑장 고르는 꿀팁있나요?</h3>
              <ol type="a">
                <li>https://outdoorworld.tistory.com/40</li>
                <li>아래는 캠핑을 잘 즐길 수 있는 꿀팁</li>
                <li>https://news.g-enews.com/ko-kr/news/article/news_all/202205231543487875f29c535823_1/article.html?md=20220524182339_U</li>
                <li>Eu incididunt proident commodo occaecat commodo occaecat eiusmod ex qui et. Culpa esse do laborum elit commodo cupidatat veniam consequat ut nostrud non ut ea proident. Fugiat eu magna sint ea fugiat commodo ad duis excepteur.</li>
                <li>Ex mollit id dolore commodo do. Do incididunt aute ipsum eiusmod cillum occaecat et ut voluptate aliquip occaecat consequat laborum id. Consectetur fugiat sit do culpa. Consequat esse sunt esse reprehenderit commodo nisi amet Lorem nulla enim enim eiusmod nulla.</li>
                <li>This license shall automatically terminate if you violate any of these restrictions and may be terminated by Bootstrapious at any time.</li>
                <li>Our order process is conducted by our online reseller Paddle.com. Paddle.com is the Merchant of Record for all our orders. Paddle provides all customer service inquiries and handles returns.</li>
              </ol>
              <h3 class="text-primary" style="font-family: 'GmarketSansMedium';">3. 캠핑에 안 챙기면 후회할 필수템 있나요?</h3>
              <p>http://www.sisacast.kr/news/articleView.html?idxno=33285 ///Qui laboris cillum nisi nisi reprehenderit fugiat quis in ipsum irure fugiat. In duis cillum exercitation magna non nisi cillum. Ex in nostrud proident velit eiusmod commodo consequat incididunt deserunt quis sit proident qui ut. Proident do do in ipsum ipsum veniam excepteur velit pariatur veniam consectetur do elit. Pariatur aliquip aute mollit nisi aute anim voluptate tempor culpa sunt eu fugiat sint aliquip.</p>
              <h3 class="text-primary" style="font-family: 'GmarketSansMedium';">4. 캠핑룩 추천해주세요!</h3>
              <ol type="a">
              <li>http://zine.istyle24.com/Fashion/FashionView.aspx?Idx=51376&Menu=12&_C_=23069</li>
                <li>Mollit sit officia dolore reprehenderit in elit ad excepteur irure tempor minim. Laborum nulla nulla aliqua sit qui pariatur ullamco occaecat cillum do. Sit laborum laboris voluptate qui nostrud nulla quis elit sunt amet magna. Deserunt adipisicing culpa ut nostrud laboris exercitation cupidatat aute. Amet sunt nisi magna dolore reprehenderit quis reprehenderit quis eu ex incididunt ullamco elit.</li>
                <li>Aliqua eiusmod non consectetur non fugiat. Lorem duis aute non eu quis do labore proident laborum reprehenderit nisi minim. Commodo aute proident do eiusmod dolor et officia voluptate proident eiusmod. Cupidatat ex ipsum reprehenderit ullamco qui ex sit nisi esse Lorem. Sunt adipisicing tempor aliqua anim dolor tempor adipisicing ipsum irure do. Ex labore deserunt cupidatat ipsum ipsum aute et sint enim labore in qui ad occaecat. Cillum velit exercitation minim nulla laborum dolore ea velit id enim esse duis.</li>
              </ol>
              <h3>6. Limitations</h3>
              <p>Sint ut ut duis esse enim ea aute ut nostrud. Eiusmod ea do dolor velit Lorem ut commodo ea elit ea consectetur aliquip aute. Eiusmod mollit consequat aute esse eu dolore nostrud nisi esse duis cupidatat. Consequat laborum laborum esse est duis est id anim magna magna cupidatat veniam. Officia labore cupidatat quis irure cupidatat do nisi est. In labore ut enim non Lorem cupidatat officia. Consequat proident dolore anim minim proident officia excepteur aliquip magna non labore officia excepteur.</p>
              <h3>7. Accuracy of materials</h3>
              <p>Magna commodo ut est aliquip amet reprehenderit est incididunt laboris. Laborum non ullamco in in quis ipsum exercitation occaecat laboris. Culpa ex ex sit pariatur enim magna officia esse laboris ad dolore.</p>
              <h3>8. Links</h3>
              <p>Anim esse Lorem nostrud consequat. Aute cupidatat duis deserunt reprehenderit consequat elit tempor. Ad mollit ad quis nulla id irure aliqua amet velit.</p>
              <h3>9. Modifications</h3>
              <p>Bootstrapious may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service.</p>
              <h3>10. Governing Law</h3>
              <p>These terms and conditions are governed by and construed in accordance with the laws of Czech Republic and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p>
              <p>Version 1.2혻- Effective date: April 23, 2020.  </p>
            </div>
          </div>
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