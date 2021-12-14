package com.icia.sejboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.sejboard.dto.MemberDTO;
import com.icia.sejboard.dto.PageDTO;
import com.icia.sejboard.service.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	// 회원가입 페이지
	@RequestMapping(value="save", method=RequestMethod.GET)
	public String save() {
		return "member/save";
	}
	// 회원가입 처리
	@RequestMapping(value="saveFile", method=RequestMethod.POST)
	public String saveFile(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		int result = ms.saveFile(member);
		if(result > 0) {
			return "index";
		} else {
			return "member/save";
		}
	}
	
	// 로그아웃 처리
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	// 회원 목록(페이징)
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
		List<MemberDTO> memberList = ms.pagingList(page);
		PageDTO paging = ms.paging(page);
		model.addAttribute("memberList",memberList);
		model.addAttribute("paging", paging);
		
		return "member/findAll";
	}
	//회원 상세 조회
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		
		return "member/detail";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		System.out.println("MemberController.idDuplicate(): "+m_id);
		String result = ms.idDuplicate(m_id);
		return result;
	}
	
	// 수정 화면 요청
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		return "member/update";
	}
	// 수정 처리
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member, Model model) throws IllegalStateException, IOException {
		ms.update(member);
		return "redirect:/member/detail?m_number="+member.getM_number();
	}
	
	// 마이페이지 화면 요청
		@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypageForm(@RequestParam("m_number") long m_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member", member);
		
		model.addAttribute("page", page);
		return "member/mypage";
	}
	// 마이페이지 수정 처리
	@RequestMapping(value="mypage", method=RequestMethod.POST)
	public String mypage(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		ms.mypage(member);
		return "redirect:/board/paging";
	}
	
	
	// 삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		ms.delete(m_number);
		return "redirect:/member/paging";
	}
	
}
