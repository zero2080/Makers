<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result eq 0 }">
		<span id="mnameResult">사용 가능한 닉네임 입니다.</span>
	</c:if>
	<c:if test="${result != 0 }">
		<span id="mnameResult">중복된 닉네임 입니다.</span>
	</c:if>
</body>
</html>