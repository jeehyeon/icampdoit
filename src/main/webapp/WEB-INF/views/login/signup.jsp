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
  <body>
    <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
          <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            <div class="mb-4"><img class="img-fluid mb-4" src="./resources/bootstrap-5/html/img/logo2.svg" alt="..." style="max-width: 4rem;">
              <h2>Sign up</h2>
              <!--
              <p class="text-muted">His room, a proper human room although a little too small, lay peacefully between its four familiar walls. A collection of textile samples lay spread out on the table.</p>
              -->
            </div>
            <form class="form-validate">
              <div class="mb-3">
                <label class="form-label" for="loginUserName"> *NAME</label>
                <input class="form-control" name="loginUserName" id="loginUserName" type="Name" placeholder="Name" autocomplete="off" required data-msg="Please enter your Name">
              </div>
              <div class="mb-4">
                <label class="form-label" for="loginUserID"> *ID</label>
                <div style="line-height:15%;">
                <input name="loginUserID" id="loginUserID" type="ID" class="form-control" placeholder="ID" autocomplete="off" required data-msg="Please enter your ID">
                <br>
                <button type="button" class="btn btn btn-dark btn-sm" style="float: right; height: 30px; display: flex; align-items:center;">아이디 중복확인</button>
                </div>
              </div>
           	  <div class="mb-3">
                <label class="form-label" for="loginPassword"> *Password</label>
                <input class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" type="password" required data-msg="Please enter your password">
              </div>
              <!--
              <div class="mb-4">
                <label class="form-label" for="loginPassword2"> Confirm your password</label>
                <input class="form-control" name="loginPassword2" id="loginPassword2" placeholder="Password" type="password" required data-msg="Please enter your password">
              </div>
              -->
              <div class="mb-3">
                <label class="form-label" for="loginUserEmail"> *Email Address</label>
                <input class="form-control" name="loginUserEmail" id="loginUserEmail" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="Please enter your email">
              </div>
              <div class="mb-3">
                <label class="form-label" for="loginUserGender"> *Gender</label>
                <div class="form-check">
                  <input class="form-check-input" name="loginUserGender" type="checkbox">
                  <label class="form-check-label text-muted"><span class="text-sm">male</span></label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" name="loginUserGender" type="checkbox">
                  <label class="form-check-label text-muted"><span class="text-sm">female</span></label>
                </div>
              </div>
              
              <div class="mb-4">
                <label class="form-label" for="loginUsername"> *이용약관 동의</label>
                <button class="btn btn-link ps-0 text-primary btn-sm collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#agree" aria-expanded="false" aria-controls="personalDetails">자세히 보기</button>
      			  <div class="collapse" id="agree">
	                <form action="#">
	                  <div class="container mb-2">
						  <form>
						    <div class="form-group">
						      <textarea class="form-control" rows="7" id="comment" style="background-color: white" readonly>제1장 총칙&#13;&#10;제1조. 목적&#13;&#10; 본 약관은 I Camp Do It(이하 "아이캠두잇")이 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 아이캠두잇의 권리, 의무, 책임사항과 기타 필요한 사항을 규정합니다.&#13;&#10;제2조. 용어의 정의&#13;&#10;본 약관에서 사용하는 용어의 정의는 다음과 같습니다.&#13;&#10;...</textarea>
						    </div>
						  </form>
	                  </div>
	                </form>
      			  </div>
      			                    			  
      			<div class="form-check">
                  <input class="form-check-input" id="agree" type="checkbox">
                  <label class="form-check-label text-muted"> <span class="text-sm">[필수] 이용약관에 동의합니다.</span></label>
                </div>
              </div>
                          
              <div class="d-grid gap-2">
                <button class="btn btn-lg btn-primary" type="submit">Sign up</button>
              </div>
              <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
              <div class="d-grid gap-2">
                <button class="btn btn btn-outline-muted btn-social" style="background-color: #ffc107"><i class="fa fa-solid fa-comment btn-social-icon fa-2x"> </i>CONNECT <span class="d-none d-sm-inline">WITH KAKAKO</span></button>
              </div>
              <!--  
              <hr class="my-4">
              <p class="text-sm text-muted">By signing up you agree to Directory's <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a>.</p>
              -->
            </form>
            <a class="close-absolute me-md-5 me-xl-6 pt-5" href="./home.do"> 
              <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg>
            </a>
          </div>
        </div>
        <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
          <!-- Image-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(./resources/bootstrap-5/html/img/photo/캠핑.jpg);"></div>
        </div>
      </div>
    </div>
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