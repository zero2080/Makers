<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link href="${conPath}/css/boardlist.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	
</script>
<style>
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>

    <div class="container boardCT">
    
		<table class="table">
	
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			
			<c:forEach var="n" items="${ntlist}">
				<tr id="notice">
					<td>${n.fbnum}</td>
					<td>
						<a href="${conPath}/FreeBoard/fbView.do?&fbnum=${n.fbnum}&pageNum=${pageNum}">
							${n.fbtitle}
						</a>
					</td>
					<td>${n.mid}</td>
					<td>${n.fbdate}</td>
					<td>${n.fbreadcount}</td>
				</tr>
			</c:forEach>
	
	
			<c:if test="${paging.total eq 0 }">
				<tr>
					<td>글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${paging.total ne 0 }">
				<c:forEach var="i" items="${fblist}">
					<tr>
						<td>${i.fbnum}</td>
						<td>
							<a href="${conPath}/FreeBoard/fbView.do?&fbnum=${i.fbnum}&pageNum=${pageNum}">${i.fbtitle}</a>
						</td>
						<td>${i.mid}</td>
						<td>${i.fbdate}</td>
						<td>${i.fbreadcount}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<button type="button" onclick="location.href='${conPath}/FreeBoard/fbwriteView.do'" class="frbtn focus">글쓰기</button>


	<!-- ****************************************************************************** -->

		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
				<c:if test="${paging.startPage>paging.blockSize}">
					<button class="btn btn-default" onclick="location.href='${conPath}/FreeBoard/fblist.do?pageNum=${paging.startPage-1}'">
					  	이전
					</button>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<button class="btn btn-default">${i}</button>
					</c:if>
					<c:if test="${paging.currentPage != i }">
						<button class="btn btn-default" onclick="location.href='${conPath }/FreeBoard/fblist.do?pageNum=${i}'">
							${i}
						</button>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<button class="btn btn-default" onclick="location.href='${conPath}/FreeBoard/fblist.do?pageNum=${paging.endPage+1}'">
						다음
					</button>
				</c:if>
			</div>
		</div>
		
		
		
	</div>  <!-- container -->

</body>
</html>