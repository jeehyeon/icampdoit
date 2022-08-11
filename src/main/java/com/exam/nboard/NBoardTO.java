package com.exam.nboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NBoardTO {
	private String seq;
	private String subject;
	private String title;
	private String writer;
	private String content;
	private String wdate;
	private String hit;
	private int ucode;
	private String vcode;
}
