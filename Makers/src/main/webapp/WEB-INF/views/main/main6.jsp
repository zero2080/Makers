<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M A K E R S</title>
<link href="${conPath}/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	//무한스크롤

	$("#cover").click(function() {

		$("html, body").animate({
			scrollTop : 0
		}, 1000);

	});

	$(window).scroll(
			function() {
				if ($(window).scrollTop() == $(document).height()
						- $(window).height()) {
					$("#enters").append("<div id='infi'>1</div>");
				}
			});

	//리모컨

	$(document).scroll(function() {
		var con = $("#cover");
		var position = $(window).scrollTop();
		if (position > 50) {
			con.fadeIn(500);
		} else if (position < 50) {
			con.fadeOut(500);
		}
	});

	//리모컨 버튼

	var i = 0;
	function openClose() {

		if (i == 0) {
			document.getElementById("remoCon").style.width = "0px";
			i++;
		} else {
			document.getElementById("remoCon").style.width = "150px";
			i--; 
		}
	}
	
</script>
<style>

/* 
#slide_left {
	width: 70%;
	height: 100%;
}

#slide_right {
	width: 30%;
	height: 100%;
}

.slide_right_mini {
	width: 50%;
	height: 50%;
	float: left;
}

 */







</style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div id="back_img">

        <div id="container">

            <div id="wrap">

                <div id="content1">

                    <div id="top_img">
                    	M A K E R S
                    </div>

                    <div id="mk_bar"></div>

                    <div id="slide1">
                    
                    	<div id="slide_left">
	                    	<jsp:include page="main5.jsp" />
	                    </div>
	                    
	                    <!-- <div id="slide_right">
	                    	<div class="slide_right_mini">1</div>
	                    	<div class="slide_right_mini">2</div>
	                    	<div class="slide_right_mini">3</div>
	                    	<div class="slide_right_mini">4</div>
	                    </div> -->
                    
                    
                        <%-- <div id="slide2">
							<img src="${conPath}/teamIMG/악세사리1.jpg" style="width: 100%; height: 100%;"  onclick="location.href='${conPath}/getMorderAllPaging.do'">
						</div>
						
                        <div class="mini">
                        	<img src="${conPath}/teamIMG/반지1.jpg" style="width: 100%; height: 100%;">
                        </div>
                        
                        <div class="mini">
                        	<img src="${conPath}/teamIMG/반지2.jpg" style="width: 100%; height: 100%;">
                        </div>
                        
                        <div class="mini">
                        	<img src="${conPath}/teamIMG/반지3.jpg" style="width: 100%; height: 100%;">
                        </div>
                        
                        <div class="mini">
                        	<img src="${conPath}/teamIMG/반지4.jpg" style="width: 100%; height: 100%;">
                        </div>
                        	
                        <div class="big">
                        	<img src="${conPath}/teamIMG/반지7.jpg" style="width: 100%; height: 100%;">
                        </div> --%>
                    </div>
                </div>

                <div id="content2">

                    <div id="category_bar">

                        <div class="category_btn">최신</div>
                        <div class="category_btn">인기</div>
                        <div class="category_btn">평점</div>
                        <div class="category_btn">좋아요</div>
                        <div class="category_btn">장바구니최다</div>

                    </div>

                    <div class="longbox">
                        <div class="long"></div>
                        <div class="long"></div>
                        <div class="long"></div>
                    </div>

                    <div class="longbox">
                        <div class="long"></div>
                        <div class="long"></div>
                        <div class="long"></div>
                    </div>

                    <div class="longbox">
                        <div class="long"></div>
                        <div class="long"></div>
                        <div class="long"></div>
                    </div>
                </div>
            </div>
            
            
            
            <!-- 페이징 -->
            
            <div>
				<c:if test="${paging.startPage>paging.blockSize}">
					<a href="${conPath }/FreeBoard/fblist.do?pageNum=${paging.startPage-1 }">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<b>[ ${i} ]</b>
					</c:if>
					
					<c:if test="${paging.currentPage != i }">
						<a href="${conPath }/FreeBoard/fblist.do?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.endPage<paging.pageCnt }">
					<a href="${conPath }/FreeBoard/fblist.do?pageNum=${paging.endPage+1 }">다음</a>
				</c:if>
			</div>
            
            <!-- 페이징 끝 -->
            
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- 리모컨 -->


            <div id="cover">

                <button type="button" class="in_out" onclick="openClose();">★</button>

                <div id="remoCon">
                
                <c:if test="${empty mem && empty adm}">
                
                    <div id="sidecontent">
                    	<p>Hello</p>
                    </div>

                    <div id="rc_logo">
                    	<img src="${conPath}/icon/box.png" style="width: 90%; vertical-align: middle;">
                    </div>

                    <div class="rc_bar1"><a id="login_RC">LOGIN</a></div>
                    <div class="rc_bar1"></div>
                    <div class="rc_bar1"></div>
                    <div class="rc_bar1"></div>

				</c:if>
				
				
				
				<c:if test="${not empty mem || not empty adm}">
                
                    <div id="sidecontent">
                    	${mem.mname}님
                    </div>

                    <div id="rc_logo">
                    	<img src="${conPath}/icon/box.png" style="width: 90%; vertical-align: middle;">
                    </div>

                    <div class="rc_bar1"><a href="${conPath}/logout.do">LOGOUT</a></div>
                    <div class="rc_bar1"></div>
                    <div class="rc_bar1"></div>
                    <div class="rc_bar1"></div>

				</c:if>




                    <div class="rc_bar2">

                        <div class="rc_bar3">자유게시판</div>
                        <div class="rc_bar3">QnA</div>
                        <div class="rc_bar3">상품제작</div>
                        <div class="rc_bar3">상품리스트</div>
                        <div class="rc_bar3">내 정보</div>

                    </div>

                    <div id="gong">
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/2.2X3.jpg" style="width: 100%; height: 100%;">
                        </div>
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/agaa.png" style="width: 100%; height: 100%;">
                        </div>
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/earring.png" style="width: 100%; height: 100%;">
                        </div>
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/gaga.png" style="width: 100%; height: 100%;">
                        </div>
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/2.2x1.8.jpg" style="width: 100%; height: 100%;">
                        </div>
                        <div class="six_block">
                        	<img src="${conPath}/mOrderImage/2.6x2.9.jpg" style="width: 100%; height: 100%;">
                        </div>
                    </div>


                    <div id="updown">
                        <button type="button" class="updown_btn" onclick="location.href='#header'">
                            UP
                        </button>
                        <button type="button" class="updown_btn" onclick="location.href='#footer'">
                            DOWN
                        </button>
                    </div>

                </div>

            </div>

        </div>
        
        
        <!-- 리모컨 끝 -->

        <div id="enters"></div>



        <div id="container2">
            <div id="log"></div>
        </div>

        <jsp:include page="footer.jsp" />

    </div>

</body>
</html>
