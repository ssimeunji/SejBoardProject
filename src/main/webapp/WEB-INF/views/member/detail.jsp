<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>MEMBER_DETAIL</title>
</head>
<body>
	<div class="box">
		<h2 class="title">회원 상세 조회</h2>
		<div>
			<input class="cus_p" type="button" value="목록" onclick="location.href='/member/paging?page=${page}'" />
		</div>
		<div class="table_box">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
			 			<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>프로필</th>
						<th>삭제</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${member.m_number}</td>
						<td>${member.m_id}</td>
						<td>${member.m_password}</td>
						<td>${member.m_name}</td>
						<td>${member.m_email}</td>
						<td>${member.m_phone}</td>
						<td><img style="width: 100px;" alt="" src="/resources/upload/${member.m_filename}"/></td>
						<td><input class="table_btn cus_p" type="button" value="삭제" onclick="location.href='/member/delete?m_number=${member.m_number}'"></td>
						<td><input class="table_btn cus_p" type="button" value="수정" onclick="location.href='/member/update?m_number=${member.m_number}'"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>