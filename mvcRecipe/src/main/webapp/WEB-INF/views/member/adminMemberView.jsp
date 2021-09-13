<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 9. 10.
 * 작성자 : 박용복
 * 설명 : 관리자 관리 뷰
 * 수정일 : 2021. 9. 10.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지 - 회원 정보 조회</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type ="text/javascript">
	$(document).ready(function() {
		
		$('#stop_btn').click(function() {
		   	var output = '';
		   
			$('input[type=checkbox]:checked').each(function(index,item){
			    if(index !=0 ){
			    	output += ',';
			    }
					output += $(this).val();
			  	});
			    
				if(output == '') {
					alert('체크가 되어 있지 않습니다!');
					return false;
				}
			   
				$.ajax({
					url: 'stopAdminMember.do',
				   	type: 'post',
				   	data: {output : output},
				   	dataType : 'json',
					cache : false,
					timeout : 30000,
				    success: function(param) {
				    	alert('수정 완료');
				    	location.reload();

				    	$("input:checkbox[id='chkbox']").prop("checked", false);
				    },
				    error : function() {
				    	alert('네트워크 오류');
				    }
				});
		});
		
		$('#up_btn').click(function() {
		   	var output = '';
		   
			$('input[type=checkbox]:checked').each(function(index,item){
			    if(index !=0 ){
			    	output += ',';
			    }
					output += $(this).val();
			  	});
			    
				if(output == '') {
					alert('체크가 되어 있지 않습니다!');
					return false;
				}
			   
				$.ajax({
					url: 'upAdminMember.do',
				   	type: 'post',
				   	data: {output : output},
				   	dataType : 'json',
					cache : false,
					timeout : 30000,
				    success: function(param) {
				    	alert('수정 완료');
				    	location.reload();
				    	$("input:checkbox[id='chkbox']").prop("checked", false);
				    },
				    error : function() {
				    	alert('네트워크 오류');
				    }
				});
		});
		
		$('#delete_btn').click(function() {
		   	var output = '';
		   
			$('input[type=checkbox]:checked').each(function(index,item){
			    if(index !=0 ){
			    	output += ',';
			    }
					output += $(this).val();
			  	});
			    
				if(output == '') {
					alert('체크가 되어 있지 않습니다!');
					return false;
				}
			   
				$.ajax({
					url: 'deleteAdminMember.do',
				   	type: 'post',
				   	data: {output : output},
				   	dataType : 'json',
					cache : false,
					timeout : 30000,
				    success: function(param) {
				    	alert('수정 완료');
				    	location.reload();
				    	$("input:checkbox[id='chkbox']").prop("checked", false);
				    },
				    error : function() {
				    	alert('네트워크 오류');
				    }
				});
		});
	});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class = "">
	<h2>가입한 회원 목록</h2>
	<div class = "">
		<input type = "button" class = "btn btn-outline-dark" value = "뒤로 가기" onclick = "location.href='myPage.do'">
		<input type = "button" class = "btn btn-outline-dark" value = "홈으로" onclick = "location.href='${pageContext.request.contextPath}/main/main.do'"> 
		<input type = "button" class = "btn btn-outline-dark" value = "회원 정지" id = "stop_btn">
		<input type = "button" class = "btn btn-outline-dark" value = "정지 해제" id = "up_btn">
		<input type = "button" class = "btn btn-outline-dark" value = "회원 탈퇴" id = "delete_btn"> 
	</div>
	<c:if test = "${count == 0}">
	<div class = "">
		회원 가입한 회원이 없습니다.
	</div>
	</c:if>
	<c:if test = "${count > 0}">
		<table>
			<tr>
				<th>회원 번호</th>
				<th>ID</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th>멤버 권한</th>
				<th>선택</th>
				<th>테스트</th>
			</tr>
			<c:forEach var = "member" items = "${list}">
			<tr>
				<td>${member.mem_num}</td>
				<td>${member.id}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<td>${member.birthday}</td>
				<td>${member.join_date}</td>
				<td>
				    <c:if test="${member.auth == 1}">정지회원</c:if>
				    <c:if test="${member.auth == 2}">일반회원</c:if>
				    <c:if test="${member.auth == 3}">관리자</c:if>
				</td>
				<td>
				    <c:if test="${member.auth != 3}">
				    	<input type = "checkbox" value = "${member.mem_num}">
				    </c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<div class = "">
			${pagingHtml}
		</div>
	</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>