package com.exam.mboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
	private String seq;
	private String subject;
	private String title;
	private String writer;
	private String wdate;
	private String hit;
	private String content;
	private int ucode;
	private int cmt;
}
