package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;
import com.exam.login.SignUpTO;
import com.exam.mboard.BoardDAO;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@RestController
public class Controller_Board {
	
	@Autowired
	private BoardDAO dao;
		 
	// 리나 upload 경로
	//private String uploadPath = "C:/java/ProjectGit/src/main/webapp/upload/";
	String url1 = System.getProperty("user.dir");
	private String uploadPath = url1 +"/src/main/webapp/upload/";

	//private int maxFileSize = 10 * 1024 * 1024;
	//private String encoding = "utf-8";
	
	@RequestMapping( value="/mboardlist.do" )
	public ModelAndView mboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardlist() 호출" );

		ArrayList<BoardTO> lists = dao.mboardList();
		ArrayList<BoardTO> reviewLists = dao.mboardListReview();
		ArrayList<BoardTO> freeLists = dao.mboardListFree();
		ArrayList<BoardTO> tradeLists = dao.mboardListTrade();
		
		BoardTO listTO = new BoardTO();
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}		
		modelAndView.setViewName( "/board/mboard_list" );
		modelAndView.addObject( "lists", lists );
		modelAndView.addObject( "reviewLists", reviewLists );
		modelAndView.addObject( "freeLists", freeLists );
		modelAndView.addObject( "tradeLists", tradeLists );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/mboardview.do" )
	public ModelAndView mboardview(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardview() 호출" );
		
		BoardTO to = new BoardTO();
		to.setSeq( request.getParameter( "seq" ) );
		
		to = dao.mboardView(to);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_view" );
		modelAndView.addObject( "to", to );
		
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
	
	// 파일 중복 체크
	private String getUniqName(String fileName) {	
		System.out.println("getUniqName() 호출");
		
		String tempName = null;
		File file = new File(uploadPath + fileName);
		System.out.println("file : " + file);
		int lastIdx = fileName.lastIndexOf(".");
		int i = 1;
		while(true) {
			if(!file.exists()) {
				break;
			}
			tempName = fileName;
			tempName = tempName.substring(0, lastIdx) + "_" + i + tempName.substring(lastIdx, tempName.length());
			file = new File(uploadPath + tempName);
			i++;
		}
		System.out.println("file.getName() : " + file.getName());
		return file.getName();
	}

	// summernote 이미지 업로드
	@RequestMapping(value = "/imageUpload.do", method=RequestMethod.POST)
	public String uploadSummernoteImage(MultipartFile image, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("uploadSummernoteImage() 호출");	
		
		String savename = image.getOriginalFilename();
		
		long filedata = image.getResource().contentLength();
		String filesize = Long.toString(filedata);
		
		savename = getUniqName(savename);
		File target = new File(uploadPath + savename);
		System.out.println("파일저장 : ");
		System.out.println("target : " + target);	
		System.out.println("savename : " + savename);	
		
		//FileCopyUtils.copy(image.getBytes(), target);
		
		//String[] savename = {originname, filesize};
		
		response.setContentType("application/json;charset=utf-8");
		//response.getWriter().print(savename);
		//return new String[] {savename, filesize};
		
		try {
			FileCopyUtils.copy(image.getBytes(), target);
        } catch (IOException e) {
            FileUtils.forceDelete(target);	// 실패시 저장된 파일 삭제	 
            System.out.println( "[에러] " + e.getMessage() );
        }
		String result= savename + "@" + filesize;
		return result;
	}
		
	@RequestMapping(value = "/mboardwrite_ok.do", method=RequestMethod.POST)
	public ModelAndView mboardwriteOk(MultipartFile image, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("mboardwriteOk() 호출");
		System.out.println(request.getParameter("writeOk"));
		System.out.println(request.getParameter("filesize"));
		//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");

		//MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding,
		//		new DefaultFileRenamePolicy());
		
		SignUpTO sto = new SignUpTO();
		System.out.println("세션 아이디값 : " + (String) session.getAttribute("id"));

		BoardTO to = new BoardTO();
		to.setSubject(request.getParameter("subject"));
		to.setTitle(request.getParameter("title"));
		to.setWriter((String) session.getAttribute("id"));
		to.setContent(request.getParameter("content"));
		to.setUcode((Integer) session.getAttribute("ucode"));
		to.setVcode(request.getParameter("vcode"));
		System.out.println("subject : " + request.getParameter("subject"));

		//String file = request.getParameter("writeOk");
		//System.out.println("파일이름 : " + file);
		
		//String filename = file.substring( 0, file.lastIndexOf(",") );
		//long filesize = Long.parseLong( file.substring(file.lastIndexOf(",")+2) );
		
		FileTO fto = new FileTO();
		if(request.getParameter("filesize")!="0") {
		fto.setFilename(request.getParameter("writeOk"));
		fto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
		}
		/*
		 * File file = request.getFile("upload"); if (file != null) {
		 * fto.setFilesize(file.length()); }
		 */
		
		int flag = dao.mboardWriteOk(to, fto);

		dao.filecnd(to, fto);
		ModelAndView modelAndView = new ModelAndView();
		
		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("/board/mboard_write_ok");
		modelAndView.addObject("flag", flag);

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
	
	@RequestMapping( value="/writecancel.do" )
	public void writecancel(HttpServletRequest request, HttpSession session) {
		System.out.println( "writecancel() 호출" );
		
		dao.filedel((String)request.getParameter("filename"));
		
		
	}
	
}
