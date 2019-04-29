<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<head>
	<jsp:include page="../main/header.jsp"/>
</head>
<section>
	
	<hr>
	<div class="container">
		<table class="table ">
			<caption><strong>${mo.mrtitle }</strong></caption>
			<tbody>
				<tr>
					<td style="height:655px;">
						<div class="product" style="overflow:hidden;width:700px; height:655px;vertical-align:middle;">
							<img src="${conPath }/mOrderImage/${mo.mrimg}" style="width:100%">
						</div>
					</td>
					<td>
						<iframe src="${conPath }/bidList.do?mrnum=${mo.mrnum}" frameborder="0" width="380" height="655"></iframe>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><strong>상세내용</strong></td>
				</tr>
				<tr>
					<td colspan="2">
						<table class="table table-bordered">
							<caption class="text-center">제작 상세 옵션</caption>
							<tr>
								<th class="text-center">작성일</th><td class="text-center">${mo.mrdate }</td>
								<th class="text-center">입찰 종료</th><td class="text-center">${fn:substring(mo.mrenddate,2,10) }</td>
								<th class="text-center">납품기한</th><td class="text-center">${fn:substring(mo.mrtimelimit,2,10) }</td>
							</tr>
							<tr>
								<th class="text-center" colspan="3">Size</th><th colspan="3" class="text-center">색상</th>
							</tr>
							<tr>
								<td class="text-center">S</td>
								<td class="text-center">M</td>
								<td class="text-center">L</td>
								<td class="text-center"><code style="background-color:#00FFAA;font-weight:bold;text-shadow: 0 0 2px #fff;">#00FFAA</code></td>
								<td class="text-center"><code style="background-color:#CC00FF;font-weight:bold;text-shadow: 0 0 2px #fff;">#CC00FF</code></td>
								<td class="text-center"><code style="background-color:#14F3AF;font-weight:bold;text-shadow: 0 0 2px #fff;">#14F3AF</code></td>
							</tr>
							<tr>
								<th class="text-center" colspan="6">재료</th>
							</tr>
							<tr>
								<td class="text-center" colspan="6">
									\${design_item}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<div>
							${mo.mrcontent }
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>

</body>
</html>