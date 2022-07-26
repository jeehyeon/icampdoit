package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller {
	
	@RequestMapping( value="/list.do" )
	public ModelAndView list(HttpServletRequest request) {
		System.out.println( "list() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_list1" );
		
		return modelAndView;
	}

}
