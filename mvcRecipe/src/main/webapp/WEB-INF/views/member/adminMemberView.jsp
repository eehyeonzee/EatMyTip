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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지 - 회원 정보 조회</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type ="text/javascript">
	$(document).ready(function() {
		$("#stop_btn").click(function(){
		    value_list = [];
		    $("input[name='authChan']:checked").each(function(){
		        var checked_value = $(this).val();
		        value_list.push(checked_value);
		    });
		    location.href='${pageContext.request.contextPath}/main/StopAdminMemberAction.do';
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
		<input type = "button" class = "btn btn-outline-dark" value = "회원 정지" id = "stop_btn" name = "stop_btn">
		<input type = "button" class = "btn btn-outline-dark" value = "회원 탈퇴" id = "delete_btn" name = "delete_btn"> 
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
					<script>
						var auth = ${member.auth};
						if(auth == 1) {
							document.write("정지회원");
						}else if(auth == 2) {
							document.write("일반회원");
						}else if(auth == 3) {
							document.write("관리자");
						}else {
							document.write("데이터베이스 오류");
						}
					</script>
				</td>
				<td>
					<script>
						var auth = ${member.auth};
						if(auth != 3) {
							var output = '<input type = "checkbox" name = "authChan" id = "authChan">';
							document.write(output);
						}
					</script>
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