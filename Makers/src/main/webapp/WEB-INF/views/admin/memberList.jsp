<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/memberList.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<table>
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>포인트</td>
			<td>이미지</td>
			<td>닉네임</td>
			<td>은행</td>
			<td>계좌번호</td>
			<td>계좌명</td>
			<td>가입일</td>
			<td>상태</td>
		</tr>
		<c:forEach var="ml" items="${memberList }">
			<tr>
				<td>${ml.mid }</td>
				<td>${ml.mpw }</td>
				<td>${ml.maddr }</td>
				<td>${ml.mphone }</td>
				<td>${ml.mpoint }</td>
				<td><img src="${conPath}/memberImg/${ml.mimg }" alt="${ml.mimg }"></td>
				<td>${ml.mname }</td>
				<td>${ml.mbank }</td>
				<td>${ml.maccount }</td>
				<td>${ml.macname }</td>
				<td>${ml.mdate }</td>
				<td>${ml.mstatus }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>