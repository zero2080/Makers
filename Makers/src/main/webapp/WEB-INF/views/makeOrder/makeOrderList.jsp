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
<style>
td:hover{
	background-color:#eee;
	cursor:pointer;
}

.mod_top {
	margin-top: 5%;
}
</style>
<script>
	$(document).ready(function(){
		var pageNum = 3;
		$(window).scroll(function() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {									//스크롤 위치 최하 감지
				if(pageNum<=${paging.pageCnt*2}){			//최초 2줄 (8개 상품) 노출 후 1줄(4개 상풍) 씩 노출하기 위해 pageCnt*2를 함	//pageNum이 마지막 페이지번호 보다 작으면 ajax 작동
					$('.table-striped tbody').append('<tr id="loading"><td colspan="4"><h1>로딩중</h1></td></tr>');
					var temPn = pageNum;						//로딩중에 ajax중복 호출 방지
					pageNum = ${paging.pageCnt*2}+1;			//위 if문에서 못들어옴
					
					$.ajax({
						url:'${conPath}/moreMorder.do',
						data:'pageNum='+temPn,
						datatype:'html',
						type:'post',
						success:function(list){
							$('#loading').remove();				//로딩페이지 삭제
							console.log('ajax통신 완료');
							var tempMorder ='<tr>';
							for(var i = 0; i<list.length;i++){
								tempMorder+='<td style="width:25%;overflow:hidden;">'
												+'<div class="text-center">'
													+'<div style="height:220px;">'
														+'<a href="${conPath}/makeOrderView.do?mrnum='+list[i].mrnum+'">'
															+'<img src="${conPath }/mOrderImage/'+list[i].mrimg+'" class="img-thumbnail" style="width:100%;">'
														+'</a>'
													+'</div>'
													+'<div style="vertical-align:low;margin-top:3px;">'
														+'<code>'+list[i].mrdate.substring(2,16)+'</code> ‡ '
														+'<code>납기'+list[i].mrtimelimit.substring(2,10)+'</code>'
													+'</div>'
												+'</div>'
											+'</td>';
								}	//for문 끝
							pageNum = temPn;
							$('.table-striped tbody').append(tempMorder+'</tr>');
							pageNum++;														//다음 페이지를 위해 pageNum 1증가
							}	//success 끝
					});		//ajax끝
				}			//if문 끝
			}				//스크롤 하단 감지 끝
		});					//스크롤 감지 끝
		function makeOrderView(mrnum){
			location.href="../makeOrderView.do?mrnum="+mrnum;
		}
	});
</script>
</head>
<body>
	<header><jsp:include page="../main/header.jsp"/></header>
	<div class="container mod_top" style="width:1000px;">
	
		<section>
			<div id="makeItem" style="overflow:hidden;height:500px;cursor:pointer;">
				<a href="${conPath }/mOrderWriteView.do"><img src="${conPath }/icon/makeItemBack_02.png" style="width:100%;"></a>
			</div>
			<hr>
			<div>
				<table class="table table-striped">
					<tbody>
						<c:forEach var="page" begin="0" end="${paging.blockSize-1}" step="1">
							<tr>
								<c:forEach var="mo" begin="0" end="3" step="1">
									<c:if test="${not empty mOrderList[page*paging.blockSize+mo] }">
										<td style="width:25%;overflow:hidden;">
											<div class="text-center">
												<div style="height:220px;">
													<a href="${conPath }/makeOrderView.do?mrnum=${mOrderList[page*paging.blockSize+mo].mrnum}">
														<img src="${conPath }/mOrderImage/${mOrderList[page*paging.blockSize+mo].mrimg}" class="img-thumbnail" style="width:100%;">
													</a>
												</div>
												<div style="margin-top:3px;">
												<code><fmt:parseDate value="${mOrderList[page*paging.blockSize+mo].mrdate}" var="mrdate" pattern="yyyy-MM-dd HH:mm:ss"/>
													  <fmt:formatDate value="${mrdate }" pattern="yy-MM-dd HH:mm"/></code> ‡
												<code>납기<fmt:parseDate value="${mOrderList[page*paging.blockSize+mo].mrtimelimit}" var="mrdate" pattern="yyyy-MM-dd HH:mm:ss"/>
														  <fmt:formatDate value="${mrdate }" pattern="yy-MM-dd"/></code>
												</div>
											</div>
										</td>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>
</body>
</html>