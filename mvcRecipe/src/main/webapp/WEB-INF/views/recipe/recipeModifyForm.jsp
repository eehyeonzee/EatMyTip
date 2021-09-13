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
			if($('#category').val() == '') {
				alert('카테고리를 선택하세요!');
				$('#category').val('').focus();
				return false;
			}
			if($('#title').val().trim() == '') {
				alert('제목을 입력하세요!');
				$('#title').val('').focus();
				return false;
			}
			
			if($('#sub_content').val().trim() == '') {
				alert('소개글을 입력하세요!');
				$('#sub_content').val('').focus();
				return false;
			}
			
			if($('#md_summernote').val().trim() == '') {
				alert('내용을 입력하세요!');
				$('#md_summernote').val('').focus();
				return false;
			}
		});
		
		// textarea에 내용 입력시 글자수 체크
		$(document).on("keyup","textarea",function(){
			 // 입력한 글자 구함
	         var inputLength = $(this).val().length;
	         
	         if(inputLength > 150){   // 150자를 넘어선 경우
	            $(this).val($(this).val().substring(0,150));
	         	$(".number_of").text("※ 소개글은 150자까지만 입력 가능합니다.")
	         }

		});
		
		// summernote 에디터
		$('#md_summernote').summernote({
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
			    ['insert',['link', 'picture', 'codeview']],
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
				<br>
				<div class="form-group">
				<textarea class="form-control" id="sub_content" rows="5" name="sub_content" placeholder="소개글을 입력해주세요 (목록에 소개될 내용입니다.)">${recipe.sub_content}</textarea>
				</div>
				<span style="color: red; font-weight:bolder; font-size: 12px; font-style: italic;" class="number_of"></span>
			</li>
			<li>
				<label for="content"></label>
				<textarea id="md_summernote" name="content" class="contents">${recipe.content}</textarea>
			</li>
			<li>
				<div>
				<label for="filename"></label>
				<c:if test="${!empty recipe.filename}">
				<br>
				<span style="background-color:#ffe8e8">* 이미 등록된 파일이 있습니다. [${recipe.filename}]</span> 
				</c:if>
				</div>
				<br>
				<input type="file" name="filename" id="filename" class="form-control-file border" value="${recipe.filename}" accept="image/gif,image/png,image/jpeg">
				<span style="color: red; font-weight:bolder; font-size: 12px; font-style: italic;">썸네일사진을 선택해주세요. (미선택시 기본이미지 출력)</span>
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