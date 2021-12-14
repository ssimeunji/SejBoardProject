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
<title>MEMBER_FINDALL</title>
</head>
<body>
	<div class="box">
		<h2 class="title">회원 목록</h2>
		<div>
			<input class="" type="button" value="게시판" onclick="location.href='/board/paging'" />
		</div>
		<div class="table_box">
			<table class="table_findAll">
				<thead>			
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${memberList}" var="member">
					<tr class="cus_p" onclick="location.href='detail?m_number=${member.m_number}'">
						<td>${member.m_number}</td>
						<td>${member.m_id}</td>
						<td>${member.m_name}</td>
						<td>${member.m_email}</td>
						<td>${member.m_phone}</td>
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
					<a class="cus_p" href="/member/paging?page=${paging.page-1}">&lt;</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
				<c:choose>
					<c:when test="${i eq paging.page}">
						${i}
					</c:when>
					<c:otherwise>
						<a href="/member/paging?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page>=paging.maxPage}">
					&gt;
				</c:when>
				<c:otherwise>
					<a href="/member/paging?page=${paging.page+1}">&gt;</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>