<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 4:04:33
 * 3. 작성자 : ASUS
 * 4. 설명 : 공지사항의 목록입니다.
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
	<div class="container ">
		<div class="row">
			<div class="col"><h1>공지사항</h1></div>
			<hr>
		</div>
		<div class="row">
			<div class="col"><h4>잇마이 레시피의 공지사항입니다.</h4></div>
		</div>
	</div>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<td>no</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			<c:forEach var="news" items="${list}">
				<tr>
					<td>${news.num}</td>
					<td><a href="detail.do?num=${news.num}">${news.title}</a></td>
					<td>관리자</td>
					<td>${news.date}</td>
				</tr>
			</c:forEach>
			</thead>
		</table>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-10"></div>
			<div class="col-sm-2"><a href="${pageContext.request.contextPath}/news/newsForm.do" class="btn btn-info" role="button">글작성</a></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>