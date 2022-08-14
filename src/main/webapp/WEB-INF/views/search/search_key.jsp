<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.exam.search.SearchkeyTO"%>
<%@page import="java.util.ArrayList"%>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}
	
	//키워드검색 캠핑장 목록
	ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)request.getAttribute( "datas" );

	String keysearch = request.getParameter("keysearch");
	if( keysearch == null || keysearch == "") {
		keysearch = "키워드나&nbsp;캠핑장&nbsp;이름을&nbsp;입력해주세요.";
	}
	
	int totalRecord = datas.size();
	System.out.println( "토탈: " + totalRecord );
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( SearchkeyTO kto : datas ){
		String contentId = kto.getContentId();
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
		
		//System.out.println( "출력: "+ facltNm );
		
		sbHtml.append( "<div class='col-sm-6 col-xl-4 mb-5 hover-animate'>" );
		sbHtml.append( "  <div class='card h-100 border-0 shadow'>" );
		sbHtml.append( "  	<div class='card-img-top overflow-hidden gradient-overlay'><img class='img-fluid' src='" + firstImageUrl + "'/><a class='tile-link' href='./campview.do?contentId="+contentId +"'></a>" );               
		sbHtml.append( "  	</div>" );
		sbHtml.append( "  	<div class='card-body d-flex align-items-center'>" );
		sbHtml.append( "      <div class='w-100'>" );
		sbHtml.append( "    	<h5 class='card-title'><a class='text-dark' href='./campview.do?contentId="+contentId +"'>" + facltNm +"</a></h5>" );
		sbHtml.append( "      	<div class='d-flex card-subtitle mb-3'>" );
		sbHtml.append( "          <p class='flex-grow-1 mb-0 text-muted text-sm'>" + addr1 + "</p>" );
		sbHtml.append( "      	</div>" );
		sbHtml.append( "      	<p class='card-text text-muted'>" + induty + "</p>" );
		sbHtml.append( "      </div>" );
		sbHtml.append( "  	</div>" );
		sbHtml.append( "  </div>" );
		sbHtml.append( "</div>" );
	}
	
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>I CAMP DO IT</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/font.css" type="text/css">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
    <!-- Leaflet Maps-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
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
    
    <div class="container-fluid pt-5 pb-3 border-bottom px-lg-5">
      <div class="row">
        <div class="col-xl-8">
          <p class="subtitle text-sm text-primary">Search    </p>
          <h1 style="font-family: 'Recipekorea';">캠핑장 일반 검색    </h1>
        </div>
      </div>
    </div>
    
    <div class="container-fluid py-5 px-lg-5">
      <div class="row">
        <div class="col-lg-3 pt-3">
          <form class="pe-xl-3" action="./searchkey.do" autocomplete="off">
            <div class="mb-4">   
              <label class="form-label" for="keyword" style="font-family: 'GmarketSansBold';'"><font size=+0.5>키워드</font></label>
              <input class="form-control" type="text" name="keysearch" id="keysearch" placeholder=<%=keysearch %>>
            </div>
            <div class="mb-4">
				<label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>캠핑 유형</font></label>
                <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="typeCamping" name="type[]">
                          <label class="form-check-label" for="typeCamping">일반 야영장                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="typeCar" name="type[]">
                          <label class="form-check-label" for="typeCar">자동차 야영장                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="typeGlamping" name="type[]">
                          <label class="form-check-label" for="typeGlamping">글램핑                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="typeCaraban" name="type[]">
                          <label class="form-check-label" for="typeCaraban">카라반                                            </label>
                        </div>
                      </li>
                </ul>
            </div>
             <div class="mb-4">
				<label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>입지</font></label>
                <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeMountain" name="type[]">
                          <label class="form-check-label" for="placeMountain">산                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeForest" name="type[]">
                          <label class="form-check-label" for="placeForest">숲                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeStream" name="type[]">
                          <label class="form-check-label" for="placeStream">계곡                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeCity" name="type[]">
                          <label class="form-check-label" for="placeCity">도심                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeRiver" name="type[]">
                          <label class="form-check-label" for="placeRiver">강                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeLake" name="type[]">
                          <label class="form-check-label" for="placeLake">호수                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeBeach" name="type[]">
                          <label class="form-check-label" for="placeBeach">해변                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="placeIsland" name="type[]">
                          <label class="form-check-label" for="placeIsland">섬                                            </label>
                        </div>
                      </li>
                </ul>
            </div>
            <div class="mb-4">
				<label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>바닥 형태</font></label>
                <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="floorGrass" name="type[]">
                          <label class="form-check-label" for="floorGrass">잔디                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="floorRock" name="type[]">
                          <label class="form-check-label" for="floorRock">파쇄석                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="floorTeck" name="type[]">
                          <label class="form-check-label" for="floorTeck">테크                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="floorPebble" name="type[]">
                          <label class="form-check-label" for="floorPebble">자갈                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="floorDirt" name="type[]">
                          <label class="form-check-label" for="floorDirt">흙                                            </label>
                        </div>
                      </li>
                </ul>
            </div>
            <div class="mb-4">
				<label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>부대 시설</font></label>
                <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facElectro" name="type[]">
                          <label class="form-check-label" for="facElectro">전기                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facWarmwater" name="type[]">
                          <label class="form-check-label" for="facWarmwater">온수                                            </label>
                        </div>
                      </li>
                      <!--  
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facPlay" name="type[]">
                          <label class="form-check-label" for="facPlay">놀이터                                            </label>
                        </div>
                      </li>
                      -->
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facGym" name="type[]">
                          <label class="form-check-label" for="facGym">운동시설                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facWifi" name="type[]">
                          <label class="form-check-label" for="facWifi">무선인터넷                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facWood" name="type[]">
                          <label class="form-check-label" for="facWood">장작판매                                            </label>
                        </div>
                      </li>
                      <!-- 
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facTrampoline" name="type[]">
                          <label class="form-check-label" for="facTrampoline">트램폴린                                            </label>
                        </div>
                      </li>
                      -->
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facPool" name="type[]">
                          <label class="form-check-label" for="facPool">물놀이장                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facMart" name="type[]">
                          <label class="form-check-label" for="facMart">마트                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facConv" name="type[]">
                          <label class="form-check-label" for="facConv">편의점                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="facWalk" name="type[]">
                          <label class="form-check-label" for="facWalk">산책로                                            </label>
                        </div>
                      </li>
                </ul>
            </div>
            <div class="mb-4">
				<label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>캠핑장비 대여</font></label>
                <ul class="list-inline mt-xl-1 mb-0">
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentTent" name="type[]">
                          <label class="form-check-label" for="rentTent">텐트                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentFire" name="type[]">
                          <label class="form-check-label" for="rentFire">화로대                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentHeat" name="type[]">
                          <label class="form-check-label" for="rentHeat">난방기구                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentDish" name="type[]">
                          <label class="form-check-label" for="rentDish">식기                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentBed" name="type[]">
                          <label class="form-check-label" for="rentBed">침낭                                            </label>
                        </div>
                      </li>
                      <li class="list-inline-item">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="rentWire" name="type[]">
                          <label class="form-check-label" for="rentWire">릴선                                            </label>
                        </div>
                      </li>
                </ul>
            </div>
            <div class="mb-4"> 
                  <label class="form-label" style="font-family: 'GmarketSansBold';'"><font size=+0.5>기타 정보</font></label>
                  <ul class="list-unstyled mb-0">
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="etcTrailer" name="amenities[]">
                        <label class="form-check-label" for="etcTrailer">개인 트레일러 입장 가능                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="etcCaraban" name="amenities[]">
                        <label class="form-check-label" for="etcCaraban">개인 카라반 입장 가능                               </label>
                      </div>
                    </li>
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="etcPet" name="amenities[]">
                        <label class="form-check-label" for="etcPet">반려견 입장 가능                               </label>
                      </div>
                    </li>
                  </ul>
                </div>
              <div>
					<button type="button" class="btn btn-dark" id="allNonChk">&emsp;&emsp;&emsp; 초기화 &emsp;&emsp;&emsp;</button>
					<button type="submit" class="btn btn-primary text-white" style="float:right" id="detailSearch">&emsp;&emsp;&emsp; 검색하기 &emsp;&emsp;&emsp;</button>
				</div>
          </form>
        </div>
        <div class="col-lg-9">
          <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
            <div class="me-3" style="font-family: 'GmarketSansMedium';'">
              <p class="mb-3 mb-md-0">총  <strong style="font-family: 'GmarketSansBold';'"><%=totalRecord %></strong> 건</p>
            </div>
          </div>
          <div class="row">
            <%=sbHtml.toString() %>
            <!--  
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="./campview.do"></a>
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 이름</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>
           
            <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="./resources/bootstrap-5/html/img/noimage.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="./campview.do"></a>               
                </div>
                <div class="card-body d-flex align-items-center">
                  <div class="w-100">
                    <h5 class="card-title"><a class="text-decoration-none text-dark" href="./campview.do">캠핑장 대표사진없을때</a></h5>
                    <div class="d-flex card-subtitle mb-3">
                      <p class="flex-grow-1 mb-0 text-muted text-sm">캠핑장 full address</p>
                    </div>
                    <p class="card-text text-muted">업종(일반 야영장)</p>
                  </div>
                </div>
              </div>
            </div>-->
          </div>
          
          <!-- Pagination -->
          <nav aria-label="Page navigation example">
            <ul class="pagination pagination-template d-flex justify-content-center">
              <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
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
    
    <script type="text/javascript">
 	window.onload = function() {
 		// 전체 선택해제
 		document.getElementById( 'allNonChk' ).onclick = function() {
 			 $(":checkbox").prop("checked",false);
 		}
 	}
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