package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Login {
	
	
	@RequestMapping( value="/login.do" )
	public ModelAndView login(HttpServletRequest request) {
		System.out.println( "login() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/login/login" );
		
		return modelAndView;
	}

	@RequestMapping( value="/signup.do" )
	public ModelAndView signup(HttpServletRequest request) {
		System.out.println( "signup() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/login/signup" );
		
		return modelAndView;
	}
}
