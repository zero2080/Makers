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
<link href="${conPath}/css/emp.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type='text/css'>
/* /* body {
	margin: 0;
	z-index: 0;
}

#slidebox {
	position: relative;
	width: 70%;
	height: 100%;
	overflow: hidden;
	white-space: nowrap;
	vertical-align: middle;
	position: absolute;
	top: 0;
	left: 0;
	display: inline-block;
	vertical-align: middle;
	float: left;
}

#slidebox_right {
	position: relative;
	width: 30%;
	height: 100%;
	overflow: hidden;
	white-space: nowrap;
	vertical-align: middle;
	display: inline-block;
	vertical-align: middle;
	float: right;
}

#slidebox_right ul li {
	width: 50%;
	height: 150px;
	float: left;
}



#slidebox ul#slider {
	list-style: none;
	margin: 0;
	padding: 0;
}

#slidebox ul li {
	position: absolute;
	width: 100%;
	height: 100%;
}

#slidebox ul li img {
	width: 100%;
	height: 100%;
}
#slider li {background-size:cover; background-position:center;}



* {
	margin: 0;
	padding: 0;
}


#slideall {
	width: 70%;
	height: 700px;
}

#slidebox {
	width: 70%;
	height: 100%;
}

#slidebox_right {
	width: 30%;
	height: 100%;
	float:left;
}

#slidebox_right ul {
	width: 100%;
	height: 100%;
}

#slidebox_right ul li{
	width: 50%;
	height: 50%;
}




 */ */

</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div id="slideall" style=" width: 100%; height: 800px;">
	
	
		<div id="slidebox" style=" width: 70%; height: 100%;">
			<ul id="slider" style=" width: 100%; height: 100%;">
				<li style="background-image: url('teamIMG/반지1.jpg');"></li>
				<li style="background-image: url('teamIMG/반지2.jpg');"></li>
				<li style="background-image: url('teamIMG/반지3.jpg');"></li>
				<li style="background-image: url('teamIMG/반지4.jpg');"></li>
			</ul>
		</div>
		
		<div id="slidebox_right" style=" width: 30%; height: 100;">>
			<ul id="slider_right_mini">
				<li style="background-image: url('teamIMG/반지1.jpg');"></li>
				<li style="background-image: url('teamIMG/반지2.jpg');"></li>
				<li style="background-image: url('teamIMG/반지3.jpg');"></li>
				<li style="background-image: url('teamIMG/반지4.jpg');"></li>
			</ul>
		</div>
	
	</div>
	<script type='text/javascript'>
		var x = 100;
		var slider = document.getElementById("slider");
		var slideArray = slider.getElementsByTagName("li");
		var slideMax = slideArray.length - 1;
		var curSlideNo = 0;

		for (i = 0; i <= slideMax; i++) {
			if (i == curSlideNo)
				slideArray[i].style.left = 0;
			else
				slideArray[i].style.left = -x + "%";
		}

		slider.addEventListener('click', function() {
			changeSlide();
		}, false);

		var aniStart = false;
		var next = 1;
		var changeSlide = function() {
			if (aniStart === true)
				return;
			next = curSlideNo + 1;
			if (next > slideMax)
				next = 0;
			aniStart = true;
			sliding();
		}

		function sliding() {
			var curX = parseInt(slideArray[curSlideNo].style.left, 10);
			var nextX = parseInt(slideArray[next].style.left, 10);
			var newCurX = curX + 1;
			var newNextX = nextX + 1;
			if (newCurX >= x) {
				slideArray[curSlideNo].style.left = -x + "%";
				slideArray[next].style.left = 0;
				curSlideNo = curSlideNo + 1;
				if (curSlideNo > slideMax)
					curSlideNo = 0;
				aniStart = false;
				return;
			}
			slideArray[curSlideNo].style.left = newCurX + "%";
			slideArray[next].style.left = newNextX + "%";
			setTimeout(function() {
				sliding();
			}, 20);
		}
		setInterval(changeSlide, 3600);
	</script>
</body>
</html>