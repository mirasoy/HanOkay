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

	/*모달*/

	
</style>

<%@include file="../includes/hostheader.jsp"%>
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
	                        	<div style="font-size:30px;">${chkinSize }</div>
                    			<span>예약완료</span>
                    		</div>
                    		<div>
	                        	<div style="font-size:30px;"id="incomp">${payed }</div>
                    			<span>결제완료</span>
                    		</div>
	                        <div>
	                        	<div style="font-size:30px;" id="laterr">${payLater }</div>
                    			<span>현장결제</span>
                    		</div>
                    		 <div >
	                        	<div style="font-size:30px;">0</div>
                    			<span>예약취소</span>
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
               
                              
               
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	오늘 입실<span class="pull-right">입실 수: ${chkinSize}</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>예약번호</th>
                                            <th>예약상태</th>
                                            <th>숙소명/객실명</th>
                                            <th>예약자/인원</th>
                                            <th>비고</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${chkin}" var="chkin">
                                        <tr>
                                            <td><c:out value="${chkin.bookNum}" /></td>
                                            <td id="st<c:out value='${chkin.bookNum}'/>"></td>
                                             <td>[<c:out value="${chkin.acmName}" />]<c:out value="${chkin.romName}" /></td>
                                            <td><c:out value="${chkin.bookerFirstname}" />&nbsp;<c:out value="${chkin.bookerLastname}" />/<c:out value="${chkin.guest}" />명</td>
                                       <td> 
                                       	<input type="button" id="<c:out value='${chkin.bookNum}'/>bt" data-toggle="modal" data-target="#inmyModal" value='입실' onclick="modal_view('<c:out value="${chkin.bookNum}"/>')"></button>

                                       </td>
                      
                                        </tr>
                                      </c:forEach>   
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
                
                
                <!-- 퇴실자 -->
               <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	오늘 퇴실<span class="pull-right">퇴실 수: ${chkoutSize}</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>예약번호</th>
                                            <th>예약상태</th>
                                            <th>숙소명/객실명</th>
                                            <th>예약자/인원</th>
                                            <th>비고</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${chkout}" var="chkout">
                                        <tr>
                                            <td><c:out value="${chkout.bookNum}" /></td>
                                             <td id="st<c:out value='${chkout.bookNum}'/>"></td>
                                             <td>[<c:out value="${chkout.acmName}" />]<c:out value="${chkout.romName}" /></td>
                                            <td><c:out value="${chkout.bookerFirstname}" />&nbsp;<c:out value="${chkout.bookerLastname}" />/<c:out value="${chkout.guest}" />명</td>
                                         <td> <input type="button" id="<c:out value='${chkout.bookNum}'/>bt" data-toggle="modal" data-target="#outmyModal" value='퇴실' onclick="modal_view2('<c:out value="${chkout.bookNum}"/>')"></button></td>
                      
                                        </tr>
                                      </c:forEach>   
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





				<!-- Modal -->
				<div class="modal fade" id="inmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				        <h4 class="modal-title" id="myModalLabel">입실처리</h4>
				      </div>
				      <div class="modal-body" id="content">
				      	<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>예약번호</th>
										<th>객실번호</th>
										<th>방번호</th>
										
									</tr>
								</thead>
									<tr>
										<td id="ibookNum"></td>
										<td id="iacmNum"></td>
										<td id="iromNum"></td>
										
									</tr>
								<thead>
									<tr>
										<th>예약기간</th>
										<th>숙박가격</th>
										<th>지불방식</th>
									</tr>
								</thead>
			
									<tr>
										<td id="istaydays"></td>
										<td id="iprice"></td>
										<td id="ipayMethod" style="color:red;"></td>

									</tr>
								</table>
				      			<p id="paylater">나중에..</p>
				      
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary" onclick="enter()">입실 승인</button>
				      </div>
				    </div>
				  </div>
				</div>

				<!-- 퇴실모달 -->
				<div class="modal fade" id="outmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        <h4 class="modal-title" id="myModalLabel">퇴실처리</h4>
					      </div>
					      <div class="modal-body">
					      		<p>퇴실처리 하시겠습니까?</p>
					      		<input type="hidden" id="obooknum">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="out()">퇴실승인</button>
					      </div>
					    </div>
					  </div>
					</div>

             
                
                
                
            </div>
            <!-- /.row -->

		</div>
	</div>
	
	
	
<script type="text/javascript">
var latitude;
var longitude;
	function modal_view(bookNum){
		
		$.ajax({
	         url : '/hosting/getTpayment',
	         data : {bookNum : bookNum},
	         type : 'GET',
	         dataType : 'json',
	         success : function(result) {
	        	 console.log(result.bookNum);
	        	 console.log(result.staydays);
	        	 
	        	 $("#ibookNum").text(result.bookNum);
	            $("#iacmNum").text(result.acmNum);
	            $("#iromNum").text(result.romNum);
	            $("#iprice").text(result.price);
	            $("#istaydays").text(result.staydays);
	            $("#ipayMethod").text(result.payMethod);
	            
	            console.log(result.payMethod);
	            if(result.payMethod=="PY_METHOD_LATER"){
	            	$("#paylater").text("현장 지불이 필요한 고객입니다. 결제하시겠습니까?");
	            } else {
	            	$("#paylater").text("이미 결제한 고객입니다");
		            	
	            }
	         }
	      }); // $.ajax
		
		
	}
	
	function modal_view2(bookNum){
		//alert(bookNum+"나가라~~");
		$("#obooknum").val(bookNum);
	}
	
	//입실승인을 누르면
	function enter(){
		var booknum=$("#ibookNum").text();
		console.log(booknum+"이시다");
		var letschange="#st"+booknum;
		var letschange2="#"+booknum+"bt";
		$(letschange).text("입실완료");
		 $(letschange2).prop("disabled", true);		
		 
		 //현장결제 결제완료 바꿈
		 $("#incomp").text(Number($("#incomp").text())+1);
		 $("#laterr").text(Number($("#laterr").text())-1);
		 
		 $('#inmyModal').modal('hide');   
	}

	//퇴실승인을 누르면
	function out(){
		var booknum=$("#obooknum").val();
		alert("out"+booknum);
		var letschange="#st"+booknum;
		var letschange2="#"+booknum+"bt";
		
		$(letschange).text("퇴실완료");
		 $(letschange2).prop("disabled", true);		
		 
		 $('#outmyModal').modal('hide');  
		
	}


 
$(document).ready(function(){
	
	//예약상태 표기
	//입실자
	<c:forEach items="${chkin}" var="chkin">
	   var bookStatus='<c:out value="${chkin.bookStatus}" />';
	   console.log(bookStatus);
	   if(bookStatus.trim()=="RS_STT_BK"){//입실자:RS_STT_BK(예약중 투숙예정) RS_STT_CI(체크인)
	      $("#st<c:out value='${chkin.bookNum}'/>").append("입실대기");
	   }
	   else if(bookStatus.trim()=="RS_STT_AC"){//체크인
		      $("#st<c:out value='${chkin.bookNum}'/>").append("입실대기");
		   }
	      
	   else if(bookStatus.trim()=="RS_STT_CI"){//체크인
	      $("#st<c:out value='${chkin.bookNum}'/>").append("입실완료");
	      $("#<c:out value='${chkin.bookNum}'/>bt").prop("disabled", true);
	   }   
	   
   </c:forEach>
	   
   //퇴실자
   <c:forEach items="${chkout}" var="chkout">
   var bookStatus='<c:out value="${chkout.bookStatus}" />';
   console.log(bookStatus);
   if(bookStatus.trim()=="RS_STT_BK"){//입실자:RS_STT_BK(투숙중) RS_STT_AC(체크아웃)
      $("#st<c:out value='${chkout.bookNum}'/>").append("퇴실대기");
   }
   
   else if(bookStatus.trim()=="RS_STT_CI"){//체크인
	      $("#st<c:out value='${chkout.bookNum}'/>").append("퇴실대기");
	   }  
   
   else if(bookStatus.trim()=="RS_STT_AC"){//체크아웃완료
      $("#st<c:out value='${chkout.bookNum}'/>").append("퇴실완료");
      $("#<c:out value='${chkout.bookNum}'/>bt").prop("disabled", true);
   }   
	</c:forEach>

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
