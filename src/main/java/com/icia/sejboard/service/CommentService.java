package com.icia.sejboard.service;

import java.util.List;

import com.icia.sejboard.dto.CommentDTO;

public interface CommentService {

	void save(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

}