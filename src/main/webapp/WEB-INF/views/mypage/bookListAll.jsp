<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
int i = 0;
%>
<%@include file="../includes/header.jsp"%>

<style>

/* 미디어쿼리 --> 사이즈 별로 나열되며 작은것부터 시작한다. */
@media ( min-width : 576px) {
	.container {
		max-width: 540px;
	}
}

@media ( min-width : 768px) {
	.container {
		max-width: 720px;
	}
}

@media ( min-width : 992px) {
	.container {
		max-width: 960px;
	}
}

@media ( min-width : 1200px) {
	.container {
		max-width: 1140px;
	}
	.container-1 {
		max-width: 1160px;
		margin: 0 auto;
	}
}

.contents{
	margin-left: 220px;
	
    padding: 0px 10px;
}


.nav_btn{
    background-color: #fff;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 200px;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    border-bottom: 1px solid #dadfe6;
}

.nav_btn_last{
     border-bottom: none;
}

.mypage_btn{
    background-color: #F5F7FF;
    text-align: center;
}


.accordion {
    
 
}

.noaccordion {
    
    
}

.side-active, .accordion:hover {
  background-color: #ccc;
}

.accordion:after {

  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}



.side-panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}


.sidebar{
     width: 200px;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    position: fixed;
    z-index: 1;
    top: 190px;
    background: #fff;
    overflow-x: hidden;
    padding: 8px 0;
}


.side-active-top{
	top: 60px;
	transition: all 0.2s ease-in-out;
}



.sidebar-header{
    height: 90px;
    padding: 11px;
}

.user-pic{
    float: left;
    width: 60px;
    
    border-radius: 12px;
    margin-right: 15px;
    overflow: hidden;
}

.user-pic>img{
    object-fit: cover;
    height: 100%;
    width: 100%;
}

.user-info{

    padding-top: 7px;
}

.user-name{
    font-weight: 400;
    line-height: 1.5;
    font-size: 0.9rem;
}


.user-name>strong{
    font-weight: 800;
}

.user-role{
    display: block;
    font-size: 11px;
    color: #818896;

}
.user-status{
    font-size: 11px;
    margin-top: 4px;
}


.fa-circle{
    font-size: 8px;
    margin-right: 4px;
    color: #5cb85c;
}



/* .. */


.contents-2{
    
    margin-left: 45px;
    box-shadow: 0 4px 10px 0 #bec2c9;
    transition: box-shadow .3s ease;
    margin-top: 26px;
    height: 274px;
}

.card{
    margin-bottom: 50px;
    box-shadow: 0 4px 10px 0 #bec2c9;
}

.item{
    cursor: pointer;
    box-sizing: border-box;
    display: block;
}


.hotel-picture{
    float: left;
}

.hotel-picture>figure{
    width: 231px;
    margin: 0;
    height: 221px;
}

.hotel-picture>figure>img{
    font-family: "object-fit:cover";
    object-fit: cover;
    height: 221px;
    width: 231px;
    vertical-align: middle;
    border: 0;
}


.info-container{
    width: 66%;
    float: right;
}

.checkin-checkout-info-panel{
    float: right;
    padding-right: 106px;
    padding-top: 31px;
    font-size: 10px;
}


.check-info{
    display: inline-table;
    vertical-align: top;
}


.hotel-info-top{
    vertical-align: top;
    padding: 30px 16px 0;
    margin-bottom: 0;
    list-style: none;
}

.hotel-title{
    color: #2a2a2e;
    font-size: 16px;
    font-weight: 700;
    overflow: hidden;
    line-height: 1.1;
    max-height: 36px;
}

.booking-id{
    line-height: 2;
    font-size: 14px;
    font-weight: 200;
}

.booking-status-panel{
    font-size: 14px;
}

.hotel-info-bottom{
    float: left;
    padding-left: 16px;
    
}


.booking-info-bottom{
    display: flex;
    padding: 16px;
    float: right;

 
}

.price-currency{
    margin-top: -2px;
    display: inline-table;
    font-size: 16px;
    font-weight: 200;
    line-height: 1.5;
    vertical-align: top;
    text-align: right;
    margin-right: 8px;
}

.price-ammount{
    display: inline-table;
    font-size: 24px;
    font-weight: 200;
    line-height: 1;
    text-align: right;
    color: #e12d2d;
}

.button-item{
    font-weight: 700;
    border-top: 1px solid;
    width: 100%;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: end;
    -webkit-justify-content: flex-end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 0 8px;
    background-color: #fff;
    border-top-color: #e9ebee;
}


.button-item{

    font-weight: 700;
    border-top: 1px solid;
    /* width: 100%; */
    /* border: 1px solid blue; */
   /*  width: 783px; */
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    /* -webkit-box-pack: end; */
    -webkit-justify-content: flex-end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 0 8px;
    background-color: #fff;
    border-top-color: #e9ebee;

}

.button-item-1{
    padding: 16px 8px;
    margin: auto 0;
    flex: 5;
}

.button-item-1>a{
  
  
    padding-left: 0;
    color: #5392f9;
    font-size: 14px;
    line-height: 2;
    padding: 0 16px;
    text-decoration: none;
}

.button-txt-1{
    border-right: 1px solid;
    border-right-color: #d7d7db;
}

.button-item-2{
    -webkit-align-self: center;
    -ms-flex-item-align: center;

}

.button-item-2>button{

    background-color: #61dafb;
    color: #fff;
    overflow: hidden;
    font-size: 14px;
    font-weight: 700;
    border-radius: 3px;
    display: inline-block;
    margin-bottom: 0;
    padding: 8px 32px;
    cursor: pointer;
    border: none;
    outline: 0;
}


</style>


<div class="container-1">



	<div class="">
		<div class="col-lg-12">
			<h1 class="page-header">나의 예약</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
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
	        
	        <button class="accordion nav_btn">나의 예약</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>	              	              
	          </ul>
	        </div>
	        
	        <button class="noaccordion nav_btn">받은 편지함</button>
	    
	        
	        <button class="noaccordion nav_btn">찜목록</button>
	       
	        
	        <button class="accordion nav_btn">리뷰</button>
	        <div class="side-panel">
	            <ul>
	                <li><a href="#">게시전</a></li>
	                <li><a href="#">게시됨</a></li>
	                <li><a href="#">베스트 리뷰</a></li>
	            </ul>
	        </div>
	        
	        <button class="accordion nav_btn nav_btn_last">회원정보</button>
	        <div class="side-panel">
	            <ul>
	                <li><a href="#">개인정보</a></li>
	                <li><a href="#">결제정보</a></li>
	            </ul>
	        </div>
	    </div>
	
	</section>
	

	<section class="contents">
		
<section class="contents-2">

    <c:forEach items="${bookListAll}" var="board">
    <div class="card">
        <div class="item">
            <div class="clickable-card">
                <div class="hotel-picture">
                    <figure>
                        <img src="${request.contextPath}/resources/img/room.jpg" alt="호텔사진">
                    </figure>
                </div>
                <div class="info-container">
                    <div class="checkin-checkout-info-panel">
                        <div class="check-dates">
                            <div class="check-info">
                                <div class="check-title">체크인</div>
                                <div class="check-date">
                                    <p><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.checkinDate}" /></p>
                                </div>
                            </div>
                            <div class="check-spacer"></div>
                            <div class="check-info">
                                <div class="check-title">체크아웃</div>
                                <div class="check-date">
                                    <p><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.checkoutDate}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="hotel-info-top">
                        <li class="hotel-title"><c:out value="${board.acmName}" /></li>
                        <li class="booking-id" data-selenium="booking-id">예약 번호: <span class="booking-id-value"><c:out value="${board.bookNum}" /></span></li>
                        <li>
	                        <div class="booking-status-panel" data-selenium="booking-status-label">
		                        <i class="ficon ficon-16 ficon-check-circle mmb-booking-status-icon-green"></i>
		                        <span class="button-item-2" id="<c:out value="${board.bookNum}" />"></span>
	                        </div>
                        </li>
                    </ul>
            
                    <div class="booking-info-bottom">
                        <div class="price m150-price">
                            <div class="price-currency" data-selenium="payment-currency">KRW</div>
                            <div class="price-ammount" data-selenium="payment-ammount">640,349</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="button-item">
                <div class="button-item-1">
                
                    <a class="button-txt button-txt-1" href="">이용후기 작성하기</a>
                    <a class="button-txt" href="">다시 예약하기</a>
                    
                </div>

                <div class="button-item-2">
                    <button>정보보기</button>
                </div>
            </div>
            </div>
            </c:forEach>
        </div>
         
    </div>




		</section>
	</section>

</div>




<%@include file="../includes/footer.jsp"%>


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


	// 예약상태를 확인 하기 위해, 값을 불러오는 반복문을 여기에 둔다.

	<c:forEach items="${bookListAll}" var="board">

	var bookStatus = '<c:out value="${board.bookStatus} "/>'

	console.log(bookStatus);

	//만약에, 내 예약상태가 "RS_STT_BK" 이라면, "투숙예정"을 출력하게끔 + 페이지는 info로 이동한다.
	if (bookStatus.trim() == 'RS_STT_BK') {

		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='투숙예정' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<td><a href='/mypage/info?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");

		//만약에, 내 예약상태가 "RS_STT_BC" 이라면, "예약취소"을 출력하게끔 + 페이지는 info3로 이동한다.		
	} else if (bookStatus.trim() == 'RS_STT_BC') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='예약취소' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<td><a href='/mypage/info3?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");

		//만약에, 내 예약상태가 "RS_STT_AC" 이라면, "투숙완료"을 출력하게끔 + 페이지는 info2로 이동한다.		
	} else if (bookStatus.trim() == 'RS_STT_AC') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='투숙완료' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<td><a href='/mypage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");

		//만약에, 내 예약상태가 "RS_STT_CI" 이라면, "체크아웃"을 출력하게끔 + 페이지는 info2로 이동한다.	
	} else if (bookStatus.trim() == 'RS_STT_CI') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='체크아웃' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<td><a href='/mypage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
	}

	</c:forEach>
</script>
