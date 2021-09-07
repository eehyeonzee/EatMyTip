<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 네브바 최 상단 잇마이팁 부분 -->
<nav class="navbar navbar-expand-md justify-content-center" style="background-color: #FFF; padding-top:40px; padding-bottom:0px; margin:0px; position:0;">
  <a href="../main/main.do"><img src="../images/logo.png" height="80px" width="200px"></a>
</nav>
<!-- 회원가입, 로그인, 회원관리 등 두번째 부분 -->
<nav class="navbar navbar-expand-md justify-content-end" style="background-color: #FFF; padding:0px; margin:0px; position:0;">
<c:if test="${empty mem_num}">
  <ul class="navbar-nav mr-5">
    <li class="nav-item mr-5" style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a>
    </li>
    <li class="nav-item"  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/registerMemberForm.do">회원가입</a>
    </li>
  </ul>
</c:if>
<c:if test="${!empty mem_num && auth == 1}">
  <ul class="navbar-nav mr-5">
    <li class="nav-item"  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
    </li>
  </ul>
</c:if>
<c:if test="${!empty mem_num && auth == 2}">
  <ul class="navbar-nav mr-5">
    <li class="nav-item mr-5" style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/myPage.do">마이페이지</a>
    </li>
    <li class="nav-item mr-5"  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="#">내가 쓴 글 보기</a>
    </li>
    <li class="nav-item mr-5"  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="#">북마크</a>
    </li>
    <li class="nav-item"  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
    </li>
  </ul>
</c:if>
<c:if test="${!empty mem_num && auth == 3}">
  <ul class="navbar-nav mr-5">
    <li class="nav-item mr-5" style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="../member/loginForm.do">관리자 정보보기</a>
    </li>
    <li class="nav-item "  style="font-size: 13pt; font-weight: bold;">
      <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
    </li>
  </ul>
</c:if>
</nav>
<!-- 공지사항, 레시피, 베스트레시피, 고객센터 링크 거는 곳 -->
<nav class="navbar navbar-expand-lg justify-content-center" style="background-color: #f76f31; padding:0px;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation" style="user-select: auto;">
    <span class="navbar-toggler-icon" style="user-select: auto;"></span>
  </button>
  <div class="navbar navbar-expand-sm justify-content-center" id="navbarsExample08" style="padding:0px; position:0px; margin:0px;">
    <ul class="navbar-nav">
      <li class="nav-item mx-5" style="padding: 10px; font-size: 17pt; font-weight: bold;">
        <a class="nav-link" href="../news/newsList.do" style="color:black;">공지사항</a>
      </li>
      <li class="nav-item mx-5" style="padding: 10px; font-size: 17pt; font-weight: bold;">
        <a class="nav-link" href="${pageContext.request.contextPath}/recipe/recipeList.do" style="color:black;">모두의 레시피</a>
      </li>
      <li class="nav-item mx-5" style="padding: 10px; font-size: 17pt; font-weight: bold;">
        <a class="nav-link" href="#" style="color:black;">베스트 레시피</a>
      </li>
      <li class="nav-item mx-5" style="padding: 10px; font-size: 17pt; font-weight: bold;">
        <a class="nav-link" href="#" style="color:black;">고객센터</a>
      </li>
    </ul>
  </div>
</nav>
<!-- header 끝 -->