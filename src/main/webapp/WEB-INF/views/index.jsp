<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>INDEX</title>
</head>
<body>
	<div class="box">
		<h2 class="title">로그인</h2>
		<form class="login_box" action="/board/paging" method="post">
			<input class="login_input" type="text" placeholder="아이디" name="m_id" />
			<input class="login_input" type="password" placeholder="비밀번호" name="m_password" />
			<input class="login_btn cus_p" type="submit" value="로그인" />
			<input class="login_signup_btn cus_p" type="button" value="회원가입" onclick="location.href='/member/save'" />
		</form>
	</div>
</body>
</html>