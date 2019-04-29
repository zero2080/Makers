<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${conPath }/css/findpw.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#send').click(function(){
				var fmid = $('#fmid').val();
				$.ajax({
					url : '${conPath}/mailSend.do',
					datatype : 'html',
					data : "reason=findPw&mid="+fmid,
					success : function(data, status){
						alert('임시 비밀번호가 '+fmid+'로 전송되었습니다.\n로그인 화면으로 이동합니다.');
						location.href="${conPath}/main.do";
					}
				});
			});
		});
	</script>
</head>
<body>

	<div>

        <div class="blackpaper">
        </div>

        <div id="findbox">
            <p>ID(E-Mail)</p>
            <input type="email" name="mid" id="fmid" class="find_pw">
            <button id="send" class="fpbtn fpfocus">이메일로 임시번호 받기</button>
        </div>

    </div>
    
</body>
</html>