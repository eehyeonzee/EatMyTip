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
				    	$('input[type=checkbox]:checked').prop("checked", false);
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
				    	$('input[type=checkbox]:checked').prop("checked", false);
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
				    	$('input[type=checkbox]:checked').prop("checked", false);
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
<div class = "container-fluid contents-wrap" style = "width:90%">
	<div class="text-center col-sm-30 my-5">
		<div align = "left">
			<h3>관리자 페이지</h3>
		</div>
	<c:if test = "${count == 0}">
	<div class = "text-center">
		회원 가입한 회원이 없습니다.
	</div>
	</c:if>
	<c:if test = "${count > 0}">
		<div class = "text-right">
			<input type = "button" class = "btn btn-outline-dark" value = "뒤로 가기" onclick = "location.href='myPage.do'">
			<input type = "button" class = "btn btn-outline-dark" value = "홈으로" onclick = "location.href='${pageContext.request.contextPath}/main/main.do'"> 
			<input type = "button" class = "btn btn-outline-dark" value = "회원 정지" id = "stop_btn">
			<input type = "button" class = "btn btn-outline-dark" value = "정지 해제" id = "up_btn">
			<input type = "button" class = "btn btn-outline-dark" value = "회원 탈퇴" id = "delete_btn"> 
		</div>
		<br>
		<table class="table table-sm">
			<tr>
				<th scope="col">회원 번호</th>
				<th scope="col">아이디</th>
				<th scope="col">이메일</th>
				<th scope="col">전화번호</th>
				<th scope="col">생년월일</th>
				<th scope="col">가입일</th>
				<th scope="col">멤버 권한</th>
				<th scope="col">선택</th>
			</tr>
			<c:forEach var = "member" items = "${list}">
			<tr>
				<th scope = "row">${member.mem_num}</th>
				<td width = "200px">${member.id}</td>
				<td width = "200px">${member.email}</td>
				<td width = "200px">${member.phone}</td>
				<td width = "200px">${member.birthday}</td>
				<td width = "200px">${member.join_date}</td>
				<td width = "150px">
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
		<div align = "center">
			${pagingHtml}
		</div>
	</c:if>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>