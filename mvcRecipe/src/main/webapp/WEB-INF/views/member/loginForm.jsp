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
<div class = "container-fluid" style = "width:90%">
	<div class="text-center col-sm-12 my-5">
		<div align = "left">
			<h3>로그인</h3>
		</div>
	<form id = "login_form" action = "login.do" method = "post">
		<table>
			<tr>
				<td height = "80px"><label for = "id" class = "col-sm-10 col-form-label">아이디</label></td> 
				<td><input type = "text" name = "id" id = "id" class = "col-sm-12 form-control" maxlength = "12"></td>
				<td class = "col-sm-2" rowspan = "2"><input type = "submit" class = "btn btn-primary" value = "로그인"></td>
			</tr>
			<tr>
				<td height = "80px"><label for = "passwd" class = "col-sm-10 col-form-label">비밀번호</label></td>
				<td><input type = "password" name = "passwd" id = "passwd" class = "col-sm-12 form-control" maxlength = "12"></td>
			</tr>
			<tr>
				<td  colspan = "3" align = "center">
					<input type = "button" value = "아이디 찾기" class = "btn btn-primary" onclick = "location.href='idSearchForm.do'">
					<input type = "button" value = "비밀번호 찾기" class = "btn btn-primary" onclick = "location.href='passwdSearchForm.do'">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
<!-- container 끝 -->
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>