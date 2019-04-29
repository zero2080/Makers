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

<style>
	table :active {
	background-color: yellow;
}

</style>
<script>

</script>
</head>
<body>
	
	<c:if test="${paging.total eq 0 }"> 신청한 레시피가 없습니다.</c:if>
	
	<c:forEach items="${mOrderList }" var="mo">
	<table onclick="location.href='${conPath}/makeOrderView.do?mrnum=${mo.mrnum }'">
		<tr>
			<td rowspan="2"><img alt="${mo.mrimg}" src="${conPath }/mOrderImage/${mo.mrimg}" style="width:100px;"></td>
			<td>번호 : ${mo.mrnum }</td><td>레시피 이름 : ${mo.mrtitle}</td><td>신청수량 : ${mo.mrcount }(EA)</td>
		</tr>
		<tr>
			<td>신청일 : ${mo.mrdate} </td>
			<td>입찰 마감일 : ${mo.mrenddate} </td>
			<td>제작 요청기한 : ${mo.mrtimelimit}</td>	
			
		</tr>
	</table>
	
	<c:if test="${mo.mrstatus eq 4 }">
	 
	 	
	 	<button onclick="location.href='${conPath}/Product/productWriteView.do?mrnum=${mo.mrnum}&mid=${mem.mid}&mrcount=${mo.mrcount}'" >판매하러가기</button>
	 </c:if>
	
	</c:forEach>
	
	
	 <div id="paging">
		   		 <a <c:if test="${paging.currentPage ne 1 }">href="${conPath }/Product/productList.do?pageNum=1"</c:if>><<</a>
		   		 
		    		<a <c:if test="${paging.startPage > paging.blockSize }">href="${conPath }myMorderList.do?mid=${mem.mid }&pageNum=${paging.startPage-1}" style="color: blue"</c:if> >이전</a>
		    	
		    	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		    		<c:if test="${paging.currentPage==i }">
		    			<b>${i }</b>
		    		</c:if>
		    		<c:if test="${paging.currentPage!=i }">
		    			<a href="${conPath}/myMorderList.do?mid=${mem.mid }&pageNum=${i}">${i } </a>
		    		</c:if>
		    	</c:forEach>
		    	
		    		<a <c:if test="${paging.endPage<paging.pageCnt }">href="${conPath }/myMorderList.do?mid=${mem.mid }&pageNum=${paging.endPage+1}" style="color: blue"</c:if>>다음</a>
		    	
		    	<a <c:if test="${paging.currentPage ne paging.pageCnt }">href="${conPath }/myMorderList.do?mid=${mem.mid }&pageNum=${paging.pageCnt}"</c:if>>>></a>
    </div>
</body>
</html>