<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/msg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		var msnums=new Array;	//체크박스 체크된 글번호 배열 저장
		$('.blackpaper').click(function() {
			$('#msgPage').attr("style", "display:none;");
		});
		
		$('.chk').click(function(){
			var temMsnum = $(this).parent().children().eq(1).find('input[type=hidden]').val();
			if($(this).find('input[type="checkbox"]').is(":checked")){
				var i = 0;
				while(true){
					if(msnums.length!=0 && msnums[i]==temMsnum){
						break;
					}else{
						msnums.push(temMsnum);
					}
					if(i<msnums.length){
						break;
					}
					i++;
				}
			}else{
				for(var i =0; i<msnums.length;i++){
					if(msnums[i]==temMsnum){
						msnums.splice(i, 1);
					}
				}
			}
		});
		
		$('#write').click(function(){
			var write = window.open("msgWriteView.do","","width=400,height=400,left=600");
		});
		
		$('.msg').click(function(){
			var msnum = $(this).parent().children().eq(1).find('input[type=hidden]').val();
			if(${empty param.mid}){ 
				var write = window.open("msgTView.do?msnum="+msnum,"","width=400,height=400,left=600");
				$(this).parent().children().eq(3).text('확인');
			}else if(${empty param.mid2}){
				var write = window.open("msgView.do?msnum="+msnum,"","width=400,height=400,left=600");
			}
		});
		
		$('#delMs').click(function(){
			if(msnums.length==0){
				alert('삭제할 메세지를 체크해 주세요.');
				return;
			}else{
				if(confirm('선택한 '+msnums.length+'개의 메세지를 삭제하시겠습니까?')==true){
					$.ajax({
					    url : '${conPath}/msgsDel.do',
					    traditional : true,
					    data : 'msnums='+msnums+'&mid=${mem.mid}&mid2=${mem.mid}',
					    success : function(data) {
					    	alert(msnums.length+'개 메세지 삭제완료');
					    	window.location.reload();
					    },
					    error : function(request, status, error) {
					        alert(error);
					    }
					});
				}
			}
		});
		
		$('.msgPaging').click(function(){
			var param = $(this).attr('id');
			$.ajax({
				url:'${conPath}/msgListView.do',
				data:param,
				datatype:'html',
				type:'post',
				success:function(data){
					$('#msgPage').append(data);
				}
			});
		});
	});
</script>
</head>
<body>
	
	<div>

		<div class="blackpaper">
	    </div>
		
		<div id="msgbox">
		
		<div class="container msgCT">
			<form>
				<table class="table msgTB">
					<tr>
						<c:if test="${not empty param.mid }">
								<th>to ID</th>
							</c:if>
							<c:if test="${empty param.mid }">
								<th>from ID</th>
							</c:if>	
						<th>content</th>
						<th>msdate</th>
						<th>Read</th>
						<th>Check</th>
					</tr>
					<c:forEach var="msg" items="${msgList }">
						<tr>
							<c:if test="${not empty param.mid }">
								<td class="msg one" style="cursor:pointer;">${msg.mid2 }</td>
							</c:if>
							<c:if test="${empty param.mid }">
								<td class="msg one" style="cursor:pointer;">${msg.mid }</td>
							</c:if>		
							<td class="msg two" style="cursor:pointer;">
								<input type="hidden" value="${msg.msnum }" name="msnum">
								${fn:substring(msg.mscontent,0,10)}<c:if test="${fn:length(msg.mscontent)>10}">····</c:if></td>
							<td class="msg three" style="cursor:pointer;">${msg.msdate }</td>
							<td class="msg four" style="cursor:pointer;">
								<c:if test="${msg.mstostatus==0 }">
									미확인
								</c:if>
								<c:if test="${msg.mstostatus==1 }">
									확인
								</c:if>
								<c:if test="${msg.mstostatus==2 }">
									확인(삭제)
								</c:if>
							</td>
							<td class="chk five"><input type="checkbox" name="selectMsnum"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<button id="write">메세지작성</button>
			<button id="delMs">삭제</button>
			
			
			<div class="btn-toolbar" role="toolbar" style="height: 500px;">
				<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
					<c:choose >
					
						<c:when test="${empty param.mid}">		<!-- 내가 보낸 메세지 -->
							
							<c:if test="${paging.startPage>paging.blockSize}">
								<button class="msgPaging btn btn-default" id="pageNum=${paging.startPage-1}&mid2=${param.mid2}">
								  	이전
								</button>
							</c:if>
							
							<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
								<c:if test="${paging.currentPage==i }">
									<button class="btn btn-default" disabled="disabled">${i}</button>
								</c:if>
								<c:if test="${paging.currentPage != i}">
									<button class="msgPaging btn btn-default" id="pageNum=${i}&mid2=${param.mid2}">
										${i}
									</button>
								</c:if>\
							</c:forEach>
							
							<c:if test="${paging.endPage<paging.pageCnt}">
								<button class="msgPaging btn btn-default" id="pageNum=${paging.startPage+1}&mid2=${param.mid2}">
									다음
								</button>
							</c:if>
										
						</c:when>
					
					
						<c:when test="${empty param.mid2}">		<!-- 내가 받은 메세지-->
							
							<c:if test="${paging.startPage>paging.blockSize}">
								<button class="msgPaging btn btn-default" id="pageNum=${paging.startPage-1}&mid=${param.mid}"">
								  	이전
								</button>
							</c:if>
							
							<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
								<c:if test="${paging.currentPage==i}">
									<button class="btn btn-default" disabled="disabled" >${i}</button>
								</c:if>
								<c:if test="${paging.currentPage != i}">
									<button class="msgPaging btn btn-default" id="pageNum=${i}&mid=${param.mid}">
										${i}
									</button>
								</c:if>
							</c:forEach>
							
							<c:if test="${paging.endPage<paging.pageCnt}">
								<button class="msgPaging btn btn-default" id="pageNum=${paging.startPage+1}&mid=${param.mid}">
									다음
								</button>
							</c:if>
										
						</c:when>
						
					</c:choose>
				</div>	
			</div>
			
			</div>
		
		</div>
	
	</div>

</body>
</html>