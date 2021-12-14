<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>BOARD_SAVE</title>
</head>
<body>
	<div class="box">
		<h2 class="title">게시판 등록</h2>
		<form action="/board/saveFile" method="post" enctype="multipart/form-data">
			<input type="hidden" id="m_number" value="${sessionScope.loginNumber}" />
			<div class="save_box">
				<p class="save_input_txt">작성자</p>
				<input class="save_input" type="text" name="m_id" value="${sessionScope.loginId}" readonly>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">제목</p>
				<input class="save_input" type="text" name="b_title" id="b_title"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box_2">
				<p class="save_input_txt">내용</p>
				<textarea class="tta save_input" name="b_contents" rows="5" id="b_contents"></textarea>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">파일</p>
				<input type="file" name="b_file"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_btn_box">
				<input class="save_btn cus_p" type="button" value="취소" onclick="location.href='/board/paging'"/>
				<input class="save_btn cus_p" type="submit" value="등록"/>
			</div>
		</form>
	</div>
</body>
</html>