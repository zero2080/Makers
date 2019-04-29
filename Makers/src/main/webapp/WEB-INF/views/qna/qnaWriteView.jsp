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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${conPath}/css/qnaWT.css" rel="stylesheet" type="text/css">
<script>
	$(window).ready(function() {
		$('#imgFile').change(function(){//파일체크
			var ext = $(this).val().split(".").pop().toLowerCase();//확장자 뽑기
			if($.inArray(ext,["gif","jpg","jpeg","png"])== -1){
				alert("gif,jpg,jpeg,png 파일만 업로드 가능합니다.");
				$(this).val("");
				return;
			}
			var size = this.files[0].size;
			var max = 1024*1024*10;
			if(size > max){
				alert("10Mb를 초과할 수 없습니다.");
				$(this).val("");
				return;
			}
			
		});
	});
	
	
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>

<c:if test="${not empty mem }">
	<c:set var="info" value="${mem.mid }"></c:set>
</c:if>
<c:if test="${not empty adm }">
	<c:set var="info" value="${adm.aid }"></c:set>
</c:if>
<% String add = request.getRemoteAddr();%>

<div class="container qnaCT">

	<form action="${conPath }/QnA/qnaWrite.do" enctype="multipart/form-data" method="post">
		<input type="hidden" value="<%=add %>" name="qip" />
		<input type="hidden" value="${info }" name="mid" />
		
		<table class="table qnaWT">
			<tr>
				<th>제목</th>
				<td><input type="text" required="required" name="qtitle" size="149"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="30" cols="151" name="qcontent" required="required"></textarea> </td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="tempImg" id="imgFile"/></td>
			</tr>
			
		</table>
		
		<div id="info_buttons">
	        <button onclick="location.href='${conPath}/QnA/qnaList.do'" class="qnart_btn focus">목록</button>
	        <button type="submit" class="qnart_btn focus">저장</button>
        </div>
		
	</form>

</div>
</body>
</html>