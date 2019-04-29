<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.ckeditor.com/4.8.0/full/ckeditor.js"></script>
<script>
var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
var mrtimelimit = '';
var mrenddate = '';
	$(document).ready(function(){
			
		CKEDITOR.replace('mrcontent',{
			filebrowserUploadUrl : "${conPath}/imageUpload.do",
			width:'100%',
			height:'600px',
		});
			
		$('#mrenddate').datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 1,
			maxDate : '+2M',
			showMonthAfterYear: true,
			dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	        nextText: '다음 달',
	        prevText: '이전 달'
		});
		
		$('#mrtimelimit').datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 1,
			showMonthAfterYear: true,
			dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	        nextText: '다음 달',
	        prevText: '이전 달'
		});
	});
	function sumOne(){
		imageEditor.btn1();
	}
	function downImg(){
		imageEditor.tempUp();
	}
	function addParts(){
		imageEditor.addParts();
	}
	function imageEditResult(newData){
		$("").attr("download", "your_pic_name.png").attr("href", newData);
	}
	setInterval(function() {
		if(${empty mem}){
			alert('로그아웃되었습니다.');
			history.back();
		}
	}, 3000);
</script>
</head>
<body>
	<header><jsp:include page="../main/header.jsp"/></header>
	<c:if test="${empty mem }">
		<script>
			alert('로그인 후 이용 가능합니다.');
			history.back();
		</script>
	</c:if>
	<section>
		<div class="container">
			<form action="${conPath }/mOrderWrite.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<caption class="text-center"><strong style="font-size:2em;">Make Order</strong></caption>
					<tr>
						<th class="text-center">Product Editor</th>
						<th class="text-center">Product Information</th>
					</tr>
					<tr>
						<td rowspan="10">
							<iframe src="${conPath }/imageEditor.do" id="imageEditor" name="imageEditor" frameborder="0" width="700" height="500" ></iframe>
						</td>
						<th>Writer</th>
					</tr>
					<tr>
						<td>${mem.mid }<input type="hidden" name="mid" value="${mem.mid }"></td>
					</tr>
					<tr>
						<th>imageEditor</th>
					</tr>
					<tr>
						<td>
							<input type="button" class="btn btn-primary" value="저장" onclick="sumOne()">
						</td>
					</tr>
					<tr>
						<th>경매 종료일</th>
					</tr>
					<tr>
						<td><input type="text" class="form-control" name="mrenddate" id="mrenddate" required="required" autocomplete="off" ></td>
					</tr>
					<tr>
						<th>납품기한</th>
					</tr>
					<tr>
						<td><input type="text" class="form-control" name="mrtimelimit" id="mrtimelimit" required="required" autocomplete="off" ></td>
					</tr>
					<tr>
						<th>첨부이미지</th>
					</tr>
					<tr>
						<td><input type="file" name="tmpMrimg" id="tempMrimg"></td>
					</tr>
					<tr>
						<td colspan="2">
							<strong><input type="text" class="form-control"  name="mrtitle" required="required" placeholder="Order Title" style="text-align:center;font-size:1.5em;" ></strong>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="mrcontent" id="mrcontent">
							
							</textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>