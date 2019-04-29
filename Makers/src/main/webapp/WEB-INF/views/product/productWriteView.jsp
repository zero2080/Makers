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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(document).ready(function() {
    $('#summernote').summernote({    
    	width:750,
        height: 600,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote});
	});

    
    $( "#frm" ).submit(function() {
    	if($('input[name=pcount]').val() < 1){
    		alert('재고량을 확인해 주세요');
			return false;
    	}
    	if($('input[name=ptitle]').val().length <2){
   		 alert('제목은 두 글자 이상입니다.');
			return false;
   		}
    	if($('#summernote').summernote('isEmpty')) {
    	    alert('글 내용이 없습니다.');
			return false;
    	 }
    });
});


</script>
   <style>
     #container{
         text-align:center;
     }
     #container .subject{
         width:500px;
     }
     #container .pcount{
		width: 100px; 
   	
   	}
   	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
 	 #container .form-group{
 	 	width: 800px;
 	 	margin: 0 auto;
 	 }
 	  
 	 #container .bf{
 	 	height : 20px;
 	 }
   	#container .submit{

   	margin: 0 auto;
   	}
   
   	#container .submit .button{

   	margin: 0 auto;
   	}
    #file{
    	width: 400px;
    	margin: 0 auto;
    }
    #file input{
    	
    	margin: 10px auto;
    }
    #file .sumNail{
    	border: 1px solid black;
    	width:400px;
    	height:100px;
    }
    </style>
</head>
<body>

    <div id="container">
        <h1 class="page-header">판매등록</h1>
        <hr />
        <form action="${conPath }/Product/productWrite.do" class="form-horizontal" method="post" id="frm" >  
          <input type="hidden" name="mid" value="${mem.mid }"> <!-- 세션mid로 바꿔야함 -->
          <input type="hidden" name="mrnum" value="${mo.mrnum }"> <!-- mrnum받아서 넣어야 -->
            <div class="form-group">
            <select name="pcategory">
            	<option value="목걸이">목걸이</option>
            	<option value="반지">반지</option>
            	<option value="발찌">발찌</option>
            	<option value="기타">기타</option>
            </select>
            <input class="subject" type="text" name="ptitle" placeholder="판매 상품명" required="required">
            <input type="number" class="pcount" name="pcount" placeholder="재고량" readonly="readonly" value="${mo.mrcount }" size=4>
            <input type="number" name="price" placeholder="금액" required="required">원
            <div class="bf">
            </div>
             <div class="col-sm-10">
                    <textarea name="pcontent" id="summernote" class="summernote"></textarea>
                 
              </div>
            </div>
            <div class="submit">
                    <input type="submit" class="btn btn-default" id="submit" value="save">
                    <input type="button" onclick="location.href='${conPath }/Product/productList.do?pageNum=${pageNum }'" class="btn btn-default" value="back">
            </div>

        </form>
    </div>
</body>
</html>