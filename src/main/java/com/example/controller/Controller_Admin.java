package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Admin {
	
	
	//관리자페이지
	@RequestMapping( value="/admin.do" )
	public ModelAndView admin(HttpServletRequest request) {
		System.out.println( "admin() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin/admin" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_users.do" )
	public ModelAndView adminUsers(HttpServletRequest request) {
		System.out.println( "admin() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin/admin_users" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_board.do" )
	public ModelAndView adminBoard(HttpServletRequest request) {
		System.out.println( "admin() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin/admin_board" );
		
		return modelAndView;
	}

	
}
