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
<script type="text/javascript">
	$(function(){
		//var rec_count = {recipe.recom_count};
		$("#rec_count").text("${recipe.recom_count}");
		// 추천 버튼 클릭시 추천 추가 또는 제거
		$("#rec_btn").click(function(){
			$.ajax({
				url:"recipeRecom.do",		// 보내는 곳 주소
				type:"post",				// 전송 데이터 타입
				data:{						// 보낼 데이터
					board_num : ${ recipe.board_num },
					mem_num : ${ recipe.mem_num }
				},
				dataType:"json",			// 보내는 데이터 타입
				cache:false,
				timeout:30000,
				success:function(param){	// param을 통해 데이터 전송받음
					if(param.duplication == 0){
						$("#rec_count").text(param.count);
						$("#rec_btn").css("background-color", "red");
					}else{
						$("#rec_count").text(param.count);
						$("#rec_btn").css("background-color", "white");
					}
				},
				error : function(request,status,error){		// 에러메세지 반환
					idChecked = 0;
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			})
		}); // end of RecomclickEvent
		
		// 찜버튼 클릭시
		$("#bookmark_btn").click(function(){
			$.ajax({
				url:"recipeBookmark.do",
				type:"post",
				data:{			// 전송할 데이터
					board_num : ${ recipe.board_num },
					mem_num : ${ recipe.mem_num }
				},
				dataType:"json",
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == "addition"){
						$("#bookmark_btn").css("background-color", "yellow");
						alert("레시피가 찜목록에 추가되었습니다.");
					}else{
						$("#bookmark_btn").css("background-color", "white");
						alert("레시피 찜하기가 취소되었습니다. ");
					}
				},
				error : function(request,status,error){		// 에러메세지 반환
					idChecked = 0;
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			})
		});
		
	});
</script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<div class="recipe-detail-main">
	<div class="detail_title">   <!-- 상세 글 머리부분 -->
		<br><h3>No. ${recipe.board_num} [${recipe.category}] ${ recipe.title }</h3>
	</div>
	<hr size="2" noshade width="100%">
	<b>작성자 </b> &nbsp;${ recipe.id } | <b>작성일</b> ${ recipe.report_date } 
	<span style="float: right;">
		<b style="color: red">추천수 : </b> <span id="rec_count"></span>&nbsp;
		<b>조회수 : </b> ${ recipe.hits }
	</span>
	<hr size="2" noshade width="100%">
	<b> IPAdress </b> &nbsp;${ recipe.ip }
	<%-- 추천 및 찜기능 --%> 
	<div class="btn_click">
	<%-- 작성자인 경우에만 버튼 보이도록 함 --%>
	<c:if test="${ mem_num == recipe.mem_num }">
		
			<button id="rec_btn" class="btn btn-outline-danger" 
			style="background-color: <c:if test="${ recommBtnCheck == 0 }">white;</c:if><c:if test="${ recommBtnCheck == 1 }">red;</c:if>">
		    	<span class="badge"><img src="${pageContext.request.contextPath}/images/heart.svg"></span>
			</button>
		
	<%-- 찜기능 --%>	 
		<button id="bookmark_btn" class="btn btn-outline-warning"
		style="background-color: <c:if test="${ bookmarkBtnCheck == 0 }">white;</c:if><c:if test="${ bookmarkBtnCheck == 1 }">yellow;</c:if>">
	    	<span class="badge"><img src="${pageContext.request.contextPath}/images/bookmark.svg"></span>
		</button>
	</c:if>
	</div>
	<br>
	<hr size="2" noshade width="100%">
	<!-- 상세글 내용 -->
		<c:if test="${ !empty recipe.filename }">
		<div class="detail-content">
		<img src="${ pageContext.request.contextPath }/upload/${ recipe.filename }" class="detail-img">
		</div>
	</c:if>
	<p>
		${ recipe.content }
	</p>
	<hr size="2" noshade width="100%">
	<div align="right">
		<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
		수정일 : ${ recipe.modify_date }
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
			<input type="button" value="목록" onclick="location.href='recipeList.do'">
	</div>
	<br>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>