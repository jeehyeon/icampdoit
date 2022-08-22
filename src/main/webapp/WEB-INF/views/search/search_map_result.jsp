<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.exam.search.SearchkeyTO"%>
<%@page import="com.exam.search.SearchListMapTO"%>
<%@page import="com.exam.search.SearchmapDAO"%>
<%@page import="java.util.ArrayList"%>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}	
	
	//여기서부터 지도검색
	SearchListMapTO slistTO = (SearchListMapTO)request.getAttribute( "slistTO" );
	int cpage = (Integer)request.getAttribute( "cpage" );
	
	int recordPerPage = slistTO.getRecordPerPage();
	int totalPage = slistTO.getTotalPage();
	int blockPerPage = slistTO.getBlockPerPage();
	int startBlock = slistTO.getStartBlock();
	int endBlock = slistTO.getEndBlock();
	int totalRecord = slistTO.getTotalRecord();	
	
	SearchkeyTO sto = (SearchkeyTO)request.getAttribute( "sto" );
	
	String sido = sto.getDoNm();
	String gugun = sto.getSigunguNm();	
	
	ArrayList<SearchkeyTO> datas = slistTO.getSearchLists();
	
	StringBuilder sbHtml = new StringBuilder();

	for( SearchkeyTO kto : datas ){		

		String contentId = kto.getContentId();
		System.out.println( "contentId :" + contentId );
		String facltNm = kto.getFacltNm();
		String induty = kto.getInduty();
		String addr1 = kto.getAddr1();
		if( addr1.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*") == false ){
			addr1 = kto.getDoNm() + " " + kto.getSigunguNm() + " " + kto.getAddr1();
		}
	
		String firstImageUrl = kto.getFirstImageUrl();
		if( firstImageUrl.equals("default") ) {
			firstImageUrl = "./resources/bootstrap-5/html/img/noimage.svg";
		}
		String mapX = kto.getMapX();
		String mapY = kto.getMapY();
		String latlngadd = mapY + ", " + mapX;		
		
		sbHtml.append( "<div class='lists col-sm-6 mb-5 hover-animate' data-marker-id='59c0c8e33b1527bfe2abaf92'>");
		sbHtml.append( "	<div class='card h-100 border-0 shadow'>");
		sbHtml.append( "		<div class='card-img-top overflow-hidden gradient-overlay'> <img class='img-fluid' src='" + firstImageUrl + "'/><a class='tile-link' href='./campview.do?contentId=" + contentId + "'></a>");
		sbHtml.append( "		</div>");			
		sbHtml.append( "		<div class='card-body d-flex align-items-center'>");
		sbHtml.append( "			<div class='w-100'>");
		sbHtml.append( "				<h5 class='card-title'><a class='text-decoration-none text-dark' id='linkid' href='./campview.do?contentId=" + contentId + "'>" + facltNm + "</a></h5>");
		sbHtml.append( "				<div class='d-flex card-subtitle mb-3'>");
		sbHtml.append( "					<p class='flex-grow-1 mb-0 text-muted text-sm' id='campaddr' >" + addr1 + "</p>");
		sbHtml.append( "				</div>");
		sbHtml.append( "				<div id='mapval' style='display: none;'>" + latlngadd + "</div>" );
		sbHtml.append( "				<p class='card-text text-muted'>" + induty + "</p>");
		sbHtml.append( "			</div>");
		sbHtml.append( "		</div>");
		sbHtml.append( "	</div>");
		sbHtml.append( "</div>");				
	}
	
	//JSONObject result = new JSONObject();
	JSONArray jsonArray = new JSONArray();
	for( SearchkeyTO to : datas ){
		String latlngadd = to.getMapY() + ", " + to.getMapX();
		String title = to.getFacltNm();
		String link = "campview.do?contentId=" + to.getContentId();
		String campaddress = to.getAddr1();
		if( campaddress.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*") == false ){
			campaddress = to.getDoNm() + " " + to.getSigunguNm() + " " + to.getAddr1();
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put( "title", title );
		jsonObject.put( "latlng", latlngadd);
		jsonObject.put( "campaddress", campaddress);
		jsonObject.put( "link", link );
		
		jsonArray.add( jsonObject );
	}
	String flatlng = "37.541, 126.986";
	if(jsonArray.get(0) !=null){
	JSONObject obj = (JSONObject)jsonArray.get(0);
	flatlng= (String)obj.get("latlng");
	}
	
	StringBuilder kmap = new StringBuilder();
	for(int i= 0; i<jsonArray.size(); i++){
		JSONObject element = (JSONObject)jsonArray.get(i);
		kmap.append("{");
		kmap.append("title: '" +(String)element.get("title") +"',");
		kmap.append("latlng: new kakao.maps.LatLng("+(String)element.get("latlng") +"),");
		kmap.append("campaddress: '"+(String)element.get("campaddress") +"',");
		kmap.append("link: '"+ (String)element.get("link")+"'");
		kmap.append("},");
	}
	
	String resultk = kmap.toString();
	resultk = resultk.substring(0, resultk.length()-1);
						
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>I Camp Do It</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/font.css" type="text/css">
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
    <!-- 페이지네이션 css -->
    <script src="https://kit.fontawesome.com/5251502df3.js" crossorigin="anonymous"></script>  
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dde53cc9d654a3a8d8b78783aa5cbfc&libraries=services"></script>
  
  	<style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 100px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 10px;height: 75px;}
	    .info .link {color: #5085BB;}
	    #wrapall {
  			min-height: 100vh;
		  	display: flex;
		  	flex-direction: column;
  		}
  		#footer {
    		margin-top: auto;
  		}
	</style>
  </head>
  <body style="padding-top: 72px;">
  	<div id="wrapall">
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
             	<% }; %>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6 py-4 p-xl-5">
          <p class="subtitle text-sm text-primary">Search    </p>
          <h1 class="mb-4" style="font-family: 'Recipekorea';">지도 검색</h1>
          <hr class="my-4">
          <form action="./searchmapgugun.do" id="searchform" autocomplete="off">
            <div class="row">
              <div class="col-md-4">
                <label class="form-label" for="sido">전체 / 시,도 :</label>
                <select class="selectpicker col-md-8" name="sido" id="sido" data-style="btn-selectpicker" title="시도 선택&nbsp;&nbsp;">
                  <option value="서울시">서울시    </option>
                  <option value="인천시">인천시    </option>
                  <option value="경기도">경기도    </option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label" for="gugun">전체 / 시,구 :</label>
                <select class="selectpicker col-md-8" name="gugun" id="gugun" title="시구 선택">
                  <!-- <option value="시구">시/구 선택   </option> -->
                </select>
              </div>
               
              <div class="col-md-4">
                <button class="btn btn-primary col-md-8" type="submit" id="searchlist"> <i class="fas fa-search me-1"></i>Search</button>
              </div>
            </div>  
            
          </form>
          <hr class="my-4">
          <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
            <div class="me-3"  style="font-family: 'GmarketSansMedium';'">
              <p class="mb-3 mb-md-0" id="number">총  <strong style="font-family: 'GmarketSansBold';'"><%=totalRecord %></strong> 건</p>
            </div>
          </div>
          <div class="row" id="result">
          	<%=sbHtml.toString() %>
           
          </div>
         	<div id="pagenation">
         		<nav aria-label="Page navigation example">
            		<ul class="pagination pagination-template d-flex justify-content-center">
 <%			
	//페이지 하단의 << 버튼
	if ( startBlock == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='searchmapgugun.do?sido="+ sido + "&gugun=" + gugun + "&cpage="+ (startBlock - blockPerPage) +"'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	}
	//페이지 하단의 < 버튼 => (cpage-1) 한페이지 앞으로 이동
	if ( cpage == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'> <i class='fa fa-angle-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='searchmapgugun.do?sido="+ sido + "&gugun=" + gugun + "&cpage="+ (cpage-1) +"'><i class='fa fa-angle-left'></i></a></li> ");
	}
	//현재 페이지
	for ( int i=startBlock; i<=endBlock; i++ ) {
		if ( cpage == i ) { 
			out.println(" <li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li> ");
		} else {
			out.println(" <li class='page-item'><a class='page-link' href='searchmapgugun.do?sido="+ sido + "&gugun=" + gugun + "&cpage=" + i + "'>" + i + "</a></li> ");
		}
	}
	//페이지 하단의 > 버튼
	if ( cpage == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='searchmapgugun.do?sido="+ sido + "&gugun=" + gugun + "&cpage="+ (cpage+1) +"'><i class='fa fa-angle-right'></i></a></li> ");
	}
	//페이지 하단의 >> 버튼
	if ( endBlock == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='searchmapgugun.do?sido="+ sido + "&gugun=" + gugun + "&cpage="+ (startBlock + blockPerPage) +"'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	}
%>
            		</ul>
          		</nav>
        	</div>
        </div>
        <div class="col-lg-6 map-side-lg pe-lg-0">
          <div class="map-full shadow-left" id="map"></div>  
        </div>
      </div>
    </div>
    </div>
    <!-- Footer - 관리자 페이지 이동 부분 넣을 곳 -->
    <footer class="position-relative z-index-10 d-print-none" id="footer">
           
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
    <!-- jQuery-->
    <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <!-- JavaScript files-->
    <script>
    	$(document).ready(function(){
    		$('#sido').on('change', function() {
    			let sidoVal = $( '#sido option:selected' ).text().trim();
    			
    			
    			$( '#gugun' ).empty();
    			
    			$.ajax({
    				url: '/searchmapsido.do',
    				type: "POST", 
    				data : {
    					"sidoVal" : sidoVal	
    				},
    				dataType : "json",
    				success: function(json){
    					$('#gugun').html( '<option value="">전체 선택   </option>' );
    					
    					$.each( json.jsonArray, function( index, jsonArray ){
    						
    						$( '#gugun' ).append( '<option value="' + jsonArray.sigunguNm + '">' + jsonArray.sigunguNm + '</option>' );
    					
    					
    					});
    					
    					
    					$('#gugun').selectpicker( 'refresh' );
    				},
    				error: function(e){
    					alert( '[에러]' + e.status );
    				}
    			});
    		});
    		
    		$('#searchlist').on('click', function() {
    			let sidoVal = $( '#sido option:selected' ).text().trim();
    			let gugunVal = $( '#gugun option:selected' ).val();
    			console.log(gugunVal);

    			$("searchform").submit();
    			
    			$( '#result' ).empty();
    			$( '#number' ).empty();
    			
    			
    		});

    	});

    </script>
    <script>
				var mapContainer = document.getElementById('map'), //지도 표시할 div id
					mapOptions = {
						center: new kakao.maps.LatLng(<%=flatlng%>), //center = 지도 중심 좌표
						level: 9 //지도 확대 레벨. 기본값=3
					};
		
				var map = new kakao.maps.Map(mapContainer, mapOptions); //지도를 표시할 div와 지도 옵션으로 지도를 생성함
				
				//마커 여러개 생성				
				var markers = []; // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
				var contents = [];
				var overlays = [];
							
				var positions =[
					<%=resultk%>
				];

			
				for ( var i=0; i<positions.length; i++ ){
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position: positions[i].latlng, // 마커가 표시될 위치입니다
						title: positions[i].title,
						map: map
					});
					markers.push(marker);
				}
				
				for( let i=0; i<positions.length; i++ ){
					
					//html 디자인
					var wrap = document.createElement('div');
					wrap.className = "wrap";
					
					var info = document.createElement( 'div' );
					info.className = "info";
					wrap.appendChild(info);
					
					var title = document.createElement( 'div' );
					title.className = "title";
					campName = document.createTextNode( positions[i].title );
					title.appendChild(campName);
					info.appendChild(title);
					
					var close = document.createElement( 'div' );
					close.ClassName = "close";
					close.setAttribute( "id", "closebtn" );
					close.title = "닫기";
					close.style.position="absolute";
					close.style.top=10 + "px";
					close.style.right=10 + "px";
					close.style.color="#888";
					close.style.width= 17 + "px";
					close.style.height= 17 + "px";
					close.style.background= "url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png')";
					close.onclick = function() {
						overlays[i].setMap(null);
					};
					title.appendChild(close);
					
					var body = document.createElement( 'div' );
					body.className = "body";
					info.appendChild(body);
					
					var desc = document.createElement( 'div' );
					desc.className = "desc";
					body.appendChild(desc);
					
					var ellipsis = document.createElement( 'div' );
					ellipsis.className = "ellipsis";
					address = document.createTextNode( positions[i].campaddress );
					ellipsis.appendChild(address);
					desc.appendChild(ellipsis);
					
					var footerDiv = document.createElement( 'div' );
					desc.appendChild(footerDiv);
					
					var link = document.createElement( 'a' );
					link.classname = "link";
					link.target = "_blank";
					link.setAttribute( "href", positions[i].link);
					detail = document.createTextNode( "상세보기" );
					link.appendChild(detail);
					footerDiv.appendChild(link);
					
					console.log(wrap);
					
					var overlay = new kakao.maps.CustomOverlay({
						//map: map,
						position: markers[i].getPosition()
						//content: wrap
					});
					
										
					overlay.setContent(wrap);

					overlays.push(overlay);					
					
					kakao.maps.event.addListener( markers[i], 'mouseover', function() {
						
						$('div .card-body:eq('+i+')').css('background-color', '#99CC99');
					});
					kakao.maps.event.addListener( markers[i], 'mouseout', function() {
					    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
						
						$('div .card-body:eq('+i+')').css('background-color', 'white');
					});
					
					
					kakao.maps.event.addListener( markers[i], 'click', function() {

						overlays[i].setMap(map); 
						//$('div .card-body:eq('+i+')').css('background-color', '#99CC99');
					});
				}
			
				$(".lists").hover(function(){
					overlays[$(this).index()].setMap(map);
					$('div .card-body:eq('+$(this).index()+')').css('background-color', '#99CC99');
				},function(){
					overlays[$(this).index()].setMap(null);
					$('div .card-body:eq('+$(this).index()+')').css('background-color', 'white');
				});
					          
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);
				
				
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