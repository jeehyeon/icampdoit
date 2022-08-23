<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.exam.mboard.CmtTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.mboard.BoardDAO" %>
<%@ page import="com.exam.mboard.BoardTO" %>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}
	
	//view
	BoardTO to = (BoardTO)request.getAttribute( "to" );

	String seq = to.getSeq();
	String subject = to.getSubject();
	String writer = to.getWriter();
	String title = to.getTitle();
	String content = to.getContent();
	String wdate = to.getWdate();
	String hit = to.getHit();
	int viewUcode = to.getUcode();
	
	int cpage = (Integer)request.getAttribute("cpage");
	int subjectValue = (Integer)request.getAttribute( "subjectValue" );
	System.out.println("view페이지 subjectValue: "+subjectValue);
	System.out.println("view페이지 session id : "+id);
	System.out.println("view페이지 seq : "+seq);
		
	//cmt
	ArrayList<CmtTO> cmtArr = (ArrayList<CmtTO>)request.getAttribute("cmtArr");
	StringBuilder cmtHtml= new StringBuilder();
	for(CmtTO cto : cmtArr){
		String deldata = "{\"seq\":\"" +cto.getSeq() + "\",\"ucode\":\""+ cto.getUcode()+"\"}";
		System.out.println("deldata : "+ deldata);
		cmtHtml.append("<div class=\"row\">");
		cmtHtml.append("<div class=\"col-9\"><strong>"+cto.getWriter() +"</strong></div>");
		cmtHtml.append("<input type=\"button\" class=\"dbtn btn btn-outline-primary col-1 ms-auto\" align=\"right\" value=\"삭제\" deldata="+deldata+">");
		cmtHtml.append("<div>");
		cmtHtml.append("<p class=\"text-uppercase text-sm text-muted\"><i class=\"far fa-clock\"></i>"+cto.getWdate() +"</p>");
		cmtHtml.append("<p class=\"text-muted\" style=\"font-family: \"BMJUA\";\">"+ cto.getContent() +"</p>");
		cmtHtml.append("</div>");
		cmtHtml.append("</div>");
		cmtHtml.append("<hr/>");
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
    <!-- Font Awesome 이거 추가함 -->
    <script src="https://kit.fontawesome.com/5251502df3.js" crossorigin="anonymous"></script>   
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
    <link rel="shortcut icon" href="./resources/bootstrap-5/html/img/logo2.svg">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- Sweet Alert -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  	<style type="text/css">
  		#wrap {
  			min-height: 90vh;
		  	display: flex;
		  	flex-direction: column;
  		}
  		#footer {
    		margin-top: auto;
  		}
  	</style>
  </head>
  <body style="padding-top: 72px;">
  	<div id="wrap">
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
             	<input type="hidden" id="ucode" val="<%=ucode%>"/> 
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./logout.do'">Logout</button>
             	<%};%>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    
    <!-- Hero Section-->
    <section class="pt-7 pb-6 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('./resources/bootstrap-5/html/img/photo/camping-bg1.jpg');">
      <div class="container overlay-content">
        <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
          <div class="text-white mb-4 mb-lg-0">
            <h1 class="text-shadow verified"><%=title %></h1>
            <div>
             <span><i class="fa-solid fa-user text-primary"></i> <%=writer %></span>&nbsp;&nbsp;
             <span><i class="fa-solid fa-calendar text-primary"></i> <%=wdate %></span>&nbsp;&nbsp;
             <span><i class="fa-solid fa-check-to-slot text-primary"></i> 조회수 <%=hit %></span>
             <input type="hidden" id="viewUcode" name="viewUcode" value="<%=viewUcode%>"/>
             <input type="hidden" id="viewSeq" name="viewSeq" value="<%=seq%>"/>
             <input type="hidden" id="subjectValue" name="viewSeq" value="<%=subjectValue%>"/>
             <input type="hidden" id="cpage" name="viewSeq" value="<%=cpage%>"/>
            </div>
          </div>        
        </div>
      </div>
    </section>
    <section class="py-6">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <!-- About Listing-->
            <div class="text-block">
              <p class="text-muted"> <%=content %> </p>
              <p></p>
            </div>

             <!-- comments-->
             <div id="cmtbody" class="mt-5">             
              
              <%=cmtHtml.toString() %>
              <!-- /comment--> 
              <!-- comment
              <div class="row">
               <div class="col-9"><strong>hong gil dong</strong></div>
               <div class="col-3" align="right"><a class="btn btn-outline-primary" href="" onclick="" >삭제</a></div>
               <div>
                  <p class="text-uppercase text-sm text-muted"><i class="far fa-clock"></i> 2022-07-30</p>
                  <p class="text-muted" style="font-family: 'BMJUA';">댓글 내용 입니다. 댓글 내용 입니다. 댓글 내용 입니다. 댓글 내용 입니다. 댓글 내용 입니다.</p> 
               </div>
              </div>
              <hr>-->
              <!-- /comment-->                       
            </div>           
            <!-- /comments-->
            
            <!-- comment form-->
            <div class="mb-6">
              <div class="collapse.show" id="leaveComment"> 
                <form class="form" id="comment-form" method="post" onsubmit="return false">
                <input type="hidden" name="ucode" value="<%=ucode%>"/>
                <input type="hidden" name="id" value="<%=id%>"/>
                <input type="hidden" name="seq" value="<%=seq%>"/>                   
                  <div class="mb-4">
                     <label class="form-label" for="comment"> <span class="required"></span></label>
                     <textarea class="form-control" name="comment" id="comment" rows="3" placeholder="내용을 입력해주세요." required data-msg="Please enter your comment"></textarea>
                     </div>                    
                    <div class="btn btn-outline-primary" onclick="cmtInsert()" style="float: right;"><i class="far fa-comment"></i>등록하기</div>                   
                </form>
              </div>
            </div>
            <hr>
            <!-- /comment form-->
        
            <div class="row">
			  <div class="col-lg-8">
				<input type="button" value="목록" class="btn btn-primary" style="cursor: pointer;" onclick="location.href='mboardlist.do?subjectValue=<%=subjectValue%>&cpage=<%=cpage%>'" />
			  </div>
			  <div class="col-lg-4 text-lg-end">
				<input type="button" value="수정" id="view-mbtn" class="btn btn-primary" style="cursor: pointer;" />
				<input type="button" value="삭제" id="view-dbtn" name="view-dbtn" class="btn btn-primary" style="cursor: pointer;" />				
			  </div>
            </div>                       
          </div>
        </div>
      </div>
    </section>
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
    <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
   window.onload =function(){
	   
	   const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 3000,
		    timerProgressBar: false,
		    didOpen: (toast) => {
		        toast.addEventListener('mouseenter', Swal.stopTimer)
		        toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		})
	   
	 //게시글 수정 버튼
	   $("#view-mbtn").on("click", function(){
		 	var modifyUcode = $("#viewUcode").val();
		 	var subjectValue = $("#subjectValue").val();
		 	var seq = $("#viewSeq").val();
		 	var cpage = $("#cpage").val();
 			var sessionUcode = <%=(Integer)session.getAttribute("ucode")%>;
 			
			   
				   if(modifyUcode == sessionUcode){
	 	  				location.href='./mboardmodify.do?subjectValue='+ subjectValue +'&cpage='+ cpage+'&seq='+seq+'&modifyUcode='+modifyUcode;
	 			} else {

	 				Toast.fire({
	 				    icon: 'warning',
	 				    title: '수정 권한이 없습니다.'
	 				})
	 			}
			   
	  })
	 
	   
	   
	   //게시글 삭제 버튼
	    $("#view-dbtn").on("click", function(){
		 	var viewUcode = $("#viewUcode").val();
  			var viewSeq = $("#viewSeq").val();
  			var sessionUcode = <%=(Integer)session.getAttribute("ucode")%>;
  			console.log(sessionUcode);
  			Swal.fire({
  			   title: '게시글을 삭제 하시겠습니까?',
  			   text: ' ',
  			   icon: 'question',
  			   
  			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
  			   confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
  			   cancelButtonColor: '#343a40', // cancel 버튼 색깔 지정
  			   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
  			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
  			   
  			   reverseButtons: false, // 버튼 순서 거꾸로
  			   
  			}).then((result) => {
  			 
  			  if (result.isConfirmed) {
  				if(viewUcode == sessionUcode){
  	  				//삭제 진행
  	  				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
   
  	  				location.href='./mboarddelete_ok.do?viewseq='+ viewSeq;
   					}
					
  	  			}else{
  	  				//삭제 불가
  	  				Toast.fire({
	 				    icon: 'warning',
	 				    title: '삭제 권한이 없습니다.'
	 				})
  	  			}
  			    
  			  }
  			})
  			
	  })
	      
	   //댓글삭제버튼
	  $(".dbtn").on("click", function(){
		 	var replyseq = $(this).attr("deldata");
  			var sendData = {"replyseq": replyseq}
  			//console.log("댓글 데이터 : " + replyseq);
    		//console.log("댓글 데이터 테스트 : " + $(this).attr("value"));
  			cmtDelete(sendData);
	  })
   
   
    	function cmtDelete(sendData) {
    		
    		Swal.fire({
   			   title: '댓글을 삭제 하시겠습니까?',
   			   text: ' ',
   			   icon: 'question',
   			   
   			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
   			   confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
   			   cancelButtonColor: '#343a40', // cancel 버튼 색깔 지정
   			   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
   			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
   			   
   			   
   			}).then((result) => {
   			 
   			  if (result.isConfirmed) {
   	  				//삭제 진행
   	  				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	   	  				$.ajax({
	   	        			url: './cmtdelete.do',
	   	        			type: 'post',
	   	        			data : sendData,
	   	        			dataType : 'text',
	   	        			success: function(data){
	   	        				if(data == 0){
	   	        					//성공
	   	        					Swal.fire({
										title: '댓글을 삭제하였습니다.',     
										text:	' ', 
										icon:	'success',
										confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
										confirmButtonText: '확인', // confirm 버튼 텍스트 지정
										
									}).then((result) => {
										if (result.isConfirmed) {
							  				location.reload();
							  			 } 
							  		 })
							 				
	   	        					
	   	        				}else if(data == 2){
	   	        					//다른 사용자일떄
	   	        					Toast.fire({
					 				    icon: 'warning',
					 				    title: '삭제 권한이 없습니다.'
					 				});
	   	        				}else{
	   								//실패 
	   	        					Swal.fire({
										title: '댓글삭제에 실패하였습니다.',     
										text:	' ', 
										icon:	'warning',
										confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
										confirmButtonText: '확인' // confirm 버튼 텍스트 지정
	   	        					});
	   	        				}
	   	        			}, 
	   	        			fail: function(error){
	   	        				Toast.fire({
	   	 	 				    	icon: 'error',
	   	 	 				    	title: '댓글 삭제 실패'
	   	 	 					});
	   	        			}
	   	        		});
   	  			}	
   			  }
   			})
    		
    	}
   };
    	function cmtInsert() {
    		var formdata = $("#comment-form").serialize() ;
    		
    		
        		$.ajax({
        			url: './cmt_insert.do',
        			type: 'post',
        			data : formdata,
        			dataType : 'json',
        			success: function(data){
        				
        				Swal.fire({
							title: '댓글을 등록하였습니다.',     
							text:	' ', 
							icon:	'success',
							confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
							confirmButtonText: '확인', // confirm 버튼 텍스트 지정
						}).then((result) => {
							if (result.isConfirmed) {
				  				location.reload();
				  			 } 
				  		 })
        				
        			}, 
        			fail: function(error){
        				Swal.fire({
							title: '댓글등록 실패.',     
							text:	' ', 
							icon:	'warning'
       					});
        		}
        	});
    	}
  
    </script>
    
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
    <!-- Map-->
    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
    <!-- Available tile layers-->
    <script src="./resources/bootstrap-5/html/js/map-layers.js"> </script>
    <script src="./resources/bootstrap-5/html/js/map-detail.js"></script>
  </body>
</html>