package com.icia.sejboard.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.sejboard.dto.BoardDTO;

@Repository
public class BoardRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 글쓰기 저장
	public void saveFile(BoardDTO board) {
		sql.insert("Board.saveFile", board);
	}

	// 조회수 증가 처리
	public void hits(long b_number) {
		sql.update("Board.hits", b_number);
	}
	
	//상세 조회
	public BoardDTO findById(long b_number) {
		return sql.selectOne("Board.findById", b_number);
	}

	// 검색
	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	// 페이징(전체 조회)
	public int boardCount() {
		return sql.selectOne("Board.count");
	}
	
	public List<BoardDTO> pagingList(int pagingStart) {
		return sql.selectList("Board.pagingList", pagingStart);
	}

	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList1", pagingParam);
	}

	// 삭제
	public void delete(long b_number) {
		sql.delete("Board.delete", b_number);
	}

	// 수정
	public void update(BoardDTO board) {
		sql.update("Board.update", board);
	}


}
