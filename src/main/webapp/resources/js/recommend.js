var latitude;
    var longitude;
    var weather = "";

   
    $(document).ready(function () {
    	 var today = new Date();
    	    
    	    var Nowhour = (today.getHours()+4)%24 ;
    	    
    	   
    	    if(Nowhour>22){
    	    	 $(".banner-bg").css({'background-image': 'url(../resources/img/back1.png)'});
    	    }else if(Nowhour>15){
    	    	 $(".banner-bg").css({'background-image': 'url(../resources/img/back2.png)'});
    	    }else if(Nowhour>9){
    	    	 $(".banner-bg").css({'background-image': 'url(../resources/img/back3.png)'});
    	    }else{
    	    	 $(".banner-bg").css({'background-image': 'url(../resources/img/back4.png)'});
    	    }

    	
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