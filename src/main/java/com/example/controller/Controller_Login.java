package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.login.LoginTO;
import com.exam.login.SignUpTO;
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
	@RequestMapping( value="/signup.do" )
	public ModelAndView signup(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/signup" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/signup_ok.do" )
	public ModelAndView signupOk(HttpServletRequest request) {
		System.out.println( "signup() 호출" );
		SignUpTO sto = new SignUpTO();
		sto.setName(request.getParameter("name"));
		sto.setId(request.getParameter("id"));
		sto.setPwd(request.getParameter("pwd"));
		sto.setBirth(request.getParameter("birth"));
		sto.setEmail(request.getParameter("email"));
		sto.setGen(request.getParameter("gen"));
		sto.setHint(request.getParameter("hint"));
		sto.setAnswer(request.getParameter("answer"));
		System.out.println(sto.getPwd());
		int flag = dao.signUpOK(sto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/signup_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	@RequestMapping( value="/kakao_login.do" )
	public ModelAndView kakaoLogin(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/kakao" );
		
		return modelAndView;
	}
	
	
	@RequestMapping( value="/idcheck.do" )
	public int idcheck(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		System.out.println(id);
		int flag= dao.idCheck(id);
		
		return flag;
	}
	
	@RequestMapping( value="/idsearch.do" )
	public String idsearch(HttpServletRequest request) {
		
		String name = request.getParameter("idname");
		String birth = request.getParameter("idbirth");
		String email = request.getParameter("idemail");
		
		String data= dao.idSearch(name, birth, email);
		
		return data;
	}
}
