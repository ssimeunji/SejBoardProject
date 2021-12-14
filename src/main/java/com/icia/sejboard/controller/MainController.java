package com.icia.sejboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icia.sejboard.dto.MemberDTO;
import com.icia.sejboard.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	// 로그인
	@RequestMapping(value="/board/paging", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member) {
		return ms.login(member);
	}
}
