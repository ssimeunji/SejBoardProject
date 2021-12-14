## 프로젝트 정의
### 기간
2021.12.7 화 ~ 2021.12.10 금
### 패키지
1. controller
2. dto
3. repository
4. service

### DTO
1. BoardDTO
2. CommentDTO
3. MemberDTO
4. PageDTO

## 테이블 정의
### 회원 테이블
```
create table member_table_sej(
	m_number bigint auto_increment,
    m_id varchar(20),
    m_password varchar(20),
    m_name varchar(10),
    m_email varchar(30),
    m_phone varchar(20),
	m_filename varchar(100),
    constraint primary key(m_number),
    constraint unique key(m_id)
);
```
### 게시판 테이블
```
create table board_table_sej(
	b_number bigint auto_increment,
    m_number bigint,
    m_id varchar(20),
    b_title varchar(50),
    b_contents varchar(1000),
    b_filename varchar(100),
    b_hits int default 0,
    b_date datetime,
    constraint primary key(b_number),
    constraint foreign key(m_number) references member_table_sej(m_number),
	constraint foreign key(m_id) references member_table_sej(m_id)
);
```
### 댓글 테이블
```
create table comment_table_sej(
	c_number bigint auto_increment,
    b_number bigint,
    m_number bigint,
    m_id varchar(20),
    c_contents varchar(200),
    c_date datetime,
    constraint primary key(c_number),
    constraint foreign key(m_number) references member_table_sej(m_number),
    constraint foreign key(m_id) references member_table_sej(m_id)
);
```

## 기능
### 게시판
+ 글 쓰기
	+ board/save.jsp -> BoardController.saveFile() <-> BoardService.saveFile() <-> BoardServiceImpl.saveFile() <-> BoardRepository.saveFile() <-> board-mapper.saveFile <-> DB
---
+ 페이징 처리
	+ board/findAll.jsp -> BoardController.paging() <-> BoardService.paging(), BoardService.pagingList() <-> BoardServiceImpl.paging(), BoardServiceImpl.pagingList() <-> BoardRepository.boardCount(), BoardRepository.pagingList() <-> board-mapper.count, board-mapper.pagingList <-> DB
---
+ 글 상세 보기
	+ board/findAll.jsp -> BoardController.findById() <-> BoardService.findById() <-> BoardServiceImpl.findById() <-> BoardRepository.findById() <-> board-mapper.findById <-> DB
---
+ 글 수정
	+ board/detail.jsp -> BoardController.update() <-> BoardService.update() <-> BoardServiceImpl.update() <-> BoardRepository.update() <-> board-mapper.update <-> DB
---
+ 글 삭제
	+ board/detail.jsp -> BoardController.delete() <-> BoardService.delete() <-> BoardServiceImpl.delete() <-> BoardRepository.delete() <-> board-mapper.delete <-> DB
---
+ 검색
	+ board/findAll.jsp -> BoardController.search() <-> BoardService.search() <-> BoardServiceImpl.search() <-> BoardRepository.search() <-> board-mapper.search <-> DB

	
### 회원
+ 회원 추가
	+ member/save.jsp -> MemberController.saveFile() <-> MemberService.saveFile() <-> MemberServiceImpl.saveFile() <-> MemberRepository.savefile() <-> member-mapper.saveFile <-> DB
---
+ (회원 추가 시)아이디 중복 체크
	+ member/save.jsp -> MemberController.idDuplicate() <-> MemberService.idDuplicate() <-> MemberServiceImpl.idDuplicate() <-> MemberRepository.idDuplicate() <-> member-mapper.idDuplicate <-> DB
---
+ 회원 상세 보기
	+ member/findAll.jsp -> MemberController.findById() <-> MemberService.findById() <-> MemberServiceImpl.findById() <-> MemberRepository.findById() <-> member-mapper.findById <-> DB
---
+  회원 정보 수정
	+ member/detail.jsp -> MemberController.update() <-> MemberService.update() <-> MemberServiceImpl.update() <-> MemberRepository.update() <-> member-mapper.update <-> DB
---
+ 회원 삭제
	+ member.detail.jsp -> MemberController.delete() <-> MemberService.delete() <-> MemberServiceImpl.delete() <-> MemberRepository.delete() <-> member-mapper.delete <-> DB