<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			var msnum = ${message.msnum};
			$('#delMsg').click(function(){
				if(confirm("정말 삭제하시겠습니까?")==true){
					$.ajax({
						url : '${conPath}/msgDelete.do',
						dataType : 'html',
						data : 'msnum='+msnum+'&mid=${member.mid }',
						success : function(){
							opener.location.reload();
							window.close();
						}	
					});
				}else{
					return;
				}
					
			});
			
			$('#replyMsg').click(function(){
				var write = window.open("msgWriteView.do?msnum="+msnum+"&mid="+'${message.mid}',"","width=400,height=400,left=600");
				console.log(msnum);
			});
		});
	</script>
</head>
<body>
	<table>
		<tr>
			<th>from</th><td>${message.mid }</td>
		</tr>
		<tr>
			<th>to</th><td>${message.mid2 }</td>
		</tr>
		<tr>
		
			<th>내용</th><td><div style="width:280px;height:200px;border:1px solid #ccc;overflow:auto;">${message.mscontent }</div></td>
		</tr>
		<tr>
			<th>보낸날짜</th><td>${message.msdate }</td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${message.mid != mem.mid }"><input type="button" value="답장" id="replyMsg"></c:if>
				<input type="button" value="삭제" id="delMsg">
				<input type="button" value="닫기" onclick="window.close()">
			</td>
		</tr>
	</table>
</body>
</html>