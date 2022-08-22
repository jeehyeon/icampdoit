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
	                  <a class="dropdown-item" href="./searchkey.do">일반검색</a><a class="dropdown-item" href="./searchmapgugun.do?sido=&gugun=">지도검색</a>
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
    
    <!-- About 시작 -->
    <section class="hero-home dark-overlay mb-5"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/어바웃1.jpg">
      <div class="container py-7">
        <div class="overlay-content text-center text-white">
		<h1 class="display-3 text-serif fw-bold text-shadow mb-0"><span style="color: gray">About</span> I Camp Do It</h1>        
		</div>
      </div>
    </section>
    
    <!-- About 내용 -->
    <section class="py-6">
      <div class="container">
        <div class="row">
          <div class="col-xl-8 col-lg-10 mx-auto" style="font-family: 'GmarketSansMedium';'">           
            <p class="lead mb-5">'아이캠두잇'은 2030 남녀 중 '혼캠'에 관심 있는 사람들, 수도권 거주자 혹은 수도권 캠핑장 이용자들을 위한 웹사이트입니다.</p>
            
            <div class="text-content border mb-6" style="border-radius: 10px;">
              <figure class="figure px-3 py-3"><img class="figure-img img-fluid" src="./resources/bootstrap-5/html/img/photo/어바웃5.jpg"></figure>
              <p class="lead mb-4" style="text-align: center;">'혼캠'이란 <strong>'혼자 캠핑'</strong>의 줄임말로, 파생단어로 '혼캠족'(=혼자 캠핑을 다니는 사람들)이 있습니다.</p>
            </div>
            
            <p class="lead mb-3">사이트 이름으로는  <strong>" I <span style="color: red">CAN</span> DO IT + <span style="color: red">CAMP</span> = I CAMP DO IT "</strong> 이라는 합성어를 새로 만들어, 혼자서 캠핑도 잘 할 수 있다는 느낌을 전달해드리고 싶었습니다.</p><br><br>
            
            <p><img class="img-fluid mb-5" src="./resources/bootstrap-5/html/img/photo/어바웃3.jpg"></p>
            <p class="lead mb-6">혼캠족이 점점 늘고 있는 만큼 캠핑에 대해 잘 모르는 사람들도 쉽게 서비스를 이용할 수 있고, 정보를 취득할 수 있는 사이트가 필요하다 라는 생각으로 시작한 사이트입니다.<br><br>
            따라서, 혼캠족을 주 타겟으로 한 정보들과 혼캠러들과 서로 소통하며 얘기와 정보를 나눌 수 있는 커뮤니티 게시판, 캠핑관련 용품들의 중고거래 게시판을 제공합니다.<br>
            테마/컨텐츠 추천 등으로 입문자들에게도 유용한 정보를 제공하는 것이 특징입니다.<br><br>
            또한, 일반/키워드/지도검색을 통해 내가 가고 싶은 캠핑장의 상세정보를 제공합니다.<br>
            상세정보 페이지의 리뷰에서 해당 캠핑장에 대한 다른 사람들의 의견과 평점 또한 확인할 수 있습니다.</p>
            <p><img class="img-fluid mb-5" src="./resources/bootstrap-5/html/img/photo/어바웃2.jpg"></p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 팀원소개 시작 -->  
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row mb-lg-6">
          <div class="col-md-8">
            <p class="subtitle text-secondary">WHO ARE WE?</p>
            <h2 class="mb-md-0" style="font-family: 'Recipekorea';">Meet our team</h2>
          </div>
        </div>
        <div class="row">
          <div class="mb-5 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/리나.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Rina</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Backend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/병찬.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Byeong Chan</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Backend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/소연.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">So Yeon</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Frontend    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative"><img class="card-img-top team-img" src="./resources/bootstrap-5/html/img/avatar/지현.png" alt=""/>
                <div class="team-circle bg-info-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Jee Hyeon</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Frontend    </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br />
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