package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Mypage {
	
	
	@RequestMapping( value="/mypage.do" )
	public ModelAndView mypage(HttpServletRequest request) {
		System.out.println( "mypage() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/mypage/mypage" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mypagesub.do" )
	public ModelAndView mypagesub(HttpServletRequest request) {
		System.out.println( "mypagesub() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/mypage/mypage_sub" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mypagemylist.do" )
	public ModelAndView mypagemylist(HttpServletRequest request) {
		System.out.println( "mypagemylist() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/mypage/mypage_mylist" );
		
		return modelAndView;
	}	
}
