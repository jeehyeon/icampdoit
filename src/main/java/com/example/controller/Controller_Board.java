package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.CmtTO;
import com.exam.mboard.FileTO;
import com.exam.login.SignUpTO;
import com.exam.mboard.BoardDAO;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@RestController
public class Controller_Board {
	
	@Autowired
	private BoardDAO dao;
		 	
	String url = System.getProperty("user.dir");
	private String uploadPath = url +"/src/main/webapp/upload/";
	
	@RequestMapping( value="/mboardlist.do" )
	public ModelAndView mboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardlist() 호출" );
		System.out.println("requsest.getParameter Cpage : " + request.getParameter( "cpage" ));
		int subjectValue = 2;
		if(request.getParameter( "subjectValue" ) != null && !request.getParameter( "subjectValue" ).equals( "" ) ) {
			subjectValue = Integer.parseInt( request.getParameter( "subjectValue" ) );
		}
				
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		System.out.println("test cpage" + cpage);
		BoardListTO blistTO = new BoardListTO();
		blistTO.setCpage( cpage );
		
		
		blistTO = dao.mboardList( blistTO, subjectValue );
		
		ModelAndView modelAndView = new ModelAndView();
		System.out.println( subjectValue );
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}		
		modelAndView.setViewName( "/board/mboard_list" );
		modelAndView.addObject( "blistTO", blistTO );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "subjectValue", subjectValue );
		
		return modelAndView;
	}
	
	@RequestMapping( value="/selectmboardlist.do" )
	public String selectmboardlist(HttpServletRequest request, HttpSession session) {
		System.out.println( "selectmboardlist() 호출" );
		
		//ArrayList<BoardTO> lists = dao.mboardList();
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}

		BoardTO listTO = new BoardTO();
		listTO.setSubject( String.valueOf(request.getParameter( "subjectValue" )) );
		
		BoardListTO blistTO = new BoardListTO();
		blistTO.setCpage( cpage );
		
		blistTO = dao.mboardSubjectChange(blistTO, listTO);
		System.out.println(listTO.getSubject());
		
		
		StringBuilder sbHtml = new StringBuilder();
		
		ArrayList<BoardTO> freeLists = blistTO.getBoardLists();
		
		for( BoardTO to : freeLists ){
			String seq = to.getSeq();
			String subject = to.getSubject();
			String writer = to.getWriter();
			String title = to.getTitle();
			String wdate = to.getWdate();
			String hit = to.getHit();
			
			sbHtml.append( "<tr onmouseover=\"this.style.background='#f1f6ea'\" onmouseout=\"this.style.background='white'\" style=\"cursor: pointer;\" onclick=\"location.href='mboardview.do?seq=" + seq + "'\">" );
			sbHtml.append( "<td class=\"text-center\">" + seq + "</td>" );
			sbHtml.append( "<td class=\"fw-bold text-center\">" + title + "</td>" );
	        sbHtml.append( "<td></td>" );
	        sbHtml.append( "<td class=\"text-end\">" + writer + "</td>" );
	        sbHtml.append( "<td class=\"text-end\">" + wdate + "</td>" );
	        sbHtml.append( "<td class=\"text-end\">" + hit + "</td>" );
	        sbHtml.append( "</tr>" );
		}
		
		String result = sbHtml.toString();
		
		return result;
	}
	
	@RequestMapping( value="/mboardview.do" )
	public ModelAndView mboardview(HttpServletRequest request, HttpSession session) {
		System.out.println( "mboardview() 호출" );
		
		int subjectValue = 2;
		if(request.getParameter( "subjectValue" ) != null && !request.getParameter( "subjectValue" ).equals( "" ) ) {
			subjectValue = Integer.parseInt( request.getParameter( "subjectValue" ) );
		}
		
		BoardTO to = new BoardTO();
		to.setSeq( request.getParameter( "seq" ) );
		
		to = dao.mboardView(to);
		
		BoardListTO bto = new BoardListTO();
		int cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		
		CmtTO cto = new CmtTO();
		cto.setPseq(request.getParameter( "seq" ));
		ArrayList<CmtTO> cmtArr = dao.mboardViewComment(cto);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_view" );
		modelAndView.addObject( "to", to );
		modelAndView.addObject( "cmtArr", cmtArr );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "subjectValue", subjectValue );
		
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
	
	@RequestMapping( value="/mboarddelete_ok.do" )
	public ModelAndView mboarddeleteOk(HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println( "mboarddeleteOk() 호출" );
		System.out.println("게시글삭제 컨트롤러 seq값 : " + request.getParameter("viewseq"));
		//게시글 삭제 전 이미지 파일 확인
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("viewseq"));
		FileTO fto = new FileTO();
		fto=dao.mboarddelfilecheck(to);
		
		if(fto.getFilename() !="null") {
			//파일이 존재 => 삭제
			System.out.println("파일이 존재");
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/board/mboard_delete_ok" );
		
		return null;
	}
	
	
	@RequestMapping( value="/writecancel.do" )
	public void writecancel(HttpServletRequest request, HttpSession session) {
		System.out.println( "writecancel() 호출" );
		
		dao.filedel((String)request.getParameter("filename"));
		
		
	}
	
	@RequestMapping( value="/cmt_insert.do" )
	public JSONObject cmtInsert(HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println( "mboarddeleteOk() 호출" );
		//System.out.println(request.getParameter("ucode"));
		//System.out.println(request.getParameter("id"));
		//System.out.println(request.getParameter("seq"));
		//System.out.println(request.getParameter("comment"));
		
		CmtTO cto = new CmtTO();
		cto.setPseq(request.getParameter("seq"));
		cto.setUcode(request.getParameter("ucode"));
		cto.setWriter(request.getParameter("id"));
		cto.setContent(request.getParameter("comment"));
		
		int flag = dao.mboardWriteComment(cto);
		JSONArray cmtList = new JSONArray();
		if(flag == 0 ) {
			ArrayList<CmtTO> lists = dao.mboardViewComment(cto);
			//System.out.println("테스트용");
			for(CmtTO to : lists) {
				System.out.println("코멘트 : "+ to.getContent());
				JSONObject obj = new JSONObject();
				obj.put("writer", to.getWriter());
				obj.put("comment", to.getContent());
				obj.put("wdate", to.getWdate());
				obj.put("ucode", to.getUcode());
				obj.put("pseq", to.getPseq());
				obj.put("seq", to.getSeq());
				cmtList.add(obj);
			}
		}
		
		JSONObject data = new JSONObject();
		data.put("cmtList", cmtList);
	//System.out.println("제이슨 어레이 : "+ cmtList);
		
		
		
		return data;
	}
	
	@RequestMapping( value="/cmtdelete.do" )
	public String cmtList(HttpServletRequest request, HttpSession session) throws IOException, ParseException {
		System.out.println( "mboarddeleteOk() 호출" );
		int flag = 1;
		//System.out.println(request.getParameter("ucode"));
		//System.out.println(request.getParameter("id"));
		//System.out.println(request.getParameter("seq"));
		//System.out.println(request.getParameter("comment"));
		String body = (String)request.getParameter("replyseq");
		System.out.println("cmtdelete 데이터 : " + body);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(body);
		JSONObject data = (JSONObject)obj;
		System.out.println("댓글삭제 데이터 seq : "+ data.get("seq"));
		System.out.println("댓글삭제 데이터 ucode : "+ data.get("ucode") );
		System.out.println("댓글삭제 데이터 session ucode : "+ session.getAttribute("ucode"));
		
		
		if(!(session.getAttribute("ucode").toString()).equals(data.get("ucode").toString())) {
			flag=2;
			return Integer.toString(flag);
		}
		
		CmtTO cto = new CmtTO();
		cto.setSeq((String)data.get("seq"));
		
		flag=dao.mboardDeleteComment(cto);
		
		return Integer.toString(flag);
	}
	
}
