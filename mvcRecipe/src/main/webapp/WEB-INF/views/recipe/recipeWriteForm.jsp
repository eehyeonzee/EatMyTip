<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 글쓰기</title>
<!-- stylesheet link 삽입 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 이벤트 연결
		$('#write_form').submit(function() {
			if($('#title').val().trim() == '') {
				alert('제목을 입력하세요!');
				$('#title').val('').focus();
				return false;
			}
			
			if($('#content').val().trim() == '') {
				alert('내용을 입력하세요!');
				$('#content').val('').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div>
	<h2>글쓰기</h2>
	<form id="write_form" action="recipeWrite.do" method="post" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="category">카테고리</label>
				<select name="category">
					<option value="식사">식사</option>
					<option value="간식">간식</option>
					<option value="음료">음료</option>
				</select>
			</li>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" maxlength="50">
			</li>
			<li>
				<label for="content">내용</label>
				<textarea rows="5" cols="50" name="content" id="content"></textarea>
			</li>
			<li>
				<label for="filename">파일</label>
				<input type="file" name="filename" id="filename" accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div>
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='recipeList.do'">
		</div>
	</form>
</div>
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>