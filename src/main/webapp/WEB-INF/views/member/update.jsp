<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>Member_UPDATE</title>
</head>
<body>
	<div class="box">
		<h2 class="title">회원정보 수정</h2>
		<div>
			<input class="cus_p" type="button" value="목록" onclick="location.href='/member/detail?m_number=${member.m_number}'" />
		</div>
		<form action="/member/update" method="post" enctype="multipart/form-data">
			<div class="save_box">
				<p class="save_input_txt">번호</p>
				<p class="save_input_txt">${member.m_number}</p>
				<input type="hidden" name="m_number" value="${member.m_number}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">아이디</p>
				<p class="save_input_txt">${member.m_id}</p>
				<input type="hidden" name="m_id" value="${member.m_id}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">이름</p>
				<input class="save_input" type="text" name="m_name" value="${member.m_name}">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">이메일</p>
				<input class="save_input" type="text" name="m_email" value="${member.m_email}">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">전화번호</p>
				<input class="save_input" type="text" name="m_phone" value="${member.m_phone}">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">프로필 사진</p>
				<img style="width: 100px; margin-right: 10px;" alt="" src="/resources/upload/${member.m_filename}"/>
				<input type="file" name="m_file" value="${member.m_filename}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_btn_box">
				<input class="save_btn cus_p" type="submit" value="수정" onclick="mypage()" />
			</div>
			
		</form>
	</div>
</body>
</html>