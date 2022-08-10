package com.exam.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchkeyTO {
	
	private String facltNm;			// 캠핑장명
	private String addr1;			// 캠핑장주소 = addr1 + addr2
	private String addr2;
	private String induty;			// 캠핑장유형(주요시설)
	private String firstImageUrl;	// 대표사진
	private String keysearch;		// 검색키워드
	private String contentId;		// 캠핑장아이디
	private String intro;			// 캠핑장소개
	private String animalCmgCl;		// 애완동물동반
	private String trlerAcmpnyAt;	// 개인트레일러입장
	private String caravAcmpnyAt;	// 개인카라반입장
	private String lctCl;			// 입지
	private String brazierCl;		// 화로대
	private String siteBottomCl1;	// 바닥형태(1잔디 / 2파쇄석 / 3테크 / 4자갈 / 5맨흙 )
	private String siteBottomCl2;
	private String siteBottomCl3;
	private String siteBottomCl4;
	private String siteBottomCl5;
	private String sbrsCl;			// 부대시설(캠핑장 시설정보)
	private String doNm;			// 시,도
	private String eqpmnLendCl;		// 캠핑장비대여
	private String homepage;		// 캠핑장 사이트주소
	private String mapX;
	private String mapY;
}
