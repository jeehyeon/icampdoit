package com.exam.search;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchkeyTO {
	
	private String facltNm;	// 캠핑장명

	private String addr1;	// 캠핑장주소 = addr1 + addr2
	private String addr2;
	
	private String induty;	// 캠핑장유형
	
	private String firstImageUrl;	// 대표사진
	
	private String keysearch;
}
