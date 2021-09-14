<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 7. 오후 8:27:09
 * 3. 작성자 : ASUS
 * 4. 설명 : 뉴스 수정 폼
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		// 이벤트 연결
		$('#modify_form').submit(function() {
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
			if($('input:radio[name=category]').is(':checked')=='') {
				alert('카테고리를 선택하세요!');
				$('#category').focus();
				$('#category').val('');
				return false;
			}
		});
	});
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<div class="container">
	<br><br>
	<h2>레시피 수정</h2>	
	<hr size="1" noshade width="100%">
	<form id="modify_form" action="newsModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="news_num" id="news_num" value="${news.news_num}">
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
			<input type="text" class="form-control" name="title" id="title" value="${news.news_title}">
		</div>
			<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" rows="11" name="content">${news.news_content}</textarea>
		</div>
		<div class="form-group">
			<label for="filename">파일</label>
			<input type="file" name="filename" id="filename" class="form-control-file border" accept="image/gif,image/png,image/jpeg">
			<c:if test="${!empty news.news_file}">
			<br>
			<span>(${news.news_file})파일이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
			</c:if>
		</div>
		<div align="center">
		<input type="submit" value="등록" class="btn btn-outline-dark">&nbsp;
		<input type="button" value="취소" class="btn btn-outline-dark" onclick="location.href='newsList.do'">
		</div>	
	</form>
	<br>
	<br>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>