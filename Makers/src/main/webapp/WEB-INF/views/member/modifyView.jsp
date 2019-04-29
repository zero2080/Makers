<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="${conPath}/css/modify.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var pwChk = 1;
	var nowPw = 0;
	$(document).ready(function() {
		$('#chPw').click(function() {
			pwChk = 0;
			$('#mpwChk').removeAttr("disabled");
			$('input[value="정보수정"]').attr("style", "display:none;");
		});
		$('#mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			console.log(mpwChk);
			console.log(mpw);
			if (mpw == mpwChk) {
				pwChk = 0;
				console.log('if문'+pwChk);
				$('#ppwConfirm').text('현재 비밀번호와 동일합니다.');
				$('input[value="정보수정"]').attr("style", "display:none;");
			} else {
				if ($('#mpwChk').val().length < 4) {
					$('#ppwConfirm').text('비밀번호는 4자리 이상이어야 합니다.');
					$('input[value="정보수정"]').attr("style", "display:none;");
				} else {
					pwChk = 1;
					$('#ppwConfirm').text('정보수정을 완료하면 비밀번호가 변경됩니다.');
					if ((pwChk + nowPw) == 2) {
						$('input[value="정보수정"]').removeAttr("style");
					}
				}
			}
		});
		$('#mpw').keyup(function() {
			var mpw = ${mem.mpw};
			if (mpw == $('#mpw').val()) {
				nowPw = 1;
				if ((pwChk + nowPw) == 2) {
					$('input[value="정보수정"]').removeAttr("style");
				} else {
					$('input[value="정보수정"]').attr("style", "display:none;");
				}
			}
		});
	});
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>

		<div id="modifybox">

			<form action="${conPath}/modifyInfo.do" method="post" enctype="multipart/form-data">
				
				<table id="modifytable">
				
					<tr >
						<th >ID</th>
						<td >${mem.mid }<input type="hidden" name="mid" value="${mem.mid}"></td>
					</tr>
					
					<tr>
						<th >PassWord</th>
						<td ><input type="password" name="mpw" id="mpw" class="modify"> 
							
					</tr>
					
					<tr>
						<th></th>
						<td><input type="button" id="chPw" value="비밀번호 변경하기" class="change_btn focus"></td></td>
					</tr>
					
					<tr>
						<th >PassWord Change</th>
						<td >
							<input type="password" name="mpwChk" id="mpwChk" disabled="disabled" class="modify">
						</td>
					</tr>
					
					<tr>
						<th></th>
						<td><span id="ppwConfirm"></span></td>
					</tr>
					
					<tr >
						<th >NickName</th>
						<td ><input type="text" name="mname" value="${mem.mname}" class="modify"></td>
					</tr>
					
					<tr>
						<th colspan="2">추가 입력 사항</th>
					</tr>
					
					<tr >
						<th >Phone</th>
						<td ><input type="text" name="mphone" value="${mem.mphone}" class="modify"></td>
					</tr>
					
					<tr >
						<th >Address</th>
						<td ><input type="text" name="maddr" value="${mem.maddr}" class="modify"></td>
					</tr>
					
					<tr>
						<th>Profile Image</th>
						<td>
							<img src="${conPath}/memberImg/${mem.mimg}" style="width: 120px; height: 110px;" class="pro_img_td">
						</td>
					</tr>
					
					
					<tr>
						<th></th>
						<td><input type="file" name="tempmimg"></td>
					</tr>
					
					<tr>
						<th colspan="2">Account Information</th>
					</tr>
					
					<tr >
						<th >Bank</th>
						<td ><input type="text" name="mbank" value="${mem.mbank}" class="modify"></td>
					</tr>
					
					<tr >
						<th >Account Number</th>
						<td ><input type="text" name="maccount" value="${mem.maccount}" class="modify"></td>
					</tr>
					
					<tr >
						<th >AccountName</th>
						<td ><input type="text" name="macname" value="${mem.macname}" class="modify"></td>
					</tr>
					
				</table>
				
			
			
			<div id="modify_buttons">
               	<input type="submit" value="정보수정" style="display: none;" class="modify_btn focus">
				<input type="button" onclick="location.href='${conPath}/main.do'" value="메인으로" class="modify_btn focus">
           	</div>
			</form>
		</div>
		
</body>
</html>