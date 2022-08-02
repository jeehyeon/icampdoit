<!--
=========================================================
* Material Dashboard 2 - v3.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>
    Material Dashboard 2 by Creative Tim
  </title>
  
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
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">

  <div class="sidenav-header" style="text-align:center" >
    <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
    <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
      
      <span class="ms-1 font-weight-bold text-white" >I CAMP DO IT<br/>administer</span>
    </a>
  </div>


  <hr class="horizontal light mt-0 mb-2">

  <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
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
  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    
    <!-- End Navbar -->
    <div class="container-fluid px-2 px-md-4 py-2">
      
      <div class="card my-2">
            <div class="card-header p-0 position-relative mt-4 mx-3 z-index-2">
              <div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">글쓰기</h6>
              </div>
              
            </div>
            <div class="card-body px-0 pb-2">
             <div class="table-responsive p-1">
                <table class="table align-items-center mb-1">
                  <tr> 	
                  	<td>
                  	<div class="me-2 ms-6 mt-1" style="float:left">
					<select name="sort"
						id="form_sort" class="customSelect">
						<option value="sortBy_default" href="#">말머리</option>
						<option value="sortBy_0" href="#">공지</option>
						<option value="sortBy_1" href="#">혼캠</option>
						<option value="sortBy_2" href="#">자유</option>
						<option value="sortBy_3" href="#">후기</option>
						<option value="sortBy_4" href="#">중고</option>
					</select>
				 </div>
            		<div class="input-group input-group-outline my-1 px-1 w-xxl-30">
						      <label class="form-label">제목을 입력하세요</label>
						      <input type="text" class="form-control">
					</div>
             
                  	</td>
                  </tr>          	
                    <tr>
                    	
                      <td>
                      <div class="mx-6">
                       <div id="summernote"></div>
                       </div>
                      </td>
                    </tr> 
                     
                     <tr>
                      
                      <td>
                      	<button type="button" class="btn btn-warning float-end mx-1">취소</button>           
						<button type="button" class="btn btn-success float-end mx-1">등록</button>
                      </td>
                     
                    </tr>   
                    
                  
                </table>
              </div>
            </div>
 
          </div>
   	</div>
  </div>
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!--   Core JS Files   -->
  <script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
 
  <!-- summernote -->
  
  <script src="./resources/bootstrap-5/html/summernote/summernote-lite.js"></script>
  <script src="./resources/bootstrap-5/html/summernote/lang/summernote-ko-KR.js"></script>
  
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    
    $(document).ready(function() {   
    	$('#summernote').summernote({
        placeholder: 'Hello bootstrap 5',
        minHeight: null,
  		maxHeight: null,
        tabsize: 2,
        height: 550,
        width: 800,
        lang : 'ko-KR',
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체']
       	
        
      });
    });
    
    
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>