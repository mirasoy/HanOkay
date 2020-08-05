<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

	
<div class="container">
	<div id="recom">
					
	</div>
</div>
	<!-- /.row -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
	var latitude;
	var longitude;
	var weather= "";
	
	
	 
    $(document).ready(function(){
		var weatherMap = new Map();
		var visitkoreaUri = "";

		
		weatherMap.set("Thunderstorm","38");
		weatherMap.set("Drizzle","14");
		weatherMap.set("Rain","14");
		weatherMap.set("Snow","38");
		weatherMap.set("Mist","38");
		weatherMap.set("Smoke","38");
		weatherMap.set("Haze","38");
		weatherMap.set("Dust","38");
		weatherMap.set("Fog","38");
		weatherMap.set("Sand","38");
		weatherMap.set("Ash","38");
		weatherMap.set("Squall","38");
		weatherMap.set("Tornado","38");
		weatherMap.set("Clear","12");
		weatherMap.set("Clouds","12");

		
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
				        	weather = resp.weather[0].main; 
				            console.log(resp);
				            console.log("현재온도 : "+ (resp.main.temp- 273.15));
				            console.log("현재습도 : "+ resp.main.humidity);
				            console.log("날씨 : "+ resp.weather[0].main );
				            console.log("상세날씨설명 : "+ resp.weather[0].description );
				            console.log("날씨 이미지 : "+ resp.weather[0].icon );
				            console.log("바람   : "+ resp.wind.speed );
				            console.log("나라   : "+ resp.sys.country );
				            console.log("도시이름  : "+ resp.name );
				            console.log("구름  : "+ (resp.clouds.all) +"%" );                 
				
				            console.log(resp.weather[0].description+"::::::"+weatherMap.get(resp.weather[0].description));           
				            
				 visitkoreaUri = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=qLpipJxWB54Fl1U2T%2Bk8vm7cxwqy18yBmlWu5%2BTPJOeQMe3pbKuVz6C6RtaU6aCbn%2BcELXjbSipNGV%2F%2FJRDN5w%3D%3D"
				+"&contentTypeId="
				+weatherMap.get(resp.weather[0].main)
				+"&mapX="+longitude+"&mapY="+latitude+
				"&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json"
				
				 console.log("url"+visitkoreaUri);
				 visitkorea(visitkoreaUri);
				
				        }
				    });
				
				
				
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
		
		
		function visitkorea(url) {
			 $.ajax({
			        url: url,
			        dataType: "json",
			        type: "GET",
			        async: "false",
			        success: function(resp) {
			        	alert(latitude);
			        	console.log("성공!...");
			        	var result = resp.response.body.items.item;
			        	
			        	if((resp.response.body.totalCount)==0){
				 		var str = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=qLpipJxWB54Fl1U2T%2Bk8vm7cxwqy18yBmlWu5%2BTPJOeQMe3pbKuVz6C6RtaU6aCbn%2BcELXjbSipNGV%2F%2FJRDN5w%3D%3D"
						+"&contentTypeId="
						+"&mapX="+longitude+"&mapY="+latitude+
						"&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json"
						
			 			}
			        	
			        	write(result);
			        	
			        },
			        error: function(resultArr){
			   		   console.log("실패...");
			   	   }
			    });
		}
		
		
		function write(result) {
			
			result.response.body.items.item;
			
			 $(result).each(function (i,obj) {
					$("#recom").append("<b>"+obj.title+"</b><br>");
	        	}); 
		}
		
		
		
   
	});
	
		</script>
</body>
<%@include file="../includes/footer.jsp"%>

</html>