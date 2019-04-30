<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${conPath }/js/html2canvas/jquery.plugin.html2canvas.js"></script>
<script src="${conPath }/js/html2canvas/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script>
$(document).ready(function() {
	$(function() {
	    var debug = $('#debug');
	    var sx, sy, dx, dy, ix, iy;
	    var dragging = false;
	    
	    $(document).on("mouseup",".moveObj", function () {
	    	if($(this).attr('id') != 'moveObj'){
	    		$(this).attr('id','moveObj');
	    	
	    	}else{
	    		 $(this).removeAttr('id');
	    	
	    	}
		})
		$(document).on('mousedown','#moveObj',function(e) {
	    	
		      e.preventDefault();
		      sx = e.pageX;
		      sy = e.pageY;
		      ix = $(this).offset().left;
		      iy = $(this).offset().top;
		      dx=dy=0;
		      dragging = true;
		      console.log("mousedown - s:",sx,sy,"/i:",ix,iy);
		    });
		 
	    $(document).on('mousemove','#moveObj', function(e) {
		      if(dragging) {
		        dx = e.pageX - sx;
		        dy = e.pageY - sy;
		        $(this).offset({left: ix+dx, top: iy+dy});
		        /* $(debug).text(dx + "," + dy); */
		      }
		    }).on('mouseup','#moveObj', function(e){
		      if(dragging) {
		        dx = e.pageX - sx;
		        dy = e.pageY - sy;
		        $(this).offset({left: ix+dx, top: iy+dy});
		        dragging = false;
		        $(this).removeAttr('id');
		        console.log("mouseup - d:",dx,dy,"/i:",ix,iy);
		      }

		    });
		  });
	
	var element = $("#test"); // global variable

	var getCanvas; // global variable

	var image;		//생성된 이미지의 base64바이너리 코드가 담길 변수
	  $("#btn1").on('click', function () {
			
	    	html2canvas(element, {
	         	onrendered: function (canvas) {
	         		if(typeof FlashCanvas != "undefined"){
	         			FlashCanvas.initElement(canvas);
	         		}
	         		image = canvas.toDataURL("image/png");
	         		
	               /*  $("#testImg").append(canvas);
	                getCanvas = canvas; */
	               
	                canvas.toBlob(function(blob){
	                	saveAs(blob,'imageEditResult.png');
	                });
	             }
	         });
	    });
	    
	    $("#tempUp").on('click', function () {
		    var imgageData = getCanvas.toDataURL("image/png",1);
		    var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
		    parent.imageEditResult(newData);
		    /* $("#btn-Convert-Html2Image").attr("download", "your_pic_name.png").attr("href", newData); */
			});
		});

	 function btn1(){
		 $('#btn1').click();
	 }

	 function tempUp(){
		 $('#tempUp').click();
	 }
	 
	 function addParts(){
		$('#test').find('ul').append('<li><img src="${conPath}/mOrderItem/1x1.3.jpg" style="position:relative;" class="moveObj"></li>')
	 }
</script>
<Style> 
.drag 
{ 
	CURSOR: hand; POSITION: relative 
} 
#moveObj{
	border: 1px solid red;
	z-index: 100;
}
</Style> 
</head>
<body>
<div style="width:600px; height:450px; margin-left:80px;">
	<div  id="test" style="display:block; width:450px;height:450px;" class="text-center">
		<img src = "${conPath }/mOrderItem/1.1x1.6.png" style="margin:0 150px">
		<ul style="position:absolute; top:450px;list-style:none;">
			<li style="display:inline-block;"><img src="${conPath }/mOrderItem/10mm-오링실버.png"style="position:relative;" class="moveObj" ></li>
			<li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.9.png" style="position:relative;" class="moveObj"></li> <!-- 동적으로 추가 -->
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.3x2.2.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/0.7X1.5.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.2-.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.2-1.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.2-2.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.3x2.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.5x1.8.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.6.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.6x1.8.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/1.65x2.3.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/2.4x1.9.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/2.6x2.9.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/3.3.png"  style="position:relative;" class="moveObj"></li>
		    <li style="display:inline-block;"><img src="${conPath }/mOrderItem/3.6.png"  style="position:relative;" class="moveObj"></li>
	    </ul>
	</div>
</div>
<div style="display:none;">
<button id="btn1">버튼1</button><button id="tempUp" >이미지다운</button><button id="addParts">부품추가</button>
   <a id="btn-Convert-Html2Image">image</a>
</div>
<div id="testImg"></div>
</body>
</html>