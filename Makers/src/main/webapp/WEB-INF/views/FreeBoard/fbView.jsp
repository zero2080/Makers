<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본문보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${conPath}/css/boardview.css" rel="stylesheet" type="text/css">

<script>
	$(document).ready(function() {  // 댓글리스트 불러오기
		$.ajax({
			url:'${conPath}/FbComment/fbcList.do',
			data:'fbnum=${fbView.fbnum}',
			datatype:'html',
			type:'get',
			success:function(data){
				$('#comment_Box').html(data);
			}
		});
	});
	
	function paging(pageNum) {  // 댓글페이징
		$.ajax({
			url:'${conPath}/FbComment/fbcList.do',
			data:'fbnum=${fbView.fbnum}&cpageNum='+pageNum,
			datatype:'html',
			type:'get',
			success:function(data){
				$('#comment_Box').html(data);
			}
		});
	}
	
	function wrComment() {
		var endPage =  $('#endp').val();
		var fbccontent = $('#fbccontent').val();
		if(fbccontent.length <1){
			return false;
		}
		$.ajax ({
			url : '${conPath}/FbComment/fbcWrite.do',
			data : 'fbnum=${fbView.fbnum}&mid=${mem.mid}&fbccontent='+fbccontent,
			datatype:'text',
			type:'get',
			success:function(data){
				paging(endPage);
				$('#fbccontent').val('');
			}
		});
	}
	
</script>
<style>
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>

    <div class="container boardViewCT">

		<div id="ViewBox">
	
			<form action="${conPath }/FreeBoard/fbView.do" method="post">
	
				<input type="hidden" name="pageNum" value="${param.pageNum}"> 
				<input type="hidden" name="fbnum" value="${fbView.fbnum}">
				<input type="hidden" name="fbcategory" value="${fbView.fbcategory}">
				<input type="hidden" name="fbip" value="${fbView.fbip}">
	
				<table class="table">
					<caption style="text-align: center; font-size : 2em; font-weight: bold;">제목 : ${fbView.fbtitle}</caption>
					
					<tr>
						<td>글번호</td>
						<td>${fbView.fbnum}</td>
					</tr>
					
					<tr>
						<td>등록일</td>
						<td>${fbView.fbdate}</td>
					</tr>
					
					<tr>
						<td>조회수</td>
						<td>${fbView.fbreadcount}</td>
					</tr>
	
					<tr>
						<td>작성자</td>
						<td>${fbView.mid}</td>
					</tr>
	
					<tr>
						<td>본문</td>
						<td><div>${fbView.fbcontent}</div></td>
					</tr>
	
					<tr>
						<td>첨부파일</td>
						<td><a href="${conPath }/freeboardFileUpload/${fbView.fbfile}">${fbView.fbfile}</a></td>
					</tr>
	
				</table>
	
			</form>
	
			<div class="btn_box">
				
				<c:choose>
				
					<c:when test = "${mem.mid eq fbView.mid && fbView.fbcategory eq 'FREE'}">
						<button class="board_btn focus" onclick = 
						"location='${conPath}/FreeBoard/fbmodifyView.do?fbnum=${fbView.fbnum }&pageNum=${param.pageNum }'">수정</button>
						<button type="button" class="board_btn focus"
						onclick="location='${conPath}/FreeBoard/fbDelete.do?fbnum=${fbView.fbnum}'">삭제</button>
					</c:when>
					
					<c:when test = "${not empty admin.aid && fbView.fbcategory eq 'NOTICE'}">
						<button class="board_btn focus" onclick = 
						"location='${conPath}/FreeBoard/fbmodifyView.do?fbnum=${fbView.fbnum }&pageNum=${param.pageNum }'">수정</button>
						<c:if test="${not empty admin.aid && fbView.fbcategory eq 'FREE'}">
							<button type="button" class="board_btn focus"
							onclick="location='${conPath}/FreeBoard/fbDelete.do?fbnum=${fbView.fbnum}'">삭제</button>
						</c:if>
					</c:when>
					
				</c:choose>
				
				<button type="button" class="board_btn focus"
					onclick="location='${conPath}/FreeBoard/fblist.do?pageNum=${param.pageNum}'">목록</button>
			</div>
	
		</div>
		
		<div id='comment_Box'></div>
		
		<div id='comment_WBox'>
		
			<table class="table fbwriteTB">
				
				<tr>
					<td class="ctw_left">
						<textarea id="fbccontent" name="fbccontent" required rows="5" cols="120"></textarea>
					</td>
					<td class="ctw_right">
						<button onclick="wrComment(${endPage});" style="width: 100px; height:100px;">
							<h1>
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</h1>
						</button>
					</td>
				</tr>
				
			</table>
		
		</div>
		
	</div>
		
	<!-- <div id="das"></div> -->
	
</body>
</html>