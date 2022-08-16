package com.exam.mboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileTO {
	private String seq;
	private String pseq;
	private String filename;
	private long filesize;
	private String newFilename;
	private long newFilesize;
}
