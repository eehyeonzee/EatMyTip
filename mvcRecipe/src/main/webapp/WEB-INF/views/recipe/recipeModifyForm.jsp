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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
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
		
		// summernote 에디터
		$('#summernote').summernote({
			height: 300, // 에디터 높이
			minHeight: null, // 최소 높이
			maxHeight: null, // 최대 높이
			focus: true, // 에디터 로딩 후 포커스
			lang: "ko-KR", // 한글 설정
			placeholder: '내용을 입력하세요', // placeholder 설정
			
			// 툴바 설정
			toolbar: [
				// [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link']],
			    ['view', ['help']]
			],
			
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<!-- container 시작 -->
<div class="container" style="width:100%">
	<br><br>
	<h2>레시피 수정</h2>
	<hr size="1" noshade width="100%">
	<form id="modify_form" action="recipeModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${recipe.board_num}">
		<ul>
			<li>
				<br>
				<p>
				<label for="category"></label>
				<select name="category" id="category">
					<option value="식사" <c:if test="${recipe.category.equals('식사')}"> selected </c:if>>식사</option>
					<option value="간식" <c:if test="${recipe.category.equals('간식')}"> selected </c:if>>간식</option>
					<option value="음료" <c:if test="${recipe.category.equals('음료')}"> selected </c:if>>음료</option>
				</select>
				</p>
			</li>
			<li>
				<div>
				<label for="title"></label>
				<input type="text" name="title" id="title" class="input2" value="${recipe.title}" maxlength="50">
				<span class="underline"></span>
				</div>
			</li>
			<li>
				<label for="content"></label>
				<textarea id="summernote" name="content" id="content">${recipe.content}</textarea>
			</li>
			<li>
				<div>
				<label for="filename"></label>
				<input type="file" name="filename" id="filename" class="form-control-file border" value="${recipe.filename}" accept="image/gif,image/png,image/jpeg">
				</div>
			</li>
		</ul>
		<br>
		<div align="center">
			<input type="submit" value="등록" class="btn btn-outline-dark">&nbsp;
			<input type="button" value="취소" class="btn btn-outline-dark" onclick="location.href='recipeList.do'">
		</div>
	</form>
	<br><br>
</div>
<!-- container 끝 -->
</body>
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</html>