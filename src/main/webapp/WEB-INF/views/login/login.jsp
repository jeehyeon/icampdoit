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
            <div class="mb-5"><img class="img-fluid mb-3" src="./resources/bootstrap-5/html/img/logo2.svg" alt="..." style="max-width: 4rem;">
              <h2>LOGIN</h2>
            </div>
            
            <!-- 로그인시작 -->
            <form class="login form-validate" action="login_ok.do" method="post">
              <!-- 아이디 -->
              <div class="mb-4">
                <div class="row">
                  <div class="col">
                    <label class="form-label" for="loginUserID"> ID</label>
                  </div>
                  <div class="col-auto"><a id="forgotid" class="form-text small text-primary" href="#" data-bs-toggle="modal" data-bs-target="#FindID">Forgot ID?</a></div>
                </div>
                <input class="form-control" name="id" id="id" type="ID" placeholder="ID" autocomplete="off" required data-msg="Please enter your ID">
              </div>
              <!-- 비밀번호 -->
              <div class="mb-4">
                <div class="row">
                  <div class="col">
                    <label class="form-label" for="loginPassword"> Password</label>
                  </div>
                  <div class="col-auto"><a class="form-text small text-primary" href="#" data-bs-toggle="modal" data-bs-target="#FindPwd">Forgot password?</a></div>
                </div>
                <input class="form-control" name="pwd" id="pwd" placeholder="Password" type="password" required data-msg="Please enter your password">
              </div>
              
              <!-- Submit-->
              <div class="d-grid">
                <button class="lbtn btn btn-lg btn-primary">Sign in</button>
              </div>
              <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
              
              
              <hr class="my-4">
              <p class="text-center"><small class="text-muted text-center">Don't have an account yet? <a href="signup.do">Sign Up</a></small></p>
            </form>
            <div class="d-grid gap-2" name="kakao_frm">             		
              		<a id="custom-login-btn" href="javascript:loginWithKakao()">
				  		<img src="./resources/bootstrap-5/html/img/kakao_login.png"
				    	width="300"
				    	alt="카카오 로그인 버튼" />
				  	</a>

				  	<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
				  	<button class="api-btn" onclick="kakaoUnlink()">카카오탈퇴</button>   
              </div>
              <div>
              		<form id="kakao_frm" method="post" action="./kakaologin_form.do" name="kakao_frm">
				  	<input type="hidden" name="kakaoemail" id="kakaoemail" />
				  	<input type="hidden" name="kakaonickname" id="kakaonickname" />
				  	<input type="hidden" name="kakaokid" id="kakaokid" />
				  	</form>
              </div>
            <a class="close-absolute me-md-5 me-xl-6 pt-5" href="./home.do"> 
              <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg></a>
          </div>
        </div>
        
        <!-- 아이디 찾기 모달 -->
	    <div class="modal fade" id="FindID" role="dialog">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="font-family: 'Recipekorea';">아이디 찾기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>  
		          <div class="form-group">
		            <label for="name" class="col-form-label"><b>이름</b></label>
		            <input type="text" class="form-control" id="idname">
		          </div>
		          <div class="form-group">
		            <label for="birth" class="col-form-label"><b>생년월일(YYYYMMDD)</b></label>
		            <input type="text" class="form-control" id="idbirth" placeholder="ex) 19961116">
		          </div>
		          <div class="form-group">
		            <label for="email" class="col-form-label"><b>이메일</b></label>
		            <input type="text" class="form-control" id="idemail"  placeholder="name@address.com">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button id="idbtn2" type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
		        <button id="idbtn" type="button" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 아이디 알려주는 모달 -->
	    <div class="modal fade" id="FindID2" role="dialog">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="font-family: 'Recipekorea';">아이디 찾기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>  
		          <div class="form-group">
		            <p>회원님의 아이디는 <b>soye**</b> 입니다.</p>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        <!-- 비밀번호 찾기 모달 -->
	    <div class="modal fade" id="FindPwd" role="dialog">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="font-family: 'Recipekorea';">비밀번호 찾기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>  
		          <div class="form-group">
		            <label for="name" class="col-form-label"><b>이름</b></label>
		            <input type="text" class="form-control" id="pname">
		          </div>
		          <div class="form-group">
		            <label for="id" class="col-form-label"><b>아이디</b></label>
		            <input type="text" class="form-control" id="pid">
		          </div>
		          <div class="form-group">
		            <label for="email" class="col-form-label"><b>이메일</b></label>
		            <input type="text" class="form-control" id="pemail">
		          </div>
		          <!--  
		          <div class="form-group">
		            <label for="birth" class="col-form-label"><b>생년월일(YYYYMMDD)</b></label>
		            <input type="text" class="form-control" id="birth" placeholder="ex) 19961116">
		          </div>
		          -->
		          <div class="form-group">
		            <label class="form-label" for="pwdhint"> *비밀번호 확인 질문</label>
	                <div class="mb-3">
	                <select class="form-select" name="phint" id="phint">
	                  <option value="1">자신의 보물 1호는?</option>
	                  <option value="2">내가 어릴적 살던 동네이름은?</option>
	                  <option value="3">내가 제일 좋아하는 과자이름은?</option>
	                  <option value="4">가장 기억에 남는 선생님 성함은?</option>
	   				</select>
              		</div>
		            <input type="text" class="form-control" id="panswer">
		          </div>
		        </form>
		        <form action="./newpwd.do" id="resform" name="resform" method="post">
		        <input type="hidden" name="resultpwd" id="resultpwd" value=""/>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
		        <button id="pbtn" type="button"  class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 비밀번호 재설정 모달 -->
	    <div class="modal fade" id="NewPwd" role="dialog">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" style="font-family: 'Recipekorea';">비밀번호 재설정</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>  
		          <div class="form-group">
		            <label for="newpwd" class="col-form-label"><b>새로운 비밀번호</b></label>
		            <input type="text" class="form-control" id="pwd">
		          </div>
		          <div class="form-group">
		            <label for="newpwd" class="col-form-label"><b>비밀번호 확인</b></label>
		            <input type="text" class="form-control" id="pwd" placeholder="비밀번호를 한번 더 입력하세요.">
		          </div>
		          <!--  
		          <div class="form-group">
		            <label for="birth" class="col-form-label"><b>생년월일(YYYYMMDD)</b></label>
		            <input type="text" class="form-control" id="birth" placeholder="ex) 19961116">
		          </div>
		          -->
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary">확인</button>
		      </div>
		    </div>
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

    </script>
    <script type="text/javascript">
 	//아이디 찾기 부분
    $("#idbtn").click(function(){
    	var name = $('#idname').val();
     	var birth = $('#idbirth').val();
     	var email = $('#idemail').val();
     	var postData = {'name' : name , 'birth' : birth , 'email' : email};
    	
    	
	     if($('#idname').val() != ''){	        
	        $.ajax({ 	   					
	            type: 'POST',
	            url: './idsearch.do',
	            data: postData,
	            dataType: 'text',
	            success: function(result) {
	            	if(result != 0){
		            	var str = result.substring(0, result.length -2);
		                alert("회원님의 아이디는 "+ str + "입니다.");
	            	}else{
	            		alert("회원님의 정보가 없습니다.");
	            	};
	              
	            },
	            error: function(a, b, c) {
	                console.log(a, b, c);
	            }				
	        });
	    	 
	    } else {
	        alert('빈칸을 모두 입력해주세요.');
	        $('#idname').focus();
	    } 				
	});
	//비밀번호 찾기 부분
	$("#pbtn").click(function(){
    	var name = $('#pname').val();
     	var id = $('#pid').val();
     	var email = $('#pemail').val();
     	var hint = $("#phint option:selected").val();
     	console.log(hint);
     	var answer = $('#panswer').val();
     	var postData = {'name' : name , 'id' : id , 'email' : email, 'hint' : hint, 'answer' : answer};
    	
    	
	     if(($('#pname').val() != '')&&($('#pid').val() != '')&&($('#pemail').val() != '')&&($('#panswer').val() != '')){	        
	        $.ajax({ 	   					
	            type: 'POST',
	            url: './pwdcheck.do',
	            data: postData,
	            dataType: 'text',
	            success: function(result) {
	            	if(result != -1){
	            		
		                $('#resultpwd').val(result);
		               
		               	$('#resform').submit();
		                
	            	}else{
	            		alert("회원님의 정보가 없거나 입력사항이 틀립니다.");
	            	};
	              
	            },
	            error: function(a, b, c) {
	                console.log(a, b, c);
	            }				
	        });
	    	 
	    } else {
	        alert('빈칸을 모두 입력해주세요.');
	        $('#idname').focus();
	    } 				
	});
	
	
	
	
	
    </script>
 	 <script type="text/javascript">
      
    	//카카오 초기화
    	Kakao.init('2dde53cc9d654a3a8d8b78783aa5cbfc');
    	console.log( Kakao.isInitialized() ); //초기화 판단 여부. console 에 true 나오면 됨.
    	
    	//데모버전으로 들어가서 카카오로그인 코드확인
		function loginWithKakao() {
			window.Kakao.Auth.login({
		      	success: function(authObj) {
		    	  	console.log( authObj ); //access 토큰값 출력		    	  	
		    	  	Kakao.Auth.setAccessToken(authObj.access_token ); //access 토큰값 저장
		    	  	
		    	  	//로그인 성공시, API 호출
		    	    //access 토큰을 발급받고, 아래 함수 호출시켜 사용자 정보를 받아오기
		    	  	Kakao.API.request({
		    			url: '/v2/user/me',
		    			success: function(res){
		    				var nickname = res.kakao_account.profile.nickname;
		    				var email = res.kakao_account.email;
		    				var kid = res.id;
		    				
		    				console.log(res);
		    				//alert(kid);
		    				//alert(JSON.stringify(res));
		    				//alert(JSON.stringify(authObj));
		    				//console.log( authObj.acces_token);
		    				
		    				console.log( email );
		    				//console.log( res.kakao_account.profile.nickname );
		    				$( '#kakaonickname' ).val( nickname );
		    				$( '#kakaoemail' ).val( email );
		    				$( '#kakaokid' ).val( kid );
		    				
		    				//$('#kakaoemail').val(res.kakao_account.profile.email);
		    				//$('#kakaonickname').val(res.kakao_account.profile.nickname);
		    				
		    				console.log( $('#kakaoemail').val() );
		    				console.log( $('#kakaonickname').val() );
		    				
		    				//document.kakao_frm.action
		    				//document.getElementById( 'kakao_frm' ).submit();
		    				
		    				$('#kakao_frm').submit();
		    				
		    				//ajax
		    				//카카오로그인 DB 만들어야 함. 비번은 랜덤으로..
		    			},
		    			fail: function(error){
		    				alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error) );
		    			}
		    	  	});
		      },
		      fail: function(err) {
		        console.log(err);
		      },
		    });
		}
    	
    	
    	//로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰 만료. 사용자 어플리케이션의 로그아웃은 따로 해야 함.
    	function kakaoLogout(){
    		if( !Kakao.Auth.getAccessToken() ){ //토큰이 있는지 확인. 없으면
    			alert( 'Not logged in' );
    			return;
    		}
    		Kakao.Auth.logout(function(){ //카카오 로그아웃
    			alert( 'logout ok\naccess token -> ' + Kakao.Auth.getAccessToken() );
    			
    		});
    	}
    	
    	
    	//연결 끊기 기능 - 탈퇴처리리는 직접 구현해야 함. 	
    	function kakaoUnlink(){
    		Kakao.API.request({
        		url: '/v1/user/unlink',
        		success: function(response) {
        			console.log( response );
        			callbackFunction();
        		},
        		fail: function(error){
        			alert('탈퇴처리가 미완료되었습니다. \n관리자에게 문의하시기 바랍니다.' );
        			console.log( error );
        		}
        	});
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