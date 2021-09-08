<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 9. 9.
 * 작성자 : 박용복
 * 설명 : 비밀번호 찾기 form
 * 수정일 : 2021. 9. 9.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#passwdsearch_form').submit(function() {
			if($('#id').val().trim() == '') {
				alert('아이디를 입력하세요!');
				$('#id').focus();
				$('#id').val('');
				return false;
			}
			if($('#name').val().trim() == '') {
				alert('회원 가입시 입력한 이름을 입력하세요!');
				$('#name').focus();
				$('#name').val('');
				return false;
			}
			if($('#passkey').val().trim() == '') {
				alert('회원 가입시 입력한 비밀번호 힌트 정답을 입력하세요!');
				$('#passkey').focus();
				$('#passkey').val('');
				return false;
			}
		});
	});
</script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp" />
<div class = "">
	<form action = "passwdSearch.do" method = "post" id = "passwdsearch_form">
		<ul>
			<li>
				<label for = "id">ID</label>
				<input type = "text" id = "id" name = "id" maxlength = "12">
			</li>
			<li>
				<label for = "name">회원 가입시 입력한 이름</label>
				<input type = "text" id = "name" name = "name" maxlength = "8">
			</li>
			<li>
				<label for = "passkey">비밀번호 힌트 : 가장 좋아하는 음식은?</label>
				<input type = "text" id = "passkey" name = "passkey" maxlength = "16">
			</li>
		</ul>
		<div class = "">
			<input type = "submit" value = "비밀번호 찾기">
			<input type = "button" value = "뒤로 가기" onclick = "location.href='loginForm.do'">
		</div>
	</form>
</div>
</body>
</html>