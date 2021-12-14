<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL(JSP Standard Tag Library)사용 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<%-- forEach --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>BOARD_FINDALL</title>
</head>
<body>
	<div class="box">
 		<h2 class="title">게시판</h2> 
		<div class="b_findAll_btn_box">
			<%-- 검색 --%>
			<form class="board_search_box" action="/board/search" method="get">
				<div class="board_search">
					<select class="board_search_select" name="searchtype">
						<option value="b_title">제목</option>
						<option value="m_id">작성자</option>
					</select>
					<input class="board_search_input" type="text" name="keyword" placeholder="Search"/>
					<input class="board_btn cus_p" type="submit" value="검색"/>
					<input class="board_btn cus_p" type="button" value="전체검색" onclick="location.href='/board/paging'"/>
				</div>
			</form>
			<div>
				<p class="b_findAll_user_text">${sessionScope.loginId}님 환영합니다.</p>
				<c:if test="${sessionScope.loginId eq 'admin'}">
					<input class="board_btn cus_p" type="button" value="회원목록" onclick="location.href='/member/paging'">
				</c:if>
				<input class="board_btn cus_p" type="button" value="마이페이지" onclick="location.href='/member/mypage?m_number=${sessionScope.loginNumber}'"/>
				<input class="btn_logout board_btn cus_p" type="button" value="로그아웃" onclick="location.href='/'"/>
			</div>
			<div class="board_save_btn_box">
				<div class="vertical_m">
					<input class="board_btn cus_p" type="button" value="등록" onclick="location.href='/board/save'"/>
				</div>
			</div>
		</div>
		<div class="table_box">
			<table class="table_findALl">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
			 			<th>제목</th>
			 			<th>파일</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr class="cus_p" onclick="location.href='/board/detail?b_number=${board.b_number}&page=${paging.page}'">
						<td>${board.b_number}</td>
						<td>${board.m_id}</td>
						<td>${board.b_title}</td>
						<td>${board.b_filename}</td>
						<td>${board.b_date}</td>
						<td>${board.b_hits}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<%-- 페이징 --%>
		<div>
			<c:choose>
				<c:when test="${paging.page<=1}">
					&lt;&nbsp;
				</c:when>
				<c:otherwise>
					<a class="cus_p" href="/board/paging?page=${paging.page-1}">&lt;</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
				<c:choose>
					<c:when test="${i eq paging.page}">
						${i}
					</c:when>
					<c:otherwise>
						<a href="/board/paging?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page>=paging.maxPage}">
					&gt;
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${paging.page+1}">&gt;</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>