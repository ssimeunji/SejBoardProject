package com.icia.sejboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.sejboard.dto.CommentDTO;
import com.icia.sejboard.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService cs;
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		cs.save(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());
		return commentList;
	}
}
