package com.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.exam.hboard.HBoardDAO;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@RestController
public class Controller_HBoard {
	
	@Autowired
	private HBoardDAO hdao;
		 
	String url = System.getProperty("user.dir");
	private String hUploadPath = url +"/src/main/webapp/h_upload/";
	

		
	@RequestMapping( value="/hboardlist.do" )
	public ModelAndView hboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "hboardlist()호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName( "/board/hboard_list" );
		
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
