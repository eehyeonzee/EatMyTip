<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 4:04:21
 * 3. 작성자 : ASUS
 * 4. 설명 : 공지사항의 작성 폼 입니다.
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#news_form').submit(function() {
			if($('#title').val().trim() == '') {
				alert('제목을 입력하세요!');
				$('#title').focus();
				$('#title').val('');
				return false;
			}
			if($('#content').val().trim() == '') {
				alert('내용을 입력하세요!');
				$('#content').focus();
				$('#content').val('');
				return false;
			}
			if($('input:radio[name=category]').is(':checked')=='') {
				alert('카테고리를 선택하세요!');
				$('#category').focus();
				$('#category').val('');
				return false;
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<div class="container">
	<h2>공지사항 쓰기</h2>
	<form id="news_form" action="newsWrite.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<h6>카테고리</h6>
			<input type="radio" id="news" name="category" value="공지사항">
			<label for="news">공지사항</label>
			<input type="radio" id="recipe" name="category" value="레시피">
			<label for="news">레시피</label>
			<input type="radio" id="bestrecipe" name="category" value="베스트레시피">
			<label for="news">베스트레시피</label>
			<input type="radio" id="event" name="category" value="이벤트">
			<label for="news">이벤트</label>
			<input type="radio" id="qna" name="category" value="문의사항">
			<label for="news">문의사항</label><br>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title">
		</div>
			<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" rows="20" name="content"></textarea>
		</div>
		<div class="form-group">
			<label for="filename">파일</label>
			<input type="file" name="filename" id="filename" accept="image/gif,image/png,image/jpeg">
		</div>
		  <button type="submit" class="btn btn-primary mb-2">글 등록</button>	
	</form>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>