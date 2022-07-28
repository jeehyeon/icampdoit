package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller {
	
	@RequestMapping( value="/home.do" )
	public ModelAndView home(HttpServletRequest request) {
		System.out.println( "home() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "home" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request) {
		System.out.println( "hboardlist() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/board/hboard_list" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="campview.do" )
	public ModelAndView campview(HttpServletRequest request) {
		System.out.println( "campview() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/search/campview" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="login.do" )
	public ModelAndView login(HttpServletRequest request) {
		System.out.println( "login() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/login/login" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="signup.do" )
	public ModelAndView signup(HttpServletRequest request) {
		System.out.println( "signup() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/login/signup" );
		
		return modelAndView;
	}

}
