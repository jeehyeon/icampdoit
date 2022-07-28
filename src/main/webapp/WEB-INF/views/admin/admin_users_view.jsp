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
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/admin/img/favicon.png">
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
</head>

<body class="g-sidenav-show bg-gray-200">
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
  <a class="nav-link text-white " href="./admin_board.do">
    
      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
        <i class="material-icons opacity-10">assignment</i>
      </div>
    
    <span class="nav-link-text ms-1">사용자 페이지</span>
  </a>
</li>
  

<li class="nav-item">
  <a class="nav-link text-white " >
    
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
    <div class="container-fluid px-2 px-md-4">
      <div class="page-header min-height-300 border-radius-xl mt-2" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
        <span class="mask  bg-gradient-secondary  opacity-6"></span>
        
      </div>
      <div class="card my-2">
            <div class="card-header p-0 position-relative mt-4 mx-3 z-index-2">
              <div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">회원 목록</h6>
                
	                
			
              </div>
              
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-1">
                <table class="table align-items-center mb-1">
                  
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">아이디 :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						      <label class="form-label">testID</label>
						      <input type="text" class="form-control" disabled/>
						    </div>
                        </div>
                      </td>
                    </tr> 
                     <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">이름  :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						      <label class="form-label">홍길동</label>
						      <input type="text" class="form-control">
						    </div>
                        </div>
                      </td>
                    </tr>  
                     <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">이메일 :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						      <label class="form-label">test@test.com</label>
						      <input type="text" class="form-control">
						    </div>
                        </div>
                      </td>
                    </tr>  
                     <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">생년월일 :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						      <label class="form-label"></label>
						       <input type="date" class="form-control">
						    </div>
                        </div>
                      </td>
                    </tr>  
                     <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">성별 :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						     <select class="form-control" id="exampleFormControlSelect1">
						       <option>남성</option>
						       <option>여성</option>
						     </select>
						    </div>
                        </div>
                      </td>
                    </tr>  
                     <tr>
                      <td>
                        <div class="d-flex px-3 py-0">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">가입일 :</h6> 
                          </div>
                          <div class="input-group input-group-static my-2 px-3 w-xxl-30">
						      <label class="form-label">2022.07.29</label>
						      <input type="text" class="form-control" disabled>
						    </div>
                        </div>
                      </td>
                      <td>
                      	<button type="button" class="btn btn-danger float-end m-0">회원삭제</button>
						<button type="button" class="btn btn-success float-end m-0">수정완료</button>
                      </td>
                    </tr>   
                    
                  </tbody>
                </table>
              </div>
            </div>
 
          </div>
   
  </div>
  
  <!--   Core JS Files   -->
  <script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5' 
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>
</html>