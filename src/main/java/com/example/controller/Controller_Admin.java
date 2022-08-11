package com.example.controller;

import java.io.File;
import java.io.IOException;

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

import com.exam.hboard.HBoardDAO;
import com.exam.hboard.HBoardTO;
import com.exam.login.SignUpTO;
import com.exam.mboard.BoardDAO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;
import com.exam.nboard.NBoardDAO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NFileTO;

@RestController
public class Controller_Admin {

	@Autowired
	private BoardDAO dao;

	@Autowired
	private HBoardDAO hdao;

	@Autowired
	private NBoardDAO ndao;

	String url = System.getProperty("user.dir");
	private String mUploadPath = url + "/src/main/webapp/upload/";

	private String hUploadPath = url + "/src/main/webapp/h_upload/";

	private String nUploadPath = url + "/src/main/webapp/n_upload/";

	// 관리자페이지
	@RequestMapping(value = "/admin.do")
	public ModelAndView admin(HttpServletRequest request, HttpSession session) {
		System.out.println("admin() 호출");

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin");

		return modelAndView;
	}

	@RequestMapping(value = "/admin_users.do")
	public ModelAndView adminUsers(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_users");

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_users");

		return modelAndView;
	}

	@RequestMapping(value = "/admin_board.do")
	public ModelAndView adminBoard(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_board 호출");

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_board");

		return modelAndView;
	}

	@RequestMapping(value = "/admin_users_view.do")
	public ModelAndView adminUsersView(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_users_view 호출");

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_users_view");

		return modelAndView;
	}

	@RequestMapping(value = "/admin_board_write.do")
	public ModelAndView adminBoardWrite(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_board_write 호출");

		int cpage = 1;
		if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}

		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(cpage);

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_board_write");
		modelAndView.addObject("cpage", cpage);

		return modelAndView;
	}

	// 파일 중복 체크
	private String getUniqName(String fileName) {
		System.out.println("getUniqName() 호출");

		String tempName = null;
		File file = new File(mUploadPath + fileName);
		System.out.println("file : " + file);
		int lastIdx = fileName.lastIndexOf(".");
		int i = 1;
		while (true) {
			if (!file.exists()) {
				break;
			}
			tempName = fileName;
			tempName = tempName.substring(0, lastIdx) + "_" + i + tempName.substring(lastIdx, tempName.length());
			file = new File(mUploadPath + tempName);
			i++;
		}
		System.out.println("file.getName() : " + file.getName());
		return file.getName();
	}

	// summernote 이미지 업로드
	@RequestMapping(value = "/aimageUpload.do", method = RequestMethod.POST)
	public String auploadSummernoteImage(MultipartFile image, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("uploadSummernoteImage() 호출");

		String savename = image.getOriginalFilename();

		long filedata = image.getResource().contentLength();
		String filesize = Long.toString(filedata);

		savename = getUniqName(savename);
		File target = new File(mUploadPath + savename);
		System.out.println("파일저장 : ");
		System.out.println("target : " + target);
		System.out.println("savename : " + savename);

		response.setContentType("application/json;charset=utf-8");

		try {
			FileCopyUtils.copy(image.getBytes(), target);
		} catch (IOException e) {
			FileUtils.forceDelete(target); // 실패시 저장된 파일 삭제
			System.out.println("[에러] " + e.getMessage());
		}
		String result = savename + "@" + filesize;
		return result;
	}
	
	@RequestMapping(value = "/aboardwrite_ok.do", method=RequestMethod.POST)
	public ModelAndView aboardwriteOk(MultipartFile image, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("aboardwriteOk() 호출");
		
		BoardTO to = new BoardTO();
		HBoardTO hto = new HBoardTO();
		NBoardTO nto = new NBoardTO();	
		FileTO fto = new FileTO();
		NFileTO nfto = new NFileTO();

		int flag = 1;
		
		if( request.getParameter("subject").equals("1")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			System.out.println("ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			System.out.println("vcode : " + to.getVcode());
			
			if(request.getParameter("filesize")!="0") {
				fto.setFilename(request.getParameter("filename"));
				fto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
			}
			flag = dao.mboardWriteOk(to, fto);
			System.out.println("flag : " + flag);
			dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("2")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			System.out.println("ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			System.out.println("vcode : " + to.getVcode());
			
			if(request.getParameter("filesize")!="0") {
				fto.setFilename(request.getParameter("filename"));
				fto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
			}
			flag = dao.mboardWriteOk(to, fto);
			System.out.println("flag : " + flag);
			dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("3")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			System.out.println("ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			System.out.println("vcode : " + to.getVcode());
			
			if(request.getParameter("filesize")!="0") {
				fto.setFilename(request.getParameter("filename"));
				fto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
			}
			flag = dao.mboardWriteOk(to, fto);
			System.out.println("flag : " + flag);
			dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("4")  ) {
			String subject = request.getParameter("subject");
			hto.setSubject(subject);
			hto.setTitle(request.getParameter("title"));
			hto.setWriter((String) session.getAttribute("id"));
			hto.setContent(request.getParameter("content"));
			hto.setUcode((Integer) session.getAttribute("ucode"));
			System.out.println("ucode : " + hto.getUcode());			
			if(request.getParameter("filesize") != "0") {
				hto.setFilename(request.getParameter("filename"));
				hto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
			}
			hto.setVcode(request.getParameter("vcode"));
			System.out.println("vcode : " + hto.getVcode());
			
			flag = hdao.aboardWriteOk(hto);
			System.out.println("flag : " + flag);
			hdao.filecnd(hto);
			
		} else if( request.getParameter("subject").equals("5")  ) {
			String subject = request.getParameter("subject");
			nto.setSubject(subject);
			nto.setTitle(request.getParameter("title"));
			nto.setWriter((String) session.getAttribute("id"));
			nto.setContent(request.getParameter("content"));
			nto.setUcode((Integer) session.getAttribute("ucode"));
			System.out.println("ucode : " + nto.getUcode());
			nto.setVcode(request.getParameter("vcode"));
			System.out.println("vcode : " + nto.getVcode());
			
			if(request.getParameter("filesize")!="0") {
				nfto.setFilename(request.getParameter("filename"));
				nfto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
			}
			flag = ndao.mboardWriteOk(nto, nfto);
			System.out.println("flag : " + flag);
			ndao.filecnd(nto, nfto);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("/board/admin_board_write_ok");
		modelAndView.addObject("flag", flag);

		return modelAndView;
	}
	
	@RequestMapping(value = "/awritecancel.do")
	public void hwritecancel(HttpServletRequest request, HttpSession session) {
		System.out.println("hwritecancel() 호출");

		dao.filedel((String) request.getParameter("filename"));

	}

	@RequestMapping(value = "/admin_board_modify.do")
	public ModelAndView adminBoardModify(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_board_modify 호출");

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_board_modify");

		return modelAndView;
	}

}
