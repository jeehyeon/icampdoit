<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.admin.AdminTO" %>
<%@ page import="com.exam.admin.AdminListTO" %>
<%@ page import="java.util.ArrayList" %>  
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}

	AdminListTO listTO = (AdminListTO)request.getAttribute("listTO");
	int cpage = (Integer)request.getAttribute( "cpage" );
	
	int recordPerPage = listTO.getRecordPerPage();
	int totalPage = listTO.getTotalPage();
	int blockPerPage = listTO.getBlockPerPage();
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();
	int totalRecord = listTO.getTotalRecord();
	
	System.out.println("관리자페이지 말머리 리스트 : " + request.getAttribute( "subjectValue" ));
	
	String subjectValue = (String)request.getAttribute( "subjectValue" );
		
	ArrayList<AdminTO> lists = listTO.getBoardLists();
	
	StringBuilder sbHtml = new StringBuilder();
	
	AdminTO to1 = new AdminTO();
	String seq = to1.getSeq();
	int viewUcode = to1.getUcode();
	
	for( AdminTO to : lists ) {
		seq = to.getSeq();
		String subject = to.getSubject();
		if( subject.equals("1") ) {
			subject = "자유 게시판";
		} else if( subject.equals("2") ) {
			subject = "후기 게시판";
		} else if( subject.equals("3") ) {
			subject = "중고거래 게시판";
		} else if( subject.equals("4") ) {
			subject = "혼캠 자료실";
		} else if( subject.equals("5") ) {
			subject = "공지 게시판";
		}
		String writer = to.getWriter();
		String title = to.getTitle();
		String wdate = to.getWdate();
		String hit = to.getHit();
		
		if( subjectValue.equals("1")||subjectValue.equals("2")||subjectValue.equals("3") ){
		sbHtml.append( "<tr class='listdata'>" );
		sbHtml.append( "<td><a href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'>" );
		sbHtml.append( "<div class='d-flex px-2 py-1'>" );
		sbHtml.append( "<div class='d-flex flex-column justify-content-center'><p class='text-sm font-weight-bold mb-0'>" + subject + "</p></div>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "</td>" );
		sbHtml.append( "<td><a href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><p class='text-sm font-weight-bold mb-0'>" + writer + "</p></td>" );
		sbHtml.append( "<td><a href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><p class='text-sm font-weight-bold mb-0'>" + title + "</p></td>" );
		sbHtml.append( "<td class='align-middle text-center text-sm'><a href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><span>" + wdate + "</span></td>" );
		sbHtml.append( "<td class='align-middle text-center'><a href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><span class='text-secondary text-sm font-weight-bold'>" + hit + "</span></td>" );
		sbHtml.append( "<td class='align-middle text-center'>" );
		sbHtml.append( "<a href='./aboarddelete_ok.do?viewseq=" + seq + "&subjectValue=" + subjectValue + "' class='dbtn font-weight-bold text-sm' data-toggle='tooltip' data-original-title='Edit user'>" );
		sbHtml.append( "<button type='button' id='dbtn' name='dbtn' style='height:35px;width:75px;' class='btn btn-xs me-1 bg-gradient-dark ps-3v'>삭제</button>" );
		sbHtml.append( "</a>" );
		sbHtml.append( "</td>" );
		sbHtml.append( "</tr>" );
		} else {
			sbHtml.append( "<tr class='listdata'>" );
			sbHtml.append( "<td><a href='admin_board_modify.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'>" );
			sbHtml.append( "<div class='d-flex px-2 py-1'>" );
			sbHtml.append( "<div class='d-flex flex-column justify-content-center'><p class='text-sm font-weight-bold mb-0'>" + subject + "</p></div>" );
			sbHtml.append( "</div>" );
			sbHtml.append( "</td>" );
			sbHtml.append( "<td><a href='admin_board_modify.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><p class='text-sm font-weight-bold mb-0'>" + writer + "</p></td>" );
			sbHtml.append( "<td><a href='admin_board_modify.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><p class='text-sm font-weight-bold mb-0'>" + title + "</p></td>" );
			sbHtml.append( "<td class='align-middle text-center text-sm'><a href='admin_board_modify.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><span>" + wdate + "</span></td>" );
			sbHtml.append( "<td class='align-middle text-center'><a href='admin_board_modify.do?cpage=" + cpage + "&seq=" + seq + "&subjectValue=" + subjectValue + "'><span class='text-secondary text-sm font-weight-bold'>" + hit + "</span></td>" );
			sbHtml.append( "<td class='align-middle text-center'>" );
			sbHtml.append( "<a href='./aboarddelete_ok.do?viewseq=" + seq + "&subjectValue=" + subjectValue + "' class='dbtn font-weight-bold text-sm' data-toggle='tooltip' data-original-title='Edit user'>" );
			sbHtml.append( "<button type='button' id='dbtn' name='dbtn' style='height:35px;width:75px;' class='btn btn-xs me-1 bg-gradient-dark ps-3v'>삭제</button>" );
			sbHtml.append( "</a>" );
			sbHtml.append( "</td>" );
			sbHtml.append( "</tr>" );
		}
	}

%>
  
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>I Camp Do It Administrator</title>
  <!-- Font Awesome 이거 추가함 -->
  <script src="https://kit.fontawesome.com/5251502df3.js" crossorigin="anonymous"></script>    
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

  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"></ol>
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
               	 <div class="me-2 ms-1" style="float:left">
					<select class="customSelect1" name="sort" id="form_sort" data-style="btn-selectpicker" onchange="changeSubject()">
						<option value="0" disabled>말머리 선택 &nbsp;&nbsp;</option>
						<option value="1">자유</option>
						<option value="2">후기</option>
						<option value="3">중고</option>
						<option value="4">혼캠</option>
						<option value="5">공지</option>
					</select>
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
                      <th class="text-uppercase text-secondary text-md font-weight-bolder opacity-10">말머리</th>
                      <th class="text-uppercase text-secondary text-md font-weight-bolder opacity-10 ps-2"> 작성자</th>
                      <th class="text-uppercase text-secondary text-md font-weight-bolder opacity-10 ps-3">제목</th>
                      <th class="text-center text-uppercase text-secondary text-md font-weight-bolder opacity-10">작성일자</th>
                      <th class="text-center text-uppercase text-secondary text-md font-weight-bolder opacity-10">조회수</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  
                  <tbody>
				<input type="hidden" id="seq" name="seq" value="<%=seq%>" />
		        <input type="hidden" id="cpage" name="cpage" value="<%= cpage %>">
           
                   <!--                    
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
                    -->
               <input type="hidden" id="viewUcode" name="viewUcode" value="<%=viewUcode%>"/>
               <input type="hidden" id="viewSeq" name="viewSeq" value="<%=seq%>"/>      
 			   <%=sbHtml.toString() %>                   
                                      
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
         <input type="hidden" value="<%=subjectValue%>" id="subjectInput" />         
          
          <!-- 페이징 버튼 -->
          <div class="pagenu">
          <ul class="pagination pagination-info">
		    
<%			
	//페이지 하단의 << 버튼
	if ( startBlock == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_board.do?cpage="+ (startBlock - blockPerPage) +"&subjectValue="+ subjectValue +"'><i class='fa fa-thin fa-angles-left'></i></a></li>");
	}
	//페이지 하단의 < 버튼 => (cpage-1) 한페이지 앞으로 이동
	if ( cpage == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'> <i class='fa fa-angle-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_board.do?cpage="+ (cpage-1) +"&subjectValue="+ subjectValue + "'><i class='fa fa-angle-left'></i></a></li> ");
	}
	//현재 페이지
	for ( int i=startBlock; i<=endBlock; i++ ) {
		if ( cpage == i ) { 
			out.println(" <li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li> ");
		} else {
			out.println(" <li class='page-item'><a class='page-link' href='admin_board.do?subjectValue=" + subjectValue + "&cpage=" + i + "'>" + i + "</a></li> ");
		}
	}
	//페이지 하단의 > 버튼
	if ( cpage == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_board.do?cpage="+ (cpage+1) +"&subjectValue="+ subjectValue + "'><i class='fa fa-angle-right'></i></a></li> ");
	}
	//페이지 하단의 >> 버튼
	if ( endBlock == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_board.do?cpage="+ (startBlock + blockPerPage) +"&subjectValue="+ subjectValue + "'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	}
%>		    
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
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- JavaScript files-->  
  <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
   
   <script type="text/javascript">
        	
    	function changeSubject(){
    		var subjectValue = $( "#form_sort option:selected" ).val();
    		
    		location.href='./admin_board.do?subjectValue=' + subjectValue; 
    	};
    		  	
    		  	if (  $( "#subjectInput" ).val() == 1 ) {
    		  		$("#form_sort").val("1");
    		  	} else if ( $( "#subjectInput" ).val() == 2 ) {
    		  		$("#form_sort").val("2");
    		  	} else if ( $( "#subjectInput" ).val() == 3 ) {
    		  		$("#form_sort").val("3");
    		  	} else if ( $( "#subjectInput" ).val() == 4 ) {
    		  		$("#form_sort").val("4");
    		  	} else if ( $( "#subjectInput" ).val() == 5 ) {
    		  		$("#form_sort").val("5");
    		  	}	  	

    </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>