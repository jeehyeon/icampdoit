package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller {
	
	@RequestMapping( value="/home.do" )
	public ModelAndView home(HttpServletRequest request) {
		System.out.println( "list() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "home" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request) {
		System.out.println( "hboardlist() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "hboard_list" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/campview.do" )
	public ModelAndView campview(HttpServletRequest request) {
		System.out.println( "campview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "campview" );
		
		return modelAndView;
	}

}
