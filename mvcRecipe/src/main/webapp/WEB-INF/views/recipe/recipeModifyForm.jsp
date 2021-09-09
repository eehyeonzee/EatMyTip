<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 9. 7.
 * 작성자 : 이현지
 * 설명 : 레시피 글 수정폼
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>레시피 글수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<!-- container 시작 -->
<div class="container" style="width:100%">
	<h2>레시피 수정</h2><%-- 임시(나중에 삭제) --%>
	<form id="modify_form" action="recipeModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${recipe.board_num}">
		<ul>
			<li>
				<label for="category">카테고리</label>
				<select name="category" id="category">
					<option value="식사" <c:if test="${recipe.category.equals('식사')}"> selected </c:if>>식사</option>
					<option value="간식" <c:if test="${recipe.category.equals('간식')}"> selected </c:if>>간식</option>
					<option value="음료" <c:if test="${recipe.category.equals('음료')}"> selected </c:if>>음료</option>
				</select>
			</li>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="${recipe.title}" maxlength="50">
			</li>
			<li>
				<label for="content">내용</label>
				<textarea rows="5" cols="50" name="content" id="content">${recipe.content}</textarea>
			</li>
			<li>
				<label for="filename">파일</label>
				<input type="file" name="filename" id="filename" value="${recipe.filename}" accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div>
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='recipeList.do'">
		</div>
	</form>
</div>
<!-- container 끝 -->
</body>
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</html>