<%-- 
 작성자 : 오상준
 작성일 : 2021-09-07
 설명 : 모두의 레시피 게시판
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	$(document).ready(function(){
		
		
		$('.box').each(function(){
            var content = $(this).children('.content');
            var content_txt = content.text();
            var content_txt_short = content_txt.substring(0,100)+"...";

            if(content_txt.length >= 50){
                content.html(content_txt_short)
                
            };

            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }
            }
        });
		
	
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
      <div class="row" style="width :100%">
      <div class="text-center col-md-12 my-5">
      <div align="center">
		<h3>모두의 레시피</h3>
	  </div>
		<%-- 로그인이 안되어 있다면 글쓰기 클릭시 로그인 페이지로 이동 --%>
		<c:if test="${ empty mem_num }">
			<div align="right">
				<input type="button" value="글쓰기" id = "btn_write" onclick="location.href='${pageContext.request.contextPath}/member/loginForm.do'">
				<input type="button" value ="목록" onclick="location.href='recipeList.do'">
				<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</c:if>
		<%-- 로그인 되어 있다면 글쓰기 클릭스 글쓰기 폼으로 이동 --%>
		<c:if test="${ !empty mem_num }">
			<div align="right">
				<form action="recipeWriteForm.do">
					<input type="hidden" value="${ mem_num }" name="mem_num">
					<input type="submit" value="글쓰기" id="btn_write">
					<input type="button" value ="목록" onclick="location.href='recipeList.do'">
					<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
				</form>
				
			</div>
		</c:if>
		 <hr>
		 <div align="left">
		 <%-- 검색부분 --%>
		<form action="recipeList.do" method="get" name="search" id="search">
			<input type="hidden" value="${ mem_num }" name="mem_num">
			<input type="search" id="search" name="search">
			<select name="division">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="작성자">작성자</option>
			</select>
			<input type="submit" value="검색">
		</form>
		</div>
	</div>
      </div>
      <div class="tot_count">
      	<p>게시물<span style="font-weight: bold; color: red;">${ count } </span>개</p>
      </div>
      <div class="row my-5 ml-5 mr-5">
      <%-- 등록된 게시물이 없는 경우 --%>
      <c:if test="${ count == 0 }">
      		<div align="center">
      			등록된 게시물이 없습니다.
      		</div>
      </c:if>
      <!-- 카드 부분 -->
      <%-- 게시물이 있는 경우 --%>
        <c:if test="${ count > 0 }">
        <!-- 반복문 시작 -->
        	<c:forEach var="recipe" items="${ list }">
	       	<div class="col-2">
	            No. ${ recipe.board_num }
	          <div class="card">
	            <div class="card-header">
	              ${ recipe.id } 님
	            </div>
	            <%-- 사진파일이 없는 경우 --%>
	            <c:if test="${ empty recipe.filename }">
	            <img src="${pageContext.request.contextPath}/upload/logo.png" alt="" />
	            </c:if>
	            <%-- 사진파일이 있는 경우 --%>
	            <c:if test="${ !empty recipe.filename }">
	            <img src="${pageContext.request.contextPath}/upload/${ recipe.filename }" alt="" />
	            </c:if>
	            <div class="card-body">
	              <h5 class="card-title">${ recipe.title }</h5>
		           <div class="box">   
		              <div class="content">
		              		<p class="card-text">${ recipe.content }</p>
		              </div>
		           </div>
		           <br>
	              <a href="recipeDetail.do?board_num=${ recipe.board_num }" class="btn btn-primary">더보기</a>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
	    <!-- 반복문 끝 -->
        </c:if>
      </div>
	        <div align="center">
	        	${ pagingHtml }
	        </div>
	        <hr>
    </div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>