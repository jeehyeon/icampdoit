<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.mboard.BoardTO" %>
<%@ page import="com.exam.mboard.BoardListTO" %>
<%@ page import="java.util.ArrayList" %>
<%
//session 값 가져오기
int ucode = -1;
String id ="";
if(session.getAttribute("id") != null){
	ucode = (int)session.getAttribute("ucode");
	id = (String)session.getAttribute("id");
}

	BoardListTO listTO = (BoardListTO)request.getAttribute("blistTO");
	int cpage = (Integer)request.getAttribute( "cpage" );
	
	int recordPerPage = listTO.getRecordPerPage();
	int totalPage = listTO.getTotalPage();
	int blockPerPage = listTO.getBlockPerPage();
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();
	int totalRecord = listTO.getTotalRecord();
	
	int subjectValue = (Integer)request.getAttribute( "subjectValue" );
	

//게시판
	//int totalRecord = (Integer)request.getAttribute( "totalRecord" );
	//String result = (String)request.getAttribute( "result" );
	
	ArrayList<BoardTO> lists = listTO.getBoardLists();
	
	StringBuilder sbHtml = new StringBuilder();
	
	
	for( BoardTO to : lists ){
		String seq = to.getSeq();
		String subject = to.getSubject();
		String writer = to.getWriter();
		String title = to.getTitle();
		String wdate = to.getWdate();
		String hit = to.getHit();
		
		sbHtml.append( "<tr onmouseover=\"this.style.background='#f1f6ea'\" onmouseout=\"this.style.background='white'\" style=\"cursor: pointer;\" onclick=\"location.href='mboardview.do?cpage=" + cpage + "&seq=" + seq + "'\">" );
		sbHtml.append( "<td class=\"text-center\">" + seq + "</td>" );
		sbHtml.append( "<td class=\"fw-bold text-center\">" + title + "</td>" );
        sbHtml.append( "<td></td>" );
        sbHtml.append( "<td class=\"text-end\">" + writer + "</td>" );
        sbHtml.append( "<td class=\"text-end\">" + wdate + "</td>" );
        sbHtml.append( "<td class=\"text-end\">" + hit + "</td>" );
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
	                  <a class="dropdown-item" href="./searchkey.do">일반검색</a><a class="dropdown-item" href="./searchmap.do">지도검색</a>
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
    
	<!-- 게시판 시작 -->
    <section class="hero py-lg-7"><img class="bg-image" src="./resources/bootstrap-5/html/img/photo/게시판2.jpg" alt="">
		<div class="container position-relative text-center text-white">
        <h1 class="hero-heading mb-0" style="font-family: 'Recipekorea';">게시판</h1>
      	</div>
    </section>
    
    <!-- 게시판 말머리 드롭박스 -->
    <section class="py-5 p-print-0 mb-7">
      <div class="container">
        <div class="card border-0 shadow shadow-print-0">
          <div class="card-header p-4 border-0 px-print-0" style="background-color: white">
            <div class="row">
              <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4 mt-2">
                <!-- 게시판종류 드롭박스 -->
                <div class="me-3">
                  <select class="form-select bg-primary-light" name="sort" id="form_sort" style="font-family: 'GmarketSansMedium';" data-style="btn-selectpicker" title="" onchange="location.href='javascript:changeSubject()'">
                    <option value="1">자유 게시판</option>
                    <option value="2">후기 게시판</option>
                    <option value="3">중고거래 게시판</option>
                  </select>
                </div>
                <!-- 글쓰기버튼 -->
                <div>
                  <input type="button" value=" 글 쓰 기 " class="btn btn-primary text-white" style="cursor: pointer;" onclick="location.href='mboardwrite.do'" />
                </div>
              </div> 
            </div>
          </div>
          
          <div class="card-body p-5 p-print-0">
            <div class="row">
              <div class="col-sm-6 pe-lg-3">
                <h2 class="h6 text-uppercase mb-4" id="totalRecord">전체: <%=totalRecord %> 건</h2>
              </div>
            </div>
            
            <!-- 게시판 목록 -->
            <div class="table-responsive text-sm mb-3">
              <table class="table">
              	<thead class="bg-gray-100">
                  <tr class="border-0">
                    <th class="text-center">No</th>
                    <th class="text-center">제목</th>
                    <th></th>
                    <th class="text-end">작성자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-end">작성날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="text-end">조회수</th>
                  </tr>
                </thead>
                <tbody id="tbody">
                  <!-- 
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">1</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">soyeon</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">2</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">rina</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">3</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">jeehyeon</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">4</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">byeongchan</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">5</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">soyeon</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">6</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">soyeon</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  <tr onmouseover="this.style.background='#f1f6ea'" onmouseout="this.style.background='white'" style="cursor: pointer;" onclick="location.href='mboardview.do'">
                    <td class="text-center">7</td>
                    <td class="fw-bold text-center">[후기게시판] 자라섬 캠핑장 솔직후기</td>
                    <td></td>
                    <td class="text-end">soyeon</td>
                    <td class="text-end">2022-01-01</td>
                    <td class="text-end">0</td>
                  </tr>
                  
                   -->
                   <%=sbHtml.toString() %>
                </tbody>
              </table>
            </div>
          </div>
          
          <input type="hidden" value="<%=subjectValue %>" id="subjectInput" />
          
          <!-- 페이징 -->
          <div class="card-footer p-5 px-print-0 border-0 text-end text-sm" style="background-color: white">
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
		out.println(" <li class='page-item'><a class='page-link' href='mboardlist.do?cpage="+ (startBlock - blockPerPage) +"&subjectValue="+ subjectValue +"'><i class='fa fa-thin fa-angles-left'></i></a></li>");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 < 버튼 => (cpage-1) 한페이지 앞으로 이동
	if ( cpage == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'> <i class='fa fa-angle-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='mboardlist.do?cpage="+ (cpage-1) +"&subjectValue="+ subjectValue + "'><i class='fa fa-angle-left'></i></a></li> ");
	}
	//out.println(" &nbsp;&nbsp; ");
	//현재 페이지
	for ( int i=startBlock; i<=endBlock; i++ ) {
		if ( cpage == i ) { 
			out.println(" <li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li> ");
		} else {
			out.println(" <li class='page-item'><a class='page-link' href='mboardlist.do?cpage=" + i +"&subjectValue="+ subjectValue + "'>" + i + "</a></li> ");
		}
	}
	//out.println(" &nbsp;&nbsp; ");
	//페이지 하단의 > 버튼
	if ( cpage == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='mboardlist.do?cpage="+ (cpage+1) +"&subjectValue="+ subjectValue + "'><i class='fa fa-angle-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 >> 버튼
	if ( endBlock == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='mboardlist.do?cpage="+ (startBlock + blockPerPage) +"&subjectValue="+ subjectValue + "'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");

%>
              </ul>
            </nav>  
            <!-- 
            <p class="mb-0">Thank you for you business. Directory, Inc.</p>
            -->
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
     <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <!-- JavaScript files-->
    <script>
	    window.onload = function(){
	    	if (  $( "#subjectInput" ).val() == 1 ) {
	    		$("#form_sort").val("1");
	    		console.log( "1로 변경");
	    	} else if ( $( "#subjectInput" ).val() == 2 ) {
	    		$("#form_sort").val("2");
	    		console.log( "2로 변경");
	    	} else {
	    		$("#form_sort").val("3");
	    		console.log( "3로 변경");
	    	}
	    	
	    	
	    }
    </script>
    <script>
    	function changePage(){
    		
    	}
    	
    	function changeSubject(){
    		subjectValue = $( "#form_sort option:selected" ).val();
    		console.log( subjectValue );
    		
    		location.href='./mboardlist.do?subjectValue=' + subjectValue; 
    		/*
    		$.ajax({
    			url: './mboardlist.do',
    			type: 'post',
    			data: {
    				subjectValue : $( "#form_sort option:selected" ).val()
    			},
    			success : {
    				
    			}
    			
    			//dataType: "text",
    			//contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
    			
    			success: function(result){
    				
    				
    				$("#tbody").html( result );
    				
    				
    				let totalRecord = $("tr").length -1;
    				
    				$("#totalRecord").text("전체 : " + totalRecord + " 건");
    				
    				
    		
    			}
    			
    		});
    		*/
    	};
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