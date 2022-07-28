package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Board {
	
	@RequestMapping( value="/mboardlist.do" )
	public ModelAndView mboardlist(HttpServletRequest request) {
		System.out.println( "mboardlist() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/mboard_list" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardview.do" )
	public ModelAndView mboardview(HttpServletRequest request) {
		System.out.println( "mboardview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/mboard_view" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardwrite.do" )
	public ModelAndView mboardwrite(HttpServletRequest request) {
		System.out.println( "mboardwrite() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/mboard_write" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardmodify.do" )
	public ModelAndView mboardmodify(HttpServletRequest request) {
		System.out.println( "mboardmodify() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/mboard_modify" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request) {
		System.out.println( "hboardlist()호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/hboard_list" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/hboardview.do" )
	public ModelAndView hboardview(HttpServletRequest request) {
		System.out.println( "hboardview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/hboard_view" );
		
		return modelAndView;
	}
	
}
