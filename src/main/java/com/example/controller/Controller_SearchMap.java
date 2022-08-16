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
import com.exam.search.SearchListMapTO;
import com.exam.search.SearchListTO;
import com.exam.search.SearchkeyDAO;
import com.exam.search.SearchkeyTO;
import com.exam.search.SearchmapDAO;


@RestController
public class Controller_SearchMap {
	
	@Autowired
	SearchkeyDAO kdao;
	@Autowired
	SearchmapDAO mdao;
		
	@RequestMapping( value="/searchmap.do" )
	public ModelAndView searchmap(HttpServletRequest request) {
		System.out.println( "searchmap() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_map" );
		
		return modelAndView;
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
		
		/*
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		SearchListMapTO slistTO = new SearchListMapTO();
		slistTO.setCpage(cpage);
		
		SearchkeyTO sto = new SearchkeyTO();
		sto.setDoNm( request.getParameter( "sidoVal" ) );
		sto.setSigunguNm( request.getParameter( "gugunVal" ) );
		
		slistTO = mdao.searchmapList(slistTO, sto );
		System.out.println( sto.getDoNm() );
		System.out.println( sto.getSigunguNm() );
		
		ArrayList<SearchkeyTO> lists = slistTO.getSearchLists();
		
		JSONObject listresult = new JSONObject();
		
		JSONArray pageArray = new JSONArray();
		JSONObject pageObject = new JSONObject();
		pageObject.put( "cpage", slistTO.getCpage() );
		
		JSONArray jsonArray = new JSONArray();
		for( SearchkeyTO to : lists ){
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
		
		listresult.put( "jsonArray", jsonArray );
		listresult.put( "pageArray", pageArray );
		
		return listresult;
		
		*/
		
		
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
