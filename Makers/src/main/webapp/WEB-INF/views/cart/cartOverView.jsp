<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(window).ready(function() {
		
		
	});
	
</script>
</head>
<body>
<table>

<jsp:include page="../main/header.jsp"/>

<% int i = 0; %>
        <tr>
            <th>pnum</th><th>img</th><th>ptitle/mrtitle</th><th>ctcount</th>
        </tr>
      
        <c:forEach items="${cartList}" var="list" varStatus="idx">
	  		<input type="hidden" id="<%=i %>" name="pnum"  value="${list.pnum }" re>
	  		<input type="hidden" class="<%=i %>" name="pcount" value="${list.pcount }">
        	<tr>
        	<td>
        		<input type="checkbox" name="ctnum" class="<%=i %>" value="${list.ctnum }">
        	</td>
       			<td>
       			<a >${list.pnum }</a>
       			</td>
       			<td>
       			<img src="${conPath }/makeOderImg/${list.mrimg }" alt="${list.mrimg }" >
       			</td>
       			<td>
       			<a href="${conPath}/Product/productView.do?pnum=${list.pnum}&pageNum=${paging.currentPage}">${list.ptitle } / ${list.mrtitle }</a>
       			</td>
       			<td>
       			<span>단가 : <fmt:formatNumber value="${list.price }" pattern="#,###"/>원 </span>
       			</td>
       			<td>
       			<label>${list.ctcount }</label> 
       			</td>
       			<td>
       			<label>총 <fmt:formatNumber value="${list.price * list.ctcount }" pattern="#,###" />원</label>
       			</td>
       			
        	</tr>
        	 	
        </c:forEach>
       
     </table>
</body>
</html>