<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 9. 7.
 * 작성자 : 박용복
 * 설명 : 로그인 폼 jsp
 * 수정일 : 2021. 9. 7.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#login_form').submit(function() {
			if($('#id').val().trim() == '') {
				alert('아이디를 입력하세요!');
				$('#id').focus();
				$('#id').val('');
				return false;
			}
			if($('#passwd').val().trim() == '') {
				alert('비밀번호를 입력하세요!');
				$('#passwd').focus();
				$('#passwd').val('');
				return false;
			}
		});
	});
</script>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp" />
<!-- container 시작 -->
<div class = "container" style = "width:100%">
	<form id = "login_form" action = "login.do" method = "post">
		<ul>
			<li>
				<label for = "id">아이디</label>
				<input type = "text" name = "id" id = "id" maxlength = "12">
			</li>
			<li>
				<label for ="passwd">비밀번호</label>
				<input type = "password" name = "passwd" id = "passwd" maxlength = "12">
			</li>
		</ul>
		<div>
			<input type = "submit" value = "로그인">
			<input type = "button" value = "홈으로" onclick = "location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form>
</div>
<!-- container 끝 -->
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>