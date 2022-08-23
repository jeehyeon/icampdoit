package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.login.LoginTO;
import com.exam.login.SignUpTO;
import com.exam.login.LoginDAO;


@RestController
public class Controller_Login {
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping( value="/login.do" )
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		
		String referer = request.getHeader("Referer");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/login" );
		
		modelAndView.addObject("referer", referer);
		return modelAndView;
	}

	@RequestMapping( value="/login_ok.do" )
	public ModelAndView loginOk(HttpServletRequest request, HttpSession session) {
		
		LoginTO lto = new LoginTO();
		lto.setId(request.getParameter("id"));
		lto.setPwd(request.getParameter("pwd"));
		lto.setUri(request.getParameter("uri"));
	
		int ucode = dao.loginOK(lto);
		
		if(ucode != -1) {
			session.setAttribute("ucode",ucode);
			session.setAttribute("prevPage",lto.getUri());
			session.setAttribute("id", lto.getId());
			session.setMaxInactiveInterval(60*60);
		}
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/login_ok" );
		modelAndView.addObject("ucode", ucode);
		modelAndView.addObject("prevPage", lto.getUri());

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

		int flag = dao.signUpOK(sto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/signup_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	

	@RequestMapping( value="/idcheck.do" )
	public int idcheck(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		int flag= dao.idCheck(id);
		
		return flag;
	}
	
	@RequestMapping( value="/idsearch.do" )
	public String idsearch(HttpServletRequest request) {

		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		String data= dao.idSearch(name, birth, email);
		
		return data;
	}
	
	@RequestMapping( value="/newpwd.do" )
	public ModelAndView newpwd(HttpServletRequest request) {

		String ucode = request.getParameter("ucode");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/newpwd" );
		modelAndView.addObject("ucode", ucode);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/pwdcheck.do" )
	public String pwdcheck(HttpServletRequest request) {

		SignUpTO sto = new SignUpTO();
		sto.setName(request.getParameter("name"));
		sto.setId(request.getParameter("id"));
		sto.setEmail(request.getParameter("email"));
		sto.setHint(request.getParameter("hint"));
		sto.setAnswer(request.getParameter("answer"));
		
		String result = dao.pwdCheck(sto);
		
		return result;
	}
	
	@RequestMapping( value="/newpwd_ok.do" )
	public ModelAndView newpwdOk(HttpServletRequest request) {

		String pwd = request.getParameter("pwd");
		String ucode = request.getParameter("ucode");
				
		int flag = dao.pwdset(pwd, ucode);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/newpwd_ok" );
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	
	@RequestMapping( value="/kakaologin_form.do" )
	public ModelAndView kakaologin_form(HttpServletRequest request, HttpSession session) {
		
		SignUpTO sto = new SignUpTO();
		
		sto.setName(request.getParameter("kakaonickname"));
		sto.setEmail(request.getParameter("kakaoemail"));
		sto.setKid(request.getParameter("kakaokid"));
		
		String kuri = request.getParameter("kuri");
		LoginTO lto = new LoginTO();
		lto.setUri(request.getParameter( "uri") );
						
		int ucode = dao.kakaoCheck(sto.getName(), sto.getEmail(), sto.getKid());
		
		String id="";
		
		if(ucode != -1) {
			id = dao.kakaoLoginID(ucode);			
			session.setAttribute("ucode", ucode);
			session.setAttribute("id", id);
		}
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/kakaoLogin_ok" );
		modelAndView.addObject("ucode", ucode);
		modelAndView.addObject("id", id);
		modelAndView.addObject("sto", sto);
		modelAndView.addObject("prevPage", kuri);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/kakaosignup.do" )
	public ModelAndView kakaosignup(HttpServletRequest request) {
		
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
		
		int flag = dao.signUpOK(sto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/signup_ok" );
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
		
	@RequestMapping( value="/logout.do" )
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login/logout_ok" );
		modelAndView.addObject("prevPage", referer);
		
		return modelAndView;
	}
	
}
