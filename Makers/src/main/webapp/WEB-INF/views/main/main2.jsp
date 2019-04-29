<%@page import="com.tj.makers.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	
	<c:if test="${empty mem}">
		<c:if test="${mstatus eq -1}">
			<div>
				<h1>탈퇴한 아이디(E-Mail)입니다.</h1>
			</div>
		</c:if>
		<div>
			<h1><a href="joinView.do">회원가입</a></h1>
			<h1><a href="loginView.do">로그인</a></h1>
			<jsp:include page="../every/loginView.jsp"/>
		</div>
	</c:if>
	<c:if test="${not empty mem}">
		<h1>로그인 성공</h1>
		<div>
			<h1><a href="myInfoView.do">마이페이지</a></h1>
			<h1><a href="msgListView.do?mid2=${mem.mid }">받은 쪽지함</a></h1>
			<h1><a href="msgListView.do?mid=${mem.mid }">보낸 쪽지함</a></h1>
			<h1><a href="logout.do">로그아웃</a></h1>
		</div>
	</c:if>
	<h1><a href="prcView.do">제품QnA</a></h1>
	<h1><a href="bidList.do?mrnum=1">제작요청페이지(입찰 컴포넌트=1번상품)</a></h1>
	<h1><a href="bidList.do?mrnum=2">제작요청페이지(입찰 컴포넌트=2번상품)</a></h1>
</body>
</html>