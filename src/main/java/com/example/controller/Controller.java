package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller {
	
	@RequestMapping( value="/home.do" )
	public ModelAndView home(HttpServletRequest request, HttpSession session) {
		System.out.println( "list() 호출" );
		if(session != null) {
			System.out.println("세션값 : " + session.getAttribute("ucode"));
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "home" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/about.do" )
	public ModelAndView about(HttpServletRequest request) {
		System.out.println( "about() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "about" );
		
		return modelAndView;
	}
	
}
