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
			$('#mid').keyup(function(){
				var mid=$('#mid').val();
				if($(this).val()=='${mem.mid}'){
					$(this).val('');
				}
				$.ajax({
					url : '${conPath}/midList.do',
					datatype : 'html',
					data : "mid="+mid,
					success : function(data,status){
						$('#result').html(data);
					}
				});
				if($('#mid').val()==''){
					$('input[type=button]').attr("disabled","disabled");
				}else{
					$('input[type=button]').removeAttr("disabled");
				}
				
			});
			
			$('input[type=button]').click(function(){
				var mid = '${mem.mid}';
				var mid2 = $('#mid').val();
				var mscontent = $('#mscontent').val();
				mscontent=mscontent.replace(/(?:\r\n|\r|\n)/g,'<br>');
				$.ajax({
					url : '${conPath}/msgSend.do',
					data : 'mid='+mid+'&mid2='+mid2+'&mscontent='+mscontent,
					success : function(data,status){
						alert('쪽지가 보내졌습니다.');
						opener.window.close();
						window.close();
					}
				});
			});
		});
	</script>
</head>
<body>
	<c:if test="${empty mem.mid }">
	<script>
		wiondow.close();
	</script>
	</c:if>
		<table>
			<tr>
				<th>my ID</th>
				<td>${mem.mid }
			</tr>
			<tr>
				<th>받는 사람(ID)</th>
				<td><input type="email" id="mid" name="mid" value="${param.mid }" autocomplete="off"<c:if test="${not empty param.msnum }">readonly="readonly"</c:if>></td>
			<tr>
				<td></td>
				<td><span id="result"></span></td>
			</tr>
			<tr>
				<th>쪽지내용</th>
				<td><textarea id="mscontent" cols="40" rows="10"><c:if test="${not empty param.msnum }">${param.mid }님에게 답장</c:if></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="보내기" <c:if test="${empty param.msnum }">disabled="disabled"</c:if>>
				</td>
			</tr>
		</table>
</body>
</html>