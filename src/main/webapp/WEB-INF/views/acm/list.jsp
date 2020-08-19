	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/list.css">

<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/result.css">

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/suhee.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="${request.contextPath}/resources/css/t-datepicker-blue.css" rel="stylesheet" type="text/css">
<script src="${request.contextPath}/resources/js/t-datepicker.js"></script>
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>

<style>

.formLayout3{
    padding: 13px 53px !important;
    width: 360px;
}


.formLayout1 {

	padding: 10px 50px !important;
}


.t-check-in{

   
    float: left;
    width: 160px;
}

.t-check-out{

    float: right;
    width: 90px;
}

.t-arrow-top, .t-arrow-top::after{
border-color: transparent transparent #fff !important;
}

.spanGroup>span:nth-child(2){
    margin-left: 110px;
}

.box1{
	    width: 20%;
}

  .submit-btn {
	padding: 20px;
}


@media screen and (max-width: 991px) {
 
    
	 .container-outer{
	   	 margin-top: -100px !important;
	 }
	    
}





body{
	background: #fff;
	}

#section-0{
/* 	border: 1px solid red; */
	    height: 800px;
	    background-color: #e2e7ed;
}

#section-1{
	/* border: 1px solid blue; */
	    height: 1200px;
}
#section-2{
	/* border: 1px solid pink; */
	    height: 1600px;
}

.pt8px{
	 padding-top: 7px;
	     height: 100px;
}

.dropbtnpp {
  /* background-color: #3498DB; */
  color: black;
  padding: 0px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtnpp:hover, .dropbtnpp:focus {
  background-color: #2980B9;
}

.dropdownpp {
  position: relative;

}

.dropdown-contentpp {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-contentpp .people {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdownpp .people:hover {background-color: #ddd;}

.showpp {display: block;   
 top: 145%;}

.ppBtn{
width: 20px;
height: 20px;
text-align : center;
border-radius: 50%;
background-color: #ededed;
}

	
	
.bgwhite{
    background-color: #fff;
}

.about-section{
float: left;
    width: 65.666667%;
    height: 450px;
    margin-right: 10px;
    
border-radius: 20px;
    
}


.imgBox{
    overflow: hidden;
    height: 273px;
    background-size: cover;
}

.imgBox>img{
     width: 100%;
    overflow: hidden;
    height: 300px;
    background-size: cover;
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    border-radius: 20px;
}

.about-section>div{
/* border: 1px solid green; */
}

.rowInfo{

    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    border-radius: 20px;
float: right;
    width: 33.33333%;
 
    height: 450px;
        background-color: #fff;
  
        max-width: 1000px;
    position: relative;
    margin: auto;
}
}


/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {

/* border: 1px solid blue; */
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
/*   bottom: 8px; */
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

.weatherDiv{
/* 	border: 1px solid red; */
	padding: 15px 0 0 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  /* background-color: #717171; */
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

.weatherText{
    background-color: #e2e7ed;
}



@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}



.scrollPlz{
display: block;
    margin-top: 7px;
    font-weight: 500;
}

.fa-angle-down:before {
    content: "\f107";
    animation-name: drop;
    animation-duration: 1s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
}

/* 달력에 대한 CSS무효화 */


.t-datepicker {
 font-size: 13px;
 line-height: 1.5;
 display: block;
 position: relative;
 float: none !important; 
 
 }

/* .t-check-in, .t-check-out {
    width: 100%;
} */

.t-dates {
    position: inline;
    background-color: transparent;
       height: 23px;
    padding: 0;
    padding-top: 0;
    border: none;
    font-size: 0.8rem;
    font-weight: 700;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-radius: 4px;
    -webkit-transition: 0.2s all;
    transition: 0.2s all;
}

.t-check-in, .t-check-out, .t-datepicker {

 
    float: none; 
}

.t-arrow-top::after {
    top: -2px;
    left: -10px;
    content: '';
    border-width: 10px;
    border-bottom-color: #fff;
}


.t-check-in {
    /* border-right-width: 1px; */
    /* border-radius: 4px 0 0 4px; */
    padding: 0;
       
}

.t-date-info-title{
    display: none !important;
}

.t-check-out .t-datepicker-day {
   
    top: 50px;
}



.t-datepicker-day {
    top: 50px;
    left: -135%;
}

.t-check-out .t-datepicker-day {
    left: -237% !important;
}


/* 인원 +- */
.qty .count {
    color: #000;
    display: inline-block;
    vertical-align: top;
    font-size: 25px;
    font-weight: 700;
    line-height: 30px;
    padding: 0 2px
    ;min-width: 35px;
    text-align: center;
}
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: #61dafb;
    width: 30px;
    height: 30px;
    font: 24px/1 Arial,sans-serif;
    text-align: center;
    border-style: solid;
    border-color: #61dafb;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: #61dafb;
    width: 30px;
    height: 30px;
    font: 24px/1 Arial,sans-serif;
    text-align: center;
    border-style: solid;
    border-color: #61dafb;
    border-radius: 50%;
    background-clip: padding-box;
}

.minus:hover{
    background-color: #61dafb !important;
    color: white;
}
.plus:hover{
    background-color: #61dafb !important;
    color: white;
}
/*Prevent text selection*/
span{
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}
input{  
    border: 0;
    width: 2%;
}
nput::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input:disabled{
    background-color:white;
}
._1573fat:not(:last-child) {
    border-bottom: 1px solid rgb(235, 235, 235) !important;
}
._1573fat {
    -webkit-box-pack: justify !important;
    -webkit-box-align: center !important;
    color: rgb(34, 34, 34) !important;
    /* padding-top: 16px !important;
    padding-bottom: 16px !important;
    padding-right: 4px !important; */
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    min-width: 240px !important;
}
._t0tx82 {
    -webkit-box-flex: 1 !important;
    flex-grow: 1 !important;
}
._1lmb2fq {
    font-size: 16px !important;
    line-height: 20px !important;
    font-weight: 600 !important;
}
._ebqknn {
    font-size: 14px !important;
    line-height: 18px !important;
    font-weight: 400 !important;
    color: rgb(113, 113, 113) !important;
}
._3zlfom {
    -webkit-box-pack: justify !important;
    -webkit-box-align: center !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    width: 104px !important;
    height: 32px !important;
    color: rgb(34, 34, 34) !important;
    font-weight: 400 !important;
    font-size: 16px !important;
    line-height: 20px !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    margin-top: 10px !important;
    margin-bottom: 10px !important;
}
._xgnsug {
    position: absolute !important;
    left: 540px !important;
    top: 100% !important;
    z-index: 1 !important;
    box-shadow: rgba(0, 0, 0, 0.2) 0px 6px 20px !important;
    margin-top: 12px !important;
    max-height: calc(100vh - 220px) !important;
    overflow-x: hidden !important;
    overflow-y: auto !important;
    background: rgb(255, 255, 255) !important;
    border-radius: 32px !important;
    padding: 16px 32px !important;
    display:none;
}
/* 인원 +-끝 */
.pac-target-input:not(:-webkit-autofill) {
    animation-name: endBrowserAutofill;
    width: 100px;
}
</style>


<!-- Start : page-wrap : section 시작-->
<div class="page-wrap">

	<!-- Start : banner-->
	<section class="banner">
		<div class="container-outer banner-bg">
			<div class="container">
				<!-- Start : banner-row-header : 메인 문구 입력-->
				<div class="row banner-row banner-row-header">
					<div class="col-xs-12">
						<div class="banner-header">
							<h1 class="text-uppercase banner-title">Let's begin</h1>
							<img src="../resources/img/dots-3.png" alt="Dots">
							<p class="banner-subtitle">We assist you to choose the best</p>
							<a href="javascript:void(0)" class="down-arrow-link"><i
								class="fa fa-2x fa-angle-down down-arrow"></i></a>
						
						</div>
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- End : banner-row-header -->



				<div class="container1">
					<section class="search_section">
						<div class="row1">
							<div class="booking-container">
								<form class="booking-form1" id= "actionForm" action="/acm/result" method='get'
									>
									<div class="result-container">
										<div>
											<div class="no-margin1">
												<div class="formLayout1">
													<div class="form-group1 pt8px box1">
														<div id="pac-container">
															<span>Location</span> <input class="form-control2"
																id="pac-input" type="text" name="keyword"
																value='<c:out value="${pageMaker.cri.keyword}"/>'
																placeholder="Enter a location">
														</div>
														<input type="hidden" value="CW" name="type">


													</div>

												</div>

												<div class="formLayout3 ">
												
													<div class="booking-group2">
														<div class="spanGroup form-group1">
															<span>Check In</span>
															<span>Check out</span>
														
														</div>
														
														<div class="t-datepicker">													
															 <div id="cin" class="t-check-in" ></div>														
															 <div class="t-check-out"></div>														 
														</div>
													</div>
												</div>
																																
												<div class="formLayout1">
											<div class="form-group1 pt8px">
												<span>Guests</span>
  												<input class="form-control1"
																id="personView" type="text"
																placeholder="게스트 추가" readonly>
												<input class="form-control1"
																id="person" type="hidden" name="person"
																readonly>			
		 							

											</div>
										</div>
											</div>	
										</div>
<!-- 인원 +- -->						
<div class="_xgnsug tog">
<div class="_3hmsj tog">
    <div class="_1573fat tog">
        <div class="_t0tx82 tog">
            <div class="_1lmb2fq tog">성인</div>
	        <div class="_ebqknn tog">만 13세 이상</div>
	    </div>
	    <div class="qty mt-5 _3zlfom tog">
            <span class="minus adultMinus bg-white tog">-</span>
            <input type="number" class="count adultCnt tog" name="qty" value="0">
            <span class="plus adultPlus bg-white tog">+</span>
        </div>
    </div>
    <div class="_1573fat tog">
        <div class="_t0tx82 tog">
            <div class="_1lmb2fq tog">어린이</div>
	        <div class="_ebqknn tog">만 13세 미만</div>
	    </div>
	    <div class="qty mt-5 _3zlfom tog">
            <span class="minus childMinus bg-white tog">-</span>
            <input type="number" class="count childCnt tog" name="qty" value="0">
            <span class="plus childPlus bg-white tog">+</span>
        </div>
    </div>
</div>
</div>
<!-- 인원 +-끝 -->	


										<div class="">
											<div class="form-btn1">

												<button
													class="submit-btn btn btn-primary btn btn-search text-uppercase"
													id="submitBtn" type="button">
													<i class="fa fa-search"></i>





												</button>
											</div>
										</div>







									</div>
								</form>
							</div>
						</div>
						<!-- end of row -->


					</section>
				</div>
				<!-- end container -->







				<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■여기부터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->


			</div>
			<!-- End : section-search -->
			<div class="banner-overlay"></div>
		</div>
		<!-- .container -->
</div>
<!-- .container-outer -->
</section>
<!-- End : banner-->

<!-- Start : section-1 : 숙박 섹션 -->
<section id="section-0" class="recommendByWeather">
	<div class="container">
		<div class="text-2 weatherText">
			<div class="mx-auto about-text-wrap text-center">
				<h2 class="text-uppercase mb-4">
					오늘의 <strong>추천 여행코스</strong>
				</h2>
				<p class="">날씨에 따른 근처 추천 관광지.</p>

			</div>
		</div>

		<div class="about-section">

			<div class="weatherDiv">
				<div>


					<div class="iconW sun-shower">
						<div class="cloud"></div>
						<div class="sun">
							<div class="rays"></div>
						</div>
						<div class="rain"></div>
					</div>
	
					<div class="iconW thunder-storm">
						<div class="cloud"></div>
						<div class="lightning">
							<div class="bolt"></div>
							<div class="bolt"></div>
						</div>
					</div>
	
					<div class="iconW cloudy">
						<div class="cloud"></div>
						<div class="cloud"></div>
					</div>
	
					<div class="iconW flurries">
						<div class="cloud"></div>
						<div class="snow">
							<div class="flake"></div>
							<div class="flake"></div>
						</div>
					</div>
	
					<div class="iconW sunny">
						<div class="sun">
							<div class="rays"></div>
						</div>
					</div>
	
					<div class="iconW rainy">
						<div class="cloud"></div>
						<div class="rain"></div>
					</div>
				</div>


			<h1 id="weatherTitle"></h1>
			<h2 id="weatherSub"></h2>
			<br>
			<h5 id="weatherinfo"></h5>

		</div>
	</div>

		<div class="rowInfo slideshow-container">
			<div class="column mySlides fade">
				<div class="rec-card">
					<div class="imgBox">
						<img id="cardImg1" src="" alt="Jane" style="width: 100%">
					</div>
					<div class="text">
						<h2 id="placeTitle1"></h2>
						<p class="rec-title" id="placeTitle1-1"></p>

						<p>
							<button id="btn1" class="recommend-btn">근처 숙소 보기</button>
						</p>
					</div>

				</div>
			</div>

			<div class="column mySlides fade">
				<div class="rec-card">
					<div class="imgBox">
						<img id="cardImg2" src="" alt="Mike" style="width: 100%">
					</div>
					<div class="text">
						<h2 id="placeTitle2"></h2>
						<p class="rec-title" id="placeTitle1-2"></p>
						<p>
							<button id="btn2" class="recommend-btn">근처 숙소 보기</button>
						</p>
					</div>
				</div>
			</div>

			<div class="column mySlides fade">
				<div class="rec-card">
					<div class="imgBox">
						<img id="cardImg3" src="" alt="John" style="width: 100%">
					</div>
					<div class="text">
						<h2 id="placeTitle3"></h2>
						<p class="rec-title" id="placeTitle1-3"></p>
						<p>
							<button id="btn3" class="recommend-btn">근처 숙소 보기</button>
						</p>
					</div>
				</div>
			</div>
			
			
			
			
		</div>
	</div>

	</div>

</section>
<div id='recom'></div>
<!-- /.row -->

<!-- Start : section-1 : 숙박 섹션 -->
<section id="section-1">
	<div class="container">
		<div class="text-2 bgwhite">
			<div class="mx-auto about-text-wrap text-center">
				<h2 class="text-uppercase mb-4">
					고즈넉한 <strong>한옥</strong>에서 더 특별한 여행 즐기기
				</h2>
				<p class="">다양한 한옥을 소개 하는 페이지 입니다.</p>

			</div>
		</div>

		<!-- Start : accommodation -->
		<div id="accommodation">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/acm/amc_p_11.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>게스트하우스 바리</h3>
								<span>서울시 종로구 / 1인 1박 특별가 </span> <span class="price"> 17,000원 </span>
								<a class="btn btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=1&in=2020-08-09&out=2020-08-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A12">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/acm/amc_p_6.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>공산성게스트하우스</h3>
								<span>충남 공주시  / 8인 특별가! </span> <span class="price"> 50,000 원 </span>
								<a class="btn btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=1&in=2020-08-09&out=2020-08-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A7">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/acm/amc_p_20.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>무위(無爲) </h3>
								<span>서울시 종로구 / 1인실 1박 가격 </span> <span class="price"> 13,000 원</span>
								<a class="btn btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=1&in=2020-02-09&out=2020-02-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A21">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/acm/amc_p_67.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>1900s Hanok </h3>
								<span>고즈넉한 분위기의 한옥 스테이</span> <span class="price"> 50,000 원</span>
								<a class="btn btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=1&in=2020-08-09&out=2020-08-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A68">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/acm/amc_p_81.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>무렵</h3>
								<span>전주의 최신 숙소</span> <span class="price">150,000원</span>
								<a class="btn btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=%EC%A0%84%EC%A3%BC&person=1&in=2020-08-09&out=2020-08-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A82">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="/display?fileName=C:/upload/room/room_p_86.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>돈암서원 한옥마을</h3>
								<span>충남 논산시 / 럭셔리 1인실</span> <span class="price">70,000 원</span>
								<a class="btn  btn-outline" href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=1&in=2020-08-09&out=2020-08-10&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=A55">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End : accommodation -->
	</div>
	<!-- End : container -->
</section>
<!-- End : section-1 -->



<!-- Start : section-2 : 리뷰 섹션 -->
<section id="section-2">
	<div class="container">
		<div class="text-2">
			<div class="mx-auto about-text-wrap text-center">
				<!-- <h2 class="text-uppercase mb-4">Your <strong>Journey</strong> is our priority</h2> -->
				<h2 class="text-uppercase mb-4">
					전 세계 여행객의 <strong>생생함이 가득한</strong> 이용후기
				</h2>
				<p class="">추천 하고 싶은 장소가 있나요? 당신의 소중한 경험들을 공유해보세요.</p>
				<!-- <a href="#" class="text-uppercase btn-primary btn">Continue explore</a>                               -->
			</div>
		</div>
		<div class="container-outer">
			<section class="slideshow-section">
				<div class="slideshow">
					<img src="/display?fileName=C:/upload/review/rev_p_33.jpg" alt="Image"> <img
						src="/display?fileName=C:/upload/review/rev_p_25.jpg" alt="Image"> <img
						src="/display?fileName=C:/upload/review/rev_p_45.jpg" alt="Image">
				</div>
				<div class="slideshow-description bg-primary1">
					<h2 class="">[교동게하]따뜻하고 전통적인 한옥게스트하우스!</h2>
					<p>부모님 모시고 한옥 두 게스트하우스 방문했는데 한옥의 매력 제대로 느끼고 갑니다~<br>
북촌 마을이 내려다보여서 전망도 좋고 방도 깔끔하고 통풍 잘 되서 정말정말 좋았어요!</p>
					<a href="/review/get?pstNum=RV17" class="text-uppercase btn btn-white btn-white-primary">Continue
						Reading</a>
				</div>
			</section>
			<section class="clearfix slideshow-section slideshow-section-reverse">

				<div class="right slideshow slideshow-highlight">
					<img src="/display?fileName=C:/upload/review/rev_p_40.jpg" alt="Image"> <img
						src="/display?fileName=C:/upload/review/rev_p_41.jpg" alt="Image"> <img
						src="/display?fileName=C:/upload/review/rev_p_39.jpg" alt="Image">
				</div>

				<div
					class="slideshow-description slideshow-description-left bg-highlight">
					<h2 class="">[남화제]Hanok Heaven</h2>
					<p>Loved our stay in this lovely, old area of Seoul. Felt like a proper, authentic Korean experience.<br>
					 Well worth paying an extra few Won for en suite wet-room as I couldnt be doing with all the shoes-on, shoes-off business!<br>
					  Sleeping on the futons (i.e. on the floor) with buckwheat pillows was surprisingly comfortable and the under-floor heating much appreciated.</p>
					<a href="/review/get?pstNum=RV22"
						class="text-uppercase btn btn-white btn-white-highlight">Continue
						Reading</a>
				</div>

			</section>
			<section class="slideshow-section">
				<div class="slideshow">
					<img src="/display?fileName=C:/upload/review/rev_p_44.jpg" alt="Image"> 
					<img src="/display?fileName=C:/upload/review/rev_p_43.jpg" alt="Image">
					<img src="/display?fileName=C:/upload/review/rev_p_34.jpg" alt="Image">
				</div>
				<div class="slideshow-description bg-primary1">
					<h2 class="">[낙안제]정원이 아름다운 숙소 </h2>
					<p>한옥 정원이 너무 아름다웠고, 숙소 내부도 안락하고 따뜻하니 좋았습니다.
이불보도 굉장히 두꺼워 푹신하고 편하게 잠들 수 있었어요!
직원분들도 친절하고 깨끗해서 재방문하고싶습니다.</p>
					<a href="/review/get?pstNum=RV8" class="text-uppercase btn btn-white btn-white-primary">Continue
						Reading</a>
				</div>
			</section>
		</div>
	</div>
</section>
<!-- End : section-2 -->
</div>
<!-- End : page-wrap -->
</div>
<!-- End : main-content -->

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    

  slides[slideIndex-1].style.display = "block";  
  
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>



<script>
$("#pac-input").keypress(function(e){
	if(event.keyCode == '13'){
		e.preventDefault();
		$('.t-date-check-in').trigger('click');
	}
	
});
	
</script>

	<script>
	 $(document).ready(function(){
	    // Call global the function
	    $('.t-datepicker').tDatePicker({
	      // options here
	    });
	    
	    //인원+-
	    $('.adultCnt').prop('disabled', true);
		$(document).on('click','.adultPlus',function(){
			$('.adultCnt').val(parseInt($('.adultCnt').val()) + 1 );
			if ($('.adultCnt').val() >8) {
					$('.adultCnt').val(8);
				}
			$('#person').val(parseInt($('.adultCnt').val()) + parseInt($('.childCnt').val()));
			$('#personView').val($('#person').val()+ '명');
			
		});
    	$(document).on('click','.adultMinus',function(){
			$('.adultCnt').val(parseInt($('.adultCnt').val()) - 1 );
				if ($('.adultCnt').val() < 0) {
					$('.adultCnt').val(0);
				}
			$('#person').val(parseInt($('.adultCnt').val()) + parseInt($('.childCnt').val()));
			$('#personView').val($('#person').val()+ '명');
	    });
	    
	    $('.childCnt').prop('disabled', true);
		$(document).on('click','.childPlus',function(){
			$('.childCnt').val(parseInt($('.childCnt').val()) + 1 );
			if ($('.childCnt').val() >8) {
					$('.childCnt').val(8);
				}
			$('#person').val(parseInt($('.adultCnt').val()) + parseInt($('.childCnt').val()));
			$('#personView').val($('#person').val()+ '명');
		});
    	$(document).on('click','.childMinus',function(){
			$('.childCnt').val(parseInt($('.childCnt').val()) - 1 );
				if ($('.childCnt').val() <0) {
					$('.childCnt').val(0);
				}
			$('#person').val(parseInt($('.adultCnt').val()) + parseInt($('.childCnt').val()));
			$('#personView').val($('#person').val()+ '명');
	    });
	  });
	 
	 $('#personView').click(function(){
		 $('._xgnsug').show();
	 });
	 $(document).click(function(e){ //문서 body를 클릭했을때 해당 클래스이름이 없으면 인원창 숨김
		 if(!$(e.target).hasClass("tog")&&!$(e.target).hasClass("form-control1")) {$("._xgnsug").hide(); }
		  		
	});
	</script>

</body>

<footer class="container-outer">
	<p class="mb-0">
		Copyright © <span class="current-year">2020</span> TMP Company
	</p>
</footer>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&libraries=places&callback=initAutocomplete"
	async defer></script>
	
	

<script type="text/javascript">






/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdownpp").classList.toggle("showpp");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtnpp')) {
    var dropdowns = document.getElementsByClassName("dropdown-contentpp");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('showpp')) {
        openDropdown.classList.remove('showpp');
      }
    }
  }
}




	//참고




	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete(
		/** @type{!HTMLInputElement} */
		(document.getElementById('pac-input')), {
			types : [ 'geocode' ],
			componentRestrictions : {
				country : 'kr'
			}
		});
		autocomplete.addListener('place_changed', fillInAddress);

	}

	function fillInAddress() {
		var place = autocomplete.getPlace();
		$('#lat').prop('value', place.geometry.location.lat());
		$('#lng').prop('value', place.geometry.location.lng());
		console.log(place.formatted_address);
		console.log('?');
		if (document.getElementById('country') != null) {
			fill_addr();
		}
	}

	
	
	$("#submitBtn").click(function(e) {
		e.preventDefault();
		if($("#in").val() =='null'||$("#out").val() =='null'){
			let today = new Date();   

			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let day = today.getDay();  // 요일

			
			$("#in").val(year+'-'+month+'-'+date);
			$("#out").val(year+'-'+month+'-'+(date+1));
		}
		$("#actionForm").submit();
	})
	
	//참고 끝
</script>
</html>