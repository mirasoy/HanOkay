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
</style>

<%@include file="../includes/hostheader.jsp"%>
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;background-color: #f5f5f5;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
		 <h1><c:out value="${userFstname}"/> 호스트님 안녕하세요!</h1>
		<br>	

 <!-- /.row -->
            <div class="row">
                
                <!-- /.col-lg-4 -->
                <div class="col-lg-10">
                    <div class="well well-lg" style="height: 200px;">
                    	<div align="center">
	                        <h5 style="color:blue;">Today</h5>
	                        <h3 style="margin-top:0px;margin-bottom:20px;">2020.8.5(수)</h3>
	                        <div id="rsvSum">
	                        <div>
	                        	<div style="font-size:30px;">17</div>
                    			<span>입금대기</span>
                    		</div>
	                        <div >
	                        	<div style="font-size:30px;">3</div>
                    			<span>예약완료</span>
                    		</div>
                    		 <div >
	                        	<div style="font-size:30px;">0</div>
                    			<span>예약취소</span>
                    		</div>
                    		</div>
                    	</div>
                    </div>
                </div>
              	<div class="col-lg-2">
                    <div class="well well-lg" style="height: 200px;">
                    	<div align="center" id="weather">
	                       
	                        <p>오늘의 날씨</p>
	                        
	                        
	                        
                    	</div>
                    </div>
                </div> <!-- /.col-lg-2 -->
               
                
                
               
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	오늘 입실
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>도착예정시간</th>
                                            <th>숙소명/객실명</th>
                                            <th>예약자</th>
                                            <th>메세지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
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
                
               <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	오늘 퇴실
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>도착예정시간</th>
                                            <th>숙소명/객실명</th>
                                            <th>예약자</th>
                                            <th>메세지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
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
            <!-- /.row -->

		</div>
	</div>
<script type="text/javascript">
var latitude;
var longitude;

 
$(document).ready(function(){
	
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
			        	
			        	var str = "";
			        	
			            str+="현재온도 : "+ (resp.main.temp- 273.15);
			            str+="현재습도 : "+ resp.main.humidity;
			            str+="날씨 : "+ resp.weather[0].main;
			            str+="상세날씨설명 : "+ resp.weather[0].description;
			            str+="날씨 이미지 : "+ resp.weather[0].icon;
			            str+="바람   : "+ resp.wind.speed;
			            str+="나라   : "+ resp.sys.country;
			            str+="도시이름  : "+ resp.name ;
			            str+="구름  : "+ (resp.clouds.all) +"%";    
             
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
