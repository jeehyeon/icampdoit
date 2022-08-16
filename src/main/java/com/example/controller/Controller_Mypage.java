package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.login.SignUpTO;
import com.exam.login.MypageDAO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;
import com.exam.search.SearchkeyDAO;
import com.exam.search.SearchkeyTO;


@RestController
public class Controller_Mypage {
	
	@Autowired
	private MypageDAO dao;
	
	@Autowired
	SearchkeyDAO kdao;
	
	@RequestMapping( value="/mypage.do" )
	public ModelAndView mypage(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypage() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}		
		
		SignUpTO sto = new SignUpTO();
		System.out.println("1");
		sto.setUcode( String.valueOf( session.getAttribute("ucode") ) );
		System.out.println("2");
		sto = dao.mypageView(sto);
		System.out.println("3");
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
	
	@RequestMapping( value="/mypagemylist.do" )
	public ModelAndView mypagemylist(HttpServletRequest request, HttpSession session) {
		System.out.println( "mypagemylist() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		BoardTO to = new BoardTO();
		to.setUcode((Integer) session.getAttribute("ucode"));
		
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage( cpage );
		
		listTO = dao.boardList(listTO, to);
				
		modelAndView.setViewName( "/mypage/mypage_mylist" );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "listTO", listTO );
		
		return modelAndView;
	}	
	
	@RequestMapping( value="/mypagesub.do" )
	public ModelAndView mypagesub(HttpServletRequest request, HttpSession session) {
		System.out.println( "mysublist() 호출" );

		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		
		SignUpTO to = new SignUpTO();
		to.setUcode( String.valueOf( session.getAttribute("ucode") ) );
		
		int ucode = (Integer)session.getAttribute("ucode");
				
		ArrayList<SearchkeyTO> lists = dao.subList(to);
		System.out.println( "mysublist() 호출" );		
		
		modelAndView.setViewName( "/mypage/mypage_sub" );
		modelAndView.addObject( "lists", lists );
		
		return modelAndView;
	}	
	
	@RequestMapping(value="/delsub.do")
	public ModelAndView campsubscribe(HttpServletRequest request, HttpSession session) {
		int flag =1;
		System.out.println("campsubscribe 찜취소");
		
		ModelAndView modelAndView = new ModelAndView();
		
		if( session.getAttribute("ucode") == null ) {
			flag = 2;
			return modelAndView;
		}	
		int ucode = (Integer)session.getAttribute("ucode");
		int sub = kdao.campSubscribeCheck( Integer.toString(ucode), request.getParameter("contentId") );
		if( sub == 0 ) {
			//찜DB존재 => 찜 삭제
			flag = kdao.campSubscribeDel( Integer.toString(ucode), request.getParameter("contentId") );
		}		
		modelAndView.setViewName( "/mypage/mypage_sub_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	
}
