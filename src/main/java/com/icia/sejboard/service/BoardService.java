package com.icia.sejboard.service;

import java.io.IOException;
import java.util.List;

import com.icia.sejboard.dto.BoardDTO;
import com.icia.sejboard.dto.PageDTO;

public interface BoardService {

	// 글쓰기 저장
	public void saveFile(BoardDTO board) throws IllegalStateException, IOException;

	// 상세 조회
	public BoardDTO findById(long b_number);
	
	// 페이징(전체 조회)
	public PageDTO paging(int page);
	public List<BoardDTO> pagingList(int page);
	
	// 검색
	public List<BoardDTO> search(String searchType, String keyword);

	// 삭제
	public void delete(long b_number);

	// 수정
	public void update(BoardDTO board) throws IllegalStateException, IOException;


}
