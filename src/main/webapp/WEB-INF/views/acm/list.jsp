<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/list.css">

<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/result.css">


<style>


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


				<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■여기부터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->



				<div class="container1">
					<section class="search_section">
						<div class="row1">
							<div class="booking-container">
								<form class="booking-form1" action="/acm/result" method='get'
									onsubmit="return checkValidation()">
									<div class="result-container">
										<div>
											<div class="no-margin1">
												<div class="formLayout1">
													<div class="form-group1 pt8px">
														<div id="pac-container">
															<span>Location</span> <input class="form-control2"
																id="pac-input" type="text" name="keyword"
																value='<c:out value="${pageMaker.cri.keyword}"/>'
																placeholder="Enter a location">
														</div>
														<input type="hidden" value="CW" name="type">


													</div>

												</div>

												<div class="formLayout1">
													<div class="form-group1 pt8px">
														<span>Check In</span>
														<div class="ui calendar" id="rangestart">
															<div class="ui input left icon width400">
																<i class="calendar icon"></i> <input type="text"
																	placeholder="Start" id="in" name="in"
																	value="<c:out value="${pageMaker.cri.in}"/>">
															</div>
														</div>
													</div>
												</div>

												<div class="formLayout1">
													<div class="form-group1 pt8px">
														<span>Check out</span>
														<div class="ui calendar" id="rangeend">
															<div class="ui input left icon width400">
																<i class="calendar icon"></i> <input type="text"
																	placeholder="End" id="out" name="out"
																	value="<c:out value="${pageMaker.cri.out}"/>">
															</div>
														</div>
													</div>
												</div>
												<div class="formLayout1">
													<div class="form-group1 pt8px">
														<span>Guests</span> <select class="form-control1"
															id="person" name="person">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
														</select> <span class="select-arrow"></span>
													</div>
												</div>

											</div>
										</div>

										<div class="">
											<div class="form-btn1">

												<button
													class="submit-btn btn btn-primary btn btn-search text-uppercase"
													id="submitBtn" type="submit">
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
					한국의 <strong>한옥</strong>에서 더 특별한 여행 즐기기
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
							<img src="../resources/img/place-1.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>3 nights + Flight 5*Hotel</span> <span class="price">$1,000</span>
								<a class="btn btn-outline" href="#">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="../resources/img/place-2.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>4 nights + Flight 5*Hotel</span> <span class="price">$1,000</span>
								<a class="btn btn-outline" href="#">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="../resources/img/place-3.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>2 nights + Flight 4*Hotel</span> <span class="price">$1,000</span>
								<a class="btn btn-outline" href="#">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="../resources/img/place-4.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>3 nights + Flight 5*Hotel</span> <span class="price">$1,000</span>
								<a class="btn btn-outline" href="#">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="../resources/img/place-5.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>4 nights + Flight 5*Hotel</span> <span class="price">$1,000</span>
								<a class="btn btn-outline" href="#">Book Now <i
									class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box"
						data-animate-effect="fadeIn">
						<div href="#">
							<img src="../resources/img/place-6.jpg"
								alt="Free HTML5 Website Template by FreeHTML5.co"
								class="img-responsive">
							<div class="desc">
								<span></span>
								<h3>Hotel title</h3>
								<span>2 nights + Flight 4*Hotel</span> <span class="price">$1,000</span>
								<a class="btn  btn-outline" href="#">Book Now <i
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
					<img src="../resources/img/img-01.jpg" alt="Image"> <img
						src="../resources/img/img-02.jpg" alt="Image"> <img
						src="../resources/img/img-03.jpg" alt="Image">
				</div>
				<div class="slideshow-description bg-primary1">
					<h2 class="">[숙소이름]홀리데이 인 리조트</h2>
					<p>추가 요금 없이 차액까지 환불받아 객실을 변경할 수 있도록 해준 HanOkay에 감사합니다! HanOkay와
						홀리데이 인의 직원도 친절했습니다. 또한 방이 넓고 수영장이 보이는 뷰가 좋았습니다. 마사지 받고나서 자쿠지에서
						반신욕을 했는데 이게 진짜 좋았습니다.</p>
					<a href="#" class="text-uppercase btn btn-white btn-white-primary">Continue
						Reading</a>
				</div>
			</section>
			<section class="clearfix slideshow-section slideshow-section-reverse">

				<div class="right slideshow slideshow-highlight">
					<img src="../resources/img/img-02.jpg" alt="Image"> <img
						src="../resources/img/img-03.jpg" alt="Image"> <img
						src="../resources/img/img-01.jpg" alt="Image">
				</div>

				<div
					class="slideshow-description slideshow-description-left bg-highlight">
					<h2 class="">[숙소이름]페어몬트 싱가포르</h2>
					<p>호텔은 심플하고 아주 좋았으며, HanOkay에서 많은 도움을 준 것에 대해 정말로 고마움을 표하고
						싶습니다. HanOkay를 계속 이용해온 고객으로 HanOkay앱을 가장 좋아하는 앱이라고 할 수 있습니다!</p>
					<a href="#"
						class="text-uppercase btn btn-white btn-white-highlight">Continue
						Reading</a>
				</div>

			</section>
			<section class="slideshow-section">
				<div class="slideshow">
					<img src="../resources/img/img-03.jpg" alt="Image"> <img
						src="../resources/img/img-02.jpg" alt="Image"> <img
						src="../resources/img/img-01.jpg" alt="Image">
				</div>
				<div class="slideshow-description bg-primary1">
					<h2 class="">[숙소이름]바이욕 스위트 호텔</h2>
					<p>[숙소소개]친구에게 계속 HanOkay를 추천하겠습니다 . 가성비갑 더블침대 두개였는데 침대도 널직하고
						방도크고 깨끗하고 전망도 좋고 다 좋았어요 가격이 저렴해서 걱정했는데 비싼호텔 못지않게 좋았네요</p>
					<a href="#" class="text-uppercase btn btn-white btn-white-primary">Continue
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
	$(document).ready(function() {
		$("#e1").select2();
	});

	/* 날짜 선택(수희) */
	var today = new Date();

	$("#out").datepicker(
			{
				minDate : new Date(today.getFullYear(), today.getMonth(), today
						.getDate() + 1),
				maxDate : new Date(today.getFullYear() + 1, today.getMonth(),
						today.getDate()),
				dateFormat : 'yy-mm-dd',
			});
	$("#in").datepicker(
			{
				minDate : 0,
				maxDate : new Date(today.getFullYear() + 1, today.getMonth(),
						today.getDate() - 1),
				onSelect : function(selectedDate) {
					var nextDay = new Date(selectedDate);
					nextDay.setDate(nextDay.getDate() + 1);
					$("#out").datepicker("option", "minDate", nextDay);
					var nextMonth = new Date(selectedDate);
					nextMonth.setDate(nextMonth.getDate() + 90);
					$("#out").datepicker("option", "maxDate", nextMonth);
				},
				dateFormat : 'yy-mm-dd'
			});
</script>

<!-- 달력 변경. 끝 -->


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

	//참고 끝
</script>
</html>