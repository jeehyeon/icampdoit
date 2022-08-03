<%@page import="com.exam.login.SignUpTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	
	SignUpTO sto =(SignUpTO)request.getAttribute("sto");
	
%>

<!DOCTYPE html>
<html>
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
	  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	</head>
	<body>
 	 <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
          <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            <div class="mb-4"><img class="img-fluid mb-4" src="./resources/bootstrap-5/html/img/logo2.svg" alt="..." style="max-width: 4rem;">
              <h2>CREATE KAKAO ACCOUNT</h2>
            </div>
            
            <!-- 회원가입 시작 -->
            <form action="./kakaosignup_ok.do" method="post" name="sfrm" class="form-horizontal">
            <input type="hidden" name="kid" id="kid" value="<%=sto.getKid()%>"/>
              <!-- 이름 -->
              <div class="mb-3">
                <label class="form-label" for="name"> *NAME</label>
                <input type="text" class="form-control" name="name" value="<%=sto.getName()%>" readonly>
              </div>
              
              <!-- 아이디 -->
              <div class="mb-4">
                <label class="form-label" for="id"> *ID</label>
                <div style="line-height:15%;">
                <input name="id" id="id" type="text" class="form-control" placeholder="ID" autocomplete="off" required data-msg="Please enter your ID" onkeydown="inputIdChk()">
                <br>
                <button type="button" class="btn btn btn-dark btn-sm" id="btncheck" style="float: right; height: 30px; display: flex; align-items:center;">아이디 중복확인</button>
                </div>
                 <span id="result"></span>
                <input type="hidden" id="idcheck" value="idUncheck"/>
              </div>
              
              <!-- 비밀번호 -->
           	  <div class="mb-3">
                <label class="form-label" for="password"> *Password</label>
                <input class="form-control" name="pwd" id="pwd" placeholder="Password" type="password" required data-msg="Please enter your password">
              </div>
              
              <!-- 생년월일 -->
              <div class="mb-3">
                <label class="form-label" for="birth"> *Date of Birth(YYYYMMDD)</label>
                <input class="form-control" name="birth" id="birth" placeholder="ex) 19961116" type="birth" required data-msg="Please enter your password">
              </div>
              
              <!-- 이메일 -->
              <div class="mb-3">
                <label class="form-label" for="email"> *Email Address</label>
                <input type="text" class="form-control" id="email" name="email" value="<%=sto.getEmail()%>" required="required" readonly>
              </div>
              
              <!-- 비밀번호 확인 질문 -->
              <div class="mb-3">
                <label class="form-label" for="pwdhint"> *비밀번호 확인 질문</label>
                <div class="mb-3">
                <select class="form-select" name="hint">
                  <option value="1">자신의 보물 1호는?</option>
                  <option value="2">내가 어릴적 살던 동네이름은?</option>
                  <option value="3">내가 제일 좋아하는 과자이름은?</option>
                  <option value="4">가장 기억에 남는 선생님 성함은?</option>
   				</select>
              	</div>
              </div>
              
              <!-- 비밀번호 확인 답변 -->
              <div class="mb-3">
              	<label class="form-label" for="pwdanswer"> *비밀번호 확인 답변</label>
                <input class="form-control" name="answer" id="answer" type="text" autocomplete="off" required data-msg="Please enter your answer">
              </div>
              
              <!-- 성별 -->
              <div class="mb-3">
                <label class="form-label" for="gender"> *Gender</label>
                <div class="form-check">
                  <input class="form-check-input" name="gen" value="남" type="radio">
                  <label class="form-check-label text-muted"><span class="text-sm">남</span></label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" name="gen" value="여" type="radio">
                  <label class="form-check-label text-muted"><span class="text-sm">여</span></label>
                </div>
              </div>
              
              <!-- 약관동의 -->
              <div class="mb-4">
                <label class="form-label" for="loginUsername"> *이용약관 동의</label>
	                  <div class="container mb-2">
						  <form>
						    <div class="form-group">
						      <textarea class="form-control" rows="7" id="" style="background-color: white" readonly>제1장 총칙&#13;&#10;제1조. 목적&#13;&#10; 본 약관은 I Camp Do It(이하 "아이캠두잇")이 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 아이캠두잇의 권리, 의무, 책임사항과 기타 필요한 사항을 규정합니다.&#13;&#10;제2조. 용어의 정의&#13;&#10;본 약관에서 사용하는 용어의 정의는 다음과 같습니다.&#13;&#10;...</textarea>
						    </div>
						  </form>
	                  </div>    			  
      			<div class="form-check">
                  <input class="form-check-input" id="info" type="checkbox" name="info">
                  <label class="form-check-label text-muted"> <span class="text-sm">[필수] 이용약관에 동의합니다.</span></label>
                </div>
              </div>
              <div class="d-grid gap-2">
                <button id="sbtn" class="btn btn-lg btn-primary">Sign up</button>
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
<!-- jQuery-->
<script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
		<script type="text/javascript">
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
		 injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
		</script>
		<script>
		
		
		
		 window.onload = function() {
	    		document.getElementById( 'sbtn' ).onclick = function() {
	    			// 데이터 전송
	    			if( document.sfrm.info.checked == false ) {
					alert( '동의하셔야 합니다.' );
					return false;
					}
					//alert( '정상' );
					if( document.sfrm.name.value.trim() == '' ) {
						alert( '이름을 입력해 주세요.' );
						return false;				
					}
					if( document.sfrm.id.value.trim() == '' ) {
						alert( '아이디를 입력해 주세요.' );
						return false;				
					}
					if( document.sfrm.pwd.value.trim() == '' ) {
						alert( '비밀번호를 입력해 주세요.' );
						return false;				
					}
					if( document.sfrm.birth.value.trim() == '' ) {
						alert( '생년월일을 입력해 주세요' );
						return false;				
					}
					if( document.sfrm.email.value.trim() == '' ) {
						alert( '이메일을 입력해 주세요' );
						return false;				
					}
					if( document.sfrm.answer.value.trim() == '' ) {
						alert( '비밀번호 확인 답변을 입력해 주세요' );
						return false;				
					}
					if( document.sfrm.gen.value.trim() == '' ) {
						alert( '성별을 체크해 주세요' );
						return false;				
					}if( document.sfrm.idcheck.value != 'idChecked' ) {
						alert( '아이디 중복체크를 해주세요' );
						return false;				
					}

	    			document.sfrm.submit();
	    			
	    		};
	    	};
</script>
<script>
			
	    	$(document).on("click", "#btncheck", function () {		
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
