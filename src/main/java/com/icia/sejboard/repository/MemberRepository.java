package com.icia.sejboard.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.sejboard.dto.MemberDTO;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 회원가입
	public int saveFile(MemberDTO member) {
		return sql.insert("Member.saveFile", member);
	}

	// 회원 목록(페이징)
	public int memberCount() {
		return sql.selectOne("Member.count");
	}
	
	public List<MemberDTO> pagingList(int pagingStart) {
		return sql.selectList("Member.pagingList", pagingStart);
	}

	public List<MemberDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Member.pagingList1", pagingParam);
	}

	// 회원 상세 조회
	public MemberDTO findById(long m_number) {
		return sql.selectOne("Member.findById", m_number);
	}

	// 로그인
	public MemberDTO login(MemberDTO member) {
		return sql.selectOne("Member.login", member);
	}

	// 아이디 중복 체크
	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate", m_id);
	}

	// 수정
	public void update(MemberDTO member) {
		sql.update("Member.update", member);
	}

	// 삭제
	public void delete(long m_number) {
		sql.delete("Member.delete", m_number);
		
	}

	// 마이페이지
	public void mypage(MemberDTO member) {
		sql.update("Member.mypage", member);
		
	}

}
