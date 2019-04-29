<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${conPath }/js/ulslider/jquery.ulslide.js"></script>
<script>
	$(window).ready(function() {
		$(document).ready(function() {
			var winWidth = document.body.clientWidth;
			$(function() {
				$('#banner').ulslide({
					statusbar : true,
					direction : 'x',
					width : 1000,
					height : 415,
					effect : {

						type : 'slide', //type: 'crossfade' ==> slide, fade, crossfade, rotate, scale, carousel,flip3D, cube3D
						distance : 0
					},
					mousewheel : true,
					affect : 'slide',
					axis : 'x',
					navigator : '#banner_bt a',
					duration : 300,
					autoslide : 3000
				});
			});

		});

	});
</script>
<style>
#bannerWrap {
	position: relative;
	width: 1500px;
	border: 1px solid green;
	display: inline-block;
	margin: 0 auto;
}

#banner {
	float: left;
	margin: 0 auto;
}

#banner img {
	height: 415px;
	width: 100%;
}

#banner_bt {
	list-style-type: none;
	bottom: 5px;
	left: 5px;
	overflow: hidden;
	border: 1px solid red;
	right: 10px;
	position: relative;
	top: 0;
	float: right;
	width: 450px;
	height: 100%;
}

#banner_bt li {
	float: left;
	padding: 3px 6px;
	margin-right: 5px;
	width: 200px;
	height: 200px;
}

#banner_bt li img {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

a, a:hover, a:visited {
	text-decoration: none;
}

.long {
	
}
</style>
</head>
<body>
	<div id="bannerWrap">


		<div id="banner">

			<li><a href=""><img src="${conPath }/teamIMG/반지1.jpg"/></a>
			</li>
			<li><a href=""><img src="${conPath }/teamIMG/반지2.jpg"/></a>
			</li>
			<li><a href=""><img src="${conPath }/teamIMG/반지3.jpg"/></a>
			</li>
			<li><a href=""><img src="${conPath }/teamIMG/반지4.jpg"/></a></li>

		</div>
		<div id="banner_bt">

			<li><a href="#1"><img alt="1" src="${conPath }/teamIMG/반지1.jpg"></a></li>
			<li><a href="#2"><img alt="2" src="${conPath }/teamIMG/반지2.jpg"></a></li>
			<li><a href="#3"><img alt="3" src="${conPath }/teamIMG/반지3.jpg"></a></li>
			<li><a href="#3"><img alt="4" src="${conPath }/teamIMG/반지4.jpg"></a></li>

		</div>



	</div>

</body>
</html>