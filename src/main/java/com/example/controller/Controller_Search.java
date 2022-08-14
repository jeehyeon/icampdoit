package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.search.CampviewCmtTO;
import com.exam.search.SearchkeyDAO;
import com.exam.search.SearchkeyTO;
import com.exam.search.SearchmapDAO;


@RestController
public class Controller_Search {
	
	@Autowired
	SearchkeyDAO kdao;
	@Autowired
	SearchmapDAO mdao;
	
	@RequestMapping( value="/searchkey.do" )
	public ModelAndView searchkey(HttpServletRequest request) {
		System.out.println( "searchkey()호출" );
		
		SearchkeyTO kto = new SearchkeyTO();
		kto.setKeysearch( request.getParameter( "keysearch" ) );
		//System.out.println( "키워드 : " + kto.getKeysearch());
		
		ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)kdao.searchkeyDAO(kto.getKeysearch());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_key" );
		modelAndView.addObject("datas", datas);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/searchdetail.do" )
	public ModelAndView searchdetail(HttpServletRequest request) {
		System.out.println( "searchdetail()호출" );
		
		// 지역 3개
		String doNmS = request.getParameter( "doNmS" );
		System.out.println( "doNmS : " + doNmS );
		String doNmI = request.getParameter( "doNmI" );
		System.out.println( "doNmS : " + doNmI );
		String doNmG = request.getParameter( "doNmG" );
		System.out.println( "doNmS : " + doNmG );
		
		// 캠핑유형 4개
		String indutyNor = request.getParameter( "indutyNor" );
		System.out.println( "indutyNor : " + indutyNor );
		String indutyCar = request.getParameter( "indutyCar" );
		System.out.println( "indutyCar : " + indutyCar );
		String indutyGl = request.getParameter( "indutyGl" );
		System.out.println( "indutyGl : " + indutyGl );
		String indutyVan = request.getParameter( "indutyVan" );
		System.out.println( "indutyVan : " + indutyVan );
		
		// 입지 8개
		String lctClMount = request.getParameter( "lctClMount" );
		System.out.println( "lctClMount : " + lctClMount );
		String lctClForest = request.getParameter( "lctClForest" );
		System.out.println( "lctClForest : " + lctClForest );
		String lctClValley = request.getParameter( "lctClValley" );
		System.out.println( "lctClValley : " + lctClValley );
		String lctClCity = request.getParameter( "lctClCity" );
		System.out.println( "lctClCity  : " + lctClCity  );
		String lctClRiver = request.getParameter( "lctClRiver" );
		System.out.println( "lctClRiver : " + lctClRiver );
		String lctClLake = request.getParameter( "lctClLake" );
		System.out.println( "lctClLake : " + lctClLake);
		String lctClBeach = request.getParameter( "lctClBeach" );
		System.out.println( "lctClBeach : " + lctClBeach );
		String lctClIsland = request.getParameter( "lctClIsland" );
		System.out.println( "lctClIsland : " + lctClIsland );

		// 바닥형태 5개
		String siteBottomCl1 = request.getParameter( "siteBottomCl1" );
		System.out.println( "siteBottomCl1 : " + siteBottomCl1 );
		String siteBottomCl2 = request.getParameter( "siteBottomCl2" );
		System.out.println( "siteBottomCl2 : " + siteBottomCl2 );
		String siteBottomCl3 = request.getParameter( "siteBottomCl3" );
		System.out.println( "siteBottomCl3 : " + siteBottomCl3 );
		String siteBottomCl4 = request.getParameter( "siteBottomCl4" );
		System.out.println( "siteBottomCl4 : " + siteBottomCl4 );
		String siteBottomCl5 = request.getParameter( "siteBottomCl5" );
		System.out.println( "siteBottomCl5 : " + siteBottomCl5 );
		
		// 부대시설 9개
		String sbrsClElectro = request.getParameter( "sbrsClElectro" );
		System.out.println( "sbrsClElectro : " + sbrsClElectro );
		String sbrsClHwater = request.getParameter( "sbrsClHwater" );
		System.out.println( "sbrsClHwater : " + sbrsClHwater );
		String sbrsClGym = request.getParameter( "sbrsClGym" );
		System.out.println( "sbrsClGym : " + sbrsClGym );
		String sbrsClWifi = request.getParameter( "sbrsClWifi" );
		System.out.println( "sbrsClWifi : " + sbrsClWifi );
		String sbrsClFirewood = request.getParameter( "sbrsClFirewood" );
		System.out.println( "sbrsClFirewood : " + sbrsClFirewood );
		String sbrsClPool = request.getParameter( "sbrsClPool" );
		System.out.println( "sbrsClPool : " + sbrsClPool );
		String sbrsClMart = request.getParameter( "sbrsClMart" );
		System.out.println( "sbrsClMart : " + sbrsClMart );
		String sbrsClCstore = request.getParameter( "sbrsClCstore" );
		System.out.println( "sbrsClCstore : " + sbrsClCstore );
		String sbrsClWalk = request.getParameter( "sbrsClWalk" );
		System.out.println( "sbrsClWalk : " + sbrsClWalk );
		
		// 캠핑장비 대여 6개
		String eqpmnLendClTent = request.getParameter( "eqpmnLendClTent" );
		System.out.println( "eqpmnLendClTent : " + eqpmnLendClTent );
		String eqpmnLendClBrazier = request.getParameter( "eqpmnLendClBrazier" );
		System.out.println( "eqpmnLendClBrazier : " + eqpmnLendClBrazier );
		String eqpmnLendClHeater = request.getParameter( "eqpmnLendClHeater" );
		System.out.println( "eqpmnLendClHeater : " + eqpmnLendClHeater );
		String eqpmnLendClTableware = request.getParameter( "eqpmnLendClTableware" );
		System.out.println( "eqpmnLendClTableware : " + eqpmnLendClTableware );
		String eqpmnLendClSbag = request.getParameter( "eqpmnLendClSbag" );
		System.out.println( "eqpmnLendClSbag : " + eqpmnLendClSbag );
		String eqpmnLendClRwire = request.getParameter( "eqpmnLendClRwire" );
		System.out.println( "eqpmnLendClRwire : " + eqpmnLendClRwire );
		
		// 기타정보 3개
		String trlerAcmpnyAt = request.getParameter( "trlerAcmpnyAt" );
		System.out.println( "trlerAcmpnyAt : " + trlerAcmpnyAt );
		String caravAcmpnyAt = request.getParameter( "caravAcmpnyAt" );
		System.out.println( "caravAcmpnyAt : " + caravAcmpnyAt );
		String animalCmgCl = request.getParameter( "animalCmgCl" );
		System.out.println( "animalCmgCl : " + animalCmgCl );
		
		ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)kdao.searchdetailDAO(doNmS, doNmI, doNmG, indutyNor, indutyCar, indutyGl, indutyVan, lctClMount, lctClForest, lctClValley, lctClCity, lctClRiver, lctClLake, lctClBeach, lctClIsland, sbrsClElectro, sbrsClHwater, sbrsClGym, sbrsClWifi, sbrsClFirewood, sbrsClPool, sbrsClMart, sbrsClCstore, sbrsClWalk, eqpmnLendClTent, eqpmnLendClBrazier, eqpmnLendClHeater, eqpmnLendClTableware, eqpmnLendClSbag, eqpmnLendClRwire);		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_key" );
		modelAndView.addObject("datas", datas);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/searchmap.do" )
	public ModelAndView searchmap(HttpServletRequest request) {
		System.out.println( "searchmap() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_map" );
		
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
		
		//for(SearchkeyTO ito : lists) {
			//System.out.println("campview 컨트롤러 이미지 : " + ito.getImageUrl());
		//}
		
		//System.out.println("campview 컨트롤러 데이터 : " + kto.getAddr1());
		//System.out.println("campview 컨트롤러 데이터 : " + kto.getContentId());
		//System.out.println("campview 컨트롤러 데이터 : " + kto.getHomepage());
		ArrayList<CampviewCmtTO> clists= kdao.campViewCmt(cto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/campview" );
		modelAndView.addObject("kto", kto);
		modelAndView.addObject("lists", lists);
		modelAndView.addObject("clists", clists);
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
	
	
	@RequestMapping( value="/searchmapsido.do" )
	public JSONObject searchmapsido(HttpServletRequest request) {
		System.out.println( "searchmapsido() 호출" );
		
		SearchkeyTO sto = new SearchkeyTO();
		String sido = "";
		
		System.out.println( request.getParameter( "sidoVal" ) );
		
		if( request.getParameter( "sidoVal" ).equals("서울시" )) {
			sto.setDoNm( "서울시" );
			sido = "서울시";
			
		} else if( request.getParameter( "sidoVal" ).equals("인천시" ) ){
			sto.setDoNm( "인천시" );
			sido = "인천시";
		} else {
			sto.setDoNm( "경기도" );
			sido = "경기도";
		}
		
		System.out.println( "doNm : " + sto.getDoNm() );
		
		ArrayList<SearchkeyTO> list = (ArrayList<SearchkeyTO>)mdao.listsigunguNm( sto.getDoNm() );
		
		JSONObject result = new JSONObject();	
		
		JSONArray jsonArray = new JSONArray();
		for( SearchkeyTO to : list ){
			String sigunguNm = to.getSigunguNm();
			
			JSONObject jsonObject = new JSONObject();

			if( !sigunguNm.equals("default") ) {
				
				jsonObject.put( "sigunguNm", sigunguNm );
				jsonArray.add( jsonObject );
			}
		}
		
		result.put( "jsonArray", jsonArray ); //배열을 다시 json에 담음. => ajax 에서 jsonArray(배열)를 안받아줘서 json 으로 다시 넣음
		
		return result;
	}
	
	@RequestMapping( value="/searchmapgugun.do" )
	public JSONObject searchmapgugun(HttpServletRequest request) {
		System.out.println( "searchmapgugun() 호출" );
		
		SearchkeyTO sto = new SearchkeyTO();

		sto.setDoNm( request.getParameter( "sidoVal" ) );
		sto.setSigunguNm( request.getParameter( "gugunVal" ) );
		
		ArrayList<SearchkeyTO> list = (ArrayList<SearchkeyTO>)mdao.listsearchmap(sto);
		
		JSONObject listresult = new JSONObject();	
		
		JSONArray jsonArray = new JSONArray();
		for( SearchkeyTO to : list ){
			String facltNm = to.getFacltNm();
			String addr1 = to.getAddr1();
			String addr2 = to.getAddr2();
			String induty = to.getInduty();
			String firstImageUrl = to.getFirstImageUrl();
			String contentId = to.getContentId();
			String mapX = to.getMapX();
			String mapY = to.getMapY();
			
			JSONObject jsonObject = new JSONObject();
				
			jsonObject.put( "facltNm", facltNm );
			jsonObject.put( "addr1", addr1 );
			jsonObject.put( "addr2", addr2 );
			jsonObject.put( "induty", induty );
			jsonObject.put( "contentId", contentId );
			jsonObject.put( "mapX", mapX );
			jsonObject.put( "mapY", mapY );
			
			if( !firstImageUrl.equals( "default" ) ) {
				jsonObject.put( "firstImageUrl", firstImageUrl );
			} else {
				jsonObject.put( "firstImageUrl", "./resources/bootstrap-5/html/img/noimage.svg" );
			}
			
			jsonArray.add( jsonObject );
		}
		
		listresult.put( "jsonArray", jsonArray ); //배열을 다시 json에 담음. => ajax 에서 jsonArray(배열)를 안받아줘서 json 으로 다시 넣음
		
		return listresult;
	}
	
}
