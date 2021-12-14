package com.icia.sejboard.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.sejboard.dto.BoardDTO;
import com.icia.sejboard.dto.PageDTO;
import com.icia.sejboard.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepository br;

	// 글쓰기 저장
	@Override
	public void saveFile(BoardDTO board) throws IllegalStateException, IOException { 
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "C:\\Users\\WRAPCORE\\Desktop\\icia\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+b_filename;
//		String savePath = "D:\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		} else {
			b_filename = "";
		}
		board.setB_filename(b_filename);
		br.saveFile(board);
	}

	// 상세 조회
	@Override
	public BoardDTO findById(long b_number) {
		br.hits(b_number);
		return br.findById(b_number);
	}
	
	// 페이징(전체조회)
	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Override
	public List<BoardDTO> pagingList(int page) {

		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
//		List<BoardDTO> pagingList = br.pagingList(pagingStart);
		List<BoardDTO> pagingList = br.pagingList1(pagingParam);
		for(BoardDTO b: pagingList) {
			System.out.println(b.toString());
		}
		return pagingList;
	}
	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount(); // 전체 글 갯수 조회
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		return paging;
	}

	// 검색
	@Override
	public List<BoardDTO> search(String searchType, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchType);
		searchParam.put("word", keyword);
		List<BoardDTO> boardList = br.search(searchParam);
		return boardList;
	}

	// 삭제
	@Override
	public void delete(long b_number) {
		br.delete(b_number);
	}

	// 수정
	@Override
	public void update(BoardDTO board) throws IllegalStateException, IOException {
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "C:\\Users\\WRAPCORE\\Desktop\\icia\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		} else {
			b_filename = "";
		}
		board.setB_filename(b_filename);
		
		br.update(board);
	}



}
