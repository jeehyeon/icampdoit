package com.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.exam.hboard.HBoardDAO;
import com.exam.hboard.HBoardListTO;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@RestController
public class Controller_HBoard {
	
	@Autowired
	private HBoardDAO dao;
		 
	String url = System.getProperty("user.dir");
	private String hUploadPath = url +"/src/main/webapp/h_upload/";
		
	@RequestMapping( value="/hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "hboardlist()호출" );
		
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
		System.out.println( "hboardview() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName( "/board/hboard_view" );
		
		return modelAndView;
	}
	
	
	
}
