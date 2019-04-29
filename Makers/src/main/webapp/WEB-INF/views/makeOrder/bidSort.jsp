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
<script>
	$(document).ready(function(){
		$('.aucBtn').mouseover(function(){
			$(this).css('background-color','skyblue').css('transition','0.3s');
		});
		$('.aucBtn').mouseout(function(){
			$(this).css('background-color','white').css('transition','0.3s');
		});
		$('.aucBtn').click(function(){
			index = $(this).parent().parent().index();
			$(this).css('background-color','skyblue').css('transition','0.3s');
			if($(this).attr('name')>0){
				auToggle=true;
			}
			
			if(auToggle==false){
				if(confirm('선택함? 진심?')==true){
					confirmBid($(this).attr('id'));
					for(var i = 0; i<$('#auTable tr').length;i++){
						if(i!=index && i-1 != index){
							$('#auTable tbody').children().eq(i).find('button').attr('disabled',true);
							$('#auTable tbody').children().eq(i).attr('style','opacity:0.5').css('background-color','#eee');
							
						}else{
							$('#auTable tbody').children().eq(i).css('border','3px solid skyblue');
						}
					}
					toggle();
					$('#sortBar,#insertBidding').css('display','none');
				}
			}else{
				if(confirm('취소함? 진심?')==true){
					console.log('ajax로 나중에 추가됨');
					retractBid();
					for(var i = 0; i<$('#auTable tr').length;i++){
						if(i!=index && i-1 != index){
							$('#auTable tbody').children().eq(i).find('button').removeAttr('disabled' ).css('opacity','1');
							$('#auTable tbody').children().eq(i).css('opacity','1').css('border','0').removeAttr('style');
							$('#sortBar,#insertBidding').removeAttr('style');
							$('#insertBidding').attr('style','border-radius:20px;width:350px;');
						}else{
							$('#auTable tbody').children().eq(i).css('border','0');
						}
					}
					toggle();
				}
			}
		});
		
		function toggle(){				//입찰 확인 토글스위치
			if(auToggle==false){
				auToggle=true;
			}else{
				auToggle=false;
			}
		}
		
		function confirmBid(acnum){
			$.ajax({
				url:'${conPath}/confirmBid.do',
				datatype:'text',
				type:'get',
				data:'acnum='+acnum+'&mrnum='+mrnum,
				success:function(data){
					console.log(data);
				}
			});
		}
		
		function retractBid(){
			$.ajax({
				url:'${conPath}/retractBid.do',
				datatype:'text',
				type:'get',
				data:'mrnum='+mrnum,
				success:function(data){
					console.log(data+'개 입찰 초기화 완료');
				}
			});
		}
		if(${bidList[0].acstatus != 0} && ${bidList[1].acstatus != 0}){
			$('#sortBar,#insertBidding').css('display','none');
		}
	});
</script>
</head>
<body>
	<table class="table" id="auTable">
		<tbody id="tbody">
			<c:forEach var ="i" items="${bidList }">
				<tr class="table-hover">
					<td class="text-center">${i.mname }</td>
					<td class="text-center"><code>
						<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
					</td>
					<td rowspan="2" class="text-center">
						<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px; background-color:white;border:0;border-radius:10px;">
							<h2><span class="glyphicon glyphicon-thumbs-up" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
						</button>
					</td>
				</tr>
				<tr>
					<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
					<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>