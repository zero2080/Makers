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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
var colorList = new Array();
	$(document).ready(function() {
		$(document).on('change','input[name=ctcount]', function() {
			var count = $(this).val();
			if(count < 0 || count>${pList.pcount}){
				$(this).val(0);
				alert('수량이 잘못되었습니다.');
				return false;
			}
		});
	}); 
	function buy() {
		var ctcount = Number($('input[name=ctcount]').val());
		var pcount = Number(${pList.pcount});
		if(ctcount <= pcount && ctcount>0){
			var mid = $('input[name=mid]').val()
			location.href='${conPath}/Cart/cartInsert.do?pnum=${pList.pnum }&mid='+mid+'&ctcount='+ctcount+'&buy=1'	 ;
		}else{
			alert('수량을 확인해주세요.');
			return false;
		}
	}
	function cart() {
		var ctcount = Number($('input[name=ctcount]').val());
		var pcount = Number(${pList.pcount});
		var mid = $('input[name=mid]').val()
		if(ctcount <= pcount  && ctcount>0){
			$.ajax({
				url : '${conPath}/Cart/cartInsert.do',
				data : 'pnum=${pList.pnum }&mid='+mid+'&ctcount='+ctcount+'&buy=0',
				type:'get',
				async: true,
				success:function(){
					alert("404가 떠야 정상인데?");
					$('input[name=ctcount]').val(0);
				},
				error:function(){
					alert("소매넣기 완료");
					$('input[name=ctcount]').val(0);
				}
			});
		}else{
			alert('수량 확인바람');
			return false;
		}
	}
	

</script>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<input type="hidden" name="mid" value="${mem.mid }">
 
 <div class="container">
	<div class="header">
		<img alt="" src="${conPath }/inventory/icon/RingCraft.JPG" style="width:100%">
	</div>
	<div class="jumbotron">
	 	<h1>${pList.ptitle }</h1>
	 	<p class="lead">카테고리 : ${pList.pcategory } / 금액 : <fmt:formatNumber value="${pList.price }" pattern="#,###"/>원 / 제작자 : ${pList.mid } / 남은수량 : ${pList.pcount }</p>
	 	<span><input type="number" name="ctcount" style="width: 200px; height: 40px;" placeholder="수량"></span> <span><a class="btn
	 			 btn-lg btn-success" onclick="buy();" role="button">Get Item!</a> </span><span><a class="btn btn-lg btn-success" role="button" onclick="cart();">장바구니 넣기</a></span>
	</div>
	<div class="col-lg-20"><pre>${pList.pcontent }</pre></div>
	
	
</div>
		<div id="addTemp">
		
		</div>
	

		<button onclick="location.href='${conPath }/Product/productList.do?pageNum=${pageNum }'">목록으로 돌아가기</button>
		<%-- <c:if test="${not empty admin }"> --%>
		
		<%-- <c:if test="${member.mid eq list.mid }"> --%><button onclick="location.href='${conPath}/Product/productModifyView.do?pnum=${pList.pnum }&pageNum=${pageNum }'">수정</button>
		<button onclick="location.href='${conPath}/Product/productTrans.do?&pnum=${pList.pnum }&pageNum=${pageNum }'">삭제</button>
		<%-- </c:if> --%>
		<button onclick="location.href='${conPath}/Cart/cartListView.do?mid=${mem.mid }'">장바구니가기</button>
		
		<jsp:include page="${conPath }/prcView.do?pnum=${param.pnum }"/>
</body>
</html>