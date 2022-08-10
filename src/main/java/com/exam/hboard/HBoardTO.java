package com.exam.hboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HBoardTO {
	private String seq;
	private String subject;
	private String title;
	private String writer;
	private String content;
	private String wdate;
	private String hit;
	private int ucode;
	private String filename;
	private long filesize;
}
