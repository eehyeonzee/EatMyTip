<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 9. 9.
 * 작성자 : 박용복
 * 설명 : 비밀번호 찾기 후 비밀번호 수정 완료
 * 수정일 : 2021. 9. 9.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>비밀번호 수정 완료!</title>
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp" />
<div class = "">
	비밀번호가 수정 완료 되었습니다!
</div>
<jsp:include page = "/WEB-INF/views/common/footer.jsp" />
</body>
</html>