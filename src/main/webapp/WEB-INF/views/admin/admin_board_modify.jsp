<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.hboard.HBoardTO" %>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}
	int cpage = (Integer)request.getAttribute("cpage");
	
	String subjectValue = (String)request.getAttribute( "subjectValue" );
	
	HBoardTO to = (HBoardTO)request.getAttribute("hto");
	
	String seq = to.getSeq();
	String subject = to.getSubject();
	String writer = to.getWriter();
	String title = to.getTitle();
	String content = to.getContent();
	System.out.println( "내용 : "+to.getContent() );
	String wdate = to.getWdate();
	String hit = to.getHit();	
	String filename = to.getFilename();
	
%>

<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>I Camp Do It Administrator</title>  
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-icons.css" rel="stylesheet" />
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="./resources/bootstrap-5/html/admin/css/material-dashboard.css?v=3.0.4" rel="stylesheet" /> 
  <link rel="stylesheet" href="./resources/bootstrap-5/html/summernote/summernote-lite.css" /> 
</head>

<body class="g-sidenav-show  bg-gray-200">
	<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark" id="sidenav-main">
		<div class="sidenav-header" style="text-align: center">
			<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> 
			<a class="navbar-brand m-0" href="./admin.do" target="_blank"> 
			  <span class="ms-1 font-weight-bold text-white">I CAMP DO IT<br />administer </span>
			</a>
		</div>
		<hr class="horizontal light mt-0 mb-2">
		 <div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main">
		  <ul class="navbar-nav">		  
	    	<li class="nav-item">
 				<a class="nav-link text-white " href="./admin.do">   
     				<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
      				 <i class="material-icons opacity-10">dashboard</i>
     				</div>   
				<span class="nav-link-text ms-1">관리자 홈</span>
			  </a>
			</li>						
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_users.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">person</i>
			      </div>			    
			    <span class="nav-link-text ms-1">회원 관리</span>
			  </a>
			</li>			  
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_board.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">table_view</i>
			      </div>			    
			    <span class="nav-link-text ms-1">게시판 관리</span>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link text-white " href="./home.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">assignment</i>
			      </div>			    
			    <span class="nav-link-text ms-1">사용자 페이지</span>
			  </a>
			</li>			  			
			<li class="nav-item">
			  <a class="nav-link text-white ">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">logout</i>
			      </div>			    
			    <span class="nav-link-text ms-1">Log out</span>
			  </a>
			</li>    
		  </ul>
		 </div>		
	</aside>
	
  <!-- Write Section-->
	<div class="main-content px-5">		
		  <!-- <form action="./aboardwrite_ok.do" method="post" id="afrm" name="afrm" enctype="multipart/form-data"> -->
		  <input type="hidden" name="writeOk" id="writeOk" value="default"/>
		  <input type="hidden" name="filesize" id="filesize" value="0000"/>
		  <input type="hidden" name="vcode" id="vcode" value="default"/>
	
			<div class="card my-2 px-5 justify-content-center">
				<div class="card-header p-0 position-relative mt-4 mx-2 z-index-2">
					<div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3 px-5">
					   <h6 class="text-white text-capitalize ps-3">글 수정</h6>
					</div>
				</div>
				<div class="card-body px-0 pb-2">
					<div class="table-responsive px-5">
						<div class="input-group input-group-outline pb-3 ">
							<input class="form-control" value="<%=title %>" id="title" name="title" type="title" placeholder="제목을 입력해주세요." />
						</div>
						<textarea id="summernote" name="content"><%=content %></textarea>
					</div>
				</div>
                 <input type="hidden" name="seq" value="<%=seq%>" />   
                 <input type="hidden" name="cpage" value="<%=cpage%>"/>  
                 <input type="hidden" id="filename" name="filename" value="<%=filename%>"/>  
				<div class="row">
				  <div class="col-lg-8">
			        <input type="button" value="목록" class="btn btn-success" style="cursor: pointer;" onclick="location.href='admin_board.do?subjectValue=<%=subjectValue%>&cpage=<%=cpage %>'" />
			      </div>
			      <div class="col-lg-4 text-lg-end">
			        <input type="button" value="수정" id="mbtn" class="btn btn-success" style="cursor: pointer;" onclick="location.href='admin_board_modify_ok.do'" /> 
			        <input type="button" value="취소" id="cbtn" class="btn btn-success" style="cursor: pointer;" onclick="location.href='/admin_board.do?subjectValue=<%=subjectValue%>&cpage=<%=cpage %>'" />
			      </div>
				</div>
			</div>
		  <!-- </form> -->
		</div>
  <!--   Core JS Files   -->
	<script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
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
	<script> var basePath = '' </script>
	<!-- Main Theme JS file    -->
	<script src="./resources/bootstrap-5/html/js/theme.js"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- summernote -->
	<script src="./resources/bootstrap-5/html/summernote/summernote-lite.js"></script>
	<script src="./resources/bootstrap-5/html/summernote/lang/summernote-ko-KR.js"></script>

	<script>    
	
 	document.getElementById( 'cbtn' ).onclick = function() { 		
 		var subject = $('#subject').val();
 		var filename = $('#writeOk').val();
 		
	    var data = {'subject' : subject , 'filename' : filename };	    	
 		
		$.ajax({
			data : data,
			type : "GET",
			url : '/awritecancel.do',
			success : function() {
				location.href='/admin_board.do';
			},
			error: function() {
	        	alert('error, 에러');
	        }
		});
	}
	 
       document.getElementById( 'mbtn' ).onclick = function() {	
		 var subject = $('#subject').val();
		 var title = $('#title').val();
		 var content = $('#summernote').val();
		 var vcode = $('#vcode').val();
		 var filename = $('#writeOk').val();
		 var filesize = $('#filesize').val();
		 		 
	     var data = {'subject' : subject , 'title' : title , 'content' : content, 'vcode' : vcode, 'filename' : filename, 'filesize' : filesize};	    	

	     if(($('#subject').val() != '')&&($('#title').val() != '')&&($('#summernote').val() != '')){	        
					
			$.ajax({
				data : data,				
				type : "POST",
				url : './admin_board_modify_ok.do',
				dataType : 'text',
				success : function(flag) {					
					
					if( flag == "0" ) {
						alert('글쓰기 성공');
						location.href='/admin_board.do';
					} else {
						alert('글쓰기 실패');
						history.back();
					}
				},
				error: function(request, status, error) {
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		        }
			});
	     } else {
		        alert('말머리를 선택하고 빈칸을 모두 입력해주세요.');
		        $('#subject').focus();
		 } 
	   }
	
	$(document).ready(function() {
		let date = new Date().getTime().toString(36);
		$('#vcode').val(date);
		console.log("date : " +date);
		var imgUrl = './h_upload/';
		var mimgUrl = imgUrl + $('#filename').val()
		console.log("filename : "+ mimgUrl);

		var fontList = ['맑은 고딕','굴림','돋움','바탕','궁서','NotoSansKR','Arial','Courier New','Verdana','Tahoma'];
		$('#summernote').summernote({
			placeholder : '내용을 입력해주세요. (이미지는 1장만 업로드 가능합니다.)',
			minHeight : null,
			maxHeight : null,
			tabsize : 2,
			height : 550,
			width : 1100,
			lang : 'ko-KR',
			fontNames: fontList,
			maximumImageFileSize: 10485760,
            fontNamesIgnoreCheck: fontList,
			toolbar: [
                ['style', ['style']],
                ['font', ['fontname','fontsize']],
                ['fontstyle', ['bold','italic','underline','strikethrough','forecolor','backcolor','color','clear']],
                ['paragraph', ['paragraph','height','ul','ol']],
                ['insert', ['table','hr','link','picture']],
                ['view', ['codeview', 'help']]
            ],
            

			/* callbacks: { //이미지를 첨부하는 부분
				onImageUpload : function(files, editor, welEditable) {					
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], editor, welEditable);
					}
					
				}
				//function modifyImage(files, editor, welEditable);
			} */
        });
		$('#summernote').summernote('focus');
	});
	
	function modifyImage(files, editor, welEditable) {
		var imgUrl = './h_upload/';
		<%-- imgUrl = imgUrl + <%=filename%>; --%>
		var mimgUrl = imgUrl + $('#filename').val()
		console.log("filename : "+mimgUrl);
		$('#summernote').summernote( 'insertImage', mimgUrl );
	}
	
	
	// 이미지 파일 업로드
	function sendFile(file, editor, welEditable) {
		var imgUrl = './h_upload/';
		var data = new FormData();
		data.append('image', file);
		$.ajax({
			data : data,
			type : "POST",
			url : '/amodify_image.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(result) {
				console.log("result : "+result);
				let str= result.split('@');
								
				imgUrl = imgUrl + str[0];
				console.log("imgUrl : "+imgUrl);				
				
				$('#summernote').summernote( 'insertImage', imgUrl );
				
				if(str[0] != null){
            				               
					$('#writeOk').val(str[0]);
					$('#filesize').val(str[1]);
	                
            	}else{
            		alert("error");
            	};
			},
			error: function() {
	        	alert('error, 이미지 사이즈는 10MB 미만이어야 합니다.');
	        }
		});
	}
	    
  </script>
    
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>