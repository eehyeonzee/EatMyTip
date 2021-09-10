<%--
/**
 * 1. 프로젝트명 : 잇마이레시피
 * 2. 작성일 : 2021. 9. 6. 오후 4:05:01
 * 3. 작성자 : ASUS
 * 4. 설명 : 공지사항의 상세 화면 입니다.
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="../js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript" src = "../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript">
	$(document).ready(function(){
		var currentPage;
		var count;
		var rowCount;
		//댓글 등록
		$('#news_comment_form').submit(function(){
			if($('#re_content').val() == ''){
				alert('내용을 입력하세요!');
				$('#re_content').val('').focus();
				return false;
			}
			
			var form_data = $(this).serialize();
			
			$.ajax({
				type:'post',
				data:form_data,
				url:'newsComments.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param) {
					if(param.result == 'logout') {
						alert('로그인해야 작성할 수 있습니다.');
						
					}else if(param.result == 'success') {
						// 폼 초기화
						initForm();
						// 댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지의 게시글을 다시 호출함
						selectData(1);
						
					}else {
						alert('등록시 오류 발생');
					}
				},
				
				error: function() {
					alert(' 등록시 네트워크 오류!')
				}
			}); // end of ajax
			
			// 기본 이벤트 제거*****
			event.preventDefault();
		});
		
		// 댓글 작성 폼 초기화
		function initForm() {
			$('textarea').val(''); // # 있으면 안 됨
			$('#re_first .letter-count').text('300/300'); // 글자수 초기화
		}
		
		// textarea에 내용 입력시 글자수 체크
		$(document).on('keyup','textarea',function() {
			// 입력한 글자 구함
			var inputLength = $(this).val().length;
			
			if(inputLength > 300) { // 300자를 넘어선 경우
				$(this).val($(this).val().subString(0,300));
			
			}else { // 300자 이하인 경우
				var remain = 300 - inputLength;
				remain += '/300';
				if($(this).attr('id') == 're_content') {
					// 등록폼 글자수 체크
					$('#re_first .letter-count').text(remain); // 후손 선택자
				
				}else {
					// 수정폼 글자수
					$('#mre_first .letter-count').text(remain);
				}
			}
		});
		//댓글 목록
		function selectData(pageNum){
			currentPage = pageNum;
			
			if(pageNum == 1){
				//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
				$('#output').empty();
			}
			
			//로딩이미지 노출
		$('#loading').show();
		
		$.ajax({
			type:'post',
			data:{pageNum:pageNum,news_num:$('#news_num').val()},
			url:'newsCommentsList.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				//댓글 불러오기 성공하면 로딩 이미지 감춰줌
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				
				$(param.list).each(function(index,item){
					var output = '<div class="item">'
					output += '<span style="font-size:14pt;">' + item.name + '<span>';
					output += '<div class="sub-item">';
					output += '<p>' + item.comm_con + '</p>';
					output += '<span>'+item.comm_date+'</span>';
					//작성자인지 멤버넘버 확인 그런데, auth도 받아서 관리자면 삭제가능하게하자
					if($('#mem_num').val() == item.mem_num){
						output += ' <input type="button" data-renum="'+item.comm_num+'" data-memnum="'+item.mem_num+'" value="수정" class="modify-btn">';
						output += ' <input type="button" data-renum="'+item.comm_num+'" data-memnum="'+item.mem_num+'" value="삭제" class="delete-btn">';
					}
					output += '<hr size="1" noshade width="100%">';
					output += '</div>';
					output += '</div>';
					
					$('#output').append(output);
				});
				//페이지 버튼 처리함
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				alert('리스트 뽑기 네트워크 오류 발생');
			}
		});
	}
		
		//페이지 처리 이벤트 연결(다음 댓글 보기 버튼 클릭시 데이터 추가)
		$('.paging-button input').click(function(){
			selectData(currentPage + 1);
		});
		selectData(1);
	});
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<div class="container mt-5">
	<div class="row">
		<div class="text-center">
			<h3>게시판 글 상세</h3>
		</div>
	</div>
	<div class="row mt-2">
		<div class="col">
			<span>글 제목: ${news.news_title}</span>
		</div>
		<div class="col">
			<span>카테고리: ${news.news_category}</span>
		</div>
	</div>
	<div class="row mt-2">
		<div class="col">
			<span>조회수: ${news.news_hits}</span>
		</div>
		<div class="col">
			<span>작성자: ${news.name}</span>
		</div>
		<div class="col">
			<span>작성일: ${news.news_date}</span>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<span class="text-justify">내용:</span>
			<span>${news.news_content}</span>
		</div>
	</div>
		<c:if test="${!empty news.news_file}">
		<div class="row">
			<div class="col">
				<img src="${pageContext.request.contextPath}/upload/${news.news_file}" class="detail-img">
			</div>
		</div>
		</c:if>
	<c:if test="${auth==3}">
	<div class="row mt-5">
		<div class="col mb-5">
			<a href="${pageContext.request.contextPath}/news/newsModifyForm.do?news_num=${news.news_num}" class="btn btn-secondary">수정</a>
			<a href="${pageContext.request.contextPath}/news/newsDelete.do?news_num=${news.news_num}" class="btn btn-danger">삭제</a>
			<a href="${pageContext.request.contextPath}/news/newsList.do" class="btn btn-info">목록</a>
		</div>
	</div>
	</c:if>
	
	<div>
		<span>댓글달기</span>
		<form id="news_comment_form">
			<input type="hidden" name="news_num" value="${news.news_num}" id="news_num">
			<input type="hidden" name="mem_num" value="${news.mem_num}" id="mem_num">
			<input type="hidden" name="auth" value="${auth}" id="auth">
			<div class="form-group">
			<textarea rows="3" cols="50" name="re_content" id="re_content" class="rep-content"
			<c:if test="${empty mem_num}">disabled="disabled"</c:if>
			><c:if test="${empty mem_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty mem_num}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second">
				<input type="submit" value="전송">
			</div>
			</c:if>
			</div>
		</form>
	</div>
		<!-- 댓글 목록 출력 시작 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/ajax-loader.gif">
	</div>
</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>