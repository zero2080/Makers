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
<script>
	$(window).ready(function() {
		
		
	});
	
</script>
</head>
<body>

<div>
 <table>
  <tr>
      <td>
      	<span>수취인</span> <input type="text" name="orname" readonly="readonly" required="required" value="${pList.orname }" >
      </td>
  </tr>
  <tr>
      <td>
      	<span>주소 api 예정</span> <input type="text" name="oraddr" readonly="readonly" required="required" value="${pList.oraddr }" >
      </td>
  </tr>
  <tr>
      <td>
      	<span>주소 api 예정</span> <input type="text" name="orpost" readonly="readonly" required="required" value="${pList.orpost }">
      </td>
  </tr>
  <tr>    
      <td>
      		주문 상품
      </td>
  </tr>
  <c:forEach var="c" items="${cartList}">
  <tr>    
      <td>
      		<span>${c.ptitle }/${c.mrtitle }</span>
      </td>
       <td>
      		<span>${c.ctcount }/${c.pcount }</span>
      </td>
      <td>
      	<img src="${conPath }/makeOderImg/${c.mrimg}" alt="${c.mrimg}">
      </td> 
  </tr>
  </c:forEach>
  	<tr>
       <td>    
       <button onclick="location.href='${conPath}/Product/productList.do'">쇼핑계속하기</button>
       <button onclick="location.href='${conPath}/Cart/cartView.do?mid=${mem.mid }'">장바구니</button>
       </td>
    </tr>
  </table>
</div>
</body>
</html>