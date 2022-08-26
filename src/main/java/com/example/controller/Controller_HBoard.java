package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.exam.hboard.HBoardDAO;
import com.exam.hboard.HBoardListTO;
import com.exam.hboard.HBoardTO;

@RestController
public class Controller_HBoard {
	
	@Autowired
	private HBoardDAO dao;
		
	@RequestMapping( value="/hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request, HttpSession session) {
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		HBoardListTO listTO = new HBoardListTO();
		listTO.setCpage( cpage );
		
		listTO = dao.boardList( listTO );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		
		modelAndView.setViewName( "/board/hboard_list" );
		modelAndView.addObject( "listTO", listTO );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/hboardview.do" )
	public ModelAndView hboardview(HttpServletRequest request, HttpSession session) {
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		HBoardTO  to = new HBoardTO();
		to.setSeq( request.getParameter( "seq" ) );
		
		to = dao.boardview(to);	
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		
		modelAndView.setViewName( "/board/hboard_view" );
		modelAndView.addObject( "to", to );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}

}
