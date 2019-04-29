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
<% String add = request.getRemoteAddr();%>
<form action="${conPath }/QnA/qnaReply.do" enctype="multipart/form-data" method="post">
<input type="hidden" value="<%=add %>" name="qip" />
<input type="hidden" value="${mem.mid }" name="mid" /><%-- ${list.mid } --%>
<input type="hidden" value="${admin.aid }" name="aid" />
<input type="hidden" value="1" name="qstat" />
<input type="hidden" value="1" name="qstep" />
<input type="hidden" value="${list.qgroup}" name="qgroup" />
<input type="hidden" value="${pageNum}" name="pageNum" />
<table>
	<tr>
		<th>제목</th>
		<td><input type="text" required="required" name="qtitle"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" cols="5" name="qcontent" required="required"></textarea> </td>
	</tr>
	<tr>
		<th>파일</th>
		<td><input type="file" name="tempImg" id="imgFile"/></td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="submit" value="저장"/><input type="button" value="이전" onclick="history.back()"></td>
	</tr>
	
</table>
</form>
</body>
</html>