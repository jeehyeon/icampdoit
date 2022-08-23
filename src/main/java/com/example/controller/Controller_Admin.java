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

import com.exam.admin.AdminDAO;
import com.exam.admin.AdminListTO;
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
	
	@Autowired
	private AdminDAO adao;

	String url = System.getProperty("user.dir");
	private String mUploadPath = url + "/src/main/webapp/upload/";

	private String hUploadPath = url + "/src/main/webapp/h_upload/";

	private String nUploadPath = url + "/src/main/webapp/n_upload/";

	// 관리자페이지
	@RequestMapping(value = "/admin_board.do")
	public ModelAndView adminBoard(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_board 호출");
		//System.out.println("컨트롤러에서 최초로 받은 말머리 : " + request.getParameter( "subjectValue" ));
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		System.out.println( "subval:" + request.getParameter("subjectValue") );
		System.out.println( "cpage:" + request.getParameter("cpage") );
		
		AdminListTO listTO = new AdminListTO();
		listTO.setCpage( cpage );
		
		String subjectValue = "5";
		
		if(request.getParameter( "subjectValue" ) != null && !request.getParameter( "subjectValue" ).equals( "" ) ) {
			subjectValue = request.getParameter( "subjectValue" );		
		};
		
		if( subjectValue.equals( "1" ) ) {
			listTO = adao.mboardList(listTO, subjectValue);
			//System.out.println("말머리선택 : " + request.getParameter( "subjectValue" ));		
		} else if( subjectValue.equals( "2" ) ) {
			listTO = adao.mboardList(listTO, subjectValue);
			//System.out.println("말머리선택 : " + request.getParameter( "subjectValue" ));		
		} else if( subjectValue.equals( "3" ) ) {
			listTO = adao.mboardList(listTO, subjectValue);
			//System.out.println("말머리선택 : " + request.getParameter( "subjectValue" ));		
		} else if( subjectValue.equals( "4" ) ) {
			listTO = adao.hboardList(listTO, subjectValue);
			//System.out.println("말머리선택 : " + request.getParameter( "subjectValue" ));		
		} else if( subjectValue.equals( "5" ) ) {
			listTO = adao.nboardList(listTO, subjectValue);
			//System.out.println("말머리선택 : " + request.getParameter( "subjectValue" ));					
		}
				
		
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_board");
		modelAndView.addObject( "listTO", listTO );
		modelAndView.addObject( "cpage", cpage );
		modelAndView.addObject( "subjectValue", subjectValue );
		

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
	private String getUniqName(String fileName, String url) {
		System.out.println("getUniqName() 호출");

		String tempName = null;
		File file = new File(url + fileName);
		System.out.println("file : " + file);
		int lastIdx = fileName.lastIndexOf(".");
		int i = 1;
		while (true) {
			if (!file.exists()) {
				break;
			}
			tempName = fileName;
			tempName = tempName.substring(0, lastIdx) + "_" + i + tempName.substring(lastIdx, tempName.length());
			file = new File(url + tempName);
			i++;
		}
		System.out.println("file.getName() : " + file.getName());
		return file.getName();
	}

	// summernote 이미지 업로드
	@RequestMapping(value = "/aimageUpload.do", method = RequestMethod.POST)
	public String auploadSummernoteImage(MultipartFile image, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("auploadSummernoteImage() 호출");

		String savename = image.getOriginalFilename();
		String subject = request.getParameter("subject");
		//System.out.println("이미지 subject : " + subject);

		long filedata = image.getResource().contentLength();
		String filesize = Long.toString(filedata);

		String uploadPath = "";
		
		if( subject.equals("4") ) {
			savename = getUniqName(savename, hUploadPath);		
			uploadPath = hUploadPath;
		} else if( subject.equals("5") ) {
			savename = getUniqName(savename, nUploadPath);		
			uploadPath = nUploadPath;
		} else if( subject.equals("1") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		} else if( subject.equals("2") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		} else if( subject.equals("3") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		}
		
		File target = new File(uploadPath + savename);
		
		//System.out.println("파일저장 : "+ target);
		//System.out.println("savename : " + savename);

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
	public String aboardwriteOk(MultipartFile image, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("aboardwriteOk() 호출");
		
		BoardTO to = new BoardTO();
		HBoardTO hto = new HBoardTO();
		NBoardTO nto = new NBoardTO();	
		
		

		int flag = 1;
		
		if( request.getParameter("subject").equals("1")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			//System.out.println("1ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			//System.out.println("1vcode : " + to.getVcode());
			
			flag = dao.mboardWriteOk(to);
			
			System.out.println( "filename 넘어오나:" + request.getParameterValues("filename"));
			
			if(request.getParameter("filesize")!=null || request.getParameter("filesize")!="") {
				String[] filenames = request.getParameterValues("filename");
				String[] filesizes = request.getParameterValues("filesize");
				//System.out.println( "컨트롤러에서filenames: " + filenames.toString() );
				
				for (int i = 0; i < filenames.length; i++) {
					FileTO fto = new FileTO();
					System.out.println(filenames[i]);  
					fto.setFilename(filenames[i]);
					fto.setFilesize(Long.parseLong(filesizes[i]) );
					flag = dao.mboardWriteFileOk(to, fto);
					dao.filecnd(to, fto);
				};
			}			
			
			//System.out.println("1flag : " + flag);
			//dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("2")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			//System.out.println("2ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			//System.out.println("2vcode : " + to.getVcode());
			
			flag = dao.mboardWriteOk(to);
			
			if(request.getParameter("filesize")!=null || request.getParameter("filesize")!="") {
				String[] filenames = request.getParameterValues("filename");
				String[] filesizes = request.getParameterValues("filesize");
				
				for (int i = 0; i < filenames.length; i++) {  
					FileTO fto = new FileTO();
					System.out.println(filenames[i]);  
					fto.setFilename(filenames[i]);
					fto.setFilesize(Long.parseLong(filesizes[i]) );
					flag = dao.mboardWriteFileOk(to, fto);
					dao.filecnd(to, fto);
				};
			}		
			
			//System.out.println("2flag : " + flag);
			//dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("3")  ) {
			String subject = request.getParameter("subject");
			to.setSubject(subject);
			to.setTitle(request.getParameter("title"));
			to.setWriter((String) session.getAttribute("id"));
			to.setContent(request.getParameter("content"));
			to.setUcode((Integer) session.getAttribute("ucode"));
			//System.out.println("3ucode : " + to.getUcode());
			to.setVcode(request.getParameter("vcode"));
			//System.out.println("3vcode : " + to.getVcode());
			
			flag = dao.mboardWriteOk(to);
			
			if(request.getParameter("filesize")!=null || request.getParameter("filesize")!="") {
				String[] filenames = request.getParameterValues("filename");
				String[] filesizes = request.getParameterValues("filesize");
				
				for (int i = 0; i < filenames.length; i++) { 
					FileTO fto = new FileTO();
					System.out.println(filenames[i]);  
					fto.setFilename(filenames[i]);
					fto.setFilesize(Long.parseLong(filesizes[i]) );
					flag = dao.mboardWriteFileOk(to, fto);
					dao.filecnd(to, fto);
				};
			}
			//System.out.println("3flag : " + flag);
			//dao.filecnd(to, fto);
			
		} else if( request.getParameter("subject").equals("4")  ) {
			System.out.println("혼캠 작성 메서드1");
			String subject = request.getParameter("subject");
			hto.setSubject(subject);
			hto.setTitle(request.getParameter("title"));
			hto.setWriter((String) session.getAttribute("id"));
			hto.setContent(request.getParameter("content"));
			hto.setUcode((Integer) session.getAttribute("ucode"));
			hto.setVcode(request.getParameter("vcode"));
			//System.out.println("4ucode : " + hto.getUcode());			
			if(request.getParameter("filesize") != null ) {
				hto.setFilename(request.getParameter("filename"));
				hto.setFilesize(Long.parseLong(request.getParameter("filesize").trim()));
				
				hto.setOldFilename(request.getParameter("filename"));
				hto.setOldFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
				System.out.println("컨트롤러write 혼캠 oldfilename :" + hto.getOldFilename() );
				
				hdao.filecnd(hto);
			}
			flag = hdao.aboardWriteOk(hto);
			//System.out.println("4vcode : " + hto.getVcode());
			
			
			//System.out.println("content : " + hto.getContent());			
			//System.out.println("4flag : " + flag);
			
			//System.out.println( "컨트롤로 혼캠 writeok 파일:" + hto.getOldFilename() );
			
			
			
		} else if( request.getParameter("subject").equals("5")  ) {
			String subject = request.getParameter("subject");
			nto.setSubject(subject);
			nto.setTitle(request.getParameter("title"));
			nto.setWriter((String) session.getAttribute("id"));
			nto.setContent(request.getParameter("content"));
			nto.setUcode((Integer) session.getAttribute("ucode"));
			//System.out.println("5ucode : " + nto.getUcode());
			nto.setVcode(request.getParameter("vcode"));
			//System.out.println("5vcode : " + nto.getVcode());
			
			flag = ndao.nboardWriteOk(nto);

			if(request.getParameter("filename")!=null && request.getParameter("filename")!="") {
				String[] filenames = request.getParameterValues("filename");
				String[] filesizes = request.getParameterValues("filesize");
				
				for (int i = 0; i < filenames.length; i++) {
					NFileTO nfto = new NFileTO();
					System.out.println( "test : "+filenames[i]);  
					nfto.setFilename(filenames[i]);
					nfto.setFilesize(Long.parseLong(filesizes[i]) );
					flag = ndao.nboardWriteFileOk(nto, nfto);
					ndao.filecnd(nto, nfto);
				};
			}
			
			
			
			//System.out.println("content : " + nto.getContent());	
			//System.out.println("5flag : " + flag);
			
			//ndao.filecnd(nto, nfto);
		}

		return Integer.toString(flag);
	}
	
	@RequestMapping(value = "/awritecancel.do")
	public void hwritecancel(HttpServletRequest request, HttpSession session) {
		System.out.println("awritecancel() 호출");
		
		if( request.getParameter("subject").equals("4")  ) {
			hdao.filedel((String) request.getParameter("newfilename"));
		} else if( request.getParameter("subject").equals("5")  ) {
			ndao.filedel((String) request.getParameter("newfilename"));
		} else {
			dao.filedel((String) request.getParameter("filename"));
		}
		
	}
	
	// 파일 중복 체크
	private String getUniqName(String fileName) {	
		System.out.println("getUniqName() 호출");
		
		String tempName = null;
		File file = new File(hUploadPath + fileName);
		System.out.println("file : " + file);
		int lastIdx = fileName.lastIndexOf(".");
		int i = 1;
		while(true) {
			if(!file.exists()) {
				break;
			}
			tempName = fileName;
			tempName = tempName.substring(0, lastIdx) + "_" + i + tempName.substring(lastIdx, tempName.length());
			file = new File(hUploadPath + tempName);
			i++;
		}
		//System.out.println("file.getName() : " + file.getName());
		return file.getName();
	}

	// summernote 이미지 업로드
	@RequestMapping(value = "/amodify_image.do", method=RequestMethod.POST)
	public String uploadSummernoteImage(MultipartFile image, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("수정uploadSummernoteImage() 호출");	
		
		String savename = image.getOriginalFilename();
		String subject = request.getParameter("subject");
		System.out.println("이미지 subject : " + subject);
		
		long filedata = image.getResource().contentLength();
		String filesize = Long.toString(filedata);
		
		String uploadPath = "";
		
		if( subject.equals("4") ) {
			savename = getUniqName(savename, hUploadPath);		
			uploadPath = hUploadPath;
		} else if( subject.equals("5") ) {
			savename = getUniqName(savename, nUploadPath);		
			uploadPath = nUploadPath;
		} else if( subject.equals("1") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		} else if( subject.equals("2") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		} else if( subject.equals("3") ) {
			savename = getUniqName(savename, mUploadPath);		
			uploadPath = mUploadPath;
		}
		File target = new File(uploadPath + savename);
		
		response.setContentType("application/json;charset=utf-8");
		
		try {
			FileCopyUtils.copy(image.getBytes(), target);
        } catch (IOException e) {
            FileUtils.forceDelete(target);	// 실패시 저장된 파일 삭제	 
            System.out.println( "[에러] " + e.getMessage() );
        }
		String result= savename + "@" + filesize;
		return result;
	}

	@RequestMapping(value = "/admin_board_modify.do")
	public ModelAndView adminBoardModify(HttpServletRequest request, HttpSession session) {
		System.out.println("admin_board_modify 호출");
		
		String subjectValue = "";
		if(request.getParameter( "subjectValue" ) != null && !request.getParameter( "subjectValue" ).equals( "" ) ) {
			subjectValue = request.getParameter( "subjectValue" );		
		};
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		HBoardTO hto = new HBoardTO();
		NBoardTO nto = new NBoardTO();
		NFileTO nfto = new NFileTO();
		ArrayList<NFileTO> fileArr = new ArrayList<NFileTO>();
		
		if( subjectValue.equals( "4" ) ) {
			hto.setUcode( (Integer) session.getAttribute("ucode") );
			hto.setSeq( request.getParameter( "seq" ) );
			hto = adao.hboardModify(hto);
			
			
		} else if( subjectValue.equals( "5" ) ) {
			nto.setUcode( (Integer) session.getAttribute("ucode") );
			nto.setSeq( request.getParameter( "seq" ) );
			nto = adao.nboardModify(nto);

			//게시글 수정 전 이미지 파일이 있는지 확인
			fileArr = adao.findNFile(nto);
		}		
		
		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin_board_modify");
		modelAndView.addObject("hto", hto);
		modelAndView.addObject("nto", nto);
		modelAndView.addObject("nfto", nfto);
		modelAndView.addObject("fileArr", fileArr);
		modelAndView.addObject("cpage", cpage);
		modelAndView.addObject( "subjectValue", subjectValue );

		return modelAndView;
	}
	
	@RequestMapping(value = "/admin_board_modify_ok.do")
	public String adminBoardModifyOk(HttpServletRequest request, HttpSession session) {
		System.out.println("adminBoardModifyOk 호출");
		
		System.out.println( "subject값:" + request.getParameter("subject"));
		System.out.println( "새로운 파일 이름:" + request.getParameter("newfilename"));
		
		String subjectValue = "";
		if(request.getParameter( "subject" ) != null && !request.getParameter( "subject" ).equals( "" ) ) {
			subjectValue = request.getParameter( "subject" );		
		};
		
		int cpage = 1;
		if(request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		int flag = 1;
		
		AdminListTO listTO = new AdminListTO();
		listTO.setCpage(cpage);
		
		System.out.println("modify_ok subjectValue : " + request.getParameter( "subject" ));
		
		if ( session.getAttribute("id").equals("admin") ) {
		
			if( subjectValue.equals( "4" ) ) {
				HBoardTO to = new HBoardTO();
				to.setSeq(request.getParameter( "seq" ));
				//System.out.println("seq : " + to.getSeq());
				to.setSubject(request.getParameter( "subject" ));
				//System.out.println("관리자 컨트롤러 setsubject : " + to.getSubject());
				to.setTitle(request.getParameter("title"));
				to.setWriter((String) session.getAttribute("id"));
				to.setContent(request.getParameter("content"));
				to.setUcode((Integer) session.getAttribute("ucode"));
				if(request.getParameter("filesize") != null) { //기존 사진이 있으면
					to.setFilename(request.getParameter("filename"));
					to.setFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
					
					to.setOldFilename(request.getParameter("filename"));
					to.setOldFilesize(Long.parseLong(request.getParameter("filesize").trim()) );
					System.out.println("컨트롤러 modify filename : " + request.getParameter("filename"));
				}
				if( request.getParameter("newfilesize") != null ) { //새로운 사진이 있으면
					//if( !request.getParameter("newFilename").equals("default") ) {
					to.setFilename(request.getParameter("newfilename"));
					to.setFilesize(Long.parseLong(request.getParameter("newfilesize").trim()) );
					
					to.setNewFilename(request.getParameter("newfilename"));
					to.setNewFilesize(Long.parseLong(request.getParameter("newfilesize").trim()) );
				}
				to.setVcode(request.getParameter("vcode"));			
				
				flag = adao.hboardModifyOk(to);
				
				
				if( to.getOldFilename() != null ) {
					hdao.filecnd(to);
				}
				if( to.getNewFilename() != null ) {
					hdao.newfilecnd(to);
				}		
				
				
			} else if( subjectValue.equals( "5" ) ) {
				NBoardTO nto = new NBoardTO();
				NFileTO nfto = new NFileTO();
				
				nto.setSeq(request.getParameter( "seq" ));
				nto.setSubject(request.getParameter( "subject" ));
				nto.setTitle(request.getParameter("title"));
				nto.setWriter((String) session.getAttribute("id"));
				nto.setContent(request.getParameter("content"));
				nto.setUcode((Integer) session.getAttribute("ucode"));
				nto.setVcode(request.getParameter("vcode"));
				
				flag = adao.nboardModifyOk1(nto);
				
				// 게시글에 기존 파일이 있으면
				if(request.getParameter("filename")!="" && request.getParameter("filename")!=null) {
					String[] filenames = request.getParameterValues("filename");
					String[] filesizes = request.getParameterValues("filesize");
					
					for (int i = 0; i < filenames.length; i++) {            
						System.out.println(filenames[i]);  
						NFileTO fito = new NFileTO();
						fito.setFilename(filenames[i]);
						fito.setFilesize(Long.parseLong(filesizes[i]) );
						flag = adao.nboardModifyOk2(nto, fito);
						System.out.println("2 ");
						ndao.filecnd(nto, fito);
						//adao.filecnd(nto, fito);
						//System.out.println("3 ");
					};
					if(flag==0) {
						System.out.println("기존파일 체크 완료");
					}else {
						System.out.println("mboardModifyOk2() 오류!");
					}
				}
				// 게시글에 새 파일이 있으면
				if(request.getParameter("newfilename")!=null && request.getParameter("newfilename")!="") {
					String[] newfilenames = request.getParameterValues("newfilename");
					String[] newfilesizes = request.getParameterValues("newfilesize");
					System.out.println("newFilename : " + request.getParameter("newFilename"));
					System.out.println("11newFilename : " + nfto.getNewFilename());
					for (int i = 0; i < newfilenames.length; i++) {            
						System.out.println(newfilenames[i]);  
						NFileTO fito = new NFileTO();
						fito.setFilename(newfilenames[i]);
						fito.setFilesize(Long.parseLong(newfilesizes[i]) );
						flag = adao.nboardModifyOk3(nto, fito);
						ndao.filecnd(nto, fito);
					}
				}
				//flag = adao.nboardModifyOk(nto, nfto);
				
				//ndao.filecnd(nto, nfto);
			} 
		}
		System.out.println("최종flag : " + flag);
		return Integer.toString(flag);
	}
	
	@RequestMapping( value="/aboarddelete_ok.do" )
	public ModelAndView mboarddeleteOk(HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println( "aboarddeleteOk() 호출" );
		
		String subjectValue = "";
		if(request.getParameter( "subjectValue" ) != null && !request.getParameter( "subjectValue" ).equals( "" ) ) {
			subjectValue = request.getParameter( "subjectValue" );		
		};
		int flag = 2;
		
		System.out.println( "세션코드 호출 : "+session.getAttribute("ucode") );
		System.out.println( "세션id 호출 : "+session.getAttribute("id") );
		
		if( subjectValue.equals("5") ) {
			// 게시글 seq값 받아오기
			NBoardTO to = new NBoardTO();
			to.setSeq( request.getParameter("viewseq") );
			to = ndao.findViewUcode(to);
			
			ArrayList<NFileTO> nfileArr = new ArrayList<NFileTO>();
								
			if ( session.getAttribute("id").equals("admin") ) {
				to.setSeq( request.getParameter("viewseq") );
				//NFileTO fto = new NFileTO();
				//게시글 삭제 전 이미지 파일 확인
				//DB에 파일 데이터가 있는지 조회
				nfileArr = ndao.nboardDelFileCheck(to);
				System.out.println("test2 : " + nfileArr);
				if( nfileArr != null && nfileArr.size()!=0 ) {
					//파일이 존재 => 삭제
					System.out.println("파일이 존재");
					//디렉터리 폴더에 파일 삭제
					for(NFileTO nfto : nfileArr) {
						ndao.filedel(nfto.getFilename());
					}
					//DB table에서 항목 삭제
					int result= ndao.fileDBDel(to);
					System.out.println("test1 :" + result);
					 if(result == 0) {
						 flag=0;
					 }else {
						 flag=1;
					 }
				}
				if( flag != 1 ) {
					//파일삭제 성공 또는 파일없음 
					flag = ndao.nboardDeleteOk(to);
			
				} else if( flag == 1 ) {
					System.out.println("파일 삭제 DAO 오류");
				}
			}

		} else if( subjectValue.equals("4") ) {
			System.out.println("subjectValue : " + subjectValue);
			//게시글 삭제 전 이미지 파일 확인
			HBoardTO to = new HBoardTO();
			to.setSeq( request.getParameter("viewseq") );
			to = hdao.findViewUcode(to);
			System.out.println( "세션코드 호출 : "+session.getAttribute("ucode") );		
			
			if ( session.getAttribute("id").equals("admin") ) {
				//if ( ((Integer)session.getAttribute("ucode")).equals("1") ) {
				to.setSeq( request.getParameter("viewseq") );
				HBoardTO hto = new HBoardTO();
				//DB에 파일 데이터가 있는지 조회
				hto = hdao.hboardDelFileCheck(to);
				
				if( hto.getFilename() != null ) {
					//파일이 존재 => 삭제
					System.out.println("파일이 존재");
					//디렉터리 폴더에 파일 삭제
					hdao.filedel( hto.getFilename() );
					//DB table에서 항목 삭제
					flag = hdao.fileDBDel(to);
				} else if( hto.getFilename() == null ) {
					//파일없으면 게시글 삭제 
					flag = hdao.fileDBDel(to);
			
				} else if( flag == 1 ) {
					System.out.println("파일 삭제 DAO 오류");
				}
			}
	    } else if( subjectValue.equals("1") ) {
			// 게시글 seq값 받아오기
	    	BoardTO to = new BoardTO();
			to.setSeq( request.getParameter("viewseq") );
			to = dao.findViewUcode(to);
			
			ArrayList<FileTO> fileArr = new ArrayList<FileTO>();
								
			if ( session.getAttribute("id").equals("admin") ) {
				to.setSeq( request.getParameter("viewseq") );
				FileTO fto = new FileTO();
				
				//DB에 파일 데이터가 있는지 조회
				fileArr=dao.mboardDelFileCheck(to);
				flag = 2;
				if(fileArr != null) {
					//파일이 존재 => 삭제
					System.out.println("파일이 존재");
					//디렉터리 폴더에 파일 삭제
					for(FileTO mfto : fileArr) {
						dao.filedel(mfto.getFilename());
					}
					//DB table에서 항목 삭제
					 int result= dao.fileDBDel(to);
					 if(result == 1) {
						 flag=0;
					 }else {
						 flag=1;
					 }
				}
				
				if(flag != 1) {
					//파일삭제 성공 또는 파일없음 => 댓글 삭제
					//m_cmt에 해당하는 댓글 삭제
					flag=dao.mboardDeleteCmtAll(to);
					if(flag==0) {
						//게시판 DB에 게시글 삭제
						flag=dao.mboardDeleteOk(to);
					}
				}else if(flag ==1) {
					System.out.println("파일 삭제 DAO 오류");
				}
			}
	    } else if( subjectValue.equals("2") ) {
			// 게시글 seq값 받아오기
	    	BoardTO to = new BoardTO();
			to.setSeq( request.getParameter("viewseq") );
			to = dao.findViewUcode(to);
			
			ArrayList<FileTO> fileArr = new ArrayList<FileTO>();
								
			if ( session.getAttribute("id").equals("admin") ) {
				to.setSeq( request.getParameter("viewseq") );
				FileTO fto = new FileTO();
				
				//DB에 파일 데이터가 있는지 조회
				fileArr=dao.mboardDelFileCheck(to);
				flag = 2;
				if(fileArr != null) {
					//파일이 존재 => 삭제
					System.out.println("파일이 존재");
					//디렉터리 폴더에 파일 삭제
					for(FileTO mfto : fileArr) {
						dao.filedel(mfto.getFilename());
					}
					//DB table에서 항목 삭제
					 int result= dao.fileDBDel(to);
					 if(result == 1) {
						 flag=0;
					 }else {
						 flag=1;
					 }
				}
				
				if(flag != 1) {
					//파일삭제 성공 또는 파일없음 => 댓글 삭제
					//m_cmt에 해당하는 댓글 삭제
					flag=dao.mboardDeleteCmtAll(to);
					if(flag==0) {
						//게시판 DB에 게시글 삭제
						flag=dao.mboardDeleteOk(to);
					}
				}else if(flag ==1) {
					System.out.println("파일 삭제 DAO 오류");
				}
			}
	    } else if( subjectValue.equals("3") ) {
			// 게시글 seq값 받아오기
	    	BoardTO to = new BoardTO();
			to.setSeq( request.getParameter("viewseq") );
			to = dao.findViewUcode(to);
			
			ArrayList<FileTO> fileArr = new ArrayList<FileTO>();
								
			if ( session.getAttribute("id").equals("admin") ) {
				to.setSeq( request.getParameter("viewseq") );
				FileTO fto = new FileTO();
				
				//DB에 파일 데이터가 있는지 조회
				fileArr=dao.mboardDelFileCheck(to);
				flag = 2;
				if(fileArr != null) {
					//파일이 존재 => 삭제
					System.out.println("파일이 존재");
					//디렉터리 폴더에 파일 삭제
					for(FileTO mfto : fileArr) {
						dao.filedel(mfto.getFilename());
					}
					//DB table에서 항목 삭제
					 int result= dao.fileDBDel(to);
					 if(result == 1) {
						 flag=0;
					 }else {
						 flag=1;
					 }
				}
				
				if(flag != 1) {
					//파일삭제 성공 또는 파일없음 => 댓글 삭제
					//m_cmt에 해당하는 댓글 삭제
					flag=dao.mboardDeleteCmtAll(to);
					if(flag==0) {
						//게시판 DB에 게시글 삭제
						flag=dao.mboardDeleteOk(to);
					}
				}else if(flag ==1) {
					System.out.println("파일 삭제 DAO 오류");
				}
			}
		}
		
		if ( !session.getAttribute("id").equals("admin") ) {
			flag = 1;
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ucode") == null) {
			modelAndView.setViewName( "/login/nousers" );
			return modelAndView;
		}
		modelAndView.setViewName( "/admin/admin_board_delete_ok" );
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

}
