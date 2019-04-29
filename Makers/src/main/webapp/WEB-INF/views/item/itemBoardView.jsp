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
<link href="${conPath}/css/boardview.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	var colorList = new Array();
	$(window)
			.ready(
					function() {
						<c:set value="${itcList }" var = "itcList"/>

						<c:forEach var="i" items="${itcList}" varStatus="status" >
						colorList.push("${i.itcolor}");
						$('#container')
								.append(
										'<label name="colors" style="background-color:${i.itcolor}"></label><br>');
						document.getElementsByName('colors')['${status.index}'].innerHTML = "선택 색상 : ${i.itcolor}";
						</c:forEach>
					});
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp" />

	<div class="container boardViewCT">

		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" readonly="readonly"
					value="${itbList.ibtitle }" /></td>
				<th>id</th>
				<td><label>${itbList.mid }</label></td>
				<th>ibcategory</th>
				<td><label>${itbList.ibcategory }</label></td>
			</tr>

			<tr>
				<td colspan="6" style="width: 50%; height: 200px;">${itbList.ibcontent }</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td><img width="300" alt="${itbList.ibimg }"
					src="${conPath }/inventory/${itbList.ibimg}"></td>
			</tr>
			<tr>
				<td>
					<div id="container">
						<br>
					</div>
				</td>
			</tr>

		</table>

		<button class="board_btn focus" onclick="location.href='${conPath}/Item/itemBoardList.do?pageNum=${pageNum}&choose=${choose }&insert=${insert }'">목록으로</button>

		<c:if test="${not empty adm and itbList.ibstate eq 0}">
			<button class="board_btn focus" onclick="location.href='${conPath}/Item/itemBoardFin.do?ibnum=${itbList.ibnum }&pageNum=${pageNum }'">등록</button>
		</c:if>

		<c:if test="${mem.mid eq itbList.mid or not empty adm}">
			<button class="board_btn focus" onclick="location.href='${conPath}/Item/itemBoardModifyView.do?ibnum=${itbList.ibnum }&pageNum=${pageNum }'">수정</button>
			<button class="board_btn focus" onclick="location.href='${conPath}/Item/itemBoardDelete.do?ibnum=${itbList.ibnum }&pageNum=${pageNum }'">삭제</button>
		</c:if>

	</div>
	
</body>
</html>