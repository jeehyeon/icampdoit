package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.admin.AdminStatDAO;
import com.exam.home.HomeDAO;
import com.exam.search.InsertGocamping;
import com.exam.search.SearchkeyTO;
import com.exam.weather.WeatherTO;


@RestController
public class Controller {
	@Autowired
	private InsertGocamping gocamp;	
	
	@Autowired
	private AdminStatDAO sdao;
	
	@Autowired
	private HomeDAO dao;
	
	@RequestMapping( value="/home.do" )
	public ModelAndView home(HttpServletRequest request, HttpSession session) {
		
		if(session != null) {
			
		} else {
			request.getSession(true);
		}		

		ArrayList<SearchkeyTO> lists = dao.campInfo();

		ArrayList<WeatherTO> wlists = dao.weatherInfo();
		if( session.isNew() ) {
			sdao.increaseVisitor();
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "home" );
		modelAndView.addObject( "lists", lists );
		modelAndView.addObject( "wlists", wlists );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/about.do" )
	public ModelAndView about(HttpServletRequest request, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "about" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/insertgocamping.do" )
	public ModelAndView insertgocamping(HttpServletRequest request, HttpSession session) {
		
		ArrayList<SearchkeyTO> lists = gocamp.gocampingparse( "인천시" );
		int flag = gocamp.insertapi(lists);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "insert_ok" );
		modelAndView.addObject( "flag", flag );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/insertCampImage.do" )
	public void insertimage(HttpServletRequest request, HttpSession session) {
		
		ArrayList<SearchkeyTO> lists = gocamp.contentIdList();
		
		for(SearchkeyTO kto : lists) {
			gocamp.insertImage(kto);
		}
	}
	
}
