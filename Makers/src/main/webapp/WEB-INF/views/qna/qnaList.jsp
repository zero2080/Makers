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
<link href="${conPath}/css/boardlist.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	$(window).ready(function() {

	});
	function search() {
		var choose = document.getElementsByName('choose')[0].value;
		var insert = document.getElementsByName('insert')[0].value;
		var pageNum = 1;
		alert(pageNum);
		/* 	$.ajax({
				url: '${conPath}/QnA/qnaSearch.do',
				type:'GET',
				data: {choose : choose, insert : insert,pageNum : pageNum},
				dataType:'html',
				success: function(data){
					$('#qnaBoard').html(data);
					
				}
			}); 
		 */
	}
	function mySearch() {
		var insert = $('input[name=info]').val(); /*  ${member.mid} */
		var pageNum = 1;
		var choose = 3;
		location.href = '${conPath}/QnA/qnaList.do?pageNum=' + pageNum
				+ '&insert=' + insert + '&choose=' + choose;

	}
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>

	<div class="container boardCT">

		<div id="qnaBoard">

			<c:if test="${qnaList } == null">
				망함
			</c:if>
			<c:if test="${not empty mem }">
				<c:set var="info" value="${mem.mid }"></c:set>
			</c:if>
			<c:if test="${not empty adm }">
				<c:set var="info" value="${adm.aid }"></c:set>
			</c:if>

			<input type="hidden" value="${info }" name="info">

			<table class="table">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:if test="${paging.total eq 0 }">
					<tr>
						<td colspan="5">글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${paging.total ne 0 }">
					<c:forEach items="${qnaList}" var="list">
						<tr>
							<td>${list.qnum }</td>
							<td><c:if test="${list.qstep eq 1 }">ㄴ답</c:if> <c:if
									test="${list.qstat eq 2}">
									<a><b>${list.qtitle }</b></a>
								</c:if> <c:if test="${list.qstat ne 2 }">
									<a
										href="${conPath}/QnA/qnaView.do?qnum=${list.qnum}&pageNum=${paging.currentPage}&choose=${choose}&insert=${insert}">${list.qtitle }</a>
								</c:if> <c:if test="${list.qstat eq 1 && list.qstep eq 0}">
									<span> <img alt="답변완료"
										src="${conPath }/qnaImg/icon/ok.png" width="50">
									</span>
								</c:if> <c:if test="${list.qstat eq 0 and list.qstep eq 0}">
									<span> <img alt="처리중"
										src="${conPath }/qnaImg/icon/no.png" width="50">
									</span>
								</c:if></td>
							<td>${list.mid }</td>
							<td>${list.qdate }</td>
							<td>${list.qreadcount }</td>
						</tr>

					</c:forEach>
				</c:if>
				
			</table>
				
				<c:if test="${not empty mem }">
					<button onclick="location.href='${conPath}/QnA/qnaWriteView.do'" class="frbtn focus">글쓰기</button>
				</c:if>
				
			
		</div>
		
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
			<c:if test="${paging.currentPage ne 1 }">
				<button class="btn btn-default" onclick="location.href='${conPath }/QnA/qnaList.do?insert=${insert}&pageNum=1&choose=${choose }'">
					<<
				</button>
			</c:if>
			
			<c:if test="${paging.startPage > paging.blockSize }">
				<button class="btn btn-default" onclick="location.href='${conPath }/QnA/qnaList.do?insert=${insert}&pageNum=${paging.startPage-1}&choose=${choose }'">
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
					<button class="btn btn-default" onclick="location.href='${conPath}/QnA/qnaList.do?insert=${insert}&pageNum=${i}&choose=${choose }'">
						${i}
					</button>
				</c:if>
				
			</c:forEach>

			<c:if test="${paging.endPage<paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/QnA/qnaList.do?insert=${insert}&pageNum=${paging.endPage+1}&choose=${choose}'">
					다음
				</button>
			</c:if>
			
			<c:if test="${paging.currentPage ne paging.pageCnt}">
				<button class="btn btn-default" onclick="location.href='${conPath }/QnA/qnaList.do?insert=${insert}&pageNum=${paging.pageCnt}&choose=${choose}'">
					>>
				</button>
			</c:if>

		</div>
		
			<div id="search">
				<form action="${conPath}/QnA/qnaList.do">
					<input type="hidden" name="pageNum" value="1">
					<table class="table">
						<tr>
							<td><input type="button" onclick="mySearch();" value="내가 쓴 글" />
							</td>
							<td><select name="choose">
									<option value="1" selected="selected">글제목</option>
									<option value="2">작성자</option>
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