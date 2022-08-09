package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
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
		System.out.println( "notice()호출" );
		
		ArrayList<NBoardTO> lists = dao.nboardList();
		
		NListTO listTO = new NListTO();
		if(request.getParameter("cpage")!=null && !request.getParameter("cpage").equals("")) {
			listTO.setCpage(Integer.parseInt(request.getParameter("cpage")));
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice" );
		modelAndView.addObject( "lists", lists );
		
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
		to.setSeq( Integer.parseInt(request.getParameter( "seq" )) );
		
		to = dao.nboardView(to);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "/customercare/notice_view" );
		modelAndView.addObject( "to", to );
		
		return modelAndView;
	}
	
}
