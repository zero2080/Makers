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
<link href="${conPath}/css/join.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var emChk = 0;
	var pwChk = 0;
	var mnChk = 0;
	$(document).ready(function() {
		$('input[type="email"]').keyup(function() {
			var mid = $('#mid').val();
			if (mid.indexOf('@') == -1) {
				$('#mailResult').html('올바른 이메일 형식이 아닙니다.');
				return;
			}
			if (mid.indexOf('@') > mid.lastIndexOf('.')) {
				$('#mailResult').html('올바른 이메일 형식이 아닙니다.');
				return;
			}
			if (mid.indexOf('.') == -1) {
				$('#mailResult').html('올바른 이메일 형식이 아닙니다.');
				return;
			}
			$.ajax({
				url : '${conPath}/searchId.do',
				datatype : 'html',
				data : "mid=" + mid,
				success : function(data, status) {
					$('#mailResult').html(data);
				}
			});
		});
		$('#random').click(function() {
			var mid = $('#mid').val();
			$.ajax({
				url : '${conPath}/mailSend.do',
				datatype : 'html',
				data : "reason=join&mid=" + mid,
				success : function(data, status) {
					alert('보안문자가 ' + mid + '로 전송되었습니다.\n');
				}
			});
		});
		$('#codeConfirm').click(function() {
			var code = $('#code').val();
			$.ajax({
				url : '${conPath}/codeConfirm.do',
				datatype : 'html',
				data : "code=" + code,
				success : function(data, status) {
					$('#result').html(data);
					if ($('#codeResult').text() == '인증번호 일치') { //메세지를 변경하려면 every/codeConfirm.jsp에서 변경하면됨
						$('#mid').attr("readonly", true); //단. 변경한 메세지와 '같음'에 들어갈 텍스트가 완전히 같아야함
						emChk = 1;
						if ((emChk + pwChk + mnChk) == 3) {
							$('#buttons').css("display", "block");
						}
					}
				}
			});
		});
		$('#mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (mpw == mpwChk) {
				$('#pwConfirm').text('비밀번호 일치');
				pwChk = 1;
				if ((emChk + pwChk + mnChk) == 3) {
					$('#buttons').css("display", "block");
				}
			} else {
				$('#pwConfirm').text('비밀번호 불일치');
				pwChk = 0;
				$('#buttons').css("display", "none");
			}
		});
		$('#mphone').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		$('#mname').keyup(function() {
			var mname = $('#mname').val();
			$.ajax({
				url : '${conPath}/nickNameResult.do',
				datatype : 'html',
				data : "mname=" + mname,
				success : function(data, status) {
					$('#mnResult').html(data);
					if ($('#mnameResult').text() == '사용 가능한 닉네임 입니다.') { //메세지를 변경하려면 every/nickNameResult.jsp에서 변경하면됨$('#mnResult').attr("readonly",true);
						mnChk = 1; //단. 변경한 메세지와 '사용가능'에 들어갈 텍스트가 완전히 같아야함
						if ((emChk + pwChk + mnChk) == 3) {
							$('#buttons').css("display", "block");
							$('#join_btn').removeAttr("disabled");
						}
					}
				}
			});
		});

	});
	
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
		<div id="joinbox">

			<form action="${conPath}/joinMember.do" method="post" enctype="multipart/form-data">

				<table id="jointable">
				
					<tr>
						<th>ID</th>
						<td><input type="email" id="mid" name="mid" required autocomplete="off" autofocus="autofocus" class="join"></td>
					</tr>
					
					<tr>
						<th></th>
						<td><input type="button" id="random" value="보안번호 발송" class="inside_btn join_btn"></td>
					</tr>
					
					<tr>
						<th></th>
						<td><p id="mailResult"></td>
					</tr>
					
					<tr>
						<th>보안코드</th>
						<td><input type="text" id="code" name="code" class="join"> </td>
					</tr>
					
					<tr>
						<th></th>
						<td><input type="button" id="codeConfirm" value="confirm" class="inside_btn join_btn"></td>
					</tr>
					
					<tr>
						<th></th>
						<td><p id="result"></td>
					</tr>
					
					<tr>
						<th>PassWord</th>
						<td><input type="password" id="mpw" name="mpw" required class="join"></td>
					</tr>
					
					<tr>
						<th>PassWord Confirm</th>
						<td><input type="password" id="mpwChk" name="mpwChk" required class="join"></td>
					</tr>
					
					<tr>
						<th></th>
						<td><p id="pwConfirm"></td>
					</tr>
					
					<tr>
						<th>NickName</th>
						<td><input type="text" id="mname" name="mname" required class="join"></td>
					</tr>
					
					<tr>
						<th></th>
						<td><p id="mnResult"></td>
					</tr>
					
					<tr>
						<td colspan="2">추가 입력 사항</td>
					</tr>
					
					<tr>
						<th>Phone</th>
						<td><input type="text" id="mphone" name="mphone" class="join"></td>
					</tr>
					
					<tr>
						<th>Address</th>
						<td><input type="text" name="maddr" class="join"></td>
					</tr>
					
					<tr>
						<th>Profile Image</th>
						<td><input type="file" name="tempMimg" class="file join_btn"></td>
					</tr>
					
					<tr>
						<td colspan="2">Account Information</td>
					</tr>
					
					<tr>
						<th>Bank</th>
						<td><input type="text" name="mbank" class="join"></td>
					</tr>
					
					<tr>
						<th>Account Number</th>
						<td><input type="text" name="maccount" class="join"></td>
					</tr>
					
					<tr>
						<th>AccountName</th>
						<td><input type="text" name="macname" class="join"></td>
					</tr>
					
				</table>
			
				<div id="buttons" style="display: none">
					<input type="submit" class="join_btn" value="가입" id="join_btn" disabled="disabled"> 
					<input type="reset" class="join_btn" value="다시입력"> 
					<input type="button" class="join_btn" onclick="location='loginView.jsp'" value="이전">
				</div>

			</form>

		</div>

</body>
</html>