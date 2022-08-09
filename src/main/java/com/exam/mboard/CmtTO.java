package com.exam.mboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmtTO {
	private String seq;
	private String pseq;
	private String writer;
	private String content;
	private String wdate;
	private String ucode;
}
