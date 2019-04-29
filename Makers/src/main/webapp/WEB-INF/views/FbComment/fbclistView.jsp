<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/boardViewCT.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	$(document).ready(function() {
		
	});
	function delCom(fbcNum){
		$.ajax({
			url : '${conPath}/FbComment/fbcDelete.do',
			data : 'fbcnum='+fbcNum,
			type:'get',
			success:function(){
				paging(${cpaging.currentPage});
			}
		});
	}
</script>
<style>
</style>
</head>
<body>

	<!-- 댓글리스트 -->

	<div id="comment_list" class="container fbcCT">
	
		<table class="table table-striped fbcTB">
			
			<c:forEach var="c" items="${fbcList}">
				<tr>
					<td class="cm_one">${c.mid}</td>
					<td class="cm_two">${c.fbcdate}</td>
					<td class="cm_three">
						<c:if test = "${mem.mid eq c.mid}">
							<span class="glyphicon glyphicon-remove" aria-hidden="true" onclick="delCom(${c.fbcnum})">
							</span>
						</c:if>
					</td>
					
				</tr>
				
				<tr>
					<td colspan="3" class="cm_four">${c.fbccontent}</td>
				</tr>
				
			</c:forEach>
			
		</table>
		
		
		
		<!-- ****************************************************************************** -->
		<!-- 페이징 -->
		
		
		
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group text-center" role="group" style="left: 50%; margin-left: -181px;">
				<c:if test="${cpaging.startPage>cpaging.blockSize}">
					<button class="btn btn-default" onclick="paging(${cpaging.startPage-1 })">
					  	이전
					</button>
				</c:if>
				<c:forEach var="c" begin="${cpaging.startPage}" end="${cpaging.endPage}">
					<c:if test="${cpaging.currentPage == c }">
						<button class="btn btn-default">${c}</button>
					</c:if>
					<c:if test="${cpaging.currentPage != c }">
						<button class="btn btn-default" onclick="paging(${c})">
							${c}
						</button>
					</c:if>
				</c:forEach>
				<c:if test="${cpaging.endPage<cpaging.pageCnt }">
					<button class="btn btn-default" onclick="paging(${cpaging.endPage+1 })">
						다음
					</button>
				</c:if>
			</div>
		</div>
		
		<input type="hidden" id="endp" value="${cpaging.endPage }">
		
	</div>
	
	
</body>
</html>