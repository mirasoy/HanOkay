<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

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
                                        <p class="banner-subtitle">We assist you to choose the best.</p>
                                        <a href="javascript:void(0)" class="down-arrow-link"><i class="fa fa-2x fa-angle-down down-arrow"></i></a>       
                                    </div>    
                                </div>  <!-- col-xs-12 -->                      
                            </div> 
                            <!-- End : banner-row-header -->

                            <!-- Start : section-search : 검색창-->
                            <div class="row banner-row" id="section-search">
                            



                                <form action="/acm/result" method="get" class="search-form section-pad-2" onsubmit="return checkValidation()" >

                                    <div class="form-row search-form-row">                                
                                        <div class="form-group form-group-pad form-group-1">
                                            <label for="inputCity">Choose Your Destination</label>
                                            <input name="keyword" type="text" class="form-control" id="inputCity" placeholder="Type your destination...">
                                            <input type="hidden" value="CW" name="type">
                                        </div>
                                        <div class="form-group form-group-1">  

                                            <!-- Start : form-group-2--> 
                                            <div class="form-group form-group-3">                                       
                                                <label for="inputAdult">Guests</label>     
                                                <select name="person" class="form-control select" id="inputAdult">
                                                    <option value="1" selected>1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                </select>                                        
                                            </div>
                                            <!-- End : form-group-2-->

                     
                                            <!-- End : form-group-4-->
                                        </div>
                                        <!-- End : form-group-1-->

                                    </div> <!-- form-row -->
                                    <div class="form-row search-form-row">

                                        <div class="form-group form-right form-group-3">
                                            <label for="inputCheckIn">Check In Date</label>
                                             <div class="ui calendar" id="rangestart">
											<div class="ui input left icon">
												<i class="calendar icon"></i> 
												<input type="text" placeholder="Start" id="in" name="in" value="">
											</div>
                                        </div>
                                        
                                        <div class="form-group form-group-3">
                                            <label for="inputCheckOut">Check Out Date</label>
                                            <div class="ui calendar" id="rangeend">
												<div class="ui input left icon">
													<i class="calendar icon"></i> 
													<input type="text" placeholder="End" id="out" name="out" value="">
												</div>
											</div>
                                        </div>
                                        <div class="form-group form-group-1">
                                            <label for="btnSubmit">&nbsp;</label>
                                            <button type="submit" class="submit-btn btn btn-primary btn btn-search text-uppercase" id="submitBtn">Check Availability</button>
                                        </div>
                                    </div>           
								</div>
				
				                   
                                </form>  
  <!--                                   <div class="form-row search-form-row">

                                        <div class="form-group form-right form-group-3">
                                            <label for="inputCheckIn">Check In Date</label>
                                            <input name="in" type="date" class="form-control" id="datePickerId" placeholder="Check In">
                                        </div>
                                        <div class="form-group form-group-3">
                                            <label for="inputCheckOut">Check Out Date</label>
                                            <input name="out" type="date" class="form-control" id="datePickerId2" placeholder="Check Out">
                                        </div>
                                        <div class="form-group form-group-1">
                                            <label for="btnSubmit">&nbsp;</label>
                                            <button type="submit" class="submit-btn btn btn-primary btn btn-search text-uppercase" id="btnSubmit">Check Availability</button>
                                        </div> -->
                                    </div>                              
                                </form>  
                                
  <!-- 여기까지 -->                              
                                                           

                            </div> 
                            <!-- End : section-search -->
                            <div class="banner-overlay"></div>
                        </div>  <!-- .container -->                   
                    </div>     <!-- .container-outer -->                 
                </section>
                <!-- End : banner-->

                <!-- Start : section-1 : 숙박 섹션 -->
                    <section id="section-1">            
                        <div class="container">
                            <div class="text-1">
                                <div class="mx-auto about-text-wrap text-center">                                               
                                    <h2 class="text-uppercase mb-4">다양한 <strong>홀리데이 하우스</strong>에서 더 특별한 여행 즐기기</h2>
                                    <p class="mb-4">숙박 업소 형태에 따라 다양하게 소개 하는 페이지 입니다.</p>
                                                                                                        
                                </div>
                            </div>
                            
                            <!-- Start : accommodation -->
                            <div id="accommodation">
                                <div class="container">                        
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-1.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>3 nights + Flight 5*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-2.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>4 nights + Flight 5*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-3.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>2 nights + Flight 4*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-4.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>3 nights + Flight 5*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-5.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>4 nights + Flight 5*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                            <div href="#"><img src="../resources/img/place-6.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                                                <div class="desc">
                                                    <span></span>
                                                    <h3>Hotel title</h3>
                                                    <span>2 nights + Flight 4*Hotel</span>
                                                    <span class="price">$1,000</span>
                                                    <a class="btn  btn-outline" href="#">Book Now <i class="icon-arrow-right22"></i></a>
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
                                <h2 class="text-uppercase mb-4">전 세계 여행객의 <strong>생생함이 가득한</strong> 이용후기</h2>
                                <p class="mb-4">추천 하고 싶은 장소가 있나요? 당신의 소중한 경험들을 공유해보세요.</p>
                                <!-- <a href="#" class="text-uppercase btn-primary btn">Continue explore</a>                               -->
                            </div>
                        </div>
                        <div class="container-outer" >
                            <section class="slideshow-section">
                                <div class="slideshow">
                                    <img src="../resources/img/img-01.jpg" alt="Image">
                                    <img src="../resources/img/img-02.jpg" alt="Image">
                                    <img src="../resources/img/img-03.jpg" alt="Image">    
                                </div>
                                <div class="slideshow-description bg-primary1">
                                    <h2 class="">[숙소이름]홀리데이 인 리조트</h2>
                                    <p>추가 요금 없이 차액까지 환불받아 객실을 변경할 수 있도록 해준 ANA에 감사합니다! ANA와 홀리데이 인의 직원도 친절했습니다. 또한 방이 넓고 수영장이 보이는 뷰가 좋았습니다. 마사지 받고나서 자쿠지에서 반신욕을 했는데 이게 진짜 좋았습니다. </p>
                                    <a href="#" class="text-uppercase btn btn-white btn-white-primary">Continue Reading</a>
                                </div>
                            </section>
                            <section class="clearfix slideshow-section slideshow-section-reverse">
                
                                <div class="right slideshow slideshow-highlight">
                                    <img src="../resources/img/img-02.jpg" alt="Image">
                                    <img src="../resources/img/img-03.jpg" alt="Image">
                                    <img src="../resources/img/img-01.jpg" alt="Image">
                                </div> 
                
                                <div class="slideshow-description slideshow-description-left bg-highlight">
                                    <h2 class="">[숙소이름]페어몬트 싱가포르</h2>
                                    <p>호텔은 심플하고 아주 좋았으며, 아고다에서 많은 도움을 준 것에 대해 정말로 고마움을 표하고 싶습니다. 아고다를 계속 이용해온 고객으로 아고다 앱을 가장 좋아하는 앱이라고 할 수 있습니다!</p>
                                    <a href="#" class="text-uppercase btn btn-white btn-white-highlight">Continue Reading</a>
                                </div>                        
                
                            </section>
                            <section class="slideshow-section">
                                <div class="slideshow">
                                    <img src="../resources/img/img-03.jpg" alt="Image">
                                    <img src="../resources/img/img-02.jpg" alt="Image">
                                    <img src="../resources/img/img-01.jpg" alt="Image">
                                </div>
                                <div class="slideshow-description bg-primary1">
                                    <h2 class="">[숙소이름]바이욕 스위트 호텔</h2>
                                    <p>[숙소소개]친구에게 계속 ANA를 추천하겠습니다 . 가성비갑 더블침대 두개였는데 침대도 널직하고 방도크고 깨끗하고 전망도 좋고 다 좋았어요 가격이 저렴해서 걱정했는데 비싼호텔 못지않게 좋았네요 </p>
                                    <a href="#" class="text-uppercase btn btn-white btn-white-primary">Continue Reading</a>
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
		
		<!-- 달력 변경(수희) -->
		var today = new Date();
		$('#rangestart').calendar({
		  type: 'date',
		  minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
		  endCalendar: $('#rangeend'),
		  formatter: {
			    date: function (date, settings) {
			      if (!date) return '';
			      var day = date.getDate();
			      var month = date.getMonth() + 1;
			      var year = date.getFullYear();
			      return year + '-' + month + '-' + day;
			    }
			}
		});
		$('#rangeend').calendar({
		  type: 'date',
		  startCalendar: $('#rangestart'),
		  formatter: {
			    date: function (date, settings) {
			      if (!date) return '';
			      var day = date.getDate();
			      var month = date.getMonth() + 1;
			      var year = date.getFullYear();
			      return year + '-' + month + '-' + day;
			    }
			}
		});

		function checkValidation() {
	         if(document.getElementById("in").value == document.getElementById("out").value){
	            alert("1박 이상 선택해주세요!");
	            return false;
	         }else{
				return true;
			}
		}

		</script>            
		<script src="resources/js/bootstrap-datepicker.js"></script>
		
		<!-- 달력 변경. 끝 -->
    </body>

    <footer class="container-outer">
        <p class="mb-0">Copyright © <span class="current-year">2020</span> TMP Company </p>    
    </footer>
    
					
	<script type="text/javascript">
	//참고
	function initAutocomplete(){
	autocomplete = new google.maps.places.Autocomplete(
			/** @type{!HTMLInputElement} */(document.getElementById('autocomplete')),
			{types: ['geocode'],componentRestrictions: {country: 'kr'}});
	autocomplete.addListener('place_changed', fillInAddress);

	}
	

	function fillInAddress(){
		var place = autocomplete.getPlace();
		$('#lat').prop('value',place.geometry.location.lat());
		$('#lng').prop('value',place.geometry.location.lng());
		console.log(place.formatted_address);
		console.log('?');
		if(document.getElementById('country')!=null){
			fill_addr();
		}
	}
	//참고 끝
		
	</script>
</html>