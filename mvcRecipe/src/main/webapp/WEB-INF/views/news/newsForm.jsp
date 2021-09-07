<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 4:04:21
 * 3. 작성자 : ASUS
 * 4. 설명 : 공지사항의 작성 폼 입니다.
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
	<h2>공지사항 쓰기</h2>
	<form id="news_form" action="newsWrite.do" method="post">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title">
		</div>
			<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" rows="20" name="content"></textarea>
		</div>
		  <button type="submit" class="btn btn-primary mb-2">Submit</button>	
	</form>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
</html>