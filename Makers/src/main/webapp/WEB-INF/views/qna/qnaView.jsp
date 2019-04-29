<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${conPath}/css/boardview.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	$(window).ready(function() {
		
	});
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>

    <div class="container boardViewCT">
    
		<c:if test="${not empty mem }">
			<c:set var="info" value="${mem.mid }"></c:set>
		</c:if>
		<c:if test="${not empty adm }">
			<c:set var="info" value="${adm.aid }"></c:set>
		</c:if>
		
		 <table class="table">
		      <tr>
				<th>제목</th>
				<td><input type="text" readonly="readonly" value="${list.qtitle }"/></td>
				<th>id</th>
				<td><label>${list.mid }</label></td>
				<th>ip</th>
				<td><label>${list.qip }</label></td>
			</tr>
			
			
			<tr>
				<td colspan="6" style="width: 50%; height: 300px;">${list.qcontent}</td>
			</tr>	
			
			<tr>
				<th>첨부파일</th>
				<td><img alt="${list.qfile }" src="${conPath }/qnaImg/${list.qfile}"> </td>
			</tr>
			
			<tr>
			<td colspan="6">
				<button class="board_btn focus"  onclick="location.href='${conPath}/QnA/qnaList.do?pageNum=${pageNum}&choose=${choose }&insert=${insert }'">목록으로</button>
				<c:if test="${not empty adm and list.qstep eq 0}"> 
						<button onclick="location.href='${conPath}/QnA/qnaReplyView.do?qnum=${list.qnum }&pageNum=${pageNum}'">답변달기</button>
				</c:if>
				<c:if test="${info eq list.mid }">
					<button class="board_btn focus" onclick="location.href='${conPath}/QnA/qnaModifyView.do?qnum=${list.qnum }&pageNum=${pageNum }'">수정</button>
					<button class="board_btn focus" onclick="location.href='${conPath}/QnA/qnaDelete.do?qnum=${list.qnum }&qstep=${list.qstep }'">삭제</button>
				</c:if> 
			</td>
			</tr>
		    </table>

	</div>
	
</body>
</html>