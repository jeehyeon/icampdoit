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
    I Camp Do It admin users
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

  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            
          </ol>
          <h6 class="font-weight-bolder mb-0">게시판 관리</h6>
        </nav>
        
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- 회원 테이블 -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header position-relative p-0 mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-secondary shadow-primary border-radius-lg pt-5 pb-4">
                <!-- 말머리 드롭다운 -->
                <div class="subjectdrop">
               	 <div class="dropdown">
					  <button class="btn bg-white dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
					    말머리
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    <li><a class="dropdown-item" href="#">공지</a></li>
					    <li><a class="dropdown-item" href="#">혼캠</a></li>
					    <li><a class="dropdown-item" href="#">자유</a></li>
					    <li><a class="dropdown-item" href="#">후기</a></li>
					    <li><a class="dropdown-item" href="#">중고</a></li>
					  </ul>
				 </div>
				 
                </div>
                
	               <div class="writebtn">
		               <a href="admin_board_write.do">
		                <button type="button" class="btn btn-lg me-1 bg-gradient-dark">글쓰기</button>
		                </a>
	               </div>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">말머리</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"> 작성자</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">제목</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성일자</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">조회수</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="listdata">
                    	
                      <td onclick="moveMo()">
                        <div class="d-flex px-2 py-1">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">공지</h6> 
                          </div>
                        </div>
                      </td>
                      <td onclick="moveMo()">                 
                        <p class="text-xs font-weight-bold mb-0">홍길동</p>
                      </td>
                      <td onclick="moveMo()">
                        <p class="text-xs font-weight-bold mb-0">공지사항입니다</p>                 
                      </td>
                      <td class="align-middle text-center text-sm" onclick="moveMo()">
                        <span>2022-07-31</span>
                      </td >
                      <td class="align-middle text-center" onclick="moveMo()">
                        <span class="text-secondary text-xs font-weight-bold">8</span>
                      </td>
                      
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          삭제
                        </a>
                      </td>
                      
                    </tr>
                    
                    <tr class="listdata">
                    
                      <td onclick="moveMo()">
                      
                        <div class="d-flex px-2 py-1">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">자유</h6> 
                          </div>
                        </div>
                        
                      </td>
                      <td onclick="moveMo()">   
                                   
                        <p class="text-xs font-weight-bold mb-0">홍길동</p>
                        
                      </td>
                      <td onclick="moveMo()">
                      
                        <p class="text-xs font-weight-bold mb-0">자유게시글입니다</p> 
                                     
                      </td>
                      <td class="align-middle text-center text-sm" onclick="moveMo()">
                      	
                        <span>2022-07-31</span>
                       
                      </td>
                      <td class="align-middle text-center" onclick="moveMo()">
                     
                        <span class="text-secondary text-xs font-weight-bold">2</span>
                       
                      </td>
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          삭제
                        </a>
                      </td>
                     
                    </tr>
                    
                    <tr class="listdata">
                      <td onclick="moveMo()">
                        <div class="d-flex px-2 py-1">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">후기</h6> 
                          </div>
                        </div>
                      </td>
                      <td onclick="moveMo()">                 
                        <p class="text-xs font-weight-bold mb-0">김병찬</p>
                      </td>
                      <td onclick="moveMo()">
                        <p class="text-xs font-weight-bold mb-0">후기 게시글입니다</p>                 
                      </td>
                      <td class="align-middle text-center text-sm" onclick="moveMo()">
                        <span>2022-07-31</span>
                      </td>
                      <td class="align-middle text-center" onclick="moveMo()">
                        <span class="text-secondary text-xs font-weight-bold">8</span>
                      </td>
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          삭제
                        </a>
                      </td>
                    </tr>
                    
                    
                    
                  </tbody>
                </table>
              </div>
            </div>
 
          </div>
          
          <!-- 페이징 버튼 -->
          <div class="pagenu">
          <ul class="pagination pagination-info">
		    <li class="page-item">
		      <a class="page-link" href="#link" aria-label="Previous">
		        <span aria-hidden="true">
		          <span class="material-icons">
		            keyboard_arrow_left
		          </span>
		        </span>
		      </a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#link">1</a>
		    </li>
		    <li class="page-item active">
		      <a class="page-link" href="#link">2</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#link">3</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#link">4</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#link">5</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#link" aria-label="Next">
		        <span aria-hidden="true">
		          <span class="material-icons">
		            keyboard_arrow_right
		          </span>
		        </span>
		      </a>
		    </li>
          </ul>
         </div> 
          
        </div>
      </div>
      
                          
      
  </main>
  
  <!--   Core JS Files   -->
  <script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
  function moveMo() {
		location.href = "admin_board_modify.do";
	}
  
  
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