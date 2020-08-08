<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>


<style>
 .weather-icon{
   background: #474e5d;
        }
       
.iconW {
  position: relative;
  display: inline-block;
  width: 12em;
  height: 10em;
  color: #474e5d;
  font-size: 1em; /* control icon size here */
}

.cloud {
  position: absolute;
  z-index: 1;
  top: 50%;
  left: 50%;
  width: 3.6875em;
  height: 3.6875em;
  margin: -1.84375em;
  background: #474e5d;
  border-radius: 50%;
  box-shadow:
    -2.1875em 0.6875em 0 -0.6875em,
    2.0625em 0.9375em 0 -0.9375em,
    0 0 0 0.375em #fff,
    -2.1875em 0.6875em 0 -0.3125em #fff,
    2.0625em 0.9375em 0 -0.5625em #fff;
}
.cloud:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: -0.5em;
  display: block;
  width: 4.5625em;
  height: 1em;
  background: #474e5d;
  box-shadow: 0 0.4375em 0 -0.0625em #fff;
}
.cloud:nth-child(2) {
  z-index: 0;
  background: #fff;
  box-shadow:
    -2.1875em 0.6875em 0 -0.6875em #fff,
    2.0625em 0.9375em 0 -0.9375em #fff,
    0 0 0 0.375em #fff,
    -2.1875em 0.6875em 0 -0.3125em #fff,
    2.0625em 0.9375em 0 -0.5625em #fff;
  opacity: 0.3;
  transform: scale(0.5) translate(6em, -3em);
  animation: cloud 4s linear infinite;
}
.cloud:nth-child(2):after { background: #fff; }

.sun {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 2.5em;
  height: 2.5em;
  margin: -1.25em;
  background: #474e5d;
  border-radius: 50%;
  box-shadow: 0 0 0 0.375em #fff;
  animation: spin 12s infinite linear;
}
.rays {
  position: absolute;
  top: -2em;
  left: 50%;
  display: block;
  width: 0.375em;
  height: 1.125em;
  margin-left: -0.1875em;
  background: #fff;
  border-radius: 0.25em;
  box-shadow: 0 5.375em #fff;
}
.rays:before,
.rays:after {
  content: '';
  position: absolute;
  top: 0em;
  left: 0em;
  display: block;
  width: 0.375em;
  height: 1.125em;
  transform: rotate(60deg);
  transform-origin: 50% 3.25em;
  background: #fff;
  border-radius: 0.25em;
  box-shadow: 0 5.375em #fff;
}
.rays:before {
  transform: rotate(120deg);
}
.cloud + .sun {
  margin: -2em 1em;
}

.rain,
.lightning,
.snow {
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  width: 3.75em;
  height: 3.75em;
  margin: 0.375em 0 0 -2em;
  background: #474e5d;
}

.rain:after {
  content: '';
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  width: 1.125em;
  height: 1.125em;
  margin: -1em 0 0 -0.25em;
  background: #0cf;
  border-radius: 100% 0 60% 50% / 60% 0 100% 50%;
  box-shadow:
    0.625em 0.875em 0 -0.125em rgba(255,255,255,0.2),
    -0.875em 1.125em 0 -0.125em rgba(255,255,255,0.2),
    -1.375em -0.125em 0 rgba(255,255,255,0.2);
  transform: rotate(-28deg);
  animation: rain 3s linear infinite;
}

.bolt {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -0.25em 0 0 -0.125em;
  color: #fff;
  opacity: 0.3;
  animation: lightning 2s linear infinite;
}
.bolt:nth-child(2) {
  width: 0.5em;
  height: 0.25em;
  margin: -1.75em 0 0 -1.875em;
  transform: translate(2.5em, 2.25em);
  opacity: 0.2;
  animation: lightning 1.5s linear infinite;
}
.bolt:before,
.bolt:after {
  content: '';
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  margin: -1.625em 0 0 -1.0125em;
  border-top: 1.25em solid transparent;
  border-right: 0.75em solid;
  border-bottom: 0.75em solid;
  border-left: 0.5em solid transparent;
  transform: skewX(-10deg);
}
.bolt:after {
  margin: -0.25em 0 0 -0.25em;
  border-top: 0.75em solid;
  border-right: 0.5em solid transparent;
  border-bottom: 1.25em solid transparent;
  border-left: 0.75em solid;
  transform: skewX(-10deg);
}
.bolt:nth-child(2):before {
  margin: -0.75em 0 0 -0.5em;
  border-top: 0.625em solid transparent;
  border-right: 0.375em solid;
  border-bottom: 0.375em solid;
  border-left: 0.25em solid transparent;
}
.bolt:nth-child(2):after {
  margin: -0.125em 0 0 -0.125em;
  border-top: 0.375em solid;
  border-right: 0.25em solid transparent;
  border-bottom: 0.625em solid transparent;
  border-left: 0.375em solid;
}

.flake:before,
.flake:after {
  content: '\2744';
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -1.025em 0 0 -1.0125em;
  color: #fff;
  list-height: 1em;
  opacity: 0.2;
  animation: spin 8s linear infinite reverse;
}
.flake:after {
  margin: 0.125em 0 0 -1em;
  font-size: 1.5em;
  opacity: 0.4;
  animation: spin 14s linear infinite;
}
.flake:nth-child(2):before {
  margin: -0.5em 0 0 0.25em;
  font-size: 1.25em;
  opacity: 0.2;
  animation: spin 10s linear infinite;
}
.flake:nth-child(2):after {
  margin: 0.375em 0 0 0.125em;
  font-size: 2em;
  opacity: 0.4;
  animation: spin 16s linear infinite reverse;
}


/* Animations */ 

@keyframes spin {
  100% { transform: rotate(360deg); }
}

@keyframes cloud {
  0% { opacity: 0; }
  50% { opacity: 0.3; }
  100% {
    opacity: 0;
    transform: scale(0.5) translate(-200%, -3em);
  }
}

@keyframes rain {
  0% {
    background: #0cf;
    box-shadow:
      0.625em 0.875em 0 -0.125em rgba(255,255,255,0.2),
      -0.875em 1.125em 0 -0.125em rgba(255,255,255,0.2),
      -1.375em -0.125em 0 #0cf;
  }
  25% {
    box-shadow:
      0.625em 0.875em 0 -0.125em rgba(255,255,255,0.2),
      -0.875em 1.125em 0 -0.125em #0cf,
      -1.375em -0.125em 0 rgba(255,255,255,0.2);
  }
  50% {
    background: rgba(255,255,255,0.3);
    box-shadow:
      0.625em 0.875em 0 -0.125em #0cf,
      -0.875em 1.125em 0 -0.125em rgba(255,255,255,0.2),
      -1.375em -0.125em 0 rgba(255,255,255,0.2);
  }
  100% {
    box-shadow:
      0.625em 0.875em 0 -0.125em rgba(255,255,255,0.2),
      -0.875em 1.125em 0 -0.125em rgba(255,255,255,0.2),
      -1.375em -0.125em 0 #0cf;
  }
}

@keyframes lightning {
  45% {
    color: #fff;
    background: #fff;
    opacity: 0.2;
  }
  50% {
    color: #0cf;
    background: #0cf;
    opacity: 1;
  }
  55% {
    color: #fff;
    background: #fff;
    opacity: 0.2;
  }
}

   .imgBox{
      	overflow: hidden;
      	height: 130px;
      } 
    .column {
        float: left;
        width: 33.3%;
        margin-bottom: 16px;
        padding: 0 8px;
    }

    .rec-card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin: 8px;
    }
.rec-card h2{
   word-break: break-all;
    font-size: 15px;
    padding: 6%;
    background-color: #d9d9d9;
    height: 60px;
    vertical-align: middle;
}

    .about-section {
        padding: 50px;
        text-align: center;
        background-color: #474e5d;
        color: white;
    }

    .rec-title {
        color: grey;
    }

    .recommend-btn {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
    }

    .recommend-btn:hover {
        background-color: #555;
    }

    @media screen and (max-width: 650px) {
        .column {
            width: 100%;
            display: block;
        }
        
   
 
</style>

<!-- Start : section-1 : 숙박 섹션 -->
<section id="section-1" class="recommendByWeather">
    <div class="container">
        <div class="text-1">
            <div class="mx-auto about-text-wrap text-center">
                <h2 class="text-uppercase mb-4">
                    오늘의 <strong>추천 여행코스</strong>
                </h2>
                <p class="mb-4">날씨에 따른 근처 추천 관광지.</p>

				<div class="about-section">

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
					<h2 id="weatherSub"></h2><br>
					<h5 id="weatherinfo"></h5>

				</div>


                <div class="rowInfo">
                    <div class="column">
                        <div class="rec-card">
                        	<div class = "imgBox">
                            <img id="cardImg1" src="/w3images/team1.jpg" alt="Jane" style="width:100%">
                            </div>
                            <div >
                                <h2 id="placeTitle1" ></h2>
                                <p class="rec-title" id="placeTitle1-1"></p>
                                
                                <p><button id="btn1" class="recommend-btn">근처 숙소 보기</button></p>
                            </div>
                            
                        </div>
                    </div>

                    <div class="column">
                        <div class="rec-card">
                        <div class = "imgBox">
                            <img id="cardImg2" src="/w3images/team2.jpg" alt="Mike" style="width:100%">
                          </div>
                            <div >
                                <h2  id="placeTitle2"></h2>
                                   <p class="rec-title" id="placeTitle1-2"></p>
                                <p><button id="btn2" class="recommend-btn">근처 숙소 보기</button></p>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="rec-card">
                         <div class = "imgBox">
                            <img id="cardImg3" src="/w3images/team3.jpg" alt="John" style="width:100%">
                              </div>
                            <div>
                                <h2 id="placeTitle3"></h2>
                                    <p class="rec-title" id="placeTitle1-3"></p>
                                <p><button id="btn3" class="recommend-btn">근처 숙소 보기</button></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<div id='recom'>
</div>
<!-- /.row -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>

    var latitude;
    var longitude;
    var weather = "";



    $(document).ready(function () {
        var weatherMap = new Map();
  
        var visitkoreaUri = "";

        weatherMap.set("Mist",["12","cloudy","안개가 짙지만 걷기엔 좋은날씨! ","걸을수 있는 관광지를 둘러볼까요?"]);
        weatherMap.set("Smoke",["14","cloudy","공기가 좋지 않은 오늘, ","실내 관광지를 추천드려요!"]);
        weatherMap.set("Haze",["14","cloudy","공기가 좋지 않은 오늘, ","실내 관광지를 추천드려요!"]);
        weatherMap.set("Dust",["14","cloudy","공기가 좋지 않은 오늘, ","실내 관광지를 추천드려요!"]);
        weatherMap.set("Fog",["12","cloudy","안개가 짙지만 걷기엔 좋은날씨!"," 걸을수 있는 관광지를 둘러볼까요?"]);
        weatherMap.set("Sand",["38","cloudy","미세먼지가 많은 하늘 ,"," 오늘은 실내에서 쇼핑을 해볼까요?"]);
        weatherMap.set("Ash",["14","cloudy","공기가 좋지 않은 오늘, ","실내 관광지를 추천드려요!"]);
        weatherMap.set("Squall",["38","cloudy","이제 우리나라도 스콜이 …?! ","말도안대염"]);
        weatherMap.set("Clouds",["12","cloudy","구름낀 하늘! 걷기에는 좋은날씨! ","함께 관광지를 둘러볼까요?"]);
        weatherMap.set("Snow",["38","flurries","눈이오네요!"," 따뜻한 실내에서 쇼핑을!"]);
        weatherMap.set("Tornado",["38","flurries","그럴리가.."," 우리나라는 토네이도는 없는데..?"]);
        weatherMap.set("Drizzle",["14","rainy","빗방울이 떨어지는 오늘, ","미술관이라도 가볼까요?"]);
        weatherMap.set("Rain",["14","rainy","빗방울이 떨어지는 오늘, ","미술관이라도 가볼까요?"]);
        weatherMap.set("Clear",["12","sunny","맑고 청명한 하늘!"," 같이 걸어볼까요?"]);
        weatherMap.set("Thunderstorm",["38","thunder-storm","우르르쾅쾅! ","실내에서 쇼핑을 즐겨봐요!"]);

		//위치불러오기
        if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
            navigator.geolocation.getCurrentPosition(function (data) {

                latitude = data.coords.latitude;
                longitude = data.coords.longitude;
                
                //위치기반 날씨검색 uri설정
                var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=" + Math.trunc(latitude) + "&lon=" + Math.trunc(longitude) + "&appid=b20d726fb6666eadaac9a1fd17586b24"
				//날씨검색펑션
                $.ajax({
                    url: apiURI,
                    dataType: "json",
                    type: "GET",
                    async: "false",
                    success: function (resp) {

                       $(".iconW").hide();
                  
                        //날씨저장
                        weather = resp.weather[0].main;
						//날씨 이모티콘 보여주기									
                        $("."+weatherMap.get(weather)[1]).show();
						
						//날씨 멘트 넣기
						$("#weatherTitle").text(weatherMap.get(resp.weather[0].main)[2]);
						$("#weatherSub").text(weatherMap.get(resp.weather[0].main)[3]);
						$("#weatherinfo").text("지금 온도는 "+(resp.main.temp - 273.15)+"도  / 습도는 "+resp.main.humidity+"% 입니다!");
						
						//관광지 url생성
						visitkoreaUri = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=qLpipJxWB54Fl1U2T%2Bk8vm7cxwqy18yBmlWu5%2BTPJOeQMe3pbKuVz6C6RtaU6aCbn%2BcELXjbSipNGV%2F%2FJRDN5w%3D%3D"
                            + "&contentTypeId="
                            + weatherMap.get(resp.weather[0].main)[0]
                            + "&mapX=" + longitude + "&mapY=" + latitude +
                            "&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=O&numOfRows=50&pageNo=1&_type=json"

						//관광지 검색 펑션 실행
                        visitkorea(visitkoreaUri);

                    },
                    error: function (resultArr) {
                    	$(".recommendByWeather").hide();               
                        console.log("실패...");
                    }
                });



            }, function (error) {
                alert(error);
                $(".recommendByWeather").hide();
            }, {
                enableHighAccuracy: true,
                timeout: Infinity,
                maximumAge: 0
            });
        } else {	/* geolocation 사용 불가능 */
            alert('geolocation 사용 불가능');
        }

		//관광지 정보 가져오기
        function visitkorea(url) {
            $.ajax({
                url: url,
                dataType: "json",
                type: "GET",
                async: "false",
                success: function (resp) {
                    console.log("성공!...");
                    var result = resp.response.body.items.item;
                    console.log("검색된갯수" + resp.response.body.totalCount);
					
                    //정보 화면에 넣는 펑션에 넘기기
                    write(result,resp.response.body.totalCount);

                },
                error: function (resultArr) {
                	
                	$(".recommendByWeather").hide();               
                    console.log("실패...");
                }
            });
        }


        function write(result,count) {
       			jj=result;
        	var numSet = new Set()
        	
        	while (numSet.size<3) {
        		numSet.add(Math.trunc(Math.random()*50));
       			}	
        	
        	
        	var num ;
        	var setNum = 1;
        	numSet.forEach(function(element){
        		$("#cardImg"+setNum).attr("src", result[element].firstimage);
        		$("#btn"+setNum).val(result[element].addr1.split(" ")[1]);
        		$("#placeTitle"+setNum).text(result[element].title);
        		$("#placeTitle1-"+setNum).text(result[element].addr1);
        		setNum++;
        	});
        
        }

		$(".recommend-btn").click(function (e) {
				
			location.href='http://localhost/acm/result?type=CW&keyword='+$(this).val()+'&person=1&in=&out=' 
		});


    });

</script>
</body>
<%@include file="../includes/footer.jsp"%>

</html>