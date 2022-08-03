package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView loginOk(HttpServletRequest request, HttpSession session) {
		System.out.println( "loginOk() 호출" );
		
		LoginTO lto = new LoginTO();
		lto.setId(request.getParameter("id"));
		lto.setPwd(request.getParameter("pwd"));
	
		int ucode = dao.loginOK(lto);
		
		if(ucode != -1) {
			session.setAttribute("ucode", ucode);
			session.setMaxInactiveInterval(60*60);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/login_ok" );
		modelAndView.addObject("ucode", ucode);
		modelAndView.addObject("id", lto.getId());
		
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
		sto.setKid("0");
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
		System.out.println("idsearch() 실행");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		System.out.println("1 "+name);
		System.out.println("2 "+birth);
		System.out.println("3 "+email);
		String data= dao.idSearch(name, birth, email);
		
		return data;
	}
	
	@RequestMapping( value="/newpwd.do" )
	public ModelAndView newpwd(HttpServletRequest request) {
		System.out.println("newpwd() 호출");
		String ucode = request.getParameter("ucode");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/newpwd" );
		modelAndView.addObject("ucode", ucode);
		return modelAndView;
	}
	
	@RequestMapping( value="/pwdcheck.do" )
	public String pwdcheck(HttpServletRequest request) {
		System.out.println("pwdcheck() 실행");
		SignUpTO sto = new SignUpTO();
		sto.setName(request.getParameter("name"));
		sto.setId(request.getParameter("id"));
		sto.setEmail(request.getParameter("email"));
		sto.setHint(request.getParameter("hint"));
		sto.setAnswer(request.getParameter("answer"));
		
		System.out.println("hint" + sto.getHint());
		String result = dao.pwdCheck(sto);
		
		return result;
	}
	
	@RequestMapping( value="/newpwd_ok.do" )
	public ModelAndView newpwdOk(HttpServletRequest request) {
		System.out.println("newpwdOk() 실행");
		String pwd = request.getParameter("pwd");
		String ucode = request.getParameter("ucode");
		
		
		int flag = dao.pwdset(pwd, ucode);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/newpwd_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	
	@RequestMapping( value="/kakaologin_form.do" )
	public ModelAndView kakaologin_form(HttpServletRequest request) {
		System.out.println("kakaologin_form() 실행");
		SignUpTO sto = new SignUpTO();
		
		sto.setName(request.getParameter("kakaonickname"));
		sto.setEmail(request.getParameter("kakaoemail"));
		sto.setKid(request.getParameter("kakaokid"));
		
		System.out.println("kakaologin_form : " + sto.getKid());
		
		int flag = dao.kakaoCheck(sto.getName(), sto.getEmail(), sto.getKid());
		
		System.out.println( "flag : " + flag );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/kakaoLogin_ok" );
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("sto", sto);
		
		return modelAndView;
	}
	@RequestMapping( value="/kakaosignup.do" )
	public ModelAndView kakaosignup(HttpServletRequest request) {
		System.out.println("kakaosignup() 실행");
		//data
		SignUpTO sto = new SignUpTO();
		sto.setName(request.getParameter("name"));
		sto.setEmail(request.getParameter("email"));
		sto.setKid(request.getParameter("kid"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/kakaoLogin_form" );
		modelAndView.addObject("sto", sto);
		return modelAndView;
	}
	
	
	
	@RequestMapping( value="/kakaosignup_ok.do" )
	public ModelAndView kakaosignupOk(HttpServletRequest request) {
		System.out.println( "kakaosignupOk() 호출" );
		
		SignUpTO sto = new SignUpTO();
		sto.setName(request.getParameter("name"));
		sto.setId(request.getParameter("id"));
		sto.setPwd(request.getParameter("pwd"));
		sto.setBirth(request.getParameter("birth"));
		sto.setEmail(request.getParameter("email"));
		sto.setGen(request.getParameter("gen"));
		sto.setHint(request.getParameter("hint"));
		sto.setAnswer(request.getParameter("answer"));
		sto.setKid(request.getParameter("kid"));
		System.out.println("사인업 아이디: " + sto.getId());
		System.out.println("사인업 이름: " + sto.getName());
		System.out.println("사인업 이메일: " + sto.getEmail());
		System.out.println("사인업 생일: " + sto.getBirth());
		System.out.println("사인업 힌트: " + sto.getHint());
		System.out.println("사인업 답변: " + sto.getAnswer());
		
		int flag = dao.signUpOK(sto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/signup_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
}
