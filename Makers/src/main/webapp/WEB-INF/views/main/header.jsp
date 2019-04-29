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
<link href="${conPath}/css/header.css" rel="stylesheet" type="text/css">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			$('#loginPage').removeAttr("style");
		});
		
		$('#login_RC').click(function() {
			$('#loginPage').removeAttr("style");
		});
		
		$('.blackpaper').click(function() {
			$('#loginPage').attr("style", "display:none;");
		});
		
		$('#msgto').click(function() {
			$('#msgPage').removeAttr("style");
			$.ajax({
				url:'${conPath}/msgListView.do',
				data:'mid=${mem.mid}',
				datatype:'html',
				type:'post',
				success:function(data){
					$('#msgPage').html(data);
				}
			});
		});
		$('#msgfrom').click(function() {
			$('#msgPage').removeAttr("style");
			$.ajax({
				url:'${conPath}/msgListView.do',
				data:'mid2=${mem.mid}',
				datatype:'html',
				type:'post',
				success:function(data){
					$('#msgPage').html(data);
				}
			});
		});
		
		$('#logOut').click(function(){
			$.ajax({
				url:'${conPath}/logout.do',
				type:'post',
				success:function(){
					location.reload();
				}
			});
		});
	});
	
</script>
</head>
<body>

	<div id="header">

		<div id="nav">

			<div id="n_name">

				<a href="${conPath}/main.do">HOME</a>

			</div>

			<c:if test="${empty mem && empty adm}">

				<div id="n_menu">

					<ul>
						<li><a id="login">LOGIN</a></li>
						
						<li><a href="${conPath}/joinView.do">JOIN</a></li>
						

						<li><a>BOARD</a>
							<ul>
								<li><a href="${conPath}/FreeBoard/fblist.do">FREE</a></li>
								<li><a href="${conPath}/QnA/qnaList.do">QnA</a></li>
							</ul>
						</li>

						<li><a>ALL</a>
							<ul>
								<li><a href="${conPath}/Item/itemBoardList.do">ITEM</a></li>
								<li><a href="${conPath}/Product/productList.do">PRODUCT</a></li>
								<li><a href="${conPath}/getMorderAllPaging.do">MOD</a></li>
							</ul>
						</li>

					</ul>

				</div>

			</c:if>





			<c:if test="${not empty mem}">

				<div id="n_menu">

					<ul>
					
					<li>
						<a id="msgto">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</a>
					</li>
					<li>
						<a id="msgfrom">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</a>
					</li>
					<li><a href="#header"><span id="logOut">LOGOUT</span></a></li>
					
						<li><a href="${conPath}/myInfoView.do">MY INFO</a></li>

						<li><a>BOARD</a>
							<ul>
								<li><a href="${conPath}/FreeBoard/fblist.do">FREE</a></li>
								<li><a href="${conPath}/QnA/qnaList.do">QnA</a></li>
							</ul>
						</li>

						<li><a>ALL</a>
							<ul>
								<li><a href="${conPath}/Item/itemBoardList.do">ITEM</a></li>
								<li><a href="${conPath}/Product/productList.do">PRODUCT</a></li>
								<li><a href="${conPath}/getMorderAllPaging.do">MOD</a></li>
								<li><a href="${conPath}/myMorderList.do?mid=${mem.mid}">MyBluePrint</a></li>
								<li><a href="${conPath}/Cart/cartListView.do?mid=${mem.mid}">장바구니</a></li>
							</ul>
						</li>

					</ul>

				</div>


			</c:if>
			
			
			
			
			
			<c:if test="${not empty adm}">

				<div id="n_menu">

					<ul>
					
						<li><a href="${conPath}/logout.do">LOGOUT</a></li>
					
						<li><a href="${conPath}/memberListView.do">LIST</a></li>
						
						<li><a>BOARD</a>
							<ul>
								<li><a href="${conPath}/FreeBoard/fblist.do">FREE</a></li>
								<li><a href="${conPath}/QnA/qnaList.do">QnA</a></li>
								
							</ul>
						</li>

						<li><a>ALL</a>
							<ul>
								<li><a href="${conPath}/Item/itemBoardList.do">ITEM</a></li>
								<li><a href="${conPath}/Product/productList.do">PRODUCT</a></li>
								<li><a href="${conPath}/getMorderAllPaging.do">MOD</a></li>
								
							</ul>
						</li>

					</ul>

				</div>


			</c:if>


		</div>

	</div>
	
	
	<c:if test="${empty mem }">
		<div id="loginPage" style="display: none;">
			<jsp:include page="../every/loginView.jsp"/>
		</div>
		
		<div id="finePwPage" style="display: none;">
			<jsp:include page="../every/findPwView.jsp"/>
		</div>
	</c:if>
	
	<c:if test="${not empty mem }">
		<div id="msgPage" style="display: none;">
			 
		</div>
	</c:if>
	
	

</body>
</html>