package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.login.LoginTO;
import com.exam.login.loginDAO;


@RestController
public class Controller_Login {
	@Autowired
	private loginDAO dao;
	
	@RequestMapping( value="/login.do" )
	public ModelAndView login(HttpServletRequest request) {
		System.out.println( "login() 호출" );

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/login" );
		
		return modelAndView;
	}

	@RequestMapping( value="/login_ok.do" )
	public ModelAndView loginOk(HttpServletRequest request) {
		System.out.println( "loginOk() 호출" );
		
		LoginTO lto = new LoginTO();
		lto.setId(request.getParameter("id"));
		lto.setPwd(request.getParameter("pwd"));
	
		int flag = dao.loginOK(lto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/login_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	@RequestMapping( value="/kakao_login.do" )
	public ModelAndView kakaoLogin(HttpServletRequest request) {
		System.out.println( "kakaoLogin() 호출" );

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/kakao" );
		
		return modelAndView;
	}
}
