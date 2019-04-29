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
			$('.id').click(function(){
				var id = $(this).text();
				$('#list').empty();
				$('#mid').val(id);
				$('input[type=button]').removeAttr("disabled");
			});
			
			if('${midList[0].mid}'==$('#mid').val()){
				$('input[type=button]').removeAttr("disabled");
				$('#list').empty();
			}else{
				$('input[type=button]').attr("disabled","disabled");
			}
			if(${midList[0].mid == mem.mid} || $('#mid').val()==''){
				$('input[type=button]').attr("disabled","disabled");
			}
		});
	</script>
</head>
<body>
	<div id="list">
		<c:forEach var="ids" items="${midList }">
			<c:if test="${ids.mid != mem.mid}">
				<span class="id">${ids.mid }</span><br>	
			</c:if>
		</c:forEach>
	</div>
</body>
</html>