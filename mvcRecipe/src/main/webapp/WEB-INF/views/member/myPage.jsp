<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
 * 작성일 : 2021. 9. 7.
 * 작성자 : 박용복
 * 설명 : 내 정보 보기 페이지
 * 수정일 : 2021. 9. 7.
--%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>페이지명</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type ="text/javascript">
	$(document).ready(function() {
		$('#photo_btn').click(function() {
			$('#photo_choice').show();
			$(this).hide();
		});
		
		var photo_path;
		var my_photo;
		$('#photo').change(function() {
			var photo = document.getElementById('photo');
			my_photo = photo.files[0];
			
			if(my_photo) {
				var reader = new FileReader();
				reader.readAsDataURL(my_photo);
				
				reader.onload = function() {
					photo_path = $('.my-photo').attr('src', reader.result);
				};
			}
		});
		
		$('#photo_submit').click(function() {
			if($('#photo').val() == '') {
				alert('파일을 선택하세요!');
				$('#photo').focus();
				return;
			}
			
			var form_data = new FormData();
			form_data.append('photo', my_photo);
			$.ajax({
				data : form_data,
				type : 'post',
				url : 'updateMyPhoto.do',
				dataType : 'json',
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요!');
					}else if(param.result == 'success') {
						alert('프로필 사진이 수정되었습니다!');
						$('#photo').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();
					}else {
						alert('파일 전송 오류 발생');
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});
		});
		
		$('#photo_reset').click(function() {
			$('.my-photo').attr('src', photo_path);
			$('#photo').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();
		});
	});
</script>
</head>
<body>
<!-- 본문 -->
<div class = "">
	<h2>회원정보</h2>
	<div class = "">
		<h3>프로필 사진</h3>
		<ul>
			<li>
				<c:if test = "${empty member.photo}">
					<img src = "#" width = "100" height = "100" class = "">
				</c:if>
				<c:if test = "${!empty member.photo}">
					<img src = "${pageContext.request.contextPath}/upload/${member.photo}" width = "100" height = "100" class = "">
				</c:if>
			</li>
			<li>
				<div class = "">
					<input type = "button" value = "수정" id = "photo_btn">
				</div>
				<div id = "photo_choice" style = "display:none;">
					<input type = "file" id = "photo" accept = "image/gif,image/png,image/jepg"><br>
					<input type = "button" value = "전송" id = "photo_submit">
					<input type = "button" value = "취소" id = "photo_reset">
				</div>
			</li>
		</ul>
		<h3>회원탈퇴</h3>
		<ul>
			<li>
				<input type = "button" value = "회원 탈퇴" onclick = "location.href='deleteUserForm.do'">
			</li>
		</ul>
	</div>
	<div class = "">
		<h3>개인 정보 수정</h3>
		<ul>
			<li>이름 : ${member.name}</li>
			<li>전화번호 : ${member.phone}</li>
			<li>이메일 : ${member.email}</li>
			<li>생일 : ${member.birthday}</li>
			<li>가입일 : ${member.join_date}</li>
			<li><input type = "button" value = "회원 정보 수정" onclick = "location.href='modifyMemberForm.do'">
		</ul>
	</div>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
</html>