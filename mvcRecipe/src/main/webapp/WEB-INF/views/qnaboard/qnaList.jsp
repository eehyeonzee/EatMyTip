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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>고객센터 게시판 목록</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="container-fluid" style="width :90%;">
	<div class="row" style="width :100%;">
    <div class="text-center col-md-12 my-5">
    <div align="left">
		<h3>문의 게시판</h3>
		 <hr size="2" noshade width="100%">
	</div>
		
		<div align="left">
		
		<br>
		<span style="font-weight: bold; color: red;">${ count } </span>개
      	<span style="float: right;">
	
			<input type="button" value="글쓰기" onclick="location.href='qnaWriteForm.do'">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</span>
	 </div>
	
	<!-- 게시물이 없는 경우 -->
	<c:if test="${count==0 }">
	<div class="result-display">
		등록된 게시물이 없습니다.
	</div>
	</c:if>
	
	<!-- 게시물이 있는 경우 -->
	<c:if test="${count>0 }">
	<div class="container-fluid mt-3 mb-5">
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				
			</tr>
			<c:forEach var="qnaboard" items="${list }">
			<tr>
				<td>${qnaboard.qna_num}</td>
				<td><a href="qnaDetail.do?qna_num=${qnaboard.qna_num}"
				>${qnaboard.qna_title}</a></td>
				<td>${qnaboard.qna_id}</td>
				<td>${qnaboard.qna_date}</td>
			</tr>
			</c:forEach>
		
		</table>
	</div>
	</c:if>
	 <%-- 구분선 --%>
		 <hr size="2" noshade width="100%">
	</div>
      </div> 
		<div class="row">
			<div class="col text-center mt-4 mb-n1">${pagingHtml}</div>
		</div>
	
	
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
