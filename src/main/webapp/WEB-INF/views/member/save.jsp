<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	// 아이디 중복 체크
	function idDuplicate() {
		const id=document.getElementById('m_id').value;
		console.log(id);
		const checkResult = document.getElementById('id-dup-check');
		$.ajax({
			type: 'post',
			url: 'idDuplicate',
			data: {'m_id': id},
			dataType: 'text',
			success: function(result) {
				if(result=="ok"){
					checkResult.style.color="green";
					checkResult.innerHTML = '멋진 아이디네요!!';
				} else {
					checkResult.style.color="red";
					checkResult.innerHTML = '이미 사용중인 아이디입니다.';
				}
			},
			error: function() {
				console.log('오타 찾으세요.');
			}
		});
	}
</script>
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>MEMBER_SAVE</title>
</head>
<body>
	<div class="box">
		<h2 class="title">회원가입</h2>
		<form action="/member/saveFile" method="post" enctype="multipart/form-data">
			<div class="save_box">
				<p class="save_input_txt">아이디</p>
				<input class="save_input" type="text" name="m_id" onblur="idDuplicate()" id="m_id">
				<span id="id-dup-check"></span>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">비밀번호</p>
				<input class="save_input" type="password" name="m_password">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">이름</p>
				<input class="save_input" type="text" name="m_name">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">이메일</p>
				<input class="save_input" type="text" name="m_email">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">전화번호</p>
				<input class="save_input" type="text" name="m_phone">
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">프로필 사진</p>
				<input type="file" name="m_file"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_btn_box">
				<input class="save_btn cus_p" type="button" value="취소" onclick="location.href='/'"/>
				<input class="save_btn cus_p" type="submit" value="가입하기">
			</div>
		</form>
	</div>
</body>
</html>