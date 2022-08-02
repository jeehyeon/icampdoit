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
  </head>
  <body>
    <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-8 col-lg-6 col-xl-5 d-flex mt-6">
          <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            <div class="mb-4"><img class="img-fluid mb-4" src="./resources/bootstrap-5/html/img/logo2.svg" alt="..." style="max-width: 4rem;">
              <h2>새로운 비밀번호 설정</h2>
            </div>
            
            <!-- 새 비밀번호 설정 시작 -->
            <form class="form-validate" action="signup_ok.do" method="post" name="newpwd">              
              <!-- 새 비밀번호 입력 -->
           	  <div class="mb-4">
                <label class="form-label" for="password"> *새 비밀번호</label>
                <input type="text" class="form-control" id="pwd" placeholder="Password" required data-msg="Please enter your new password">
              </div>
                            
              <!-- 새 비밀번호 확인 -->
              <div class="mb-4">
              	<label class="form-label" for="newpwd2"> *새 비밀번호 확인</label>
              	<input type="text" class="form-control" id="pwd" placeholder="비밀번호를 한번 더 입력하세요." required data-msg="Please enter your new password">
              </div>
              
              <div class="d-grid gap-2">
                <button id="sbtn" class="btn btn-lg btn-primary">비밀번호 재설정</button>
              </div>
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
    <!-- jQuery-->
    <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
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
      
      
      
      window.onload = function() {
    		document.getElementById( 'sbtn' ).onclick = function() {
    			// 데이터 전송
    			if( document.signup.info.checked == false ) {
				alert( '동의하셔야 합니다.' );
				return false;
				}
				//alert( '정상' );
				if( document.signup.name.value.trim() == '' ) {
					alert( '이름을 입력해 주세요.' );
					return false;				
				}
				if( document.signup.id.value.trim() == '' ) {
					alert( '아이디를 입력해 주세요.' );
					return false;				
				}
				if( document.signup.pwd.value.trim() == '' ) {
					alert( '비밀번호를 입력해 주세요.' );
					return false;				
				}
				if( document.signup.birth.value.trim() == '' ) {
					alert( '생년월일을 입력해 주세요' );
					return false;				
				}
				if( document.signup.email.value.trim() == '' ) {
					alert( '이메일을 입력해 주세요' );
					return false;				
				}
				if( document.signup.answer.value.trim() == '' ) {
					alert( '비밀번호 확인 답변을 입력해 주세요' );
					return false;				
				}
				if( document.signup.gen.value.trim() == '' ) {
					alert( '성별을 체크해 주세요' );
					return false;				
				}if( document.signup.idcheck.value != 'idChecked' ) {
					alert( '아이디 중복체크를 해주세요' );
					return false;				
				}
    			
    			
    			document.signup.submit();
    			
    		};
    	};
    	
    	$('#btnCheck').click(function () {		
    	    if ($('#id').val() != '') {	        
    	        $.ajax({ 	   					
    	            type: 'GET',
    	            url: './idcheck.do',
    	            data: 'id=' + $('#id').val(),
    	            dataType: 'json',
    	            success: function(result) {
    	                if (result == '1') {
    	                    $('#result').text('사용 가능한 아이디입니다.');
    	                    $('#idcheck').val('idChecked');

    	                } else {
    	                    $('#result').text('이미 사용중인 아이디입니다.');
    	                }
    	            },
    	            error: function(a, b, c) {
    	                console.log(a, b, c);
    	            }				
    	        });
    	   				
    	    } else {
    	        alert('아이디를 입력하세요.');
    	        $('#id').focus();
    	    }
    	   			
    	});
    	
    	
    	
    	function inputIdChk(){
    		$('#idcheck').val('idUncheck');
    	}
    </script>
    
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