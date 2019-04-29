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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${conPath}/css/productlist.css" rel="stylesheet" type="text/css">
<script>
</script>
<style>
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>

	<div class="container productCT">

		<c:if test="${result == 0 }">
			<script>
				alert("실패");
			</script>
		</c:if>
		<c:if test="${not empty result &&result ne 0 }">
			<script>
				alert("성공");
			</script>
		</c:if>
	
		<div id="ProductBoard">
	
			<table class="table">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>수량</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>조회수</th>
					
				</tr>
				<c:if test="${paging.total eq 0 }">
					<tr>
						<td>글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${paging.total ne 0 }">
					<c:forEach items="${pList}" var="list">
						<tr>
							<td>${list.pnum }</td>
							<td>
								<a href="${conPath}/Product/productView.do?pnum=${list.pnum}&pageNum=${paging.currentPage}">${list.ptitle }</a>
							</td>
							<td>${list.pcount}</td>
							<td>${list.mid}</td>
							<td>${list.pcategory}</td>
							<td>${list.preadcount}</td>
						</tr>
	
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="6">
						<button class="frbtn focus" onclick="location.href='${conPath}/Product/productWriteView.do?pageNum=${paging.currentPage }'">글쓰기</button>
					</td>
				</tr>
	
			</table>
		</div>

		
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
			<c:if test="${paging.currentPage ne 1 }">
				<button class="btn btn-default" onclick="location.href='${conPath }/Product/productList.do?pageNum=1'">
					<<
				</button>
			</c:if>
			
			<c:if test="${paging.startPage > paging.blockSize }">
				<button class="btn btn-default" onclick="location.href='${conPath }/Product/productList.do?pageNum=${paging.startPage-1}'">
					이전
				</button>
			</c:if>
			
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			
				<c:if test="${paging.currentPage==i }">
					<button class="btn btn-default">
						${i}
					</button>
				</c:if>
				
				<c:if test="${paging.currentPage!=i }">
					<button class="btn btn-default" onclick="location.href='${conPath}/Product/productList.do?pageNum=${i}'">
						${i}
					</button>
				</c:if>
				
			</c:forEach>

			<c:if test="${paging.endPage<paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/Product/productList.do?pageNum=${paging.endPage+1}'">
					다음
				</button>
			</c:if>
			
			
			<c:if test="${paging.currentPage ne paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/Product/productList.do?pageNum=${paging.pageCnt}'">
					>>
				</button>
			</c:if>

		</div>
		
		
		</div>
	
	</div>
	
</body>
</html>