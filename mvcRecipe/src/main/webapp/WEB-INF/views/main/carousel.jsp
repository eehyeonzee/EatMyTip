<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<div class="container-fluid my-5">
    <div class="carousel slide" data-ride="carousel" id="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide to="0" class="active"></li>
            <li data-target="#carousel" data-slide to="1"></li>
            <li data-target="#carousel" data-slide to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="../images/main1.jpg" >
            </div>
            <div class="item">
                <img src="../images/main2.png" >
            </div>
            <div class="item">
                <img src="../images/main3.png" >
            </div>
        </div>
        <a class="carousel-control left" href="#carousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#carousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>