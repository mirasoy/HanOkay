<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String checkin = request.getParameter("in");
	String checkout = request.getParameter("out");
	String person = request.getParameter("person");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>호텔 상세페이지</title>

<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="../resources/css/bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
#map {
	width: 33%;
    height: 600px;
    background-color: grey;
    display: inline-block;
}
</style>
</head>

<body>
	<div>
		<div>
			[숙소정보]</br>
			<c:out value="${acm.acmName}" /></br>
			<c:out value="${acm.acmCity}" /><c:out value="${acm.acmDistr}" /><c:out value="${acm.acmDetailaddr}" /></br>
			<c:out value="${acm.acmDesc}" /></br>

</br>
</br>
</br>
			<table>
				<tr>
					[숙소사진]</br>
				  	<td rowspan="3"><img alt="대표사진" src="<c:out value="${acm.acmPurl}" />"></td>
				  	<td><img alt="사진1" src="<c:out value="${acm.acmPurl1}" />"></td>
				    <td><img alt="사진2" src="<c:out value="${acm.acmPurl2}" />"></td>
				  	<td><img alt="사진3" src="<c:out value="${acm.acmPurl3}" />"></td>
				</tr>
				<tr>
				    <td><img alt="사진4" src="<c:out value="${acm.acmPurl4}" />"></td>
				  	<td><img alt="사진5" src="<c:out value="${acm.acmPurl5}" />"></td>
				    <td><img alt="사진6" src="<c:out value="${acm.acmPurl6}" />"></td>
				</tr>
			</table>
					
				<%--<c:out value="${acm.repPhone}" /></br>
					<c:out value="${acm.acmPhone2}" /></br>
					<c:out value="${acm.acmFax}" /></br>
					<c:out value="${acm.acmEmail}" /></br>
					<c:out value="${acm.checkinTime}" /></br>
					<c:out value="${acm.checkoutTime}" /></br> --%>
		</div>

</br>
</br>
</br>
		
		<div>
			[숙소리뷰]</br>
			<table>
				<thead>
					<tr>
						<th>리뷰</th>
						<th>만족도</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
							
				<c:forEach items="${rev }" var="rev">
					<tr>
						<td><c:out value="${rev.title}" /></td>
						<td><c:out value="${rev.revDetail.stisf}" /></td>
						<td><c:out value="${rev.userNum}" /></td>
						<td><c:out value="${rev.regDate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
</br>
</br>
</br>
		
		<div>
			[편의시설]</br>
			<table>
				<thead>
					<tr>
						<th>편의시설</th>
					</tr>
				</thead>
							
				<c:forEach items="${opt }" var="opt">
					<td><c:out value="${opt.acmOptcode}" /></td>
				</c:forEach>
			</table>		
			
		</div>
		
</br>
</br>
</br>
		
		<div>
			[객실정보]</br>
			<table>
				<thead>
					<tr>
						<th>방이름</th>
						<th>인원</th>
						<th>침대타입</th>
						<th>침대개수</th>
						<th>방크기</th>
						<th>가격</th>
						<th>사진</th>
					</tr>
				</thead>
							
				<c:forEach items="${rom }" var="rom">
					<tr>
						<td><img alt="객실 사진" src="<c:out value="${rom.romPurl}" />"></td>
						<td><c:out value="${rom.roomName}" /></td>
						<td><c:out value="${rom.capacity}" /></td>
						<td><c:out value="${rom.bedType}" /></td>
						<td><c:out value="${rom.bedCnt}" /></td>
						<td><c:out value="${rom.romSize}" /></td>
						<td><c:out value="${rom.price}" /></td>
						<td><a type="button" href="
						/booking/new?romNum=<c:out value="${rom.romNum}"/>
						&in=<%=checkin%>&out=<%=checkout%>&person=<%=person%>&price=<c:out value="${rom.price}"/>
						">예약하기</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- GoogleMap API 연동(황영롱) -->
	
</br>
</br>
</br>
	[위치정보]</br>
	<div id="map"></div>
	<!-- 지도가 붙을 위치 -->
	<script>
	
		var address = null;
		

		/*  function getAddr(){
		
		     $.ajax({
		
		           type:'post',
		
		           headers:{
		
		               "Content-Type":"application/json"
		
		           },
		
		           async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.
		
		           url:"/board/category/getAddr?userId=${boardDTO.userId}",
		
		           dataType:"text",
		
		           success : function(result){
		
		               if ( result != null ){
		
		                   console.log("넘어온 값 : " + result);
		
		                   address = result;  
		
		               }
		
		           }
		
		       });
		
		 }; */

		function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
/*
			getAddr();

			var latVal = $
			{
				boardDTO.lat
			}
			; // 게시글 DTO에서 위도값을 가져옴

			var lngVal = $
			{
				boardDTO.lon
			}
			; // 게시글 DTO에서 경도값을 가져옴
*/			

			var acmNum = "${acmNum}";
			
			console.log(acmNum);
			var latitude="";
			var longitude="";
			console.log(latitude);
			
			<c:forEach items="${list }" var="acm">
			if("${acm.acmNum}"===acmNum){
				console.log("true");
				latitude = ${acm.latitude};
				longitude = ${acm.longitude};
			}
			</c:forEach>
			console.log(latitude);
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
			console.log('initMap');
			
			
			var mapLocation = {
					
				lat : latVal,
				lng : lngVal
			}; // 위도, 경도를 가지는 객체를 생성

			/*     var map = new google.maps.Map(document.getElementById('map'), { // 위의 div id="map" 부분에 지도를 추가하는 부분
			
			      zoom: 18, // 확대 정도(ZOOM)
			
			      center: uluru // 지도에 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함
			
			    });
			
			 */

			var mapOptions = {

				center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)

				zoom : 18, // 지도 zoom단계

				mapTypeId : google.maps.MapTypeId.ROADMAP

			};

			var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함

			mapOptions);

			var size_x = 60; // 마커로 사용할 이미지의 가로 크기

			var size_y = 60; // 마커로 사용할 이미지의 세로 크기

			// 마커로 사용할 이미지 주소

			var image = new google.maps.MarkerImage(
					'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',

					new google.maps.Size(size_x, size_y),

					'',

					'',

					new google.maps.Size(size_x, size_y));

			<c:forEach items="${list }" var="acm">
			var latLng = {lat: parseFloat(${acm.latitude}), lng: parseFloat(${acm.longitude})};
			console.log(latLng);
			
			var marker;

			marker = new google.maps.Marker({

				position : latLng, // 마커가 위치할 위도와 경도(변수)

				map : map,

				icon : image, // 마커로 사용할 이미지(변수)

				title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀

			});
			
			
			</c:forEach>
			var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용

			// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~

			var infowindow = new google.maps.InfoWindow({
				content : content
			});

			google.maps.event.addListener(marker, "click", function() {

				infowindow.open(map, marker);

			});
			

			/*
			
			 단순한 마커로 default로 표시할 때 쓰는 마커 세팅
			
			var marker = new google.maps.Marker({
			
			    position: uluru,
			
			    map: map
			
			  });
			
			  
			
			 */

		}
	</script>

	<!--
 
                    아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
 
                    key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
 
                 -->

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9doHEOny5z2QCXaCBWMm84aCRbPs0YVA&callback=initMap">
		
	</script>
</body>


	
	
</html>