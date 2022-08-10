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
	int cpage = (Integer)request.getAttribute("cpage");

	
%>

<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>I CAMP DO IT</title> 
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
 
 <script type="text/javascript">  
	window.onload = function() {
		document.getElementById( 'wbtn' ).onclick = function() {

			var subject = afrm.subject.value;
	     	var title = afrm.title.value;
	     	var content = afrm.content.value;
	     	console.log(subject);
	     	console.log(title);
	     	
	     	//var postData = {'subject' : subject , 'title' : title , 'content' : content};
     	
			if(subject.trim() == '') {
				alert( '말머리를 선택하셔야 합니다.' );
				return false;
			}
			if(title.trim() == '') {
				alert( '제목을 입력하셔야 합니다.' );
				return false;
			}
			if(content.trim() == '') {
				alert( '내용을 입력하셔야 합니다.' );
				return false;
			}
			 
			document.afrm.submit();
		};	
	};	
</script> 

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
			<!-- 원래 div 태그 있던 위치...  -->
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
		  		
	</aside>
		  <div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main"></div>
		  <!-- ㄴ 이게 문제의 그 태그...ㅠㅠ -->

 			
	<!-- Write Section-->
	<div class="main-content px-5">
		<!-- <div class="container-fluid px-2 px-md-4 py-2"> -->
		
		  <form action="./aboardwrite_ok.do" method="post" id="afrm" name="afrm" enctype="multipart/form-data">
		  <input type="hidden" name="writeOk" id="writeOk" value="default"/>
		  <input type="hidden" name="filesize" id="filesize" value="0000"/>
		  <input type="hidden" name="vcode" id="vcode" value="default"/>
	
			<div class="card my-2 px-5 justify-content-center">
				<div class="card-header p-0 position-relative mt-4 mx-2 z-index-2">
					<div
						class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3 px-5">
						<select id="subject" name="subject" class="customSelect" >
							<option value="default" href="#">말머리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							<option value="1" href="#">자유</option>
							<option value="2" href="#">후기</option>
							<option value="3" href="#">중고</option>
							<option value="4" href="#">혼캠</option>
							<option value="5" href="#">공지</option>
						</select>
					</div>
				</div>
				<div class="card-body px-0 pb-2">
					<div class="table-responsive px-5">
						<div class="input-group input-group-outline pb-3 ">
							<input class="form-control" id="title" name="title" type="title" placeholder="제목을 입력해주세요." />
						</div>
						<textarea id="summernote" name="content"></textarea>
					</div>
				</div>
				<div class="row">
				  <div class="col-lg-8">
			        <input type="button" value="목록" class="btn btn-success" style="cursor: pointer;" onclick="location.href='admin_board.do'" />
			      </div>
			      <div class="col-lg-4 text-lg-end">
			        <input type="button" value="등록" id="wbtn" class="btn btn-success" style="cursor: pointer;" onclick="location.href='aboardwrite_ok.do'" /> 
			        <input type="button" value="취소" id="cbtn" class="btn btn-success" style="cursor: pointer;" onclick="location.href='/admin_board.do'" />
			      </div>
				</div>
			</div>
		  </form>
		</div>
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
    
/* 	document.getElementById( 'cbtn' ).onclick = function() {
		
		
		$.ajax({
			data : {filename: $('#writeOk').val()},
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
	 */
	
	
	$(document).ready(function() {
		let date = new Date().getTime().toString(36);
		$('#vcode').val(date);

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

			callbacks: { //이미지를 첨부하는 부분
				onImageUpload : function(files, editor, welEditable) {
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], editor, welEditable);
					}										            
				}					 
			}
        });
	});
	
	// 이미지 파일 업로드
	function sendFile(file, editor, welEditable) {
		var imgUrl = './upload/';
		var data = new FormData();
		data.append('image', file);
		$.ajax({
			data : data,
			type : "POST",
			url : '/aimageUpload.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(result) {
				console.log(result);
				let str= result.split('@');
				
				imgUrl = imgUrl + str[0];
				
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