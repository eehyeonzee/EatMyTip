<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인화면</title>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
<!-- container 시작 -->
	<div class="container" style="width:100%">
		<jsp:include page="/WEB-INF/views/main/carousel.jsp"/>
	</div>	
		    <div class="container-fluid">
      <div class="row" style="width :100%">
      <div class="text-center col-md-12 my-5">
      <h3>추천 글</h3>
      <hr>
      <span>다양한 레시피들을 바로 보세요.</span>
      </div>
      </div>
      <div class="row my-5 ml-5 mr-5">
        <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img1.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img2.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img3.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img4.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
                <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img5.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
                <div class="col-2">
          <p>Card</p>
          <div class="card">
            <div class="card-header">
              My Card
            </div>
            <img src="../images/img6.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Lorem</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed sem ut malesuada.</p>
              <a href="#" class="btn btn-primary">More</a>
            </div>
          </div>
        </div>
      </div>
    </div>
<!-- container 끝 -->
</body>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</html>