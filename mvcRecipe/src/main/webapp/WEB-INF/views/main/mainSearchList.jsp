<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 14. 오전 12:24:59
 * 3. 작성자 : ASUS
 * 4. 설명 : 
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
	<!-- 본문 -->
	<!-- 공지사항 검색 시작 -->
	<div class="container-fluid" style="width: 90%;">
		<div class="row" style="width: 100%">
			<div class="container text-center mt-5">
				<div align="left">
					<h3>공지사항</h3>
				</div>
				<div align="left">
					<br> 게시물 <span style="font-weight: bold; color: red;">${ news_count }</span>개
				</div>
			</div>
			<hr size="2" noshade width="85%">
			<br>
			<!-- 테이블 시작 -->
			<c:if test="${news_count == 0}">
				<div class="container mt-5">
					<h3>등록된 게시물이 없습니다.</h3>
				</div>
			</c:if>
			<c:if test="${news_count > 0 }">
				<table class="table">
					<thead>
						<tr>
							<td>no</td>
							<td>카테고리</td>
							<td>제목</td>
							<td>작성자</td>
							<td>조회수</td>
							<td>작성일</td>
						</tr>
						<c:forEach var="news" items="${NewsList}">
							<tr>
								<td>${news.news_num}</td>
								<td>${news.news_category}</td>
								<td><a href="newsDetail.do?news_num=${news.news_num}">${news.news_title}</a></td>
								<td><img
									src="${pageContext.request.contextPath}/images/crown.gif"
									style="height: 25px; width: 30;" />${news.id}</td>
								<td>${news.news_hits}</td>
								<td>${news.news_modi}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
				<div class="row">
					<br>
					<div align="center">${pagingHtmlNews}</div>
				</div>
			</c:if>
			<br>
			<br>
		</div>
	</div>
	<!-- 공지사항 검색 끝 -->
	<!-- 레시피 검색 시작 -->
	<div class="container-fluid" style="width: 90%;">
		<div class="row" style="width: 100%;">
		      <div class="text-center col-md-12 my-5">
		
			<div align="left">
				<h3>모두의 레시피</h3>
			</div>
			<div align="left">
				<br> 
				게시물 <span style="font-weight: bold; color: red;">${ recipe_count }</span>개
			</div>
			<hr size="2" noshade width="100%">
		</div>
		</div>
		<%-- 카드시작 --%>
		<div class="row my-5 ml-5 mr-5">
			<%-- 등록된 게시물이 없는 경우 --%>
			<c:if test="${ recipe_count == 0 }">
				<div align="center">등록된 게시물이 없습니다.</div>
			</c:if>
			<!-- 카드 부분 -->
			<%-- 게시물이 있는 경우 --%>
			<c:if test="${ recipe_count > 0 }">
				<!-- 반복문 시작 -->
				<c:forEach var="recipe" items="${ recipeList }">
					<div class="col-3">
						<b>No. ${ recipe.board_num }</b> <span
							style="float: right; font-size: 14px;"> 조회 ${ recipe.hits }
						</span>
						<div class="card" style="height: 540px;">
							<div class="card-header">
								${ recipe.id } 님 <span style="float: right;"> 추천 <b
									style="color: red;">${ recipe.recom_count }</b>
								</span>
							</div>
							<%-- 사진파일이 없는 경우 --%>
							<c:if test="${ empty recipe.filename }">
								<img src="${pageContext.request.contextPath}/images/basic.png"
									style="height: 270px;" />
							</c:if>
							<%-- 사진파일이 있는 경우 --%>
							<c:if test="${ !empty recipe.filename }">
								<img
									src="${pageContext.request.contextPath}/upload/${ recipe.filename }"
									style="height: 270px;" />
							</c:if>
							<div class="card-body">
								<h5 class="card-title">
									<a href="recipeDetail.do?board_num=${ recipe.board_num }"
										class="btn btn-outline-dark">${ recipe.title }</a>
								</h5>
								<div class="box">
									<div class="content">
										<p class="card-text">${ recipe.sub_content }</p>
									</div>
								</div>
								<br>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 반복문 끝 -->
			</c:if>
			<!-- 카드끝 -->
		</div>
		<div align="center">${ pagingHtmlRecipe }</div>
	</div>
	<hr>
	<hr>
	<hr>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>