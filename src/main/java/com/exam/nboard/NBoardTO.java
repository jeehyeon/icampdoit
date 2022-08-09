package com.exam.nboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NBoardTO {
	private int seq;
	private String subject;
	private String title;
	private String writer;
	private String content;
	private String wdate;
	private int hit;
}
