<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 9. 7.
 * 작성자 : 오상준
 * 설명 : 레시피 상세 페이지.
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>모두의 레시피</title>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
	<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
		<c:if test="${ mem_num == recipe.mem_num }">
			<input type="button" value= "수정" onclick="location.href='#'">
			<input type="button" value= "삭제" id="delete_btn">
			<script type="text/javascript">
				var delete_btn = document.getElementById("delete_btn");
				// 이벤트 연결
				delete_btn.onclick=function(){
					var choice = confirm("삭제하시겠습니까?");
					if(choice){
						location.replace("#");
					}
				};
			</script>
		</c:if>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>