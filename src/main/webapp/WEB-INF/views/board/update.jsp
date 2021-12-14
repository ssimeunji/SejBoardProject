<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- css --%>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>BOARD_UPDATE</title>
</head>
<body>
	<div class="box">
		<h2 class="title">글 수정</h2>
		<form action="/board/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}"/>
			<input type="hidden" name="m_number" value="${board.m_number}"/>
			<div class="save_box">
				<p class="save_input_txt">번호</p>
				<p class="save_input_txt">${board.b_number}</p>
				<input type="hidden" name="b_number" value="${board.b_number}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">작성자</p>
				<p class="save_input_txt">${board.m_id}</p>
				<input type="hidden" name="m_id" value="${board.m_id}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">제목</p>
				<input class="save_input" type="text" name="b_title" id="b_title" value="${board.b_title}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_box_2">
				<p class="save_input_txt">내용</p>
				<textarea class="tta save_input" name="b_contents" rows="5" id="b_contents">${board.b_contents}</textarea>
			</div>
			<div class="empty_10"></div>
			<div class="save_box">
				<p class="save_input_txt">파일</p>
				<img style="width: 100px; margin-right: 10px;" alt="" src="/resources/upload/${board.b_filename}"/>
				<input type="file" name="b_file" value="${board.b_filename}"/>
			</div>
			<div class="empty_10"></div>
			<div class="save_btn_box">
				<input class="btn" type="button" value="취소" onclick="location.href='/board/detail?b_number=${board.b_number}'"/>
				<input class="btn" type="submit" value="저장" onclick="update()"/>
			</div>
		</form>
	</div>
</body>
</html>