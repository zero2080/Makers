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
<link href="${conPath}/css/footer.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<footer>
		<div id="ftlogo">

			<img src="${conPath}/icon/box.png" style="height: 50%; margin-left: 70%;">

		</div>
		
		<div id="ftcontent">
			<ul>
				<li>Makers</li>
				<li>대표자 : 오범수</li>
				<li>서울특별시 종로구 삼일대로 17길 51 스타골드빌딩</li>
				<li>TEL : 010-5338-5313</li>
				<li>Copyright© 2019 Makers. All rights reserved.</li>
			</ul>
		</div>
	</footer>
 
</body>
</html>