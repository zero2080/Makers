<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
	var actimelimit = '';
	var acprice = 0;
	var mid = '${mOrder.mid }';
	var mid2 = '${mem.mid}';
	var mrnum = ${mOrder.mrnum};
	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	$(document).ready(function(){
		function addCommas(x) {		//숫자 단위 콤마
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function removeCommas(x) {	// 콤마제거
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		}
		$('#acprice').keyup(function(){
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));	//숫자만 입력
		});
		
		$("#dialog").dialog();
		
		$(document).tooltip();
		
		$('#deliveryDay').datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : 1,
			maxDate : '${mOrder.mrtimelimit}',
			showMonthAfterYear: true,
			dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	        nextText: '다음 달',
	        prevText: '이전 달'
		});
		
		$('#resume').click(function(){
			actimelimit = $('#deliveryDay').val();
			acprice = $('#acprice').val()
			if(pattern.test(actimelimit)){		//날자형식 유효성 검사
				acprice = removeCommas(acprice);
				if(confirm('입찰하시겠습니까?')==true){
					$.ajax({
						url:'${conPath}/insertBiding.do',
						data:'mid='+mid+'&mid2='+mid2+'&mrnum='+mrnum+'&acprice='+acprice+'&actimelimit='+actimelimit,
						datatype:'text',
						type:'post',
						success:function(){
							alert('입찰에 성공하였습니다.');
							opener.location.reload();
							window.close();
						}
					});
				}
				return;
			}
			alert('입력된 정보를 확인해 주세요');
			return;
		});
	});		
</script>
</head>
<body>
	<div class="container">
		<form class="form-inline">
			<table class="table">
				<caption class="text-center" style="font-size:2em;vertical-align:mid;"><strong>입찰하기</strong></caption>
				<tbody>
					<tr>
						<th class="text-center">경매번호</th>
						<td class="text-center">${mOrder.mrnum }<input type="hidden" name="mrnum" value="${mOrder.mrnum }"></td>
					</tr>
					<tr>
						<th class="text-center">제작요청</th>
						<td class="text-center"><code style="font-size:1.1em;font-weight:bold;">${mOrder.mid }</code><input type="hidden" value="${mOrder.mid }" name="mid"></td>
					</tr>
					<tr>
						<th class="text-center">입찰자</th>
						<td class="text-center"><code style="font-size:1.1em;font-weight:bold;">${mem.mid }(${mem.mname })</code><input type="hidden" value="${mem.mid }" name="mid2"></td>
					</tr>
					<tr>
						<th class="text-center">입찰 시작일</th>
						<td class="text-center" style="vertical-align:middle;"><strong><fmt:parseDate value="${mOrder.mrdate }" var="mrdate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${mrdate }" pattern="yyyy/MM/dd HH:mm"/></strong></td>
					</tr>
					<tr>
						<th class="text-center">납품기한</th>
						<td class="text-center" style="vertical-align:middle;"><strong><fmt:parseDate value="${mOrder.mrtimelimit }" var="mrdate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${mrdate }" pattern="yyyy/MM/dd"/></strong></td>
					</tr>
					<tr>
						<th class="text-center">납품 가능일</th>
						<td class="text-center"><input type="text" class="form-control" id="deliveryDay" name="actimelimit"></td>
					</tr>
					<tr>
						<th class="text-center">입찰가</th>
						<td class="text-center"><input type="text" class="form-control" name="acprice" id="acprice" required="required" title="금액은 숫자만 입력가능하며 단위구분은 자동으로 입력됩니다."></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input class="btn" id="resume" style="font-weight:bold;" type="button" value="입찰">
							<input class="btn" style="font-weight:bold;" type="reset" value="Reset">
							<input class="btn" style="font-weight:bold;" type="button" value="닫기" onclick="window.close();">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div id="dialog" title="입찰 주의 사항">
		<p>최대 납품 기한은 제작 요청납품 기한을 넘길 수 없으며, 실 납품일이 설정한 납품기한보다 늦을 경우 본 서비스 사용에 제한을 받을 수 있습니다.</p>
	</div>
</body>
</html>