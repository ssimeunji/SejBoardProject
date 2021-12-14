<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>MEMBER_MYPAGE</title>
<script type="text/javascript">
	function mypageUpdate() {
		const pw = document.getElementById("m_password").value;
		const pwDB = '${member.m_password}';
		
		if (pw==pwDB) {
			update_form.submit();
			alert("회원 정보가 수정되었습니다.");
		} else {			
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
</script>
</head>
<body>
	<div class="box">
		<h2 class="title">마이페이지</h2>
		<div>
			<input class="cus_p" type="button" value="게시판" onclick="location.href='/board/paging?page=${page}'" />
		</div>
		<form action="/member/mypage" name="update_form" method="post" enctype="multipart/form-data">
			<div class="save_box">
				<p class="save_input_txt">번호</p>
				<p class="save_input_txt">${member.m_number}</p>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">아이디</p>
				<p class="save_input_txt">${member.m_id}</p>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">비밀번호</p>
				<input class="save_input" type="text" name="m_password" id="m_password">
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
				<input class="save_btn cus_p" onclick="mypageUpdate()" type="button" value="수정">
			</div>
			
		</form>
	</div>
</body>
</html>