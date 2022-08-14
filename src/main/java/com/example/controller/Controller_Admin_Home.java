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
import com.exam.admin.AdminStatDAO;
import com.exam.admin.VisitTO;
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
public class Controller_Admin_Home {

	@Autowired
	private BoardDAO dao;

	@Autowired
	private HBoardDAO hdao;

	@Autowired
	private NBoardDAO ndao;
	
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private AdminStatDAO sdao;

	String url = System.getProperty("user.dir");
	private String mUploadPath = url + "/src/main/webapp/upload/";

	private String hUploadPath = url + "/src/main/webapp/h_upload/";

	private String nUploadPath = url + "/src/main/webapp/n_upload/";

	// 관리자페이지
	@RequestMapping(value = "/admin.do")
	public ModelAndView admin(HttpServletRequest request, HttpSession session) {
		System.out.println("admin() 호출");
		
		String countBoardResult = sdao.countBoard();  //총 게시글 수
		String countFemale = sdao.countFemale(); //여성회원수
		String countMale = sdao.countMale(); //남성회원수
		String weeklyRegistered = sdao.weeklyRegistered(); //이번주 가입자수
		String countReviews = sdao.countReviews();  //review 갯수
		String countTotalVisitor = sdao.countTotalVisitor(); //총 방문자 수
		String countTodayVisitor = sdao.countTodayVisitor(); //오늘 방문자 수
		//연령대 별 회원 수
		SignUpTO sto = new SignUpTO();
		ArrayList<SignUpTO> lists = sdao.countbyAge(sto);
		
		System.out.println( "countBoardResult : " + countBoardResult );

		ModelAndView modelAndView = new ModelAndView();

		if (session.getAttribute("ucode") == null) {
			modelAndView.setViewName("/login/nousers");
			return modelAndView;
		}
		modelAndView.setViewName("admin/admin");
		modelAndView.addObject( "countBoardResult", countBoardResult );
		modelAndView.addObject( "countFemale", countFemale );
		modelAndView.addObject( "countMale", countMale );
		modelAndView.addObject( "weeklyRegistered", weeklyRegistered );
		modelAndView.addObject( "countReviews", countReviews );
		modelAndView.addObject( "countTotalVisitor", countTotalVisitor );
		modelAndView.addObject( "countTodayVisitor", countTodayVisitor );
		modelAndView.addObject( "lists", lists );

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

}
