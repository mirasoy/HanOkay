<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
	
<div class="container">


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
	             		<strong></strong>님
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
	<div class="col-lg-12">
		<div class="panel panel-default">
	


			<!-- /.panel-heading -->
			<div class="panel-body">
					<table
						class="table table-striped table-bordered table-hover bookList">
						<thead>
							<tr>
								<th>숙소이름</th>
								<th>예약번호</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>리뷰</th>
							</tr>
						</thead>


					</table>

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	
	</section>
	<!-- /.row -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
	//append로 리스트목록 붙이기
		<c:forEach items="${list }" var="rev">

		$(".bookList").append("<tr>");
		$(".bookList").append("<td><a href='/acm/get?type=&keyword=&person=1&in=&out=&acmNum=<c:out value="${rev.acmNum }" />'><c:out value="${rev.acmName }" /><a></td>");
		$(".bookList").append("<td ><c:out value="${rev.bookNum }" /></td>");
		$(".bookList").append("<td ><c:out value="${rev.checkInDay }" /></td>");
		$(".bookList")
				.append("<td ><c:out value="${rev.checkOutDay }" /></td>");

		if ("<c:out value="${rev.pstNum }" />" == "") {
			$(".bookList").append("<button class='button btn'><a href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</button></a>");
		} else {
			$(".bookList").append("<button class='button btn'><a href='/review/get?pstNum=<c:out value="${rev.pstNum }" />'>리뷰보기</button></a>");
		}

		$(".bookList").append("</tr>");

		</c:forEach>
	</script>
</body>
<%@include file="../includes/footer.jsp"%>

</html>