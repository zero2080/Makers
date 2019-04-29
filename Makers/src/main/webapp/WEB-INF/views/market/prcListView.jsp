<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		var pageNum = ${paging.currentPage};
		var prcgroup = 0;
		var prcnum = 0;
		var content = '';
		var cutCon = '';
		var index = -1;
	/* -----------------------------------------QnA 추가------------------------------------------- */
		$('#moreComment').click(function(){
			pageNum += 1;
			$.ajax({
				url:'${conPath}/moreComment.do',
				type:'post',
				data:'pageNum='+pageNum,
				async: true,
				success:function(list){
					for(var i=0;i<list.length;i++){
						content = list[i].prccontent;
						cutCon = '';
						if(content.length>20){						//문자열 넘어가면 ...처리
							cutCon=content.substring(0,20)+'····';
						}else{
							cutCon=content
						};
							if(list[i].prcstep==0){					//원글
								console.log(list[i].prcstep);
								$('#tbody').append('<tr class="prcRow" data-toggle="modal" data-target=".bs-example-modal-lg" id="'+list[i].prcgroup+'" style="cursor:pointer">'
										+'<td class="text-center" id="'+list[i].prcnum+'">'+list[i].rn+'</td>'
										+'<td><input type="hidden" value="'+content+'">'+cutCon+'</td>'
										+'<td class="text-center"><code>'+list[i].mid+'</code></td>'
										+'<td class="text-center">'+list[i].prcdate+'</td>'
									   +'</tr>');
							}else if(list[i].prcstep==1){			//답글
								console.log(list[i].prcstep);
								$('#tbody').append('<tr class="prcRow" data-toggle="modal" data-target=".bs-example-modal-lg" id="'+list[i].prcgroup+'" style="cursor:pointer">'
										+'<td class="text-center" id="'+list[i].prcnum+'">'+list[i].rn+'</td>'
										+'<td>&nbsp; &nbsp; <img src="${conPath }/icon/reply.png"><input type="hidden" value="'+content+'">'+cutCon+'</td>'
										+'<td class="text-center"><code>'+list[i].mid+'</code></td>'
										+'<td class="text-center">'+list[i].prcdate+'</td>'
									   +'</tr>');
							}
							if(list[i].rn==${paging.total}){
								$('#moreComment').css('display','none');
							}
						}
				}
			});
		});
	/* ----------------------------------------- 글쓰기 ---------------------------------------------- */
		$('#prcWrite').click(function(){
			var mid = '${member.mid}';
			var prccontent = $('#prcontent').val();
			var pnum = 2;	//!!!!판매페이지랑 붙일때 고쳐야함 !!!! 제품번호 넘어올때 어떻게 넘어올지 정하면 해당 형식에서 제품번호를 추출해야함
			console.log(mid +' / '+prccontent+' / '+pnum);
			$.ajax({
				url:'${conPath}/prcWrite.do',
				type:'post',
				dataType:'text',
				data:'pnum='+pnum+'&mid='+mid+'&prccontent='+prccontent,
				success:function(data){
						var qnaTable =	'<tr class="prcRow" data-toggle="modal" data-target=".bs-example-modal-lg" id="'+prcgroup+'" style="cursor:pointer">'+
										'<td class="text-center">Now</td>'+
										'<td><input type="hidden" value="'+prccontent+'">'+prccontent+'</td>'+
										'<td class="text-center"><code>'+mid+'</code></td>'+
										'<td class="text-center">Now</td>'
										+'</tr>';
						if(data==true){
							if($('#tbody tr').length<=0){
								$('#tbody').append(qnaTable);
							}else{
								$('#tbody').children().eq(0).before(qnaTable);
							}
						}
					}
				});
			});
	
	/* -------------------------------- 답글쓰기 (!!!!!판매자 로그인시 로그인 ID와 판매자 아이디가 같을때만 실행되게 해야함!!!!!) ---------------------------------- */
		$(document).on('click','.prcRow', function(){
			prcgroup = $(this).attr('id');
			prcnum = $(this).children().eq(0).attr('id');
			index = $(this).index();
			var content = $(this).children().eq(1).find('input[type=hidden]').val();
			var writer = $(this).children().eq(2).text();
			var date = $(this).children().eq(3).text();
			if(prcnum==prcgroup){
				$('#selNo').text(prcgroup+'번 글');
			}else{
				$('#selNo').text(prcgroup+'번 글의 답변');
			}
			$('#selId').text(writer);
			$('#selContent').text(content);
			$('#selDate').text(date);
			
			if(writer=='${member.mid}' || ${not empty admin}){
				$('#prcDel').removeAttr("style");
			}else{
				$('#prcDel').attr("style","display:none");
			}
			
			console.log(prcgroup);
			console.log(content+' / '+writer);
		});
	
	/*---------------------------------답글 달기------------------------------------*/
		$('#replWrite').click(function(){
			var replContent = $('#replContent').val();
			var mid='${member.mid}';
			var pnum = 2;	//!!!!판매페이지랑 붙일때 고쳐야함 !!!! 제품번호 넘어올때 어떻게 넘어올지 정하면 해당 형식에서 제품번호를 추출해야함
			console.log('index = '+index);
			console.log(replContent+' / '+mid+' / '+pnum+' / '+prcgroup);
		  	$.ajax({
				url:'${conPath}/prcReply.do',
				dataType:'text',
				type:'post',
				data:'pnum='+pnum+'&mid='+mid+'&prcgroup='+prcgroup+'&prccontent='+replContent,
				success:function(data){
					if(data==true){
						$('#tbody').children().eq(index).after('<tr class="prcRow" data-toggle="modal" data-target=".bs-example-modal-lg" id="'+prcgroup+'" style="cursor:pointer">'+
																'<td class="text-center">Now</td>'+
																'<td>&nbsp; &nbsp; <img src="${conPath }/icon/reply.png"><input type="hidden" value="'+replContent+'">'+replContent+'</td>'+
																'<td class="text-center"><code>'+mid+'</code></td>'+
																'<td class="text-center">Now</td>'
																+'</tr>');
						$('#replContent').val('');
					}
				} 
			});
		});
	
		/*---------------------------------글 삭제------------------------------------*/
		$('#prcDel').click(function(){
			console.log('log(del):'+prcgroup+'/'+prcnum);
			$.ajax({
				url:'${conPath}/prcDel.do',
				dataType:'text',
				type:'post',
				data:'prcgroup='+prcgroup+'&prcnum='+prcnum,
				success:function(data){
					console.log('삭제');
					$('#tbody').children().eq(index).remove();
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<c:if test="${not empty member }">
			<table class="table table=striped table-hover">
				<tr>
					<th class="text-center">ID</th><th class="text-center">내용</th><th class="text-center">확인</th>
				</tr>
				<tr>
					<td class="text-center" style="vertical-align:middle;">${member.mid }<input type="hidden" value="${member.mid }"></td>
					<td><textarea  class="form-control" name="prcontent" id="prcontent" rows="4" cols="100"></textarea></td>
					<td class="text-center" style="vertical-align:middle;"><input class="btn btn-warning" id="prcWrite" type="button" value="올리기"></td>
				</tr>
			</table>
		</c:if>
		<div class="table-responsive" id="comment">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="text-center">No</th><th class="text-center">내용</th><th class="text-center">작성자</th><th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach var="prc" items="${prcList }">
						<tr class="prcRow" data-toggle="modal" data-target=".bs-example-modal-lg" id="${prc.prcgroup}" style="cursor:pointer">
							<td class="text-center" id="${prc.prcnum }">${prc.rn}</td>
							<td>
								<c:if test="${prc.prcstep eq 0 }">
									<input type="hidden" value="${prc.prccontent}">
									${fn:substring(prc.prccontent,0,20)}<c:if test="${fn:length(prc.prccontent)>20}">····</c:if>
								</c:if>
								<c:if test="${prc.prcstep eq 1 }">
									&nbsp; &nbsp; <img src="${conPath }/icon/reply.png">
									<input type="hidden" value="${prc.prccontent}">
									${fn:substring(prc.prccontent,0,20)}
									<c:if test="${fn:length(prc.prccontent)>20}">····</c:if>
								</c:if>
							</td>
							<td class="text-center"><code>${prc.mid}</code></td>
							<td class="text-center">${prc.prcdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="text-center">
			<button type="button" id="moreComment" class="btn btn-primary">더보기</button>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="container-fluid" <c:if test="${not empty member }">style="height:385px;"</c:if>
	      								<c:if test="${empty member }">style="height:200px;"</c:if>>		<!-- 합칠때 상품 판매자 ID와 비교하여 판매자만 답글을 달 수 있게 해야함!!!!!! -->
	      		<div class="row" style="height:30px;margin-top:10px;">
					<div class="clearfix col-md-3 text-center"><strong>ID</strong></div><div class="clearfix col-md-7 text-center"><strong>내용</strong></div><div class="clearfix col-md-2 text-center"><strong>작성일</strong></div>
				</div>
				<div class="row" style="height:110px;">
					<div class="clearfix col-md-3 text-center align-self-center"><h2><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></h2><span class="glyphicon-class"><code id="selNo"></code><br><code id="selId"></code></span></div>
					<div class="clearfix col-md-7 "><div style="background-color:#eee;"><span style="white-space: pre-line;" id="selContent"></span></div></div>
					<div class="clearfix col-md-2 text-center" style="line-height:110px;" id="selDate"></div>
				</div>
				<div class="row" style="height:20px;">
					<div class="col-md-4 text-left"></div>
					<div class="col-md-4 text-center"><button class="btn btn-default" id="prcDel" style="display:none;">Delete</button></div>
					<div class="col-md-4 text-right"><code>^-^</code></div>
				</div>
				<c:if test="${not empty member }">
					<hr>
					<div class="row" style="height:30px;">
						<div class="clearfix col-md-3 text-center"><strong>Reply</strong></div><div class="clearfix col-md-7 text-center"><strong>내용</strong></div><div class="clearfix col-md-2 text-center"><strong>확인</strong></div>
					</div>
					<div class="row" style="height:110px;">
						<div class="clearfix col-md-3 text-center align-self-center"><h2><span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span></h2><span class="glyphicon-class">Reply</span><input type="hidden" value="${member.mid }"></div>
						
						<div class="clearfix col-md-7 "><textarea id="replContent" class="form-control" rows="4" id=""></textarea></div>
						<div class="clearfix col-md-2 text-center" style="vertical-align:middle;"><input style="width:100%;height:94px;" class="btn btn-warning" data-dismiss="modal" id="replWrite" type="button" value="올리기"></div>
					</div>
					<div class="row" style="height:20px;">
						<div class="col-md-12 text-right"><code>Reply only admin account</code></div>
					</div>
				</c:if>
			
	    </div>
	  </div>
	</div>
	
</body>
</html>