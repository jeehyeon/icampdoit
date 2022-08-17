<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.login.SignUpTO" %>
<%@ page import="com.exam.admin.AdminUsersDAO" %>
<%
	SignUpTO sto = (SignUpTO)request.getAttribute( "sto" );

	int cpage = (Integer)request.getAttribute("cpage");

	String name = sto.getName();
	String id = sto.getId();
	String email = sto.getEmail();
	String gen = sto.getGen();
	String rdate = sto.getRdate();
	String birth = sto.getBirth();
	String ucode = sto.getUcode();
%>
<!DOCTYPE html>
<html>
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
			  <a class="nav-link text-white " href="./logout.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">logout</i>
			      </div>			    
			    <span class="nav-link-text ms-1" >Log out</span>
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
						      <label class="form-label"><%=id %></label>
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
						      <!-- <label class="form-label"><%=name %></label> -->
						      <input type="text" class="form-control" name="name" id="name" value="<%=name%>">
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
						      <!--<label class="form-label"><%=email %></label>  -->
						      <input type="text" class="form-control" name="email" id="email" value="<%=email%>">
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
						      <!--<label class="form-label"><%=birth %></label>  -->
						       <input type="text" class="form-control" name="birth" id="birth" value="<%=birth%>">
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
						     <select class="form-select" id="exampleFormControlSelect1" name="gen" id="gen" >
						     	<%if( gen.equals("여")){ %>
						     		<option value="여" selected>여</option>
						     		<option value="남">남</option>
						     	<% } else { %>
						       		<option value="여" >여</option>
						     		<option value="남" selected>남</option>
						     	<% } %>
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
						      <label class="form-label"><%=rdate %></label>
						      <input type="text" class="form-control" disabled>
						    </div>
                        </div>
                         <input type="hidden" id="ucode" name="ucode" value="<%=ucode%>" />
                      </td>
                      <td>
                      	<button type="button" id="dbtn" class="btn btn-danger float-end mx-1 my-1" >회원삭제</button>
						<button type="button" id="mbtn" class="btn btn-success float-end mx-1 my-1">수정완료</button>
                      </td>
                    </tr>   
                    
                  </tbody>
                </table>
                <div id="dialog" style="display:none;" title="회원정보 삭제">
                	<h4>회원 정보를 삭제하시겠습니까? 삭제 후 복구가 불가능합니다.</h4>
                </div>
              </div>
            </div>
 
          </div>
   	</div>
  </div>
  
  <!--   Core JS Files   -->
  <script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
  <script>

	  
	 // 	
			 
		  // }
			 

  
  document.getElementById( 'dbtn' ).onclick = function() {
	  if( confirm( "회원 정보를 삭제하시겠습니까? 삭제 후 복구가 불가능합니다.") ) {
		  var ucode = $('#ucode').val();
		  
		  $.ajax({
				data : ucode,				
				type : "POST",
				url : './admin_users_deleteOk.do',
				dataType : 'text',
				success : function(flag) {					
					
					if( flag == "0" ) {
						alert('회원정보 삭제 성공');
						location.href= '/admin_users.do';
					} else {
						alert('회원정보 수정 실패');
						history.back();
					}
				},
				error: function(request, status, error) {
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		        }
			});
	  }
  };
  
  document.getElementById( 'mbtn' ).onclick = function() {
	  var name = $('#name').val();
		var email = $('#email').val();
		var birth = $('#birth').val();
		var gen = $('.form-select option:selected').val();
		 //alert( "gen option: " + gen );
		var ucode = $('#ucode').val();
		 
		//console.log( name );
		 		 
	    var data = {'name': name, 'email' : email , 'birth' : birth, 'gen' : gen, 'ucode' : ucode };	    	

	    if(($('#name').val() != '')&&($('#email').val() != '')&&($('#birth').val() != '')&&($('#gen').val() != '')){	        
					
			$.ajax({
				data : data,				
				type : "POST",
				url : './admin_users_modifyOk.do',
				dataType : 'text',
				success : function(flag) {					
					
					if( flag == "0" ) {
						alert('회원정보 수정 성공');
						location.href= '/admin_users.do';
					} else {
						alert('회원정보 수정 실패');
						history.back();
					}
				},
				error: function(request, status, error) {
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		        }
			});
	     } else {
		        alert('에러남.');
		        $('#title').focus();
		 } 
  }
  
  </script>
  
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