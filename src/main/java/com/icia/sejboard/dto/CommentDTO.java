package com.icia.sejboard.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDTO {
	private long c_number;
	private long b_number;
	private long m_number;
	private String m_id;
	private String c_contents;
	private Timestamp c_date;
}
