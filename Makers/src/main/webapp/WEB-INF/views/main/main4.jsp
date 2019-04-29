<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.carousel-indicators li:first-child {
	background-image: url(teamIMG/반지1.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}

.carousel-indicators li:nth-child(2) {
	background-image: url(teamIMG/반지2.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}

.carousel-indicators li:nth-child(3) {
	background-image: url(teamIMG/반지3.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}


.carousel-indicators li:last-child {
	background-image: url(teamIMG/반지4.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}




.item:first-child {
	background-image: url(teamIMG/반지1.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}

.item:nth-child(2) {
	background-image: url(teamIMG/반지2.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}

.item:nth-child(3) {
	background-image: url(teamIMG/반지3.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}


.item:last-child {
	background-image: url(teamIMG/반지4.jpg);
	background-size : cover;
	width: 200px;
	height: 200px;
}







.item {
	width: 100%;
	height: 100%;
}

.carousel-inner {
	width: 100px;
	height: 80px;
}



</style>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>

<body>


	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
		
		<!--페이지-->
		<div id="mini_slide_box">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
		</div>
		<!--페이지-->

		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active">
				<!-- <img src="teamIMG/반지1.jpg"> -->
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 1</h1>
						<p>텍스트 1</p>
					</div>
				</div>
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<!-- <img src="teamIMG/반지2.jpg"> -->
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 2</h1>
						<p>텍스트 2</p>
					</div>
				</div>
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<!-- <img src="teamIMG/반지3.jpg"> -->
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 3</h1>
						<p>텍스트 3</p>
					</div>
				</div>
			</div>
			<!--슬라이드3-->
			
			
			<!--슬라이드4-->
			<div class="item">
				<!-- <img src="teamIMG/반지4.jpg"> -->
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 4</h1>
						<p>텍스트 4</p>
					</div>
				</div>
			</div>
			<!--슬라이드4-->
			
			
		</div>
		

		<!--이전, 다음 버튼-->
		<!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a> 
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a> -->
	</div>


</body>
</html>