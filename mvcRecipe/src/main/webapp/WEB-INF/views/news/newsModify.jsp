<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 7. 오후 8:27:27
 * 3. 작성자 : ASUS
 * 4. 설명 : 뉴스 수정 후 결과창
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
	<div class="container ">
		<div class="row">
			<div class="col"><h1>수정 완료 되었습니다.</h1></div>
			<hr>
		</div>
		<div class="row">
			<div class="col"><h4>목록으로 돌아갑니다.</h4></div>
		</div>
		<div class="row">
			<div class="col"><a href="${pageContext.request.contextPath}/news/newsList.do" class="btn btn-info" role="button">목록으로</a></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>