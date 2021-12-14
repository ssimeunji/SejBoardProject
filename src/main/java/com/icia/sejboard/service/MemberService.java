package com.icia.sejboard.service;

import java.io.IOException;
import java.util.List;

import com.icia.sejboard.dto.MemberDTO;
import com.icia.sejboard.dto.PageDTO;

public interface MemberService {
	
	// 회원가입
	public int saveFile(MemberDTO member) throws IllegalStateException, IOException;

	// 회원 목록( 페이징)
	public PageDTO paging(int page);
	public List<MemberDTO> pagingList(int page);

	// 회원 상세 조회
	public MemberDTO findById(long m_number);

	// 로그인
	public String login(MemberDTO member);

	// 아이디 중복 체크
	public String idDuplicate(String m_id);

	// 수정
	public void update(MemberDTO member) throws IllegalStateException, IOException;

	// 삭제
	public void delete(long m_number);

	// 마이페이지
	public void mypage(MemberDTO member) throws IllegalStateException, IOException;
	
}
