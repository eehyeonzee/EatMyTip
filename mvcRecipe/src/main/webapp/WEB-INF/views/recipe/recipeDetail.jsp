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
					mem_num : ${ mem_num }
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
					mem_num : ${ mem_num }
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
		}); // end of Bookmark
		
		
		// 댓글 기능쪽 자바스크립트
		var currentPage;
		var count;
		var rowCount;
		
		$("#re_form").submit(function(event){	// 폼에 있는 이벤트 제거하기 위해 인자값 넣음
			if($("#re_content").val().trim() == ""){
				alert("내용을 입력하세요!");
				$("#re_content").val("").focus();
				return false;
			}
			
			// form 이하의 태그에 입력한 데이터를 모두 읽어옴
			var form_data = $(this).serialize();
		
		
			// ajax를 통해 댓글 등록 처리
			$.ajax({
					type:"post",
					data:form_data,
					url:"recipeReplyWrite.do",
					dataType:"json",
					cache : false,
					timeout:30000,
					success:function(param){
						if(param.result == "logout"){
							alert("로그인 해야 작성할 수 있습니다.");
						}else if(param.result == "success"){
							// 폼 초기화 함수 호출
							initForm();
							// 댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지의 게시글을 다시 호출함
							selectData(1);
						}else{
							alert("등록시 오류 발생");
						}
					},
					error : function(request,status,error){		// 에러메세지 반환
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			
			// 기본 이벤트 제거하는 부분    이거는 꼭 넣어주어야 한다. 이게 빠지면 서밋이 되버림
			event.preventDefalut();
			
		});	// end of reply
		
		// 댓글 작성 폼 초기화
		function initForm(){
			$("textarea").val("");
			$("#re_first .letter-count").text("300/300");
		}
		
		// textarea에 내용 입력시 글자수 체크
		$(document).on("keyup","textarea",function(){
			 // 입력한 글자 구함
	         var inputLength = $(this).val().length;
	         
	         if(inputLength > 300){   // 300자를 넘어선 경우
	            $(this).val($(this).val().substring(0,300));
	         }else{   // 300자 이하
	            var remain = 300 - inputLength;
	            remain += '/300';
	            if($(this).attr('id') == 're_content'){ 
	               // 등록폼 글자수   후손선택자라 중간에 공백이 있음
	               $('#re_first .letter-count').text(remain);
	            }else{
	               // 수정폼 글자수
	               $('#mre_first .letter-count').text(remain);
	            }
	         }

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
	<%-- 로그인 한 경우에만 버튼 보이도록 함 --%>
	<%-- 추천기능 --%>
	<c:if test="${ !empty mem_num }">
		
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
	<p align="center">
		${ recipe.content }
	</p>
	
	<hr size="2" noshade width="100%">
	<%-- 댓글 목록 출력 시작 --%>
	<div id="output"></div>
	<div class="paging-button" style="display: none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display: none;">
		<img src="${pageContext.request.contextPath }/images/ajax-loader.gif" >
	</div>
	<%-- 댓글 목록 출력 끝 --%>
	<%-- 댓글 시작 --%>
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<div align="center">
		<form id="re_form">
			<input type="hidden" name="board_num" value="${ recipe.board_num }" id="board_num">
			<input type="hidden" name="mem_num" value="${ mem_num }" id="mem_num">
			<textarea name="re_content" id="re_content" class="rep-content"
				<c:if test="${ empty mem_num }">disabled="disabled"</c:if>
			><c:if test="${ empty mem_num }">로그인 해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty mem_num }">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second">
				<input type="submit" value="등록">
			</div>
			</c:if>
		</form>
		</div>
	</div>
	<hr size="2" noshade width="100%">
	<%-- 하단 목록,수정,삭제 --%>
	<input type="button" value="목록" style="color: black; background-color: white; border-color: #d5dfe8" 
			onclick="location.href='recipeList.do'">
	<div style="float: right;">
		<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
		수정일 : ${ recipe.modify_date }
			<c:if test="${ mem_num == recipe.mem_num }">
				<input type="button" value= "수정"  onclick="location.href='recipeModifyForm.do?board_num=${recipe.board_num}'" style="color: black; background-color: white; border-color: #d5dfe8">
				<input type="button" value= "삭제" id="delete_btn" style="color: red; background-color: white; border-color: #d5dfe8">
				<script type="text/javascript">
					var delete_btn = document.getElementById("delete_btn");
					// 이벤트 연결
					delete_btn.onclick=function(){
						var choice = confirm("삭제하시겠습니까?");
						if(choice){
							location.replace("recipeDelete.do?board_num=${recipe.board_num}");
						}
					};
				</script>
			</c:if>
	</div>
	<div style="padding-bottom: 50px;"></div>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>