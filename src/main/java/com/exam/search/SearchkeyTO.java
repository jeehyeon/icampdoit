package com.exam.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchkeyTO {
	private String seq;				//viewpage용
	private String imgurl;        //이미지 불러오기용
	
	private String keysearch;		// 검색키워드
	
	private String facltNm;			// 1. 캠핑장명
	
	private String addr1;			// 2. 캠핑장주소 = addr1 + addr2
	private String addr2;			// 3.
	
	private String induty;			// 4. 캠핑장유형(주요시설)
	private String firstImageUrl;	// 5. 대표이미지
	private String contentId;		// 6. 캠핑장아이디
	private String intro;			// 7. 캠핑장소개
	private String animalCmgCl;		// 8. 애완동물동반(불가능/가능/가능(소형견))
	private String trlerAcmpnyAt;	// 9. 개인트레일러입장
	private String caravAcmpnyAt;	// 10. 개인카라반입장
	private String lctCl;			// 11. 입지
	private String brazierCl;		// 12. 화로대 사용가능여부
	
	// 바닥형태
	private String siteBottomCl1;	// 13. 잔디
	private String siteBottomCl2;	// 14. 파쇄석
	private String siteBottomCl3;	// 15. 테크
	private String siteBottomCl4;	// 16. 자갈
	private String siteBottomCl5;	// 17. 맨흙
	
	private String sbrsCl;			// 18. 부대시설(캠핑장 시설정보)
	private String doNm;			// 19. 시,도
	private String eqpmnLendCl;		// 20. 캠핑장비대여
	private String homepage;		// 21. 캠핑장 사이트주소
	private String mapX;			// 22. 경도(X)
	private String mapY;			// 23. 위도(Y)
	private String sigunguNm;		// 24. 시군구

}
