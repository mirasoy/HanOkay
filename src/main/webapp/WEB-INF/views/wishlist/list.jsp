<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
	String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >

<style>
.container{
padding: 0;
}

.contents-2 {
    margin-left: 45px;
 
    margin-top: 26px;

}

.fh5co-tours > div { /*컨테이너*/
    border-radius: 20px;}

</style>

<div class="container-1">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 관심 목록</h1>
			<p><%=userFstName %>님의 관심있는 여행지는 어디입니까? </p>
		</div>
	</div>



<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■사이드바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	
	<section class="sidebar">
	    <div class="sidebar_detail">	
	        <div class="sidebar-header">
	            <div class="user-pic"> <img src="${request.contextPath}/resources/img/user.jpg" alt="유저이미지"></div>
	            <div class="user-info">
	                <span class="user-name">	               
	             		<strong><%=userFstName%></strong>님
	                </span>
	                <span class="user-role">Administrator</span>
	                <span class="user-status">
	                    <i class="fa fa-circle"></i>
	                    <span>Online</span>
	                </span>
	            </div>
	        </div>
	        <button class="mypage_btn nav_btn">마이페이지</button>	     
	        <button class="noaccordion nav_btn">프로필</button>	        
	        <button class="accordion nav_btn">나의 예약</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>	              	              
	          </ul>
	        </div>
	        
	        <button class="accordion nav_btn">나의 리뷰</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/review/list">전체목록</a></li>
				<li class="item2"><a href="/review/writtenReviewlist">작성한 리뷰</a></li>
				<li class="item3"><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>             	              
	          </ul>
	        </div>           	            
	         <button class="noaccordion nav_btn nav_btn_last" onclick="location.href='/chat/chatList'">나의 채팅</button>	
	    </div>
	</section>
	

	<section class="contents">
		<section class="contents-2">
	
		<!-- Start : accommodation -->
		<div id="accommodation">
			<div class="container">
				<div class="row">
					<c:forEach items="${list}" var="board">
						<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
							data-animate-effect="fadeIn">
							<div href="#">
								<img src="../resources/img/place-1.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
								<div class="desc">
									<span></span>
									<h3><c:out value="${board.listTitle}" /></h3>
									<span><c:out value="${board.listContent}" /></span> <span class="price">$1,000</span>																
									<a href="${path}/wishlist/remove.do?wishNum=${board.wishNum}" id="deleteBtn" class="deleteBtn btn btn-outline">삭제</a>							
										
								</div>
							</div>
						</div>
					</c:forEach>											
				</div>
			</div>
		</div>
		<!-- End : accommodation -->	
	

		</section>
	</section>
	<!-- end of contents --> 


<div>
<!-- end of container-1 --> 







<script type="text/javascript" src="/resources/js/wishlist.js"></script>	
	<script>
		
	
		
	var deleteBtn = document.getElementsByClassName("deleteBtn");
	for(
			var i=0 ; i<deleteBtn.length ; i++
			){
		deleteBtn[i].onclick = function(e){			
		
			alert("삭제클릭")	;
		
		};	
	}
	
	
	</script>


	<%@include file="../includes/footer.jsp"%>