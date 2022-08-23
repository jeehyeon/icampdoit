package com.example.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.exam.search.SearchListMapTO;
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

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_map" );
		
		return modelAndView;
	}

	@RequestMapping( value="/searchmapsido.do" )
	public JSONObject searchmapsido(HttpServletRequest request) {
		
		SearchkeyTO sto = new SearchkeyTO();
		String sido = "";
				
		if( request.getParameter( "sidoVal" ).equals("서울시" )) {
			sto.setDoNm( "서울시" );
			sido = "서울시";
			
		} else if( request.getParameter( "sidoVal" ).equals("인천시" ) ){
			sto.setDoNm( "인천시" );
			sido = "인천시";
		} else if( request.getParameter( "sidoVal" ).equals("경기도" ) ){
			sto.setDoNm( "경기도" );
			sido = "경기도";
		}
				
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
	public ModelAndView searchmapgugun(HttpServletRequest request) {
				
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		SearchkeyTO sto = new SearchkeyTO();
		sto.setDoNm( request.getParameter( "sido" ) );
		sto.setSigunguNm( request.getParameter( "gugun" ) );
		
		SearchListMapTO slistTO = new SearchListMapTO();
		slistTO.setCpage(cpage);

		slistTO = mdao.searchmapList(slistTO, sto );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/search_map_result" );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "slistTO", slistTO );
		modelAndView.addObject( "sto", sto );
		return modelAndView;
	}
	
}
