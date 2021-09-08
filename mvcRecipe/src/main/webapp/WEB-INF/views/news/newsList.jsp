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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
<!-- 공지사항 상단 -->
	<div class="container ">
		<div class="row">
			<div class="col">
				<h1>공지사항</h1>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col">
				<h4>잇마이 레시피의 공지사항입니다.</h4>
			</div>
		</div>
	</div>
<!-- 공지사항에 게시글이 없을 경우 없다는 표시 -->
	<c:if test="${count == 0}">
		<div class="container">
			<h3>등록된 게시물이 없습니다.</h3>
		</div>
	</c:if>
<!-- 공지사항에 게시글이 있을 경우 리스트를 출력 -->
	<c:if test="${count > 0}">
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<td>no</td>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
						<td>수정일</td>
					</tr>
					<c:forEach var="news" items="${list}">
						<tr>
							<td>${news.news_num}</td>
							<td><a href="newsDetail.do?news_num=${news.news_num}">${news.news_title}</a></td>
							<td>${news.name}</td>
							<td>${news.news_hits}</td>
							<td>${news.news_modi}</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</div>
	</c:if>
<!-- 관리자일 경우 공지사항 글 작성 버튼 보이게 -->
	<c:if test="${auth==3}">
	<div class="container">
		<div class="row">
			<div class="col-sm-10"></div>
			<div class="col-sm-2">
				<a href="${pageContext.request.contextPath}/news/newsForm.do"
					class="btn btn-info" role="button">글작성</a>
			</div>
		</div>
	</div>
	</c:if>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>