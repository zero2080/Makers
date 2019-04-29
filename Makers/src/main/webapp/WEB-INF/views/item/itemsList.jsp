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
		$('select[name=choose]').change(function() {

			if ($(this).val() == 2) {
				$('input[name=insert]').attr('type', 'number');
				$('input[name=insert]').attr('style', 'width:100px;');
			} else {
				$('input[name=insert]').attr('type', 'text');
				$('input[name=insert]').attr('style', 'width:100px;');

			}
		});

	});
	function mySearch() {
		var insert = $('input[name=info]').val(); /*  ${member.mid} */
		var pageNum = 1;
		var choose = 3;

		location.href = '${conPath}/Item/itemsList.do?pageNum=' + pageNum
				+ '&insert=' + insert + '&choose=' + choose;
	}
</script>
<style>

* {
	margin: 0;
	padding: 0;
}

#search {
	margin-top:5%;
	box-sizing: border-box;
	width: 50%;
	margin-left: 25%;
}

#search td:first-child {
	width: 5%;
}

#search td:nth-child(2) {
	width: 5%;
}

#search td:nth-child(3) {
	width: 80%;
}

#search td:last-child {
	width: 10%;
}


</style>
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
		<div id="items">

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
						<td>글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${paging.total ne 0 }">
					<c:forEach items="${itemsList}" var="list">

						<tr>
							<td>${list.itnum }</td>
							<td><a href="${conPath}/Item/itemsView.do?itnum=${list.itnum}&pageNum=${paging.currentPage}&choose=${choose}&insert=${insert}">${list.itname }
									[${list.cnt }] 
								</a>
							</td>
							<%-- <td>${list.mid}</td> --%>
							<td>${list.itdate}</td>
							<td>${list.itcategory}</td>
						</tr>

					</c:forEach>
				</c:if>
			</table>
		</div>


		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group text-center" role="group"
				style="left: 50%; margin-left: -181px;">
				<c:if test="${paging.currentPage ne 1 }">
					<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemsList.do?pageNum=1&insert=${insert }&choose=${choose}'">
						<<
					</button>
				</c:if>

				<c:if test="${paging.startPage > paging.blockSize }">
					<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemsList.do?pageNum=${paging.startPage-1}&choose=${choose}&insert=${insert}'">
						이전
					</button>
				</c:if>

				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">

					<c:if test="${paging.currentPage==i }">
						<button class="btn btn-default">${i}</button>
					</c:if>

					<c:if test="${paging.currentPage!=i }">
						<button class="btn btn-default" onclick="location.href='${conPath}/Item/itemsList.do?pageNum=${i}&insert=${insert}&choose=${choose}'">
							${i}
						</button>
					</c:if>

				</c:forEach>

				<c:if test="${paging.endPage<paging.pageCnt}">
					<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemsList.do?pageNum=${paging.endPage+1}&choose=${choose}&insert=${insert}'">
						다음
					</button>
				</c:if>

				<c:if test="${paging.currentPage ne paging.pageCnt}">
					<button class="btn btn-default" onclick="location.href='${conPath }/Item/itemsList.do?pageNum=${paging.pageCnt}&choose=${choose}&insert=${insert}'">
						>>
					</button>
				</c:if>

			</div>


			<div id="search">
				<form action="${conPath}/Item/itemsList.do">
					<input type="hidden" name="pageNum" value="1">
					<table>
						<tr>
							<td><input type="button" onclick="mySearch();" value="내가 쓴 글" /></td>
							<td><select name="choose">
									<option value="1" selected="selected">부품이름</option>
									<option value="2">부품번호</option>
							</select></td>
							<td><input type="text" size="40" name="insert" /></td>
							<td><input type=submit value='검색' /></td>
						</tr>
					</table>

				</form>

			</div>

		</div>
	</div>

</body>
</html>