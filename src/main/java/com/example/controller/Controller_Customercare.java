package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.nboard.NBoardDAO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NListTO;


@RestController
public class Controller_Customercare {
	
	@Autowired
	private NBoardDAO dao;
	
	@RequestMapping( value="/notice.do" )
	public ModelAndView notice(HttpServletRequest request, HttpSession session) {
		
		int cpage=1;
		if(request.getParameter("cpage")!=null && !request.getParameter("cpage").equals("")) {
			cpage = (Integer.parseInt(request.getParameter("cpage")));
		}
		
		NListTO listTO = new NListTO();
		listTO.setCpage(cpage);	
		
		listTO = dao.nList(listTO);	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice" );
		modelAndView.addObject( "listTO", listTO );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/faq.do" )
	public ModelAndView faq(HttpServletRequest request) {
		System.out.println( "faq() 호출" );
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/faq" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/noticeview.do" )
	public ModelAndView noticeview(HttpServletRequest request) {
		System.out.println( "noticeview() 호출" );
		
		NBoardTO to = new NBoardTO();
		to.setSeq( request.getParameter( "seq" ) );
		
		to = dao.nboardView(to);
		
		int cpage = (Integer.parseInt(request.getParameter( "cpage" )));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice_view" );
		modelAndView.addObject( "to", to );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}
	
}
