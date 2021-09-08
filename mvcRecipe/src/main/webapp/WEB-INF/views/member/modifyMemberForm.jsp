<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 9. 8.
 * 작성자 : 박용복
 * 설명 : 회원 정보 수정 form
 * 수정일 : 2021. 9. 8.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#modify_form').submit(function() {
			if($('#nowpasswd').val().trim() == '') {
				alert('개인정보를 수정하시려면 비밀번호를 입력하세요!');
				$('#nowpasswd').focus();
				$('#nowpasswd').val('');
				return false;
			}
			if($('#email').val().trim() == '') {
				alert('이메일을 입력하세요!');
				$('#email').focus();
				$('#email').val('');
				return false;
			}
			if($('#phone').val().trim() == '') {
				alert('전화번호를 입력하세요!');
				$('#phone').focus();
				$('#phone').val('');
				return false;
			}
			if($('#passkey').val().trim() == '') {
				alert('비밀번호 정답을 입력하세요!');
				$('#passkey').focus();
				$('#passkey').val();
				return false;
			}
			if($('#newpasswd').val() != $('#chepasswd').val()) {
				alert('새 비밀번호와 새 비밀번호 확인이 불일치 합니다!');
				$('#chepasswd').val('').focus();
				return false;
			}
		}); 		// end of submit
		
		// 새 비밀번호 확인까지 한 후 새 비밀번호를 수정하려고 하면 새 비밀번호를 초기화
		$('#newpasswd').keyup(function() {
			$('#chepasswd').val('');
			$('#message_chepasswd').text('');
		});
		
		// 새 비밀번호와 새 비밀번호 확인 일치 여부 체크
		$('#chepasswd').keyup(function() {
			if($('#newpasswd').val() == $('#chepasswd').val()) {
				$('#message_chepasswd').text('새 비밀번호 일치');
			}else {
				$('#message_chepasswd').text('');
			}
		});
	});
</script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp" />
<div class = "">
	<h2>회원 정보 수정</h2>
	<form action = "modifyMember.do" method = "post" id = "modify_form">
		<ul>
			<li>
				<label for = "id">아이디</label>
				: ${member.id}
			</li>
			<li>
				<label for = "name">이름</label>
				: ${member.name}
			</li>
			<li>
				<label for = "nowpasswd">현재 비밀번호</label>
				<input type = "password" name = "nowpasswd" id = "nowpasswd" maxlength = "12">
			</li>
			<li>
				<label for = "newpasswd">새 비밀번호</label>
				<input type = "password" name = "newpasswd" id = "newpasswd" maxlength = "12">
			</li>
			<li>
				<label for = "chepasswd">새 비밀번호 확인</label>
				<input type = "password" name = "chepasswd" id = "chepasswd" maxlength = "12">
				<span id = "message_chepasswd"></span>
			</li>
			<li>
				<label for = "email">이메일</label>
				<input type = "email" name = "email" id = "email" value = "${member.email}" maxlength = "50">
			</li>
			<li>
				<label for = "phone">전화번호</label>
				<input type = "text" name = "phone" id = "phone" value = "${member.phone}" maxlength = "15">
			</li>
			<li>
				<label for = "birthday">생년월일</label>
				: ${member.birthday}
			</li>
			<li>
				<label>비밀번호 힌트 : 가장 좋아하는 요리는?</label>
			</li>
			<li>
				<label for = "passkey">비밀번호 정답</label>
				<input type = "text" name = "passkey" id = "passkey" value = "${member.passkey}" maxlength = "16">
			</li>
		</ul>
		<div class = "">
			<input type = "submit" value = "수정">
			<input type = "button" value = "뒤로가기" onclick = "location.href='myPage.do'">
		</div>
	</form>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>