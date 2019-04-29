<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
<link href="${conPath}/css/writeSN.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(document).ready(function() {
    $('#summernote').summernote({    
    	width:750,
        height: 600,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,                  // set focus to editable area after initializing summernote});
        dialogsInBody:true
	});
});
</script>
<style>
</style>
</head>
<% String fbip = request.getRemoteAddr(); %>
	
	<jsp:include page="../main/header.jsp"/>

	<div id="container">
	<h1 class="page-header">글 수정</h1>
	<hr/>
	
		<form action="${conPath}/FreeBoard/fbModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mid" value="${member.mid }">
			<input type="hidden" name="fbip" value="<%= fbip%>">
			<input type="hidden" name="fbnum" value="${fbView.fbnum }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			
			<c:if test="${not empty mem}">
				<input type="hidden" name="fbcategory" readonly="readonly" value="FREE">
			</c:if>
			<c:if test="${not empty adm}">
				<input type="hidden" name="fbcategory" readonly="readonly" value="NOTICE">
			</c:if>
			
			<div class="form-group">
            	<input type="text" name="fbtitle" placeholder="제목" required="required" class="subject">
            	<div class="bf">
            	</div>
				<div class="col-sm-10">
				<textarea name="fbcontent" id="summernote" class="summernote">${fbView.fbcontent}</textarea>
				</div>
			</div>
		
			<div class="submit">
           		<input type="submit" class="btn btn-default" value="글수정">
           	</div>	
				
		</form>

	</div>

</body>
</html>