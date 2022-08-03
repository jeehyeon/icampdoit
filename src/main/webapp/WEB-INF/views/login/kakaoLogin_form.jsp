<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String kakaoemail = request.getParameter( "kakaoemail" );
	String kakaonickname = request.getParameter( "kakaonickname" );
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
            <form action="./kakaoLogin_editForm_ok.do" method="post" name="sfrm" class="form-horizontal" enctype="multipart/form-data">
              <!-- 이름 -->
              <div class="mb-3">
                <label class="form-label" for="name"> *NAME</label>
                <input type="text" class="form-control" name="name" value="<%=kakaonickname%>" readonly>
              </div>
              
              <!-- 아이디 -->
              <div class="mb-4">
                <label class="form-label" for="id"> *ID</label>
                <div style="line-height:15%;">
                <input type="text" class="form-control" id="user_id" name="id" required="required">
                <br>
                <button type="button" class="btn btn btn-dark btn-sm" style="float: right; height: 30px; display: flex; align-items:center;">아이디 중복확인</button>
                </div>
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
                <input type="text" class="form-control" id="user_id" name="id" value="<%=kakaoemail%>" required="required" readonly>
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
                <input class="form-control" name="answer" id="answer" type="email" autocomplete="off" required data-msg="Please enter your answer">
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
                  <input class="form-check-input" id="" type="checkbox" name="info">
                  <label class="form-check-label text-muted"> <span class="text-sm">[필수] 이용약관에 동의합니다.</span></label>
                </div>
              </div>
              <div class="d-grid gap-2">
                <button id="sbtn" class="btn btn-lg btn-primary">Sign up</button>
              </div>
            </form>

			<div class="text-center">ICampDoIt 계정 회원이십니까? <a href="./login.do">ICampDoIt 계정으로 로그인 하기</a></div>
			<div class="text-center">ICampDoIt 계정으로 가입하시겠습니까? <a href="./signup.do">ICampDoIt 계정으로 가입 하기</a></div>
		</div>
	
		<script type="text/javascript">
		window.onload = function() {
			//id와pw 적합여부 검사(4~12자리, 영어대소문자, 숫자만 가능)
			let val = /^[a-zA-Z0-9]{4,15}$/		
			
			//생년월일 적합여부 검사
			let birth_val = /([0-9]{2}(0[1-9]{1}|1[0-2]{1})(0[1-9]{1}|[1,2]{1}[0-9]{1}|3[0,1]{1}))/g
			
			//이메일형식 적합여부 검사
			let mail_val = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
			
			//폰번호 적합여부 검사
			let phone_val = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/
			
			//형식검사하는 메서드
			function check( val, target ) {
				if( val.test( target ) ) {
					return true;
				}
			}
			
			
			//닉네임 중복 검사
			$( "#nick_id" ).blur( function() {
				var user_nick = $( "#nick_id" ).val();
				if( user_nick != '' ) {
					if( check( val, user_nick ) ) {
						$.ajax({
							url: './usingNick_chk.do?user_nick='+user_nick,
							type: 'GET',
							success: function( data ) {
								
								if( data == "0" ) {
									$( "#usingNick_chk" ).text( "사용할 수 있는 닉네임입니다." );
									$( "#usingNick_chk" ).css( "margin-left", "155px" );
									$( "#usingNick_chk" ).css( "color", "blue" );
									$( "#submit1" ).attr( "disabled", false );
								} else if( data == "1"  ) {
									$( "#usingNick_chk" ).text( "사용중인 닉네임입니다." );
									$( "#usingNick_chk" ).css( "margin-left", "155px" );
									$( "#usingNick_chk" ).css( "color", "red" );
									$( "#submit1" ).attr( "disabled", true );
								}
							},
							error: function() {
								console.log( "kakoLogin_editForm의 ajax 에러" )
							}
						})
					} else {
						$( "#usingNick_chk" ).text( "닉네임이 형식에 맞지않습니다." );
						$( "#usingNick_chk" ).css( "margin-left", "155px" );
						$( "#usingNick_chk" ).css( "color", "red" );
						$( "#user_nick" ).val( "" );
						$( "#submit1" ).attr( "disabled", true );
					}
					
				} else {
					$( "#usingNick_chk" ).text( "" );
				}
			})
			
			//생년월일 유효성검사
			$( "#user_birth" ).blur( function() {
				var user_birth = $( '#user_birth' ).val();
				
				if( user_birth.length != 6 || !check( birth_val, user_birth ) ) {
					$( "#birth_chk" ).text( "생년월일이 형식에 맞지않습니다." );
					$( "#birth_chk" ).css( "margin-left", "155px" );
					$( "#birth_chk" ).css( "color", "red" );
					$( '#user_birth' ).val( "" );
					$( "#submit1" ).attr( "disabled", true );
				} else {
					$( "#birth_chk" ).text( "" );
					$( "#submit1" ).attr( "disabled", false );
				}
			})
			
			//전화번호 유효성검사
			$( '#user_phone' ).blur( function() {
				var user_phone = $( '#user_phone' ).val();
				
				if( !check( phone_val, user_phone ) ) {
					$( "#phone_chk" ).text( "휴대폰번호가 형식에 맞지않습니다." );
					$( "#phone_chk" ).css( "margin-left", "155px" );
					$( "#phone_chk" ).css( "color", "red" );
					$( '#user_phone' ).val( "" );
					$( "#submit1" ).attr( "disabled", true );
				} else {
					$( "#phone_chk" ).text( "" );
					$( "#submit1" ).attr( "disabled", false );
				}
			})
			
			document.getElementById('submit1').onclick = function() {
				let id = document.sfrm.id.value.trim()
				let pwd = document.sfrm.pwd.value.trim()
				let mail = document.sfrm.mail.value.trim()
				let birth = document.sfrm.birth.value.trim()
				let phone = document.sfrm.phone.value.trim()
				
				if( birth == '' ) {
					alert( '생년월일을 입력하셔야 합니다.')
					return false;
				}
				if( phone == '' ) {
					alert( '핸드폰 번호를 입력하셔야 합니다.')
					return false;
				}
				if( document.sfrm.nick.value.trim() == '' ) {
					alert( '닉네임을 입력하셔야 합니다.')
					return false;
				}
				if(document.sfrm.info.checked == false) {
					alert('동의를 하셔야 합니다.');
					return false;
				}
				//파일형식 검사(사진파일만 가능)
				if ( document.sfrm.profile.value.trim() != '' ) {
					var fileValue = document.sfrm.profile.value.trim().split('\\');
					var filename = fileValue[fileValue.length-1];
					var fileEname = filename.substring(filename.length-4, filename.length);
					if ( fileEname == '.jpg' || fileEname == '.png' || fileEname == '.gif' || fileEname == '.GIF' || fileEname == '.PNG' || fileEname == '.JPG' ) {} 
					else {
						alert( '사진파일만 첨부해주세요.(jpg, png, gif)' );
						document.sfrm.profile.value = '';
						return false;
					}
				}
				document.sfrm.submit();
			};
			
			//개인정보방침보이는 modal창 설정
			$( '#dialog' ).dialog({
				width: 700,
				height: 500,
				autoOpen: false,
				modal: true,
				resizable: false,
				buttons: {
					'확인': function() {
						$( this ).dialog( 'close' );
					}
				},
				show: {
					effect: 'blind',
					duration: 1000
				},
				hide: {
					effect: 'blind',
					duration: 1000
				}
			})
		};
		
		//개인정보방침 modal창 띄우기
		function agree() {
			$( '#dialog' ).dialog( 'open' );
		}
		
		
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
