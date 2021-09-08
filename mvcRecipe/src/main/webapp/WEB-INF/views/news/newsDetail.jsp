<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 4:05:01
 * 3. 작성자 : ASUS
 * 4. 설명 : 공지사항의 상세 화면 입니다.
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="text-center">
			<h3>게시판 글 상세</h3>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<span>글 제목: ${news.news_title}</span>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<span>조회수: ${news.news_hits}</span>
		</div>
		<div class="col">
			<span>작성자: ${news.name}</span>
		</div>
		<div class="col">
			<span>작성일: ${news.news_date}</span>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<span class="text-justify">내용:</span>
			<span>${news.news_content}</span>
		</div>
	</div>
		<c:if test="${!empty news.news_file}">
		<div class="row">
			<div class="col">
				<img src="${pageContext.request.contextPath}/upload/${news.news_file}" class="detail-img">
			</div>
		</div>
		</c:if>
	<c:if test="${auth==3}">
	<div class="row">
		<div class="col">
			<a href="${pageContext.request.contextPath}/news/newsModifyForm.do?news_num=${news.news_num}" class="btn btn-secondary">수정</a>
			<a href="${pageContext.request.contextPath}/news/newsDelete.do?news_num=${news.news_num}" class="btn btn-danger">삭제</a>
			<a href="${pageContext.request.contextPath}/news/newsList.do" class="btn btn-info">목록</a>
		</div>
	</div>
	</c:if>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
</html>