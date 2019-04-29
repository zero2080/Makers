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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 var index = -1;
 var auToggle = false;
 var stToggle=false;
 var mrnum = ${param.mrnum};
	$(document).ready(function(){
		
		$('.aucBtn').mouseover(function(){
			$(this).css('background-color','skyblue').css('transition','0.3s');
			if($(this).attr('name')==2  && '${mem.mid}'==$(this).children().eq(0).attr('id')){
				$(this).css('transition','all .4s ease');
				$(this).css('background-image','url("${conPath}/icon/truck-animation.gif")');
				$(this).css('background-size','110px');
				$(this).css('transform','rotateY(180deg)');
				
			}else if($(this).attr('name')==3 && ${mem.mid == mOrder.mid}){
				$(this).css('background-image','url("${conPath}/icon/box.png")');
				$(this).css('background-size','55px');
			} 
		});
		$('.aucBtn').mouseout(function(){
			if($(this).attr('name')<=1){
				$(this).css('background-color','white').css('transition','0.3s');
			}else if($(this).attr('name')==2){
				$(this).css('transition','all .4s ease');
				$(this).css('transform','rotateY(0deg)');
				$(this).css('background-image','url("${conPath}/icon/shakeHand.png")');
				$(this).css('background-size','81px');
				
			}else if($(this).attr('name')==3){
				$(this).css('background-image','url("${conPath}/icon/truck-animation.gif")');
				$(this).css('background-size','110px');
			}
		});
		$('.aucBtn').click(function(){
			
			index = $(this).parent().parent().index();
			var mid = '${mOrder.mid}';
			var mid2 = $(this).children().eq(0).attr('id');
			var acnum = $(this).attr('id');
			
			if($(this).attr('name')==2 && '${mem.mid}'==mid){
				alert('계약 체결 후 취소는 양측 합의 후 제작자 측에서 가능합니다.\r\n기타사항은 문의게시판을 이용해 주세요');
				return;
			}else if($(this).attr('name')==2 && '${mem.mid}'==mid2){
				if(confirm('배송처리(확인)\r\n계약파기(취소)')==true){
					if(confirm('배송처리 하시겠습니까?')==true){
						while(true){
							var mscontent = prompt('송장번호를 입력하세요');
							if (mscontent=='' || mscontent==' '){
								alert('유효한 데이터를 입력해 주세요');
							}else{
								break;
							}
						}
						deliveryResult(mid,mid2,acnum,mscontent,mrnum);
						$(this).attr('name',3);
						$(this).find('span').removeAttr('class');
						$(this).css('background-image','url("${conPath}/icon/truck-animation.png")');
						$(this).css('background-repeat','no-repeat');
						$(this).css('background-position','center');
						$(this).css('background-size','110px');
						$(this).css('transform','rotateY(0deg)');
					}
				}else if(confirm('일방적 계약 파기 시 불이익을 당할수 있습니다.\r\n계약을 파기하시겠습니까?(입찰 내역 삭제)')==true){
					delBid(acnum,mrnum);
				}
				return;
			}
			
			if($(this).attr('name')==3 && '${mem.mid}'==mid){
				if(confirm('제품을 받았습니다. 수령완료 처리 합니다.')==true){
					takeResult(acnum,mid,mid2,mrnum);
					$(this).attr('name',4);
					$(this).find('span').removeAttr('class');
					$(this).css('background-image','url("${conPath}/icon/box.png")');
					$(this).css('background-repeat','no-repeat');
					$(this).css('background-position','center');
					$(this).css('background-size','55px');
					$(this).css('transform','rotateY(0deg)');
				}
				return;
			}else if($(this).attr('name')==3 && '${mem.mid}'==mid2){
				alert('배송 중인 제품입니다.');
				return;
			}
			
			if($(this).attr('name')==4){
				alert('완료된 거래 입니다.');
				return;
			}
			
			
			$(this).css('background-color','skyblue').css('transition','0.3s');
			if($(this).attr('name')>0){
				auToggle=true;
			}
			if(auToggle==false){
				if('${mem.mid}'==mid2){
					if(confirm('선택하신 입찰을 철회(삭제)하시겠습니까?')==true){
						delBid(acnum,mrnum);
						$('#auTable tbody').children().eq(0).remove();
						$('#auTable tbody').children().eq(0).remove();
					}
				}else{
					if(confirm('입찰자를 선택하셨습니다. 진행하시겠습니까?')==true){
						confirmBid(acnum,mrnum);
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
				}
			}else{
				if('${mem.mid}'==mid){
					if(confirm('취소함? 진심?')==true){
						retractBid();
						for(var i = 0; i<$('#auTable tr').length;i++){
							if(i!=index && i-1 != index){
								$('#auTable tbody').children().eq(i).find('button').removeAttr('disabled' ).css('opacity','1');
								$('#auTable tbody').children().eq(i).css('opacity','1').css('border','0').removeAttr('style');
								$('#sortBar,#insertBidding').removeAttr('style');
								$('#insertBidding').attr('style','border-radius:20px;width:350px;');
								location.reload();
							}else{
								$('#auTable tbody').children().eq(i).css('border','0');
							}
						}
						toggle();
					}
				}else{
					if(confirm('거래를 승인하시겠습니까?(확인)\r\n'+
								'입찰을 철회 하시겠습니까?(취소)')==true){
						if(confirm('거래를 체결합니다.\r\n'+
								   '승인(확인) 시 납품일까지 납품이 완료 되어야 하며\r\n'+
								   '납품일이 지나면 활동에 악영향을 끼칠 수 있습니다.\r\n'+
								   '거래를 체결하시겠습니까?')==true){
							confirmOrder(acnum,mrnum);
							$(this).css('border-radius','50%');
							$(this).attr('name',2);
							$(this).find('span').removeAttr('class');
							$(this).css('background-image','url("${conPath}/icon/shakeHand.png")');
							$(this).css('height','80px');
							$(this).css('background-repeat','no-repeat');
							$(this).css('background-position','center');
						}
					}else if(confirm('입찰을 취소하시겠습니까?\r\n'+
									 '확인을 누르시면 입찰 내역이 삭제됩니다.')==true){
						console.log('acnum:'+acnum+'입찰 취소 삭제');
						delBid(acnum,mrnum);
						$('#auTable tbody').children().eq(0).remove();
						$('#auTable tbody').children().eq(0).remove();
					}
				}
			}
		});
		$('.sortBtn').click(function(){
			$('.sortBtn').css('background-color','#337AB7');
			$('.sortBtn').css('color','white');
			stToggle=false;
			if($(this).attr('id')==1 || $(this).attr('id')==2){
				if(stToggle==false){
					$(this).css('background-color','pink');
					$(this).css('color','black');
					stToggle=true;
				}
			}else if($(this).attr('id')==3 || $(this).attr('id')==4){
				if(stToggle==false){
					$(this).css('background-color','pink');
					$(this).css('color','black');
					stToggle=true;
				}
			}else if($(this).attr('id')==5 || $(this).attr('id')==6){
				if(stToggle==false){
					$(this).css('background-color','pink');
					$(this).css('color','black');
					stToggle=true;
				}
			}
			$.ajax({
				url:'${conPath}/bidList.do',
				datatype:'html',
				type:'post',
				data:'mrnum='+mrnum+'&sort='+$(this).attr('id'),
				success:function(data){
					$('#bidListWrap').html(data);
				}
			});
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
					$('#auTable tbody').children().find('button').attr('name',0);
				}
			});
		}
		
		function confirmOrder(acnum,mrnum){
			$.ajax({
				url:'${conPath}/confirmOrder.do',
				data:'acnum='+acnum+'&mrnum='+mrnum,
				datatype:'text',
				type:'get',
				success:function(data){
					console.log(data + ': confirmOrder OK');
				}
			});
		}
		
		function delBid(acnum,mrnum){
			$.ajax({
				url:'${conPath}/delBid.do',
				data:'acnum='+acnum+'&mrnum='+mrnum,
				datatype:'text',
				type:'get',
				success:function(data){
					console.log(data + ': delBid OK');
					location.reload();
				}
			});
		}
		
		function deliveryResult(mid,mid2,acnum,mscontent,mrnum){
			$.ajax({
				url:'${conPath}/deliveryResult.do',
				data:'mid='+mid+'&mid2='+mid2+'&acnum='+acnum+'&mscontent='+mscontent,
				datatype:'text',
				type:'post',
				success : function(result){
					if(result==2){
						alert('메세지 전송완료/배송처리 완료');
					}
				}
			});
		}
		
		function takeResult(acnum,mid,mid2,mrnum){
			$.ajax({
				url:'${conPath}/takeResult.do',
				data:'mid='+mid+'&mid2='+mid2+'&acnum='+acnum+'&mrnum='+mrnum,
				datatype:'text',
				type:'post',
				success:function(result){
					if(result==2){
						alert('메세지 전송완료/배송처리 완료');
					}
				}
			});
		}
		
		if(${mOrder.mrstatus} > 0){
			$('#sortBar,#insertBidding').css('display','none');
		}
		
		$('#insertBidding').click(function(){
			var bidWindow = window.open("insertBidingView.do?mrnum="+mrnum,"","width=400,height=450,left=600");
		});
	});
</script>
</head>
<body>
	<div class="container text-center" style="width:360px;overflow:hidden;padding:0;">
	<c:if test="${not empty mem && mem.mid != mOrder.mid}">
		<div class="row">
			<div class="col-md-12">
				<img id="insertBidding" src="${conPath }/icon/bidding.png" style="border-radius:20px;width:340px;margin:0 auto" class="btn btn-warning">
			</div>
		</div>
	</c:if>
		<div class="container" style="width:370px; height:500px; overflow:auto;">
			<div>
				<table class="table text-center" style="width:100%;margin:0;">
					<tr>
						<th class="info text-center" style="vertical-align:middle;">입찰건수</th>
						<td><span class="badge" style="font-size:1.5em;">${fn:length(bidList) }</span></td>
						<th class="info text-center"  style="vertical-align:middle;">시작일</th>
						<td style="vertical-align:middle;"><strong><fmt:parseDate value="${mOrder.mrdate }" var="mrdate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${mrdate }" pattern="yy/MM/dd HH:mm"/></strong></td>
					</tr>
					<tr>
						<th class="info text-center"  style="vertical-align:middle;">종료 일자</th>
						<td colspan="3"><fmt:parseDate value="${mOrder.mrenddate }" var="mrenddate" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${mrenddate }" pattern="yy년 MM월(E) dd일 HH시mm분"/></td>
					</tr>
					<tr>
						<th class="info text-center"  style="vertical-align:middle;">최저입찰가</th>
						<td colspan="3" class="text-center" style="font-size:2em;color:#53a0ed;"><strong><fmt:formatNumber value="${minPrice }" pattern="￦ #,###" /></strong></td>
					</tr>
					
				</table>
			</div>
			<c:if test="${not empty mem && mem.mid == bidList[0].mid && mOrder.mrstatus == 0}">
				<table id="sortBar" style="height:80px;line-height:30px;width:340px; overflow:hidden;margin:0;">
					<tr>
						<th colspan="2" class="text-center"><mark>BidDate</mark></th>
						<th colspan="2" class="text-center"><mark>Price</mark></th>
						<th colspan="2" class="text-center"><mark>Grade</mark></th>
					</tr>
					<tr>
						<td><button class="sortBtn btn btn-primary" id="1"><strong>오름</strong></button></td>
						<td><button class="sortBtn btn btn-primary" id="2"><strong>내림</strong></button></td>
						<td><button class="sortBtn btn btn-primary" id="3"><strong>오름</strong></button></td>
						<td><button class="sortBtn btn btn-primary" id="4"><strong>내림</strong></button></td>
						<td><button class="sortBtn btn btn-primary" id="5"><strong>오름</strong></button></td>
						<td><button class="sortBtn btn btn-primary" id="6"><strong>내림</strong></button></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${not empty mem}">
				<div id="bidListWrap">
					<table class="table" id="auTable">
						<tbody id="tbody">
							<c:forEach var ="i" items="${bidList }">
								<c:if test="${i.acstatus eq -1 && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover" style="background-color:#eee;opacity:0.5;">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center">
											<button class="aucBtn" id="${i.acnum }" style="outline:none;width:80px; background-color:white;border:0;border-radius:10px;opacity:0.5" disabled="disabled">
												<h2 id="${i.mid2 }"><span id="${i.mid }" class="glyphicon glyphicon-thumbs-up" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr style="background-color:#eee;opacity:0.5;">
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								<c:if test="${i.acstatus eq 0 && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center">
											<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px; background-color:white;border:0;border-radius:10px;">
												<h2 id="${i.mid2 }"><span id="${i.mid }" class="glyphicon glyphicon-thumbs-up" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr>
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								<c:if test="${i.acstatus == 1  && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover" style="border:3px solid skyblue;">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center" >
											<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px; background-color:white;border:0;border-radius:10px;">
												<h2 id="${i.mid2 }"><span id="${i.mid }" class="glyphicon glyphicon-thumbs-up" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr style="border:3px solid skyblue;"> 
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								<c:if test="${i.acstatus == 2  && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover" style="border:3px solid skyblue;">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center" >
											<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px;height:80px;background-color:skyblue;border:0;border-radius:50%;background-image:url('${conPath}/icon/shakeHand.png');background-repeat:no-repeat;background-position:center;">
												<h2 id="${i.mid2 }"><span id="${i.mid }" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr style="border:3px solid skyblue;"> 
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								<c:if test="${i.acstatus == 3  && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover" style="border:3px solid skyblue;">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center" >
											<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px;height:80px;background-color:skyblue;border:0;border-radius:50%;background-image:url('${conPath}/icon/truck-animation.gif');background-size:110px;background-repeat:no-repeat;background-position:center;">
												<h2 id="${i.mid2 }"><span id="${i.mid }" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr style="border:3px solid skyblue;"> 
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								<c:if test="${i.acstatus == 4  && (mem.mid eq i.mid || i.mid2==mem.mid)}">
									<tr class="table-hover" style="border:3px solid skyblue;">
										<td class="text-center">${i.mname }<code>G.${i.mgrade }</code></td>
										<td class="text-center"><code>
											<fmt:parseDate value="${i.acdate }" var="acdate" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${acdate }" pattern="yy/MM/dd HH:mm"/></code>
										</td>
										<td rowspan="2" class="text-center" >
											<button class="aucBtn" id="${i.acnum }" name="${i.acstatus }" style="outline:none;width:80px;height:80px;background-color:skyblue;border:0;border-radius:50%;background-image:url('${conPath}/icon/box.png');background-size:55px;background-repeat:no-repeat;background-position:center;">
												<h2 id="${i.mid2 }"><span id="${i.mid }" style="margin-top:-10px;border-radius:50%;background-color:white;"></span></h2>
											</button>
										</td>
									</tr>
									<tr style="border:3px solid skyblue;"> 
										<td class="text-center"><strong><fmt:formatNumber value="${i.acprice }" pattern="￦ #,###" /></strong></td>
										<td class="text-center"><fmt:parseDate value="${i.actimelimit }" var="limit" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${limit }" pattern="yy/MM/dd"/></td>
									</tr>
								</c:if>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>
