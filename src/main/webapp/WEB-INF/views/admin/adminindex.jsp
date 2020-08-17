<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	a{
		color: #21292d !important;
		}
		
	#rsvSum > div{
		display:inline-block;
		padding-left:70px;
		padding-right:70px;
		
	}
	
	.well{
		background-color:white !important; 
	
	}
	
	/*charts	
	   @import url(https://fonts.googleapis.com/css?family=Open+Sans);
		 body {
			 margin: 20px 0 40px;
			 font-family: "Open Sans", sans-serif;
			 color: #282828;
		}
		 .skills {
			 width: 80%;
			 max-width: 960px;
			 height: 500px;
			 margin: auto;
			 position: relative;
		}
		 .lines {
			 height: 100%;
			 position: relative;
		}
		 .line {
			 height: inherit;
			 width: 2px;
			 position: absolute;
			 background: rgba(238, 238, 238, 0.6);
		}
		 .line.l--0 {
			 left: 0;
		}
		 .line.l--25 {
			 left: 25%;
		}
		 .line.l--50 {
			 left: 50%;
		}
		 .line.l--75 {
			 left: 75%;
		}
		 .line.l--100 {
			 left: calc(100% - 1px);
		}
		 .line__label {
			 display: block;
			 width: 100px;
			 text-align: center;
			 position: absolute;
			 bottom: -20px;
			 right: -50px;
		}
		 .line__label.title {
			 text-transform: uppercase;
			 font-weight: bold;
		}
		 .charts {
			 width: 100%;
			 height: 100%;
			 position: absolute;
			 top: 0;
			 left: 0;
			 z-index: 10;
		}
		 .chart:not(:first-child) {
			 margin-top: 10px;
		}
		 .chart__title {
			 display: block;
			 margin: 0 0 10px;
			 font-weight: bold;
			 opacity: 0;
			 animation: 1s anim-lightspeed-in ease forwards;
		}
		 .chart--prod .chart__title {
			 animation-delay: 1.3s;
		}
		 .chart--design .chart__title {
			 animation-delay: 2.1s;
		}
		 .chart--horiz {
			 overflow: hidden;
		}
		 .chart__bar {
			 height: 30px;
			 margin-bottom: 10px;
			 background: linear-gradient(to left, #4cb8c4, #3cd3ad);
			 border-top-right-radius: 4px;
			 border-bottom-right-radius: 4px;
			 opacity: 0;
			 animation: 1s anim-lightspeed-in ease forwards;
		}
		
		 .chart--dev .chart__bar:nth-of-type(3) {
			 animation-delay: 1.1s;
		}
		 .chart--dev .chart__bar:nth-of-type(2) {
			 animation-delay: 0.9s;
		}
		 .chart--dev .chart__bar:nth-of-type(1) {
			 animation-delay: 0.7s;
		}
		 .chart--prod .chart__bar:nth-of-type(3) {
			 animation-delay: 1.9s;
		}
		 .chart--prod .chart__bar:nth-of-type(2) {
			 animation-delay: 1.7s;
		}
		 .chart--prod .chart__bar:nth-of-type(1) {
			 animation-delay: 1.5s;
		}
		
		 .chart--design .chart__bar:nth-of-type(3) {
			 animation-delay: 2.7s;
		}
		 .chart--design .chart__bar:nth-of-type(2) {
			 animation-delay: 2.5s;
		}
		 .chart--design .chart__bar:nth-of-type(1) {
			 animation-delay: 2.3s;
		}
		 .chart__label {
			 padding-left: 10px;
			 line-height: 30px;
			 color: white;
		}
		 @keyframes anim-lightspeed-in {
			 0% {
				 transform: translateX(-200%);
				 opacity: 1;
			}
			 100% {
				 transform: translateX(0);
				 opacity: 1;
			}
		}
		 
	*/
	
	
</style>
<%@include file="../includes/adminheader.jsp"%>
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;background-color: #f5f5f5;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
		<br>	

 <!-- /.row -->
            <div class="row">
                
                <!-- /.col-lg-4 -->
                <div class="col-lg-10">
                    <div class="well well-lg" style="height: 200px;">
                    	<div align="center">
	                        <h5 style="color:blue;">Today</h5>
	                        <div style="margin-top:0px;margin-bottom:20px;font-size:25px;">${todayform }</div>
	                       <div id="rsvSum">
	                        <div >
	                        	<div style="font-size:30px;">0</div>
                    			<span>새 회원 수</span>
                    		</div>
                    		<div>
	                        	<div style="font-size:30px;">${hopensize}</div>
                    			<span>호스트 대기자</span>
                    		</div>
	                        <div>
	                        	<div style="font-size:30px;">0</div>
                    			<span>신고 현황</span>
                    		</div>
                    		 <div >
	                        	<div style="font-size:30px;">0</div>
                    			<span>1:1 문의</span>
                    		</div>
                    		
                    		</div>
                    	</div>
                    </div>
                </div>
                
                <!-- 오늘의 날씨 구역 -->
              	<div class="col-lg-2">
                    <div class="well well-lg" style="height: 200px;      background-color: #a1d5e6 !important;    color: #a1d5e6 ;">
                    	<div align="center" id="weather">
	                       
	                        <h4 style=" color: black ;">오늘의 날씨</h4>
	                      
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
	                     
	                        
                    	</div>
                    	    <p id="Wdegree" style=" color: black; text-align: center; margin-top: 108px; margin-left: 0; background-color: white;"></p> 
                    </div>
                </div> <!-- /.col-lg-2 -->
               
                
                
               
             
                
                
                
                
            </div>
            <!-- /.row 

			<div class="skills">
			  <ul class="lines">
			    <li class="line l--0">
			      <span class="line__label title">
			        	전체 :
			      </span>
			    </li>
			    <li class="line l--25">
			      <span class="line__label">
			        25%
			      </span>
			    </li>
			    <li class="line l--50">
			      <span class="line__label">
			        50%
			      </span>
			    </li>
			    <li class="line l--75">
			      <span class="line__label">
			        75%
			      </span>
			    </li>
			    <li class="line l--100">
			      <span class="line__label">
			        100%
			      </span>
			    </li>
			  </ul>
			  
			  <div class="charts">
			    <div class="chart chart--dev">
			      <span class="chart__title">숙소 top3</span>
			      <ul class="chart--horiz">
			        <li class="chart__bar" style="width: 98%;">
			          <span class="chart__label">
			            HTML5
			          </span>
			        </li>
			        <li class="chart__bar" style="width: 98%;">
			          <span class="chart__label">
			            CSS3 & SCSS & CSS in JS
			          </span>
			        </li>
			        <li class="chart__bar" style="width: 70%;">
			          <span class="chart__label">
			            JavaScript
			          </span>
			        </li>
			        
			      </ul>
			    </div>
			    
			    <div class="chart chart--prod">
			      <span class="chart__title">예약자 top3</span>
			      <ul class="chart--horiz">
			      <li class="chart__bar" style="width: 75%;">
			        <span class="chart__label">
			          Git + Github, Bitbucket & Sourcetree
			        </span>
			      </li>
			      <li class="chart__bar" style="width: 80%;">
			        <span class="chart__label">
			          Microsoft Office
			        </span>
			      </li>
			       <li class="chart__bar" style="width: 80%;">
			        <span class="chart__label">
			          Microsoft Office
			        </span>
			      </li>
			    </ul>
			    </div>
			    
			    <div class="chart chart--design">
			      <span class="chart__title">리뷰 top3</span>
			      <ul class="chart--horiz">
			      <li class="chart__bar" style="width: 40%;">
			        <span class="chart__label">
			          Sketch
			        </span>
			      </li>
			      <li class="chart__bar" style="width: 40%;">
			        <span class="chart__label">
			          Photoshop
			        </span>
			      </li>
			      <li class="chart__bar" style="width: 35%;">
			        <span class="chart__label">
			          Illustrator
			        </span>
			      </li>
			    </ul>
			    </div>
			  </div>
			</div>
			
			<br><br>-->
			
 <div class="row">
			   <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	신고 현황<span class="pull-right">신고 수:&nbsp;1</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>신고된 숙소</th>
                                            <th>날짜</th>
                                            <th>신고내용</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     	<td>A123_삼보</td>
                                     	<td>2020-08-16</td>
                                   	    <td>숙소 위치가 정보와 다릅니다</td>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                
                
                <!-- 1:1문의 -->
               <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	1:1 문의<span class="pull-right">새 글:&nbsp;1</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>회원</th>
                                            <th>제목</th>
                                            <th>문의내용</th>
                                            <th>작성시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<td>U1</td>
                                     	<td>숙소등록시</td>
                                     	<td>사업자회원이 등록이안됩니다</td>
                                   	    <td>2020-08-15 00:13</td>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->  
                
                
		</div>
		</div>
	</div>
<script type="text/javascript">
var latitude;
var longitude;

 
$(document).ready(function(){
	
	
	//날씨표기
	var weatherMap = new Map();
	  
    weatherMap.set("Mist","cloudy");
    weatherMap.set("Smoke","cloudy");
    weatherMap.set("Haze","cloudy");
    weatherMap.set("Dust","cloudy");
    weatherMap.set("Fog","cloudy");
    weatherMap.set("Sand","cloudy");
    weatherMap.set("Ash","cloudy");
    weatherMap.set("Squall","cloudy");
    weatherMap.set("Clouds","cloudy");
    weatherMap.set("Snow","flurries");
    weatherMap.set("Tornado","flurries");
    weatherMap.set("Drizzle","rainy");
    weatherMap.set("Rain","rainy");
    weatherMap.set("Clear","sunny");
    weatherMap.set("Thunderstorm","thunder-storm");

	
	
	if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
		navigator.geolocation.getCurrentPosition(function(data) {
		
			latitude = data.coords.latitude;
			longitude = data.coords.longitude;
			
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+Math.trunc(latitude)+"&lon="+Math.trunc(longitude)+"&appid=b20d726fb6666eadaac9a1fd17586b24"
			    $.ajax({
			        url: apiURI,
			        dataType: "json",
			        type: "GET",
			        async: "false",
			        success: function(resp) {
			        	
			        	  $(".iconW").hide();
		                  
	                        //날씨저장
	                        weather = resp.weather[0].main;
							//날씨 이모티콘 보여주기									
	                        $("."+weatherMap.get(weather)).show();
							
	                        $("#Wdegree").text("온도 : "+Math.trunc(resp.main.temp- 273.15)+"도");
			        	
			        	var str = "";
			        	/* 
			            str+="현재온도 : "+ (resp.main.temp- 273.15);
			            str+="현재습도 : "+ resp.main.humidity;
			            str+="날씨 : "+ resp.weather[0].main;
			            str+="상세날씨설명 : "+ resp.weather[0].description;
			            str+="날씨 이미지 : "+ resp.weather[0].icon;
			            str+="바람   : "+ resp.wind.speed;
			            str+="나라   : "+ resp.sys.country;
			            str+="도시이름  : "+ resp.name ;
			            str+="구름  : "+ (resp.clouds.all) +"%";     */
             
			            $("#weather").append(str);
			        }
			    })
			
			
			
			
		}, function(error) {
			alert(error);
		}, {
			enableHighAccuracy: true,
			timeout: Infinity,
			maximumAge: 0
		});
	} else {	/* geolocation 사용 불가능 */
		alert('geolocation 사용 불가능');
	}
})


	
	
		
</script>
<%@include file="../includes/footer.jsp"%>










