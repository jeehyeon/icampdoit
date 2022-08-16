package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.search.CampviewCmtTO;
import com.exam.search.SearchListTO;
import com.exam.search.SearchkeyDAO;
import com.exam.search.SearchkeyTO;


@RestController
public class Controller_Search {
	
	@Autowired
	SearchkeyDAO kdao;
	
	@RequestMapping( value="/searchkey.do" )
	public ModelAndView searchkey(HttpServletRequest request) {
		System.out.println( "searchkey()호출" );
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
				
		SearchkeyTO kto = new SearchkeyTO();
		kto.setKeysearch( request.getParameter( "keysearch" ) );
		//System.out.println( "키워드 : " + kto.getKeysearch());	
		
		SearchListTO listTO = new SearchListTO();
		listTO.setCpage( cpage );
		
		listTO = kdao.searchkeyList(listTO, kto.getKeysearch() );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_key" );
		modelAndView.addObject( "listTO", listTO );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/searchdetail.do" )
	public ModelAndView searchdetail(HttpServletRequest request) {
		System.out.println( "searchdetail()호출" );
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		String addurl = "?";
		
		// 지역 3개
		String doNmS = "";
		String doNmI = "";
		String doNmG = "";
		System.out.println( "공백확인 : "+ doNmS);
		if( (request.getParameter( "doNmS" )!=null&&request.getParameter("doNmS")!="") ) {
			addurl +="doNmS=" + request.getParameter("doNmS") +"&";
			doNmS = request.getParameter( "doNmS" );
			System.out.println( "값들어갔는지S: " + doNmS );
		} else {
			doNmS = request.getParameter( "doNmS" );
		}
		if( (request.getParameter( "doNmI" )!=null&&request.getParameter("doNmI")!="") ) {
			addurl +="doNmI=" + request.getParameter("doNmI") +"&";
			doNmI = request.getParameter( "doNmI" );
			System.out.println( "값들어갔는지I: " + doNmI );
		} else {
			doNmI = request.getParameter( "doNmI" );
		}
		if( (request.getParameter( "doNmG" )!=null&&request.getParameter("doNmG")!="") ) {
			addurl +="doNmG=" + request.getParameter("doNmG") +"&";
			doNmG = request.getParameter( "doNmG" );
			System.out.println( "값들어갔는지G: " + doNmG );
		} else {
			doNmG = request.getParameter( "doNmG" );
		}
		System.out.println( "addurl:"+ addurl);
		
		// 캠핑유형 4개
		String indutyNor = "";
		String indutyCar = "";
		String indutyGl = "";
		String indutyVan = "";
		if( (request.getParameter( "indutyNor" )!=null&&request.getParameter("indutyNor")!="") ) {
			addurl +="indutyNor=" + request.getParameter("indutyNor") +"&";
			indutyNor = request.getParameter( "indutyNor" );
		} else {
			indutyNor = request.getParameter( "indutyNor" );
		}
		if( (request.getParameter( "indutyCar" )!=null&&request.getParameter("indutyCar")!="") ) {
			addurl +="indutyCar=" + request.getParameter("indutyCar") +"&";
			indutyCar = request.getParameter( "indutyCar" );
		} else {
			indutyCar = request.getParameter( "indutyCar" );
		}
		if( (request.getParameter( "indutyGl" )!=null&&request.getParameter("indutyGl")!="") ) {
			addurl +="indutyGl=" + request.getParameter("indutyGl") +"&";
			indutyGl = request.getParameter( "indutyGl" );
		} else {
			indutyGl = request.getParameter( "indutyGl" );
		}
		if( (request.getParameter( "indutyVan" )!=null&&request.getParameter("indutyVan")!="") ) {
			addurl +="indutyVan=" + request.getParameter("indutyVan") +"&";
			indutyVan = request.getParameter( "indutyVan" );
		} else {
			indutyVan = request.getParameter( "indutyVan" );
		}
				
		// 입지 8개
		String lctClMount = ""; 
		String lctClForest = "";
		String lctClValley = "";
		String lctClCity = "";
		String lctClRiver = "";
		String lctClLake = "";
		String lctClBeach = "";
		String lctClIsland = "";
		if( (request.getParameter( "lctClMount" )!=null&&request.getParameter( "lctClMount" )!="") ) {
			addurl +="lctClMount=" + request.getParameter("lctClMount") +"&";
			lctClMount = request.getParameter( "lctClMount" );
		} else {
			lctClMount = request.getParameter( "lctClMount" );
		}
		if( (request.getParameter( "lctClForest" )!=null&&request.getParameter( "lctClForest" )!="")  ) {
			addurl +="lctClForest=" + request.getParameter("lctClForest") +"&";
			lctClForest = request.getParameter( "lctClForest" );
		} else {
			lctClForest = request.getParameter( "lctClForest" );
		}
		/*
		if() {
			
		} else {
			
		}
		if() {
			
		} else {
			
		}
		if() {
			
		} else {
			
		}
		if() {
			
		} else {
			
		}
		if() {
			
		} else {
			
		}
		if() {
			
		} else {
			
		}
		
		
		if( 
			|| 
			 || 
			(request.getParameter( "lctClCity" )!=null&&request.getParameter( "lctClCity" )!="") || 
			(request.getParameter( "lctClRiver" )!=null&&request.getParameter( "lctClRiver" )!="") || 
			(request.getParameter( "lctClLake" )!=null&&request.getParameter( "lctClLake" )!="") || 
			(request.getParameter( "lctClBeach" )!=null&&request.getParameter( "lctClBeach" )!="") || 
			(request.getParameter( "lctClIsland" )!=null&&request.getParameter( "lctClIsland" )!="") ) {
			//System.out.println("2.1");
			 
			
			lctClValley = request.getParameter( "lctClValley" );
			lctClCity = request.getParameter( "lctClCity" );
			lctClRiver = request.getParameter( "lctClRiver" );
			lctClLake = request.getParameter( "lctClLake" );
			lctClBeach = request.getParameter( "lctClBeach" );
			lctClIsland = request.getParameter( "lctClIsland" );
		}
		*/	
		// 바닥형태 5개
		String siteBottomCl1 ="";
		String siteBottomCl2 ="";
		String siteBottomCl3 ="";
		String siteBottomCl4 ="";
		String siteBottomCl5 ="";
		if( request.getParameter( "siteBottomCl1" )!="null" || request.getParameter( "siteBottomCl2" )!="null" || request.getParameter( "siteBottomCl3" )!="null" || request.getParameter( "siteBottomCl4" )!="null" || request.getParameter( "siteBottomCl5" )!="null") {
			siteBottomCl1 = request.getParameter( "siteBottomCl1" ); 
			siteBottomCl2 = request.getParameter( "siteBottomCl2" );
			siteBottomCl3 = request.getParameter( "siteBottomCl3" );
			siteBottomCl4 = request.getParameter( "siteBottomCl4" );
			siteBottomCl5 = request.getParameter( "siteBottomCl5" );
			
		};
		
		// 부대시설 9개
		String sbrsClElectro = "";
		String sbrsClHwater = "";
		String sbrsClGym = "";
		String sbrsClWifi = "";
		String sbrsClFirewood = "";
		String sbrsClPool = "";
		String sbrsClMart = "";
		String sbrsClCstore = "";
		String sbrsClWalk = "";
		//System.out.println("3 : "+  request.getParameter( "sbrsClElectro" ));
		if( (request.getParameter( "sbrsClElectro" )!=null&&request.getParameter( "sbrsClElectro" )!="") || 
			(request.getParameter( "sbrsClHwater" )!=null&&request.getParameter( "sbrsClHwater" )!="") || 
			(request.getParameter( "sbrsClGym" )!=null&&request.getParameter( "sbrsClGym" )!="") || 
			(request.getParameter( "sbrsClWifi" )!=null&&request.getParameter( "sbrsClWifi" )!="") || 
			(request.getParameter( "sbrsClFirewood" )!=null&&request.getParameter( "sbrsClFirewood" )!="") || 
			(request.getParameter( "sbrsClPool" )!=null&&request.getParameter( "sbrsClPool" )!="") || 
			(request.getParameter( "sbrsClMart" )!=null&&request.getParameter( "sbrsClMart" )!="") || 
			(request.getParameter( "sbrsClCstore" )!=null&&request.getParameter( "sbrsClCstore" )!="") || 
			(request.getParameter( "sbrsClWalk" )!=null&&request.getParameter( "sbrsClWalk" )!="") ) {
			System.out.println("3.1");
			sbrsClElectro = request.getParameter( "sbrsClElectro" );
			sbrsClHwater = request.getParameter( "sbrsClHwater" );
			sbrsClGym = request.getParameter( "sbrsClGym" );
			sbrsClWifi = request.getParameter( "sbrsClWifi" );
			sbrsClFirewood = request.getParameter( "sbrsClFirewood" );
			sbrsClPool = request.getParameter( "sbrsClPool" );
			sbrsClMart = request.getParameter( "sbrsClMart" );
			sbrsClCstore = request.getParameter( "sbrsClCstore" );
			sbrsClWalk = request.getParameter( "sbrsClWalk" );
		};
		
		// 캠핑장비 대여 6개
		String eqpmnLendClTent = "";
		String eqpmnLendClBrazier = "";
		String eqpmnLendClHeater = "";
		String eqpmnLendClTableware = "";
		String eqpmnLendClSbag = "";
		String eqpmnLendClRwire = "";
		if( (request.getParameter( "eqpmnLendClTent" )!=null&&request.getParameter( "eqpmnLendClTent" )!="") ||
			(request.getParameter( "eqpmnLendClBrazier" )!=null&&request.getParameter( "eqpmnLendClBrazier" )!="") ||
			(request.getParameter( "eqpmnLendClHeater" )!=null&&request.getParameter( "eqpmnLendClHeater" )!="") ||
			(request.getParameter( "eqpmnLendClTableware" )!=null&&request.getParameter( "eqpmnLendClTableware" )!="") ||
			(request.getParameter( "eqpmnLendClSbag" )!=null&&request.getParameter( "eqpmnLendClSbag" )!="") ||
			(request.getParameter( "eqpmnLendClRwire" )!=null&&request.getParameter( "eqpmnLendClRwire" )!="") ) {
			eqpmnLendClTent = request.getParameter( "eqpmnLendClTent" );
			eqpmnLendClBrazier = request.getParameter( "eqpmnLendClBrazier" );
			eqpmnLendClHeater = request.getParameter( "eqpmnLendClHeater" );
			eqpmnLendClTableware = request.getParameter( "eqpmnLendClTableware" );
			eqpmnLendClSbag = request.getParameter( "eqpmnLendClSbag" );
			eqpmnLendClRwire = request.getParameter( "eqpmnLendClRwire" );
		};
		
		// 기타정보 3개
		String trlerAcmpnyAt = "";
		String caravAcmpnyAt = "";
		String animalCmgCl = "";
		if( request.getParameter( "trlerAcmpnyAt" )!="null" || request.getParameter( "caravAcmpnyAt" )!="null" || request.getParameter( "animalCmgCl" )!="null" ) {
			trlerAcmpnyAt = request.getParameter( "trlerAcmpnyAt" );
			caravAcmpnyAt = request.getParameter( "caravAcmpnyAt" );
			animalCmgCl = request.getParameter( "animalCmgCl" );
		} ;
		
		SearchListTO listTO = new SearchListTO();
		listTO.setCpage( cpage );
		
		listTO = kdao.searchdetailDAO( listTO, doNmS, doNmI, doNmG, indutyNor, indutyCar, indutyGl, indutyVan, lctClMount, lctClForest, lctClValley, lctClCity, lctClRiver, lctClLake, lctClBeach, lctClIsland, sbrsClElectro, sbrsClHwater, sbrsClGym, sbrsClWifi, sbrsClFirewood, sbrsClPool, sbrsClMart, sbrsClCstore, sbrsClWalk, eqpmnLendClTent, eqpmnLendClBrazier, eqpmnLendClHeater, eqpmnLendClTableware, eqpmnLendClSbag, eqpmnLendClRwire);		
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_detail" );
		modelAndView.addObject( "listTO", listTO );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "addurl", addurl );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/campview.do" )
	public ModelAndView campview(HttpServletRequest request, HttpSession session) {
		System.out.println( "campview() 호출" );
		//System.out.println("컨트롤러 request.getParameter(contentID) : " + request.getParameter("contentId"));
		SearchkeyTO kto = new SearchkeyTO();
		CampviewCmtTO cto = new CampviewCmtTO();
		kto.setContentId(request.getParameter("contentId"));
		cto.setContentId(request.getParameter("contentId"));
		//campview 테이블에 해당 캠핑장 데이터가 있는지 검사
		kto= kdao.campViewTableExist(kto);
			//System.out.println("컨트롤러 kdao.viewTableExist : " + kto.getSeq()+ " / " + kto.getContentId());
		int flag=1;
		//있다면 조회수 +1 / 없다면 Insert 후 조회수 +1
		if(kto.getSeq() != "-1") {
			//campview table 존재
			flag=kdao.campViewHit(kto);
		}else {
			//campview 테이블이 없을떄
			flag=kdao.campViewTableInsert(kto);
		}
		
		
		//campview page 정보 불러오기
		kto = kdao.campView(kto);
		
		//campview 사진데이터
		ArrayList<SearchkeyTO> lists = kdao.gocampimgparse(kto);
		
		//댓글
		ArrayList<CampviewCmtTO> clists= kdao.campViewCmt(cto);
		
		//찜하기
		int sub;
		if(session.getAttribute("ucode") == null) {
			sub= 2;
		}else {
			int ucode = (Integer)session.getAttribute("ucode");
			
			sub =kdao.campSubscribeCheck(Integer.toString(ucode), kto.getContentId());
			System.out.println("sub : " + sub);
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/campview" );
		modelAndView.addObject("kto", kto);
		modelAndView.addObject("lists", lists);
		modelAndView.addObject("clists", clists);
		modelAndView.addObject("sub", sub);
		return modelAndView;
	}
	@RequestMapping(value="/campviewCmt.do")
	public String campviewCmt(HttpServletRequest request, HttpSession session) {
		int flag =1;
		//System.out.println("댓글 달기 평점: "+request.getParameter("rating"));
		//System.out.println("댓글 달기 내용: "+request.getParameter("review"));
		if(session.getAttribute("ucode") == null) {
			flag=2;
			return Integer.toString(flag);
		}
		CampviewCmtTO cto = new CampviewCmtTO();
		int ucode = (Integer)session.getAttribute("ucode");
		cto.setWriter((String)session.getAttribute("id"));
		cto.setMark(request.getParameter("rating"));
		cto.setContent(request.getParameter("review"));
		cto.setContentId(request.getParameter("contentId"));
		cto.setUcode(Integer.toString(ucode));
		
		flag=kdao.campViewCmtInsert(cto);
		return Integer.toString(flag);
	}
	@RequestMapping(value="/subscribe.do")
	public String campsubscribe(HttpServletRequest request, HttpSession session) {
		int flag =1;
		System.out.println("댓글 달기 컨텐트ID: "+request.getParameter("contentId"));
		//System.out.println("댓글 달기 내용: "+request.getParameter("review"));
		if(session.getAttribute("ucode") == null) {
			flag=2;
			return Integer.toString(flag);
		}	
		int ucode = (Integer)session.getAttribute("ucode");
		int sub =kdao.campSubscribeCheck(Integer.toString(ucode), request.getParameter("contentId"));
		if(sub == 0) {
			//찜DB존재 => 찜 삭제
			flag=kdao.campSubscribeDel(Integer.toString(ucode), request.getParameter("contentId"));
		}else {
			//찜DB에 없음 => 찜추가
			flag= kdao.campSubscribe(Integer.toString(ucode), request.getParameter("contentId"));
		}
		
		
		
		return Integer.toString(flag);
	}
	
}
