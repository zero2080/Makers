<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link href="${conPath }/css/info.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#quitmember').click(function(){
		if(confirm('탈퇴 하시겠습니까?\r\n 같은 ID(E-mail)은 재가입이 불가능 합니다.')){
			var mpw=prompt('비밀번호를 입력하세요');
			if(mpw=='${mem.mpw}'){
				$.ajax({
					url:'${conPath}/quitMember.do',
					data:'mid=${mem.mid}&mpw='+mpw,
					type:'post',
					success:function(){
						alert('회원이 탈퇴 되었습니다.');
						location.reload();
					}
				});
			}else{
				alert('비밀번호가 틀렸습니다.');
				return;
			}
		}
	});
});
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
        <div id="infobox">

            <table id="infotable">
                <tr>
                    <th>ID</th>
                    <td><input type="text" readonly="readonly" value="${mem.mid}" class="info"></td>
                </tr>
                
                <tr>
                    <th>NickName</th>
                    <td><input type="text" readonly="readonly" value="${mem.mname}" class="info"></td>
                </tr>
                
                
                <tr>
					<td colspan="2">추가 입력 사항</td>
				</tr>
                
                <tr>
                    <th>Phone</th>
                    <td><input type="text" readonly="readonly" value="${mem.mphone}" class="info"></td>
                </tr>
                
                
                <tr>
                    <th>Address</th>
                    <td><input type="text" readonly="readonly" value="${mem.maddr}" class="info"></td>
                </tr>
                
                <tr>
                    <th>Profile Image</th>
                    <td><img src="${conPath }/memberImg/${mem.mimg}"
                             style="width: 120px; height: 110px;" class="pro_img_td"></td>
                </tr>
                

                <tr>
                    <td colspan="2">Account Information</td>
                </tr>
                
                
                <tr>
                    <th>Bank</th>
                    <td><input type="text" readonly="readonly" value="${mem.mbank}" class="info"></td>
                </tr>
                <tr>
                    <th>Account Number</th>
                    <td><input type="text" readonly="readonly" value="${mem.maccount}" class="info"></td>
                </tr>
                <tr>
                    <th>AccountName</th>
                    <td><input type="text" readonly="readonly" value="${mem.macname}" class="info"></td>
                </tr>

            </table>

            <div id="info_buttons">
                <button onclick="location.href='modifyView.do'" class="info_btn focus">정보수정</button>
                <button id="quitmember" class="info_btn focus">회원탈퇴</button>
            </div>

        </div>

</body>
</html>