package com.icia.sejboard.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.sejboard.dto.PageDTO;
import com.icia.sejboard.dto.BoardDTO;
import com.icia.sejboard.dto.CommentDTO;
import com.icia.sejboard.service.BoardService;
import com.icia.sejboard.service.CommentService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	@Autowired
	private BoardService bs;
	
	@Autowired
	private CommentService cs;

	// 글쓰기 화면 이동
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String saveForm() {
		return "board/save";
	}

	// 글쓰기 + 파일추가 저장 후 목록 이동
	@RequestMapping(value = "saveFile", method = RequestMethod.POST)
	public String saveFile(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		bs.saveFile(board);
		return "redirect:/board/paging";
	}

	// 글 상세 조회
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String findById(@RequestParam("b_number") long b_number, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);

		model.addAttribute("page", page);
		
		List<CommentDTO> commentList = cs.findAll(b_number);
		model.addAttribute("commentList", commentList);
		
		return "board/detail";
	}

	// 페이징(전체조회)
	@RequestMapping(value = "paging", method = RequestMethod.GET)
	public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
		List<BoardDTO> boardList = bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}

	// 검색
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchType, @RequestParam("keyword") String keyword,
			Model model) {
		List<BoardDTO> boardList = bs.search(searchType, keyword);
		model.addAttribute("boardList", boardList);
		return "board/findAll";
	}
	
	// 삭제
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		bs.delete(b_number);
		return "redirect:/board/paging";
	}
	
	//수정
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);
		
		model.addAttribute("page", page);
		return "board/update";
	}
	//수정 처리
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, @RequestParam(value="page", required=false, defaultValue="1")int page) throws IllegalStateException, IOException {
		System.out.println(board);
		bs.update(board);
		return "redirect:/board/detail?b_number="+board.getB_number() + "&page=" + page;
	}
}
