<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 




<%@include file="../../includes/header.jsp"%>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >

<style>

	.container-1{
	    border: 1px solid red;
	}

	.contents{
	 	border: 1px solid green;
	}
	
	.contents-2{
		height: 1000px;
		box-shadow: none !important;
	}


.card1{
    margin-bottom: 50px;
position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    /* background-color: #fff; */
    background-clip: border-box;
    /* border: 1px solid rgba(0,0,0,.125); */
    border-radius: .25rem;

}


.items{
    border-bottom: 1px solid rgb(221, 221, 221) !important;
   margin-bottom: 30px;
    padding-bottom: 30px;

}






.item1>h1{

    font-size: 30px;
    font-weight: 800;
    line-height: 40px;
    margin: 0px !important;
    padding: 0px !important;
}

.item1>p{
    font-size: 14px !important;
    line-height: 18px !important;
    color: #717171 !important;
    margin-bottom: 8px !important;
}

.item2>.user_profile_edit_button{
font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;


}


.item3> h1{
font-size: 22px;
    font-weight: 600;
}

.item3>button{
    font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;
}


</style>



<div class="container-1">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">내 프로필</h1>
			<p><%=userFstName %>님 반갑습니다.</p>
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
		<div class="card1">
			<div class="item1 items">
				<h1>안녕하세요 저는 <%=userFstName %>입니다.</h1>
				<p>회원가입 : 2020</p>
			</div>
			<div class="item2 items">
				<button type="button" class="user_profile_edit_button" >프로필 수정하기</button>
			</div>		
			
			<div class="item3 items">
				<h1>★ 후기 0개 </h1>
				<button type="button" class="review_edit_button" >내가 작성한 후기</button>
			</div>											
		</div>
	</section>
</section>

<script>

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("side-active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}



  $(document).ready(function () {
    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }
  });
</script>

<%@include file="../../includes/footer.jsp"%>
