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
<script type="text/javascript" src="${conPath }/js/ulslider/jquery.ulslide.js"></script>

<script>
var $j = jQuery.noConflict();
$j(function() {
    $j('#box1').ulslide({
         statusbar: true,
         width: 1050,
         height: 590.63,
   		 effect: {
		    type: 'slide',      //type: 'crossfade' ==> slide, fade, crossfade, rotate, scale, carousel,flip3D, cube3D
		    distance: 0 
			 },
       	 axis: 'x',          // x,y,r(렌덤)

	        direction: 'f',     // 방향(앞뒤) f, b
	        duration: 300,
	        autoslide: 4000,
	        mousewheel: true,
	
	        navigator: '#main_bn_bt a',    // 페이지 선택이동
	    
    });

});
</script>
<style>
#wrap1{
	overflow: hidden;
	width: 1600px;
}
#box1{
	float: left;
}
#box1 li img{
	width: 100%;
}
#main_bn_bt{
	overflow: hidden;
	float:right;
	width: 500px;
    padding-top: 40px;
    height: 590px;
}
#main_bn_bt li a img{
	width: 200px;
	height: 200px;
}
#main_bn_bt li{
	float: left;
	margin: 20px;
}
li{
	list-style: none;
}
</style>
</head>
<body>
<div id ="wrap1">
    <div id="box1">
      <li><img src="${conPath }/qnaImg/Warframe0005.jpg" alt="1"  /></li>
     <li><img src="${conPath }/qnaImg/Warframe0006.jpg" alt="2" /></li>
     <li><img src="${conPath }/qnaImg/Warframe0009.jpg" alt="3" /></li>
      <li><img src="${conPath }/qnaImg/Warframe0005.jpg" alt="4" /></li>
    </div>
  <div id="main_bn_bt">
  	<div>
       <li><a href="#1"><img src="${conPath }/qnaImg/Warframe0005.jpg" alt="1" /></a></li>
       <li><a href="#2"><img src="${conPath }/qnaImg/Warframe0006.jpg" alt="2" /></a></li>
    </div>
    <div>
       <li><a href="#3"><img src="${conPath }/qnaImg/Warframe0009.jpg" alt="3" /></a></li>
       <li><a href="#4"><img src="${conPath }/qnaImg/Warframe0005.jpg" alt="4" /></a></li>
     </div>
  </div>
</div>



</body>
</html>