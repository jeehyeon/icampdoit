<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.nboard.NBoardTO" %>
<%@ page import="com.exam.nboard.NListTO" %>
<%@ page import="java.util.ArrayList" %>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}

	//Arraylist
	//ArrayList<NBoardTO> lists = (ArrayList)request.getAttribute( "lists" );

	NListTO listTO = (NListTO)request.getAttribute( "listTO" );
	int cpage = listTO.getCpage();
	
	int totalRecord = listTO.getTotalRecord();
	int blockPerPage = listTO.getBlockPerPage();
	int totalPage = listTO.getTotalPage();	
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();
	
	ArrayList<NBoardTO> lists = listTO.getBoardLists();
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( NBoardTO to : lists ){
		String seq = to.getSeq();
		String subject = to.getSubject();
		String writer = to.getWriter();
		String title = to.getTitle();
		String wdate = to.getWdate();
		String hit = to.getHit();
		
		sbHtml.append( "<tr onmouseover=\"this.style.background='#f1f6ea'\" onmouseout=\"this.style.background='white'\" style=\"cursor: pointer;\" onclick=\"location.href='noticeview.do?cpage=" + cpage + "&seq=" + seq + "'\">" );
		sbHtml.append( "<td class=\"text-center\">" + seq + "</td>" );
		sbHtml.append( "<td class=\"fw-bold text-center\">" + title + "</td>" );
        sbHtml.append( "<td></td>" );
        sbHtml.append( "<td class=\"text-center\">" + writer + "</td>" );
        sbHtml.append( "<td class=\"text-center\">" + wdate + "</td>" );
        sbHtml.append( "<td class=\"text-center\">" + hit + "</td>" );
        sbHtml.append( "</tr>" );
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
    <!--<link rel="stylesheet" href="vendor/nouislider/nouislider.css"> -->
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
  </head>
  <body style="padding-top: 72px;">
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
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./logout.do'">Logout</button>
             	<%}; %>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    
    <!-- NOTICE 시작 -->
    <section class="hero py-5 py-lg-7"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/어바웃4.jpg">
      <div class="container position-relative text-white">
        <h1 class="hero-heading mb-0" style="font-family: 'Recipekorea';">NOTICE</h1>
      </div>
    </section>
     
    <section class="py-5 p-print-0 mb-5">
      <div class="container">
          <div class="card-body p-5 p-print-0">
            <div class="row">
              <div class="col-sm-6 mt-3 pe-lg-3">
                <h2 class="h6 text-uppercase mb-4">전체: <%=totalRecord %> 건</h2>
              </div>
            </div>
            
            <!-- 목록 -->
            
            <div class="table-responsive text-sm mb-3">
              <table class="table">
              	<thead class="bg-gray-100">
                  <tr class="border-0">
                    <th class="text-center">No</th>
                    <th class="text-center">제목</th>
                    <th></th>
                    <th class="text-center">작성자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-center">작성날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-center">조회수</th>
                  </tr>
                </thead>
                <tbody>
                <!-- 
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">1</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">2</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">3</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">4</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">5</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">6</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='noticeview.do'">
                    <td class="text-center">7</td>
                    <td class="fw-bold text-center">[공지] 사이트 이용안내 변경 사항 공지</td>
                    <td></td>
                    <td class="text-end">아이캠두잇</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                   -->
                   <%=sbHtml.toString() %>
                </tbody>
              </table>
            </div>
          </div>
          
          <!-- 페이징 -->
          <div class="card-footer bg-white p-5 px-print-0 border-0 text-end text-sm">
            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
              <!--
                <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
                -->
<%			
	//페이지 하단의 << 버튼
	if ( startBlock == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='notice.do?cpage="+ (startBlock - blockPerPage) +"'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 < 버튼 => (cpage-1) 한페이지 앞으로 이동
	if ( cpage == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'> <i class='fa fa-angle-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='notice.do?cpage="+ (cpage-1) +"'><i class='fa fa-angle-left'></i></a></li> ");
	}
	//out.println(" &nbsp;&nbsp; ");
	//현재 페이지
	for ( int i=startBlock; i<=endBlock; i++ ) {
		if ( cpage == i ) { 
			out.println(" <li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li> ");
		} else {
			out.println(" <li class='page-item'><a class='page-link' href='notice.do?cpage=" + i + "'>" + i + "</a></li> ");
		}
	}
	//out.println(" &nbsp;&nbsp; ");
	//페이지 하단의 > 버튼
	if ( cpage == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='notice.do?cpage="+ (cpage+1) +"'><i class='fa fa-angle-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 >> 버튼
	if ( endBlock == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='notice.do?cpage="+ (startBlock + blockPerPage) +"'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");

%>  
              </ul>
            </nav>  
          </div>
        </div>
      </div>
    </section>
    <!-- 
	<section class="py-6">
	
	</section>
	-->
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
  </body>
</html>