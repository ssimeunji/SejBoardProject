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
<title>BOARD_DETAIL</title>
</head>
<body>
	<div class="box">
		<h2 class="title">상세 조회</h2>
		<div class="b_detail_btn_box">
			<input class="btn cus_p" type="button" value="목록" onclick="location.href='/board/paging?page=${page}'"/>
			<c:if test="${sessionScope.loginId eq board.m_id}">
				<input class="btn cus_p" type="button" value="수정" onclick="location.href='/board/update?b_number=${board.b_number}&page=${page}'"/>
				<input class="btn cus_p" type="button" value="삭제" onclick="location.href='/board/delete?b_number=${board.b_number}'"/>
			</c:if>
			<c:if test="${sessionScope.loginId eq 'admin'}">
				<input class="btn cus_p" type="button" value="삭제" onclick="location.href='/board/delete?b_number=${board.b_number}'"/>
			</c:if>
		</div>
		<div class="table_box">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
			 			<th>제목</th>
			 			<th>내용</th>
			 			<th>파일</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${board.b_number}</td>
						<td>${board.m_id}</td>
						<td>${board.b_title}</td>
						<td>${board.b_contents}</td>
						<td><img style="width: 100px;" alt="" src="/resources/upload/${board.b_filename}"/></td>
						<td>${board.b_date}</td>
						<td>${board.b_hits}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<%-- 댓글 --%>
		<div style="margin:20px 0px;" id="comment-write">
			<div class="save_box">
				<input class="comment_user" type="text" id="m_id" value="${sessionScope.loginId}" readonly/>
				<input class="save_input" type="text" id="c_contents" placeholder="댓글내용"/>
				<input class="save_btn cus_p" type="button" id="comment-write-btn" value="댓글등록"/>
			</div>
		</div>
		<span id="id-dup-check"></span>
		<%-- 댓글목록출력 --%>
		<div id="comment-list">
			<table class="table">
				<thead>
					<tr>
						<th>댓글번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성시간</th>
					</tr>
				</thead>
				<c:forEach items="${commentList}" var="comment">
				<tbody>
					<tr>
						<td>${comment.c_number}</td>
						<td>${comment.m_id}</td>
						<td>${comment.c_contents}</td>
						<td>${comment.c_date}</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$("#comment-write-btn").click(function(){
		const commentWriter = $("#m_id").val();
		const commentContents = $("#c_contents").val();
		const boardNumber = '${board.b_number}';
		console.log(commentWriter, commentContents, boardNumber);
		
 		$.ajax({
			type: 'post', //전송방식(get, post, delete, put 등)
			url: '/comment/save', //요청주소(컨트롤러로 요청하는 주소)
			data: {
				'm_id': commentWriter,
				'c_contents': commentContents,
				'b_number': boardNumber}, //전송할 데이터

			dataType: 'json', //요청 후 리턴받을 때의 데이터 형식
			success: function(result) { //요청이 성공적으로 처리 됬을 때 실행할 함수
				console.log(result);
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				for(let i in result){
					output += "<tr>";
					output += "<td>"+result[i].c_number+"</td>";
					output += "<td>"+result[i].m_id+"</td>";
					output += "<td>"+result[i].c_contents+"</td>";
					output += "<td>"+result[i].c_date+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				document.getElementById('comment-list').innerHTML = output;
				document.getElementById('m_id').value='';
				document.getElementById('c_contents').value='';
			},
			error: function() { //요청이 실패 했을 때 실행할 함수
				console.log('오타 찾으세요.');
			}
		});
	});
</script>
</html>