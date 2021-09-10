<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 9. 10.
 * 작성자 : 나윤경
 * 설명 : 고객센터 게시판 글 수정
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript">

</script>
</head>
<body>
<div class="page-main">
	<h2>글 수정</h2>
	<form id="qnaModify_form" action="qnaModify.do" method="post">
		<input type="hidden" name="qna_num" value="${qnaBoardVO.qna_num}">
		<ul>
			<li>
				<label for="qna_title">제목</label>
				<input type="text" name="qna_title" id="qna_title" size="30"
				                   value="${boardVO.qna_title}" maxlength="50">
			</li>
		 	<li>
	            <label for="qna_id">닉네임</label>
	            <c:if test="${empty mem_num }">
	               <input type="text" name="qna_id" id="qna_id" size="12" maxlength="12" placeholder="닉네임을 입력하세요">
	            </c:if>
	            <c:if test="${!empty mem_num }">
	               <input type="text" name="qna_id" id="qna_id" size="12" maxlength="12" value="${mem_id }" readonly>
	            </c:if>
         	</li>
			<li>
				<label for="qna_passwd">비밀번호</label>
				<input type="password" name="qna_passwd" id="qna_passwd" size="12" maxlength="12">
				*등록시 입력한 비밀번호
			</li>
			<li>
				<label for="qna_content">내용</label>
				<textarea rows="5" cols="40" name="qna_content" id="qna_content">${boardVO.qna_content}</textarea>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="글수정">
			<input type="button" value="목록" onclick="location.href='qnaList.do'">
		</div>
	</form>
</div>
</body>
</html>



