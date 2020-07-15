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
			<div>
				[객실 선택]</br> 
				<div  id="datepicker">
					체크인</br>
					<div class="ui calendar" id="rangestart">
						<div class="ui input left icon">
							<i class="calendar icon"></i> 
							<input type="text" placeholder="Start" id="in" name="in" value="<%=request.getParameter("in")%>">
						</div>
					</div>
					체크아웃</br>
					<div class="ui calendar" id="rangeend">
						<div class="ui input left icon">
							<i class="calendar icon"></i> 
							<input type="text" placeholder="End" id="out" name="out" value="<%=request.getParameter("out")%>">
						</div>
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
						<td>
							<c:choose>
								<c:when test="${rev.revDetail.stisf==1}">★</c:when>
								<c:when test="${rev.revDetail.stisf==2}">★★</c:when>
								<c:when test="${rev.revDetail.stisf==3}">★★★</c:when>
								<c:when test="${rev.revDetail.stisf==4}">★★★★</c:when>
								<c:when test="${rev.revDetail.stisf==5}">★★★★★</c:when>
							</c:choose>
						<td><c:out value="${rev.userNum}" /></td>
						<td><fmt:formatDate value="${rev.regDate}" pattern="yyyy-MM-dd"/></td>
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
					<td>
						<c:choose>
							<c:when test="${opt.acmOptcode eq'AC_OPT_SW'}">
								수영장
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_PK'}">
								주차장
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_PU'}">
								공항 이동 교통편 서비스
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_GM'}">
								체육관/피트니스
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_FD'}">
								24시간 프런트 데스크
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_FA'}">
								가족/아동 여행객 친화형 시설
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_NS'}">
								금연
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_SP'}">
								스파/사우나
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_RT'}">
								레스토랑
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_SA'}">
								흡연 구역
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_WP'}">
								반려동물 동반 가능
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_AD'}">
								장애인용 편의 시설/서비스
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_VC'}">
								비즈니스 관련 편의 시설
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_GP'}">
								골프장
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_WF'}">
								인터넷
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_BF'}">
								조식
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_LC'}">
								중식
							</c:when>
							<c:when test="${opt.acmOptcode eq'AC_OPT_DN'}">
								석식
							</c:when>
							<c:otherwise>기타</c:otherwise>
						</c:choose>
					</td>
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
						<td><c:out value="${rom.romCapa}" />명&emsp;</td>
						<td><c:out value="${rom.romSize}" />m²&emsp;</td>
						<td>₩ <fmt:formatNumber value="${rom.romPrice}" type="number"/></td>
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

		$("#out").datepicker({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()+1),
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()),
			numberOfMonths: 2,
			dateFormat: 'yy-mm-dd'
		});
		$("#in").datepicker({
			minDate: 0,
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()-1),
			numberOfMonths: 2,
			dateFormat: 'yy-mm-dd',
			onSelect: function(selectedDate) {
				var nextDay = new Date(selectedDate);
				nextDay.setDate(nextDay.getDate() + 1);
			  $("#out").datepicker("option","minDate", nextDay);
				var nextMonth = new Date(selectedDate);
				nextMonth.setDate(nextMonth.getDate() + 90);
			  $("#out").datepicker("option","maxDate", nextMonth);
			  $("#out").datepicker("open");
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
		
		
		//***************** 구글맵 api(경원)
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&callback=initMap">
	</script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>