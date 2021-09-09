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
	<h2>공지사항 수정하기</h2>
	<form id="modify_form" action="newsModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="news_num" id="news_num" value="${news.news_num}">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" value="${news.news_title}">
		</div>
			<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" rows="20" name="content">${news.news_content}</textarea>
		</div>
		<div class="form-group">
			<label for="filename">파일</label>
			<input type="file" name="filename" id="filename" accept="image/gif,image/png,image/jpeg" value="${news.news_file}">
		</div>
		  <button type="submit" class="btn btn-primary mb-2">수정 등록</button>	
	</form>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>