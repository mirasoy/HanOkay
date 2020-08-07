<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>

.columns-r {
  float: left;
  width: 33.3%;
  padding: 8px;
}

.acmname {
  list-style-type: none;
  border: 1px solid #eee;
  margin: 0;
  padding: 0;
  -webkit-transition: 0.3s;
  transition: 0.3s;
}

.acmname:hover {
  box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.acmname .header-r {
  background-color: #111;
  color: white;
  font-size: 25px;
  overflow: hidden;
  padding: 0;

}

.acmname li {
  border-bottom: 1px solid #eee;
  padding: 8px;
  text-align: center;
}

.acmname .grey {
  background-color: #eee;
  font-size: 25px;
  white-space: nowrap;
    overflow: hidden;
}

.button-r {
  background-color: #61dafb;
  border: none;
  color: white;
  font-weight: bold;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
}
.button-rv {
  background-color: #fb8561;
  border: none;
  color: white;
  font-weight: bold;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
}


@media only screen and (max-width: 600px) {
  .columns-r {
    width: 100%;
  }
}
</style>
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
					<div
						class="bookList">
					</div>
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
		var str = "";
		var reviewYN = "";
		if ("<c:out value="${rev.pstNum }" />" == "") {
			reviewYN = "<li class='grey'><a class='button-r' href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</a></li>"
		} else {
			reviewYN = "<li class='grey'><a class='button-rv' href='/review/get?pstNum=<c:out value="${rev.pstNum }" />'>리뷰보기</a></li>"
		}

		
		str += '<div class="columns-r">'
		str += ' <ul class="acmname">'
		str += ' <li class="header-r">'
		str +=	'<img style=" width: auto; height: 270px; max-width: 500px; " id="rPicture" src="/review/display?fileName=<c:out value="${rev.acmpurl }" /><c:out value="${rev.acmpname }" />">'
		str += '</li><li class="grey"><c:out value="${rev.acmName }" /></li>'
		str += '<li><h5>체크인</h5><c:out value="${rev.checkInDay }" /></li>'
		str += '<li><h5>체크아웃</h5><c:out value="${rev.checkOutDay }" /></li>'
		str += reviewYN
		str += ' </ul>'
		str += ' </div>'

		$(".bookList").append(str);
	

		
		</c:forEach>
	</script>
</body>
<%@include file="../includes/footer.jsp"%>

</html>