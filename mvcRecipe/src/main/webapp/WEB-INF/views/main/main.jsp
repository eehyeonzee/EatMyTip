<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
	<!-- 캐러셀 -->
	<div class="container-fluid mt-5 mb-5">
		<jsp:include page="/WEB-INF/views/main/carousel.jsp" />
	</div>
	<!-- 공지 - 레시피 -->
	<div class="container-fluid">
		<div class="row" style="width: 100%">
			<div class="text-center col-md-6 my-5 mt-5">
				<a class=" btn btn-light btn-lg" href="../news/newsList.do">공지사항&이벤트</a>
				<hr style="width:80%">
				<span> 공지사항 </span>
				<table class="table mt-5">
					<thead>
						<tr>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
						<tr>
							<td>테스트</td>
							<td>테스트</td>
							<td>테스트</td>
						</tr>
				</table>
			</div>
			<div class="text-center col-md-6 my-5">
				<a class=" btn btn-light btn-lg" href="${pageContext.request.contextPath}/recipe/recipeList.do">신규레시피</a>
				<hr style="width:80%">
				<span> 레시피게시판</span>
				<div class="row mt-5">
					<div class="col-4">
						<div class="card">
							<div class="card-header">작성자</div>
							<img src="../images/img1.jpg" alt="" />
							<div class="card-body">
								<p class="card-text">제목</p>
								<a href="#" class="btn btn-primary">More</a>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-header">작성자</div>
							<img src="../images/img1.jpg" alt="" />
							<div class="card-body">
								<p class="card-text">제목</p>
								<a href="#" class="btn btn-primary">More</a>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-header">작성자</div>
							<img src="../images/img1.jpg" alt="" />
							<div class="card-body">
								<p class="card-text">제목</p>
								<a href="#" class="btn btn-primary">More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row" style="width: 100%">
			<div class="text-center col-md-12 mt-1 mb-5">
				<a class=" btn btn-light btn-lg" href="${pageContext.request.contextPath}/bestRecipe/bestRecipeList.do">베스트 레시피</a>
				<hr>
				<span> 많은 사용자에게 추천을 많이 받은 레시피</span>
			</div>
		</div>
		<div class="row mb-5 ml-5 mr-5">
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img1.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img2.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img3.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img4.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img5.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
					<div class="card-header">작성자</div>
					<img src="../images/img6.jpg" alt="" />
					<div class="card-body">
						<p class="card-text">제목</p>
						<a href="#" class="btn btn-primary">More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid mt-5 pt-3 mb-5 pb-3">
			<div class="row" style="width: 100%">
			<div class="text-center col-md-12">
				<a class=" btn btn-light btn-lg" href="${pageContext.request.contextPath}/news/newsList.do">이벤트</a>
				<hr>
			</div>
	</div>
	<div class="row">
		<div class="col-4"><img src="../images/event_sm1.png"></div>
		<div class="col-4"><img src="../images/event_sm2.png"></div>
		<div class="col-4"><img src="../images/event_sm3.png"></div>
	</div>
	</div>
	<!-- container 끝 -->
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</html>