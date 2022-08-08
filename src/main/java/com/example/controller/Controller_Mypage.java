package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.login.SignUpTO;
import com.exam.login.mypageDAO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.FileTO;


@RestController
public class Controller_Mypage {
	
	@Autowired
	private mypageDAO dao;
	
	@RequestMapping( value="/mypage.do" )
	public ModelAndView mypage(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypage() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}		
		
		SignUpTO sto = new SignUpTO();
		sto.setUcode( String.valueOf( session.getAttribute("ucode") ) );
		
		sto = dao.mypageView(sto);
		
		modelAndView.setViewName( "/mypage/mypage" );
		modelAndView.addObject("sto", sto);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mypagemodify_ok.do" )
	public ModelAndView mypageModifyOk(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypageModifyOk() 호출" );
		
		SignUpTO sto = new SignUpTO();
		sto.setUcode(request.getParameter( "ucode" ));
		System.out.println( "수정 : " + request.getParameter( "ucode" ) );
		sto.setName(request.getParameter( "name" ));
		System.out.println( "이름수정 : " + request.getParameter( "name" ) );
		sto.setGen(request.getParameter( "gen" ));
		sto.setEmail(request.getParameter( "email" ));
		sto.setBirth(request.getParameter( "birth" ));
		
		int flag = dao.mypageModifyOk(sto);
		System.out.println( "flag : " + flag);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}				
		modelAndView.setViewName( "/mypage/mypage_modify_ok" );
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mypagesub.do" )
	public ModelAndView mypagesub(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypagesub() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/mypage/mypage_sub" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mypagemylist.do" )
	public ModelAndView mypagemylist(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypagemylist() 호출" );
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage( cpage );
		
		listTO = dao.boardList(listTO);
				
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/mypage/mypage_mylist" );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "listTO", listTO );
		
		return modelAndView;
	}	
}
