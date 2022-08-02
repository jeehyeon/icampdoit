package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Customercare {
	
	@RequestMapping( value="/notice.do" )
	public ModelAndView notice(HttpServletRequest request) {
		System.out.println( "notice()호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/faq.do" )
	public ModelAndView faq(HttpServletRequest request) {
		System.out.println( "faq() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/faq" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/noticeview.do" )
	public ModelAndView noticeview(HttpServletRequest request) {
		System.out.println( "noticeview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice_view" );
		
		return modelAndView;
	}
	
}
