<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.login.SignUpTO" %>
<%@page import="java.util.ArrayList"%>
<%
	String countBoardResult = (String)request.getAttribute( "countBoardResult" );
	String countFemale = (String)request.getAttribute( "countFemale" );
	String countMale = (String)request.getAttribute( "countMale" );
	String weeklyRegistered = (String)request.getAttribute( "weeklyRegistered" );
	String countReviews = (String)request.getAttribute( "countReviews" );
	String countTotalVisitor = (String)request.getAttribute( "countTotalVisitor" );
	String countTodayVisitor = (String)request.getAttribute( "countTodayVisitor" );
	String countSocialId = (String)request.getAttribute( "countSocialId" );
	
	ArrayList<SignUpTO> lists = (ArrayList<SignUpTO>)request.getAttribute("lists");
	
	int total0 = 0;
	int total10 = 0;
	int total20 = 0;
	int total30 = 0;
	int total40 = 0;
	for( SignUpTO list : lists ){
		if( list.getAge() != null && list.getAge().equals( "10" ) ){
			total10 = Integer.parseInt(list.getTotal());
		} else if( list.getAge() != null && list.getAge().equals( "20" ) ){
			total20 = Integer.parseInt(list.getTotal());
		} else if( list.getAge() != null && list.getAge().equals( "30" ) ){
			total30 = Integer.parseInt(list.getTotal());
		} else if( list.getAge() != null && list.getAge().equals( "0" )) {
			total0 = Integer.parseInt(list.getTotal());
		} else if( list.getAge() != null && list.getAge().equals( "40" )) {
			total40 = Integer.parseInt(list.getTotal());
		}
	}	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Font Awesome 이거 추가함 -->
<script src="https://kit.fontawesome.com/5251502df3.js" crossorigin="anonymous"></script>   
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
	
 <main class="main-content border-radius-lg ">

	<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
	  <div class="container-fluid py-1 px-3">
	    <nav aria-label="breadcrumb">     
	      <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">       
	      </ol>
	      <h6 class="font-weight-bolder mb-0">DashBoard</h6>      
	    </nav>
	  </div>
	</nav>

    <div class="container-fluid py-4">
      <div class="row">       
        <div class="col-lg-4 mb-3">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-person-dress opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">여성 회원 수</p>
                  <h4 class="mb-0"><%=countFemale %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        <div class="col-lg-4 mb-3">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                <!-- <i class="material-icons opacity-10">person</i> -->
                <i class="fa-solid fa-person opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">남성 회원 수</p>
                <h4 class="mb-0"><%=countMale %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        <div class="col-lg-4 mb-3">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                <i class="material-icons opacity-10">person_add</i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">이번주 가입자 수</p>
                  <h4 class="mb-0">+ <%=weeklyRegistered %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        
        <div class="col-lg-4 mb-3 mt-4">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-file-lines opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">게시판 게시글수</p>
                  <h4 class="mb-0"><%=countBoardResult %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>    
        <div class="col-lg-4 mb-3 mt-4">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-align-right opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">등록된 리뷰 수</p>
	              <h4 class="mb-0"><%=countReviews %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        <div class="col-lg-4 mb-3 mt-4">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-warning shadow-warning text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-comment opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">소셜 가입자 수</p>
		          <h4 class="mb-0"><%=countSocialId %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        
        <div class="col-lg-4 col-md-5 mt-5 mb-4">
          <div class="card z-index-2 ">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
              <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                <div class="chart">
                  <canvas id="chart-bars" class="chart-canvas" height="200" ></canvas>
                </div>
              </div>
            </div>
            <div class="card-body">
              <h6 class="mb-0 ">연령 분포</h6>
              
              <hr class="dark horizontal">
              <div class="d-flex ">
                
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mt-2 mb-3 mt-5">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-admin shadow-admin text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-arrow-right-to-bracket opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">오늘 방문자 수</p>
		          <h4 class="mb-0"><%=countTodayVisitor %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
        <div class="col-lg-4 mt-2 mb-2 mt-5">
          <div class="card z-index-2 ">           
	        <div class="card">
	          <div class="card-header p-3 pt-2">
	            <div class="icon icon-lg icon-shape bg-gradient-admin shadow-admin text-center border-radius-xl mt-n4 position-absolute">
	              <i class="fa-solid fa-people-line opacity-10"></i>
	            </div>
	            <div class="text-end pt-1">
	              <p class="text-sm mb-0 text-capitalize">총 방문자 수</p>
		          <h4 class="mb-0"><%=countTotalVisitor %></h4>
	            </div>
	          </div>
	          <hr class="dark horizontal my-0">
	          <div class="card-footer p-3">	              
	          </div>
	        </div>	            
	      </div>
        </div>
       </div>      
     </div>
   </main>
      
<!--   Core JS Files   -->
<script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js" ></script>
<script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js" ></script>
<script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js" ></script>
<script src="./resources/bootstrap-5/html/admin/js/plugins/chartjs.min.js"></script>
  <script>
    var ctx = document.getElementById("chart-bars").getContext("2d");

    new Chart(ctx, {
        type: "bar",
        data: {
          labels: ["0~9세", "10대", "20대", "30대", "40대이상"],
          datasets: [{
            label: "회원 수",
            tension: 0.4,
            borderWidth: 0,
            borderRadius: 4,
            borderSkipped: false,
            backgroundColor: "rgba(255, 255, 255, .8)",
            data: [<%=total0%>, <%=total10%>, <%=total20%>, <%=total30%>, <%=total40%> ],
            maxBarThickness: 6
          }, ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              display: false,
            }
          },
          interaction: {
            intersect: false,
            mode: 'index',
          },
          scales: {
            y: {
              grid: {
                drawBorder: false,
                display: true,
                drawOnChartArea: true,
                drawTicks: false,
                borderDash: [5, 5],
                color: 'rgba(255, 255, 255, .2)'
              },
              ticks: {
                suggestedMin: 0,
                suggestedMax: 500,
                beginAtZero: true,
                padding: 10,
                font: {
                  size: 14,
                  weight: 300,
                  family: "Roboto",
                  style: 'normal',
                  lineHeight: 2
                },
                color: "#fff"
              },
            },
            x: {
              grid: {
                drawBorder: false,
                display: true,
                drawOnChartArea: true,
                drawTicks: false,
                borderDash: [5, 5],
                color: 'rgba(255, 255, 255, .2)'
              },
              ticks: {
                display: true,
                color: '#f8f9fa',
                padding: 10,
                font: {
                  size: 14,
                  weight: 300,
                  family: "Roboto",
                  style: 'normal',
                  lineHeight: 2
                },
              }
            },
          },
        },
      });


    var ctx2 = document.getElementById("chart-line").getContext("2d");

    new Chart(ctx2, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Mobile apps",
          tension: 0,
          borderWidth: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255, 255, 255, .8)",
          pointBorderColor: "transparent",
          borderColor: "rgba(255, 255, 255, .8)",
          borderColor: "rgba(255, 255, 255, .8)",
          borderWidth: 4,
          backgroundColor: "transparent",
          fill: true,
          data: [50, 40, 300, 320, 500, 350, 200, 230, 500],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });

    var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");

    new Chart(ctx3, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Mobile apps",
          tension: 0,
          borderWidth: 0,
          pointRadius: 5,
          pointBackgroundColor: "rgba(255, 255, 255, .8)",
          pointBorderColor: "transparent",
          borderColor: "rgba(255, 255, 255, .8)",
          borderWidth: 4,
          backgroundColor: "transparent",
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5],
              color: 'rgba(255, 255, 255, .2)'
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#f8f9fa',
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#f8f9fa',
              padding: 10,
              font: {
                size: 14,
                weight: 300,
                family: "Roboto",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
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


<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc --><script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
  </body>

</html>