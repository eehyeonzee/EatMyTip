<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

 <%-- 
 * 작성일 : 2021. 9. 6.
 * 작성자 : 나윤경
 * 설명 : 고객센터 게시판 목록
 * 수정일 : 2021. 9. 7.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h2>게시판 목록</h2>
	<div class ="align-right">
		
			<input type="button" value="글쓰기" onclick="location.href='writeForm.do'">
			<input type="button" value="목록" onclick="location.href='list.do'">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	
	</div>
	
	<!-- 게시물이 없는 경우 -->
	<c:if test="${count==0 }">
	<div class="result-display">
		등록된 게시물이 없습니다.
	</div>
	</c:if>
	
	<!-- 게시물이 있는 경우 -->
	<c:if test="${count>0 }">
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일</th>
			
		</tr>
		<c:forEach var="qnaboard" items="${list }">
		<tr>
			<td>${qnaboard.qna_num}</td>
			<td><a href="detail.do?num=${qnaboard.qna_num}">${qndboard.qna_title}</a></td>
			<td>${qnaboard.qna_id}</td>
			<td>${qnaboard.qna_date}</td>
		</tr>
		</c:forEach>
	
	</table>
	<div class="align-center">
		${pagingHtml }
	</div>
	
	</c:if>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>