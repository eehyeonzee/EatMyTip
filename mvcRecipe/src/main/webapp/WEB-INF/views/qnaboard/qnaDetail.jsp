<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 9. 8.
 * 작성자 : 나윤경
 * 설명 : 고객센터 상세게시판 폼 및 댓글
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 게시판 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="page-main">
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <h2>게시판 글 상세</h2>
   <ul>
		<li>글 번호: ${qnaboard.qna_num} </li>
		<li>글 제목: ${qnaboard.qna_title }</li>
		<li>닉네임:
			<c:if test="${empty mem_num }">${qnaboard.qna_id}</c:if>
			<c:if test="${!empty mem_num }"> ${mem_id }</c:if>
		</li>
   </ul>
   <hr size="1" noshade width="100%">
   <p>
		${qnaboard.qna_content }
   </p>
   <hr size="1" noshade width="100%">
   <div class="align-right">
   		작성일: ${qnaboard.qna_date }
   		<%-- 로그인 한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
   		<c:if test="${mem_num == qnaboard.mem_num }">
   		<input type="button" value="수정" onclick="location.href='qnaModifyForm.do?qna_num=${qnaboard.qna_num}'">
   		<input type="button" value="삭제" id="qnaDelete_btn">
   		<script type="text/javascript">
   			var qnaDelete_btn = document.getElementById('qnaDelete_btn');
   			//이벤트 연결
   			qnaDelete_btn.onclick=function(){
   				var choice = confirm('삭제하시겠습니까?');
   				if(choice){
   					location.replace('qnaDelete.do?qna_num=${qnaboard.qna_num}');
   				}
   			};
   			
   		</script>
   		</c:if>
   		<input type="button" value="목록" onclick="location.href='qnaList.do'">
   </div>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>