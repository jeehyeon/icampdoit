package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println( "키워드 : " + kto.getKeysearch());
		
		ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)kdao.searchkeyDAO(kto.getKeysearch());
		
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
	public ModelAndView campview(HttpServletRequest request) {
		System.out.println( "campview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/campview" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/searchmapsido.do" )
	public ModelAndView searchmapsido(HttpServletRequest request) {
		System.out.println( "searchmapsido() 호출" );
		
		SearchkeyTO sto = new SearchkeyTO();
		String sido = "";
		
		if( request.getParameter( "sidoVal" ) == "서울시" ) {
			sto.setDoNm( "서울시" );
			sido = "서울시";
		} else if( request.getParameter( "sidoVal" ) == "인천시" ) {
			sto.setDoNm( "인천시" );
			sido = "인천시";
		} else {
			sto.setDoNm( "경기도" );
			sido = "경기도";
		}
		
		System.out.println( "doNm : " + sto.getDoNm() );
		
		//ArrayList<SearchkeyTO> list = (ArrayList<SearchkeyTO>)mdao.listsigunguNm( sto.getDoNm() );

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/json_gugun" );
		//modelAndView.addObject( "list", list );
		modelAndView.addObject( "sido", sido );
		
		return modelAndView;
	}
	
}
