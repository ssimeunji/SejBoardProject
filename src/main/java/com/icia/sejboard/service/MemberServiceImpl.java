package com.icia.sejboard.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.sejboard.dto.MemberDTO;
import com.icia.sejboard.dto.PageDTO;
import com.icia.sejboard.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	// 회원가입
	@Override
	public int saveFile(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "C:\\Users\\WRAPCORE\\Desktop\\icia\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		} else  {
			m_filename = "";
		}
		member.setM_filename(m_filename);
		
		return mr.saveFile(member);
	}

	// 회원 목록(페이징)
	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수
	
	@Override
	public List<MemberDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
//		List<BoardDTO> pagingList = br.pagingList(pagingStart);
		List<MemberDTO> pagingList = mr.pagingList1(pagingParam);
		for(MemberDTO m: pagingList) {
			System.out.println(m.toString());
		}
		return pagingList;
	}
	@Override
	public PageDTO paging(int page) {
		int boardCount = mr.memberCount(); // 전체 글 갯수 조회
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

	// 회원 상세 조회
	@Override
	public MemberDTO findById(long m_number) {
		return mr.findById(m_number);
	}

	// 로그인
	@Override
	public String login(MemberDTO member) {
		MemberDTO loginMember = mr.login(member);
		if(loginMember != null) {
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", loginMember.getM_number());
			return "redirect:/board/paging";
		} else {
			return "index";
		}
	}

	// 아이디 중복 체크
	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null) {
			return "ok"; //조회결과가 없기 때문에 해당 아이디는 사용 가능
		} else {
			return "no"; //조회결과가 있기 때문에 해당 아이디는 사용 불가능
		}
	}

	// 수정
	@Override
	public void update(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "C:\\Users\\WRAPCORE\\Desktop\\icia\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		} else  {
			m_filename = "";
		}
		member.setM_filename(m_filename);
		
		mr.update(member);
		
	}
	// 마이페이지
	@Override
	public void mypage(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "C:\\Users\\WRAPCORE\\Desktop\\icia\\development_sej\\source\\spring\\SejBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		} else  {
			m_filename = "";
		}
		member.setM_filename(m_filename);
		
		mr.mypage(member);
		
	}
	// 삭제
	@Override
	public void delete(long m_number) {
		mr.delete(m_number);
		
	}

}
