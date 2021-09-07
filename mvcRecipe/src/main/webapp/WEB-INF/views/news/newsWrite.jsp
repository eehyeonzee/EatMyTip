<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 7:11:56
 * 3. 작성자 : ASUS
 * 4. 설명 : NewsWriteAction이 불러옴. 
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
<title>페이지명</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
	<div class="container ">
		<div class="row">
			<div class="col"><h1>작성 완료 되었습니다.</h1></div>
			<hr>
		</div>
		<div class="row">
			<div class="col"><h4>목록으로 돌아갑니다.</h4></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
</html>