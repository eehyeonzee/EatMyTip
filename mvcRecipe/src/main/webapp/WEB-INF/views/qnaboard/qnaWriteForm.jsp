<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 
 * 작성일 : 2021. 9. 6.
 * 작성자 : 나윤경
 * 설명 : 고객센터 게시판 글 작성
 * 수정일 : 2021. 9. 7.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript">
	

</script>
</head>
<body>
<div class="page-main">
	<h2>글 작성</h2>
	<form id="write_form" action="write.do" method="post">
		<ul>
			<li>
				<label for="qna_title">제목</label>
				<input type="text" name="qna_title" id="qna_title" size="30" maxlength="50">
			</li>
			<li>
				<label for="qna_id">작성자</label>
				<input type="text" name="qna_id" value="${qnaboard.qna_id }" readonly/>
			</li>
			<li>
				<label for="qna_passwd">비밀번호</label>
				<input type="password" name="qna_passwd" id="qna_passwd" size="12" maxlength="12">
			</li>
			<li>
				<label for="qna_content">내용</label>
				<textarea rows="5" cols="40" name="qna_content" id="qna_content"></textarea>
			</li>					
		</ul>
		<div class="align-center">
			<input type="submit" value="글 작성">
			<input type="button" value="목록" onclick="location.href='qnaList.do'">
		</div>	
	</form>

</div>
</body>
</html>