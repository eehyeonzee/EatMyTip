<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
 * 작성일 : 2021. 9. 7.
 * 작성자 : 박용복
 * 설명 : 회원 가입 페이지
 * 수정일 : 2021. 9. 7.
--%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idChecked = 0;
		
		// 아이디 중복 체크
		$('#id_check').click(function() {
			if($('#id').val().trim() == '') {
				alert('아이디를 입력하세요!');
				$('#id').focus();
				$('#id').val('');
				return;
			}
			
			$('#message_id').text('');
			
			$.ajax({
				url : 'checkDuplicatedId.do',
				type : 'post',
				data : {id : $('#id').val()},
				dataType : 'json',
				cache : false,
				timeout : 30000,
				success : function(param) {
					if(param.result == 'idNotFound') {
						idChecked = 1;
						$('#message_id').css('color', '#0000FF').text('사용 가능한 아이디 입니다.');
					}else if(param.result == 'idDuplicated') {
						idChecked = 0;
						$('#message_id').css('color', 'red').text('이미 사용 중인 아이디 입니다!');
						$('#id').val('').focus();
					}else {
						idChecked = 0;
						alert('아이디 중복 체크 오류 발생!');
					}
				},
				error : function() {
					idChecked = 0;
					alert('네트워크 오류 발생!');
				}
			});
		});
		
		// 아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_form #id').keydown(function() {
			idChecked = 0;
			$('#message_id').text('');
		});
		
		// 회원 정보 등록 유효성 체크
		$('#register_form').submit(function() {
			if($('#id').val().trim() == '') {
				alert('아이디를 입력하세요!');
				$('#id').focus();
				$('#id').val('');
				return false;
			}
			if(idChecked == 0) {
				alert('아이디 중복 체크를 하셔야 합니다!');
				$('#id_check').focus();
				return false;
			}
			if($('#name').val().trim() == '') {
				alert('이름을 입력하세요!');
				$('#name').focus();
				$('#name').val('');
				return false;
			}
			if($('#passwd').val().trim() == '') {
				alert('비밀번호를 입력하세요!');
				$('#passwd').focus();
				$('#passwd').val('');
				return false;
			}
			if($('#passwd2').val().trim() == '') {
				alert('비밀번호를 확인해주세요!');
				$('#passwd2').focus();
				$('#passwd2').val('');
				return false;
			}
			if($('#email').val() == '') {
				alert('이메일을 입력하세요!');
				$('#email').focus();
				$('#email').val('');
				return false;
			}
			if($('#phone').val().trim() == '') {
				alert('전화번호 입력하세요!');
				$('#phone').focus();
				$('#phone').val('');
				return false;
			}
			if($('#birthday').val().trim() == '') {
				alert('생년월일을 입력하세요!');
				$('#birthday').focus();
				$('#birthday').val('');
				return false;
			}
			if($('#passkey').val().trim() == '') {
				alert('비밀번호 힌트를 입력하세요!');
				$('#passkey').focus();
				$('#passkey').val('');
				return false;
			}
			if($('#passwd').val() != $('#passwd2').val()) {
				alert('비밀번호와 비밀번호 확인이 불일치!');
				$('#passwd').val('').focus();
				return false;
			}
		});
		
		// 비밀번호 확인 일치 여부 체크
		// 비밀번호 확인까지 한 후 다시 비밀번호를 수정하려고 하면 비밀번호 확인을 초기화
		$('#passwd').keyup(function(){
			$('#passwd2').val('');
			$('#message_passwd2').text('');
		});
		
		// 비밀번호와 비밀번호 확인 일치 여부 체크
		$('#passwd').keyup(function() {
			if($('#passwd').val() == $('#passwd2').val()) {
				$('#message_passwd2').text('비밀번호 일치');
			}else {
				$('#message_passwd2').text('');
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
	<form id = "register_form" action = "registerMember.do" method = "post">
		<div class = "form-group row">
			<label for = "id" class = "col-sm-2 col-form-label">아이디</label>
			<input type = "text" class = "form-control" name = "id" id = "id" maxlength = "12">
			<input type = "button" value = "ID 중복체크" id = "id_check">
			<span id = "message_id"></span>
		</div>
		<div class = "form-group row">
			<label for = "name" class = "col-sm-2 col-form-label">이름</label>
			<input type = "text" class = "form-control" name = "name" id = "name" maxlength = "8">
		</div>
		<div class = "form-group row">
			<label for = "passwd" class = "col-sm-2 col-form-label">비밀번호</label>
			<input type = "password" class = "form-control" name = "passwd" id = "passwd" maxlength = "12">
		</div>
		<div class = "form-group row">
			<label for = "passwd2" class = "col-sm-2 col-form-label">비밀번호 확인</label>
			<input type = "password" class = "form-control" id = "passwd2" maxlength = "12">
			<span id = "message_passwd2"></span>
		</div>
		<div class = "form-group row">
			<label for = "email" class = "col-sm-2 col-form-label">이메일</label>
			<input type = "email" class = "form-control" name = "email" id = "email" maxlength = "50">
		</div>
		<div class = "form-group row">
			<label for = "phone" class = "col-sm-2 col-form-label">전화번호</label>
			<input type = "text" class = "form-control" name = "phone" id = "phone" maxlength = "15">
		</div>
		<div class = "form-group row">
			<label for = "birthday" class = "col-sm-2 col-form-label">생년월일</label>
			<input type = "date" class = "form-control" name = "birthday" id = "birthday">
		</div>
		<div class = "form-group row">
			<label class = "col-sm-5 col-form-label">비밀번호 힌트 : 가장 좋아하는 요리는?</label>
		</div>
		<div class = "form-group row">
			<label for = "passkey" class = "col-sm-2 col-form-label">비밀번호 정답</label>
			<input type = "text" class = "form-control" name = "passkey" id = "passkey" maxlength = "16">
		</div>
		<div class = "form-group row">
			<div class = "col-sm-10">
				<button type = "submit" class = "btn btn-primary">회원 가입</button>
			</div>
		</div>
	</form>
</div>
<!-- container 끝 -->
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>