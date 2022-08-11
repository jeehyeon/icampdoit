package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.search.InsertGocamping;
import com.exam.search.SearchkeyTO;


@RestController
public class Controller {
	@Autowired
	private InsertGocamping gocamp;	
	
	@RequestMapping( value="/home.do" )
	public ModelAndView home(HttpServletRequest request, HttpSession session) {
		System.out.println( "list() 호출" );
		if(session != null) {
			System.out.println("세션값 ucode : " + session.getAttribute("ucode"));
			System.out.println("세션값 id : " + session.getAttribute("id"));
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "home" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/about.do" )
	public ModelAndView about(HttpServletRequest request, HttpSession session) {
		System.out.println( "about() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "about" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/insertgocamping.do" )
	public ModelAndView insertgocamping(HttpServletRequest request, HttpSession session) {
		System.out.println( "insertgocamping() 호출" );
		
		ArrayList<SearchkeyTO> lists = gocamp.gocampingparse( "경기도" );
		int flag = gocamp.insertapi(lists);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "insert_ok" );
		modelAndView.addObject( "flag", flag );
		
		return modelAndView;
	}
}
