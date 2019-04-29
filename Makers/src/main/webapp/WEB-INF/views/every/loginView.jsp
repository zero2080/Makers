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
<link href="${conPath}/css/login.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	$('#forgot').click(function() {
		$('#loginPage').attr("style", "display:none;");
		$('#finePwPage').removeAttr("style");
	});
	
	$('.blackpaper').click(function() {
		$('#finePwPage').attr("style", "display:none;");
	});
	 
	if (${loginFail == 0} && true) {
		$('#loginPage').removeAttr("style");
	}
	
	$('.libtn').click(function(){
		var id=$('#id').val();
		var pw=$('#pw').val();
		$.ajax({
			url:'${conPath}/login.do',
			data:'id='+id+'&pw='+pw,
			datatype:'html',
			type:'post',
			success:function(data){
				location.reload();
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
        
        <div id="loginbox">

            <form name="frm" id="frm" onsubmit="return chk()">

                <input type="text" name="id" id="id" class="login" value="${mid}" placeholder="ID" autofocus="autofocus" required>
                <input type="password" name="pw" id="pw" class="login" placeholder="password" required>
				
				<div id="forgot">Forgot password?</div>
				
                <div class="btn_wrap">
                    <input type="button" class="libtn focus" value="Login">
                </div>

            </form>

        </div>
    </div>
</body>
</html>