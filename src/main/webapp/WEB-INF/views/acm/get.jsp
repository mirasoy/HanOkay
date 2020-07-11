<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<% 
	String person = (String)request.getParameter("person");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>호텔 상세페이지</title>
<style>
#map {
	width: 33%;
	height: 600px;
	background-color: grey;
	display: inline-block;
	background-color: grey;
}
</style>
</head>

<body>
	<div>
		<div>
			</br>
			</br>
			</br>
			</br>
			</br> </br>
			<link
				href="https://cdn.rawgit.com/mdehoog/Semantic-UI/6e6d051d47b598ebab05857545f242caf2b4b48c/dist/semantic.min.css"
				rel="stylesheet" type="text/css" />
			<script
				src="https://cdn.rawgit.com/mdehoog/Semantic-UI/6e6d051d47b598ebab05857545f242caf2b4b48c/dist/semantic.min.js"></script>
			<div>
				[객실 선택] 체크인
				<div class="ui calendar" id="rangestart">
					<div class="ui input left icon">
						<i class="calendar icon"></i> 
						<input type="text" placeholder="Start" id="in" name="in" value="<%=request.getParameter("in")%>">
					</div>
				</div>
				체크아웃
				<div class="ui calendar" id="rangeend">
					<div class="ui input left icon">
						<i class="calendar icon"></i> 
						<input type="text" placeholder="End" id="out" name="out" value="<%=request.getParameter("out")%>">
					</div>
				</div>
				
			</div>
			
			<input type="hidden" id="person" value="<%=person%>">

		</div>
		</br> </br> </br>

		<div>
			[숙소정보]</br>
			<c:out value="${acm.acmName}" />
			</br>
			<c:out value="${acm.acmCity}" />
			<c:out value="${acm.acmDistr}" />
			<c:out value="${acm.acmDetailaddr}" />
			</br>
			<c:out value="${acm.acmDesc}" />
			</br> </br> </br> </br>
			<table>
				<tr>
					[숙소사진]
					</br>
					<td rowspan="3"><img alt="대표사진"
						src="<c:out value="${acm.acmPurl}" />"></td>
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
		</div>
		</br> </br> </br>

		<div>
			[숙소리뷰]</br>
			<table>
				<thead>
					<tr>
						<th>리뷰&emsp;</th>
						<th>만족도&emsp;</th>
						<th>작성자&emsp;</th>
						<th>등록일&emsp;</th>
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
				
				<c:if test="${empty rev}">
					<tr><td>(리스트가 없습니다)</td></tr>
				</c:if>
			</table>
		</div>

		</br> </br> </br>

		<div>
			[편의시설]</br>
			<table>
				<c:forEach items="${opt }" var="opt">
					<td><c:out value="${opt.acmOptcode}" />&emsp;</td>
				</c:forEach>
				
				<c:if test="${empty opt}">
					<td>(리스트가 없습니다)</td>
				</c:if>
			</table>

		</div>

		</br> </br> </br>

		<div>
			[객실정보]</br>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>객실이름&emsp;</th>
						<th>객실타입&emsp;</th>
						<th>침대타입x갯수&emsp;</th>
						<th>인원&emsp;</th>
						<th>객실크기&emsp;</th>
						<th>1박이용료&emsp;</th>
					</tr>
				</thead>
				<c:forEach items="${rom }" var="rom">
					<tr>
						<td><img alt="객실 사진" src="<c:out value="${rom.romPurl}" />"></td>
						<td><c:out value="${rom.romName}" />&emsp;</td>
						<td><c:out value="${rom.romType}" /></td>
						<td><c:out value="${rom.bedType}" /> x <c:out
								value="${rom.bedCnt}" />&emsp;</td>
						<td><c:out value="${rom.romCapa}" />&emsp;</td>
						<td><c:out value="${rom.romSize}" />&emsp;</td>
						<td><c:out value="${rom.romPrice}" /></td>
						<td><button class="reservBtn"
								value="&price=<c:out value="${rom.romPrice}"/>"
								data-romNum="${rom.romNum}">예약하기</button></td>
					</tr>
				</c:forEach>
				<c:if test="${empty rom}">
					<tr><td>(리스트가 없습니다)</td></tr>
				</c:if>
			</table>
		</div>
	</div>
	</br>
	</br>
	</br> [위치정보]
	</br>
	<div id="map"></div>
	<script>
	
		// 날짜 선택
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
		
	
		// 페이지 이동
		let person = document.getElementById("person").value;
		let reservBtns = document.getElementsByClassName("reservBtn");
		
		for(let i = 0; i<reservBtns.length; i++){
			let reservBtn = reservBtns[i];
			reservBtn.addEventListener("click", function(){
				/* alert(this.getAttribute("data-romNum")) */
				let checkin = document.getElementById("in").value;
				let checkout = document.getElementById("out").value;
				
				if('<%=user%>'=="null" || '<%=user%>' == null){
					alert("로그인이 필요합니다!");
					return false;
				}
				
				if(person == "null" || person == "") person = 1;
				
				if(document.getElementById("in").value == document.getElementById("out").value){
					alert("1박 이상 선택해주세요!");
					return false;
				}else{
					document.location = '../../booking/new?romNum='+this.getAttribute("data-romNum") 
						+ this.value + "&in=" + checkin +"&out=" + checkout +"&person=" + person;
					return true;
				}
			});
		}
		
		
		//***************** 경원찡 만든 구글맵 api
		var address = null;
		
		function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수

			var acmNum = "${acm.acmNum}";
			
			var latitude="";
			var longitude="";
			
			if("${acm.acmNum}"===acmNum){
				console.log("true");
				latitude = ${acm.latitude};
				longitude = ${acm.longitude};
			}
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
			
			var mapLocation = {
				lat : latVal,
				lng : lngVal
			}; // 위도, 경도를 가지는 객체를 생성


			var mapOptions = {
				center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
				zoom : 18, // 지도 zoom단계
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			mapOptions);
			
			var size_x = 30; // 마커로 사용할 이미지의 가로 크기
			
			var size_y = 30; // 마커로 사용할 이미지의 세로 크기

			// 마커로 사용할 이미지 주소
			var image = new google.maps.MarkerImage(
					'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
					
					new google.maps.Size(size_x, size_y),
					'',
					'',
					new google.maps.Size(size_x, size_y));

			var latLng = {lat: parseFloat(${acm.latitude }), lng: parseFloat(${acm.longitude})};

			var marker;

			marker = new google.maps.Marker({

				position : latLng, // 마커가 위치할 위도와 경도(변수)
				map : map,
				icon : image, // 마커로 사용할 이미지(변수)
				title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀

			});
			
			var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용
			
			// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
			var infowindow = new google.maps.InfoWindow({
				content : content
			});

			google.maps.event.addListener(marker, "click", function() {
				infowindow.open(map, marker);
			});
			
		}
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9doHEOny5z2QCXaCBWMm84aCRbPs0YVA&callback=initMap">
	</script>
	<script src="resources/js/bootstrap-datepicker.js"></script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>