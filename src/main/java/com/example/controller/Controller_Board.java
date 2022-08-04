package com.example.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;
import com.exam.login.SignUpTO;
import com.exam.mboard.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@RestController
public class Controller_Board {
	
	@Autowired
	private BoardDAO dao;
	
	private String uploadPath = "C:/java/ProjectGit/src/main/webapp/upload"; // 리나 upload 경로
	private int maxFileSize = 20 * 1024 * 1024;
	private String encoding = "utf-8";
	
	@RequestMapping( value="/mboardlist.do" )
	public ModelAndView mboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardlist() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_list" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardview.do" )
	public ModelAndView mboardview(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardview() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_view" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardwrite.do" )
	public ModelAndView mboardwrite(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardwrite() 호출" );
		
		int cpage = 1;
		if( request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}
		
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(cpage);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_write" );
		modelAndView.addObject( "cpage", cpage );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardwrite_ok.do" )
	public ModelAndView mboardwriteOk(HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println( "mboardwriteOk() 호출" );
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());
		SignUpTO sto = new SignUpTO();
		
		BoardTO to = new BoardTO();
		to.setSubject( multi.getParameter( "subject" ) );
		to.setTitle( multi.getParameter( "title" ) );
		to.setWriter( sto.getId() );
		to.setContent( multi.getParameter( "content" ) );
		to.setUcode( sto.getUcode() );
		System.out.println("subject : " +  multi.getParameter( "subject" ) );
		
		FileTO fto = new FileTO();		
		fto.setFilename( multi.getFilesystemName( "upload" ) );
		File file = multi.getFile( "upload" ); 
		if( file != null ) {
			fto.setFilesize( file.length() );
		}
		
		int flag = dao.mboardWriteOk(to, fto);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_write_ok" );
		modelAndView.addObject( "flag", flag );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardmodify.do" )
	public ModelAndView mboardmodify(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardmodify() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_modify" );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardmodify_ok.do" )
	public ModelAndView mboardmodifyOk(HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println( "mboardmodifyOk() 호출" );
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_modify_ok" );
		
		return modelAndView;
	}
	
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
