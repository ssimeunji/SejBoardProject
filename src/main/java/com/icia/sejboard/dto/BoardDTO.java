package com.icia.sejboard.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private long b_number;
	private long m_number;
	private String m_id;
	private String b_title;
	private String b_contents;
	private int b_hits;
	private Timestamp b_date;
	
	private MultipartFile b_file;
	private String b_filename;
}
