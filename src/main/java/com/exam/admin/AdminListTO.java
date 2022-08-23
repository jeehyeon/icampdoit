package com.exam.admin;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminListTO {
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	
	private ArrayList<AdminTO> boardLists;
	
	public AdminListTO() {
		// TODO Auto-generated constructor stub
		this.cpage = 1;
		this.recordPerPage = 10; // 한페이지에 보여질 데이터 갯수
		this.blockPerPage = 5;// 하단 페이지에 보여질 블럭수[1][2][3][4][5] 5개
		this.totalPage = 1; // 전체 페이지수
		this.totalRecord = 0;// 한 페이지에 게시글 카운트 수
	}
}
