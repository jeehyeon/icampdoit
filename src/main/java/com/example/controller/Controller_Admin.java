package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller_Admin {
	
	
	//관리자페이지
	@RequestMapping( value="/admin.do" )
	public ModelAndView admin(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_users.do" )
	public ModelAndView adminUsers(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin_users" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin_users" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_board.do" )
	public ModelAndView adminBoard(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin_board 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin_board" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_users_view.do" )
	public ModelAndView adminUsersView(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin_users_view 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin_users_view" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/admin_board_write.do" )
	public ModelAndView adminBoardWrite(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin_board_write 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin_board_write" );
		
		return modelAndView;
	}
	@RequestMapping( value="/admin_board_modify.do" )
	public ModelAndView adminBoardModify(HttpServletRequest request, HttpSession session) {
		System.out.println( "admin_board_modify 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "admin/admin_board_modify" );
		
		return modelAndView;
	}
	
}
