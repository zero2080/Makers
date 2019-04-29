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
<link href="${conPath}/css/boardlist.css" rel="stylesheet" type="text/css">
<script>
	$(window).ready(function() {

	});
	function mySearch() {
		var insert = $('input[name=info]').val();
		var pageNum = 1;
		var choose = 3;
		location.href = '${conPath}/Item/itemBoardList.do?pageNum=' + pageNum
				+ '&insert=' + insert + '&choose=' + choose;

	}
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp" />

	<div class="container boardCT">

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
		<c:if test="${not empty mem }">
			<c:set var="info" value="${mem.mid }"></c:set>
		</c:if>
		<c:if test="${not empty adm }">
			<c:set var="info" value="${adm.aid }"></c:set>
		</c:if>
		<input type="hidden" value="${info }" name="info">
		<div id="itemBoard">

			<table class="table">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>카테고리</th>
				</tr>
				<c:if test="${paging.total eq 0 }">
					<tr>
						<td colspan="5">글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${paging.total ne 0 }">
					<c:forEach items="${itbList}" var="list">

						<tr>
							<td>${list.ibnum }</td>
							<td><c:if test="${list.ibstate eq 1}">
									<a style="text-decoration : none; font-weight: bold;">${list.ibtitle } [${list.cnt }]</a>
									<span> 
										<img alt="등록완료" src="${conPath }/inventory/icon/ok.png" width="50">
									</span>
								</c:if> 
								
								<c:if test="${list.ibstate eq 0}">
									<a href="${conPath}/Item/itemBoardView.do?ibnum=${list.ibnum}&pageNum=${paging.currentPage}&choose=${choose}&insert=${insert}">${list.ibtitle }
										[${list.cnt }]
									</a>
									<span> 
										<img alt="처리중" src="${conPath }/inventory/icon/no.png" width="50">
									</span>
								</c:if></td>
							<td>${list.mid }</td>
							<td>${list.ibdate }</td>
							<td>${list.ibcategory }</td>
						</tr>

					</c:forEach>
				</c:if>
			</table>
			
			<button class="frbtn focus" onclick="location.href='${conPath}/Item/itemBoardWriteView.do'" style="margin-left: 5px;">글쓰기</button>
			<button class="frbtn focus" onclick="location.href='${conPath }/Item/itemsList.do'">아이템</button>
						
		</div>
		
		
		<div class="btn-toolbar" role="toolbar"> <!-- 페이징 -->
			<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
			<c:if test="${paging.currentPage ne 1 }">
				<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemBoardList.do?pageNum=1&insert=${insert }&choose=${choose }'">
					<<
				</button>
			</c:if>
			
			<c:if test="${paging.startPage > paging.blockSize }">
				<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemBoardList.do?pageNum=${paging.startPage-1}&choose=${choose }&insert=${insert}'">
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
					<button class="btn btn-default" onclick="location.href='${conPath}/Item/itemBoardList.do?pageNum=${i}&insert=${insert}&choose=${choose}'">
						${i}
					</button>
				</c:if>
				
			</c:forEach>

			<c:if test="${paging.endPage<paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemBoardList.do?pageNum=${paging.endPage+1}&choose=${choose }&insert=${insert }'">
					다음
				</button>
			</c:if>
			
			<c:if test="${paging.currentPage ne paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemBoardList.do?pageNum=${paging.pageCnt}&choose=${choose }&insert=${insert }'">
					>>
				</button>
			</c:if>

		</div>  <!-- 페이징끝 -->
		
		
		<div id="search">
			<form action="${conPath}/Item/itemBoardList.do">
				<input type="hidden" name="pageNum" value="1">
				<table style="width: 100%; height: 30px;">
					<tr>
						<td><input type="button" onclick="mySearch();" value="내가 쓴 글" /></td>
						<td>
							<select name="choose">
								<option value="1" selected="selected">글제목</option>
								<option value="2">작성자</option>
							</select>
						</td>
						<td><input type="text" size="30" name="insert" /></td>
						<td>
							<button onclick='submit'>검색</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

		</div>
	
	</div> <!-- 컨테이너 -->
</body>
</html>