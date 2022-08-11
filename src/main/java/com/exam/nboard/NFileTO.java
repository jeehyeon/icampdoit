package com.exam.nboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NFileTO {
	private String seq;
	private String pseq;
	private String filename;
	private long filesize;

}
