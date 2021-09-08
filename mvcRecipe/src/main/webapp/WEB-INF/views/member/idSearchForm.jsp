<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 9. 8.
 * 작성자 : 박용복
 * 설명 : 아이디 찾기 form
 * 수정일 : 2021. 9. 8.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#idsearch_form').submit(function() {
			if($('#name').val().trim() == '') {
				alert('회원 가입시 입력한 이름을 입력하세요!');
				$('#name').focus();
				$('#name').val('');
				return false;
			}
			if($('#phone').val().trim() == '') {
				alert('회원 가입시 입력한 전화번호를 입력하세요!');
				$('#phone').focus();
				$('#phone').val('');
				return false;
			}
		});
	});
</script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp" />
<div class = "">
	<form action = "idSearch.do" method = "post" id = "idsearch_form">
		<ul>
			<li>
				<label for = "name">회원 가입시 입력한 이름</label>
				<input type = "text" id = "name" name = "name" maxlength = "8">
			</li>
			<li>
				<label for = "phone">회원 가입시 입력한 전화번호</label>
				<input type = "text" id = "phone" name = "phone" maxlength = "15">
			</li>
		</ul>
		<div class = "">
			<input type = "submit" value = "아이디 찾기">
			<input type = "button" value = "뒤로 가기" onclick = "location.href='loginForm.do'">
		</div>
	</form>
</div>
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>