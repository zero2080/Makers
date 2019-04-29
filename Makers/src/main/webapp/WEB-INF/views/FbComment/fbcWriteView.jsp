<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>

	<div id="write">
		
			<input type="hidden" name="mid" value="${mem.mid}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">  
			<input type="hidden" name="fbnum" value="${param.fbnum}"> 

			<table>

				<tr>
					<th>댓글</th>
					<td><textarea name="fbccontent" required rows="10" cols="30"></textarea></td>
					<td><button onclick="wrComment();">작성</button></td>
				</tr>

			</table>


	</div>
	
</body>
</html>