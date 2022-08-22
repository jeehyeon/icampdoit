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
		
		SignUpTO sto = new SignUpTO();
		sto.setUcode(request.getParameter( "ucode" ));
		sto.setName(request.getParameter( "name" ));
		sto.setGen(request.getParameter( "gen" ));
		sto.setEmail(request.getParameter( "email" ));
		sto.setBirth(request.getParameter( "birth" ));
		
		int flag = dao.mypageModifyOk(sto);
		
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

		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		
		SignUpTO to = new SignUpTO();
		to.setUcode( String.valueOf( session.getAttribute("ucode") ) );
						
		ArrayList<SearchkeyTO> lists = dao.subList(to);
		
		modelAndView.setViewName( "/mypage/mypage_sub" );
		modelAndView.addObject( "lists", lists );
		
		return modelAndView;
	}	
	
	@RequestMapping( value="/delsub.do" )
	public ModelAndView campsubscribe(HttpServletRequest request, HttpSession session) {
		int flag =1;
		
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
