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
var pageNum = 1;
	$(document).ready(function(){
		var mid = $('input[name=mid]').val();
		$.ajax({
			url : '${conPath}/Cart/cartView.do',
			data : "mid="+mid+"&pageNum=1",
			type:'post',
			dataType:'html',
			success:function(data){
				$('#cartView').append(data);
				pageNum++;
			}
		});	
		
		$(document).on('change', 'input[name=ctcounts]', function () {//수량증가
			var ctcount = Number($(this).val());
			var i = $(this).attr('class');
			var mid = $('input[name=mid]').val();
			var pnum = $('#'+i).val();
			var pcount = Number($("."+i+'[name=pcount]').val());
			alert("ctcount = "+ctcount+", i = "+i+"pcount = "+pcount);
			if( pcount >= ctcount){
				if(ctcount <= 0){
					ctcount = 1;
					$(this).val(1);
					alert('최소 수량은 1개 이상입니다.');
					return false;
				}
			}else if(pcount < ctcount){
				ctcount = pcount; 
				$(this).val(pcount);
				alert('상품이 부족합니다.');
				return false;
			}
			
			$.ajax({
				url : '${conPath}/Cart/cartCountUp.do',
				data : "ctcount="+ctcount+"&pnum="+pnum+"&mid="+mid,
				type:'get',
				async: false,
				success:function(){
					ajaxRun(mid);
				},
				error:function(){
					ajaxRun(mid);
				}
			});	
		});
		
	});
	var chk=0;
	function chkAll() {
		
		if(chk==0){
			$("input[name=ctnum]:checkbox").each(function() {
	
				$(this).attr("checked", true);
				
			});
			chk=1;
		}else{
			$("input[name=ctnum]:checkbox").each(function() {
				
				$(this).attr("checked", false);
				
			});
			chk=0;
		}
	}
	var ctnum = new Array();
	function cartBuy() {
		
		var mid = $('input[name=mid]').val();
		$('input:checkbox:checked').each(function(index) {
			ctnum.push($(this).val());
		})
		if(ctnum.length > 0){
		location.href="${conPath}/Cart/cartBuy.do?ctnum="+ctnum+"&buy=2&mid="+mid;
		}else{
			alert('1개 이상 선택 후 주문가능합니다.');
			return false;
		}
	}
	



    $(window).scroll(function() {
    	var mid = $('input[name=mid]').val();
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        	$.ajax({
    			url : '${conPath}/Cart/cartView.do',
    			data : "mid="+mid+"&pageNum="+pageNum,
    			type:'get',
    			dataType:'html',
    			success:function(data){
    				$('#cartView').append(data);
    				pageNum++;
    			
    			}
        	});	
    	}
       }); 
    $(document).on('click','.deleteCart' ,function() {
    	var ctnum = $(this).attr('name');
		alert(ctnum);
		var mid = $('input[name=mid]').val();
		$.ajax({
			url : '${conPath}/Cart/cartDelete.do',
			data : "mid="+mid+"&pageNum=1&ctnum="+ctnum,
			type:'get',
			success:function(data){
				ajaxRun(mid);
			}
    	});	
	});
    function ajaxRun(mid) {
    	
    	$.ajax({
			url : '${conPath}/Cart/cartView.do',
			data : "mid="+mid+"&pageNum=1",
			type:'get',
			dataType:'html',
			async: false,
			success:function(data){
				$('#cartView').html(data);
			
			}
    	});	
	}
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>


<div id="cartView">
	
 	
 </div>
    <div>
    <input type="hidden" name="mid" value="${mem.mid }">
     	<button onclick="chkAll();">모두 체크</button>
       	<button onclick="cartBuy();">주문하기</button>
    </div>
</body>
</html>