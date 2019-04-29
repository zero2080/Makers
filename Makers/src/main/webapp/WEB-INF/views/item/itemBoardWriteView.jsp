<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${conPath}/css/qnaWT.css" rel="stylesheet" type="text/css">
<script src="${conPath }/js/colorPiker/jscolor.js"></script>
<script>
	$(window).ready(function() {
		$('#imgFile').change(function() {//파일체크
			var ext = $(this).val().split(".").pop().toLowerCase();//확장자 뽑기
			if ($.inArray(ext, [ "gif", "jpg", "jpeg", "png" ]) == -1) {
				alert("gif,jpg,jpeg,png 파일만 업로드 가능합니다.");
				$(this).val("");
				return;
			}
			var size = this.files[0].size;
			var max = 1024 * 1024 * 10;
			if (size > max) {
				alert("10Mb를 초과할 수 없습니다.");
				$(this).val("");
				return;
			}
		});
	});

	var colorList = new Array();
	var i = 0;
	function update(picker) {
		document.getElementById('hex-str').innerHTML = picker.toHEXString();

	}

	function insert() {
		var insert = document.getElementById('hex-str').innerHTML;

		for (var i = 0; i < colorList.length; i++) {
			if (colorList[i] == insert) {
				alert("이미 같은 색상이 있습니다.");
				return false;
			}

		}
		if (insert != '' && insert != null) {

			if (insert == undefined) {
				alert("색상을 선택 후 저장 가능합니다.");
				return false;
			}
			colorList.push(insert);
			$('#container')
					.append(
							'<label name="colors" style="background-color:'+insert+'"></label> <input type="button" class="colorButton" name="선택 색상 : '+insert+'" value="색상 삭제"/><br>');
			document.getElementsByName('colors')[i].innerHTML = "선택 색상 : "
					+ insert;
			i++;

		} else {
			alert("색상을 선택 후 저장 가능합니다.");
			return false;
		}
	}
	function save() {
		var ibtitle = document.getElementsByName('ibtitle')[0].value;
		var ibcontent = document.getElementsByName('ibcontent')[0].value;
		var tempImg = document.getElementsByName('tempImg')[0].value;
		if (colorList == null || colorList == '') {
			alert('하나 이상의 색상을 선택해야합니다.');
			return false;
		}
		if (ibtitle == null || ibtitle == '') {
			alert('글제목을 입력해야합니다.');
			return false;
		}
		if (ibcontent == null || ibcontent == '') {
			alert('글내용이 필요합니다.');
			return false;
		}
		if (tempImg == null || tempImg == '') {
			alert('사진이 필요합니다.');
			return false;
		}
		document.getElementById('colorList').value = colorList;
		$('#hidden').append(
				' <c:set var="colorList" value="'+colorList+'"></c:set><처리됨>');
		/* $('#hidden').append('<input type="hidden" value="'+colorList+'" name="colors" /><처리됨>');  */
		document.frm.submit();
	}
	$(document).on("click", ".colorButton", function() {
		var name = $(this).attr("name");

		colorList.splice(colorList.indexOf(name), 1);
		var length = document.getElementsByName('colors').length;

		for (var i = 0; i < length; i++) {
			var temp = document.getElementsByName('colors')[i].innerHTML;

			if (temp == name) {
				document.getElementsByName('colors')[i].remove();
				document.getElementsByTagName('br')[i].remove();
				break;
			}
		}
		$(this).remove();

	});
</script>
<style>
#hex-str {
	display: none;
}

.colorButton {
	border: 0px;
}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp" />

	<div class="container qnaCT">

		<form action="${conPath }/Item/itemBoardWrite.do" name="frm"
			enctype="multipart/form-data" method="post" onsubmit="return false;">
			<input type="hidden" value="${mem.mid }" name="mid" /> <input
				type="hidden" value="" name="colorList" id="colorList" />

			<table class="table qnaWT">
				<tr>
					<th>제목</th>
					<td>
						<select name="ibcategory">
							<option>귀걸이</option>
							<!-- 나중에 카테고리 테이블 만들어서 불러오기 -->
							<option>목걸이</option>
						</select> 
						<input type="text" required="required" name="ibtitle" size="130" placeholder="주의! 제목은 등록시 부품 아이디로 저장됩니다." />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="30" cols="151" name="ibcontent" required="required"></textarea></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="tempImg" id="imgFile" /></td>
				</tr>
				<tr>
					<td>
						<div id="container">
							<input class="jscolor {onFineChange:'update(this)'}" value="ffcc00"> <span id="hex-str"></span> 
							<input type="button" onclick="insert();" value="색상 저장" /> <br>
						</div>
					</td>
				</tr>

			</table>
			
			<div id="info_buttons">
		        <button onclick="save()" class="qnart_btn focus">저장</button>
		        <button onclick="location.href='${conPath}/Item/itemBoardList.do'" class="qnart_btn focus">목록</button>
	        </div>
			
		</form>

	</div>

</body>
</html>