<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../includes/header.jsp"%>
<% String person = request.getParameter("person"); %>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/suhee.css">
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>

<div class = "page-wrapper">
	<div class = "page-contnets" style="width: 100%;">
	
		<!-- 검색 조건 -->
		<div class = "container-search box" id="datepicker">
				<form>
					<div class="booking-search-row"> 
						<div class="row">
							<div class="booking-group" >
								<span class="form-label">Checkin</span>
								<input class="form-control" type="text" placeholder="Start" id="in" name="in" value="${in}" onchange="search()">
							</div>
							<div class="booking-group">
								<span class="form-label">Checkout</span>
								<input class="form-control" type="text" placeholder="End" id="out" name="out" value="${out}" onchange="search()">
							</div>
							<div class="booking-group"  >
								<span class="form-label">Person</span>
									<select name="person" class="form-control select" id="person" style="height: 65px" onchange="search()">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
									</select>
								<span class="select-arrow"></span>
							</div>
						</div>
					</div>
				</form>
		</div>

		<!-- 네비게이션 -->
		<div class = "detail-navigation-list container-navigation box">
			<div class = "detail-navigation-list">
				<a href="#info">INFO</a>
				<a href="#review-all">REVIEW</a>
				<a href="#location">LOCATION</a>
				<a href="#room-list">ROOM</a>
			</div>
		</div>

		<!-- 숙소정보-->
		<div class = "container-info box" id="info">
		<!-- 메세지보내기기능 -->
			<span>
			<form class = 'right' action='/chat/chatRoom' method='POST'>
			<input type='hidden' name='chatromnum' value='newChatr::${acmOwnerNum }'>
			<button class = 'btn right'>메시지보내기</button></form></span>
		<!-- 메세지보내기기능 -->	
			<span class="title"><c:out value="${acm.acmName}" /></span>
			<span id="stisf">&nbsp;</span>
			<span id="stisf-num">(<c:out value="${star}" />)</span>
			</br><span class="address"><i class="fas fa-map-marker-alt"></i>&nbsp;<c:out value="${acm.acmCity}" />&nbsp;<c:out value="${acm.acmDistr}" />&nbsp;<c:out value="${acm.acmDetailaddr}" />&nbsp;&nbsp;<a target="_blank" href="https://www.google.co.kr/maps/place/${acm.acmCity}${acm.acmDistr}${acm.acmDetailaddr}">지도보기</a></span>
			&emsp;<i class="fa fa-ellipsis-v" aria-hidden="true"></i>&emsp;<span class="phone"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;전화하기: <a href="tel:${acm.repPhone}"><c:out value="${acm.repPhone}"/></a></span>
			&emsp;<i class="fa fa-ellipsis-v" aria-hidden="true"></i>&emsp;<span class="email"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;메일보내기: <a href="mailto:${acm.acmEmail}"><c:out value="${acm.acmEmail}"/></a></span>&nbsp;&nbsp;<span class="copy">주소복사</span><i class="fa fa-clipboard" aria-hidden="true"></i>
			<input type="hidden" id="email" value="${acm.acmEmail}">
			</br><span class="desc" ><i class="fa fa-quote-left" aria-hidden="true"></i><c:out value="${acm.acmDesc}" /><i class="fa fa-quote-right" aria-hidden="true"></i></span>
			
			
		</div>
		
		<!-- 숙소사진 -->
		<div class = "container-picture box" id="picture">
				<table class="pic" style="border-color: red">
					<tr >
						<td id="pic1" rowspan="3" ></td>				
						<td id="pic2"></td><td id="pic3"></td>				
					</tr>
					<tr>
						<td id="pic4"></td><td id="pic5"></td>	
					</tr>
					<tr>
						<td id="pic6"></td><td id="pic7"></td>	
					</tr>
				</table>
		</div>
		
		<div class = "container-grid  box">
		<!-- 편의시설 -->
		<div class = "container-option" id="option">
			<label class="sub-title">OPTION</label>
			<div id=acmOpt></div>
		</div>		

		<!-- 숙소위치 -->
		<div class = "container-location booking-for" id="location">
			<label class="sub-title">LOCATION</label>
			<div id="map"></div>
		</div>	
				
		<!-- 숙소리뷰 -->
		<div class = "container-review" id="review">
			<label class="sub-title">REVIEW</label>
			<table>
				<c:forEach items="${rev}" var="rev" begin="0" end="4">
					<tr>
						<td>
							<details>						
								<summary>
									<span><c:out value="${rev.revPtitle}" />&nbsp;<fmt:formatDate value="${rev.revPregdate}" pattern="(yyyy년 M월)"/>
										<c:choose>
										    <c:when test="${rev.revStisf >= 3.0}"><i class="fa fa-thumbs-up" aria-hidden="true"></i></c:when>
										    <c:otherwise><i class="fa fa-thumbs-down" id="test" aria-hidden="true"></i></c:otherwise>
										</c:choose>
									</span>
								</summary>
								<c:choose>
								        <c:when test="${fn:length(rev.revContent) gt 90}">
								        <c:out value="${fn:substring(rev.revContent, 0, 89)} ... (중략) ">
								        </c:out></c:when>
								        <c:otherwise>
								        <c:out value="${rev.revContent}">
								        </c:out></c:otherwise>
								</c:choose>
		  					</details>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty rev}">
					<tr><td>첫 번째 리뷰의 주인공이 되어보세요!<i class="fa fa-smile-o" aria-hidden="true"></i></td></tr>
				</c:if>
				<tr><td><a href="#review-all">리뷰 더보기</a></td></tr>
			</table>
		</div>		
		</div>
		
		<!-- 객실리스트 -->
		<div class = "container-roomlist box" id="room-list">
			<label class="sub-title">ROOM</label></br>
				<table>
					<c:forEach items="${rom}" var="rom">
						<tr class= "rom-list" id="${rom.romNum}">
							<td class="rom-title"><span ><c:out value="${rom.romName}" /></span></td>
							<td class="rom-pic"><img alt='객실사진' src='/display?fileName=<c:out value="${rom.romPurl}" /><c:out value="${rom.romPname}" />' />
							</td>
							
							<td class="table-rom-td"><span class="rom-type"><c:out value="${rom.romType}" /></span>&nbsp;
							<span class="rom-size"><c:out value="${rom.romSize}" />(m²)</span>
							</br><i class="fa fa-user" aria-hidden="true"></i>&emsp;<span class="rom-capa"><c:out value="${rom.romCapa}" />명</span>
							</br><span class="rom-bed"><i class="fa fa-bed" aria-hidden="true"></i>&emsp;<c:out value="${rom.bedType}" />&nbsp;
								<c:choose>
									<c:when test="${rom.bedType eq '온돌'}"> </c:when>
									<c:otherwise>
										<c:out value="${rom.bedCnt}" />개
									</c:otherwise>
								</c:choose>
								</span>
							</td>
							
							<td class="table-rom-td rom-opt romOpt" >
							</td>
							
							<td class="table-rom-td rom-price"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp;<fmt:formatNumber value="${rom.romPrice}" type="number"/></br>(1박 기준)
							</td>
							
							<td class="table-rom-td rom-select">
								<span id="select-rom">
									<button onclick='book("${rom.romNum}","${rom.romPrice}")'>예약</button>
								</span>
							</td>
						</tr>
						<tr><td></br></td></tr>
					</c:forEach>
				</table>
			<c:if test="${empty rom}">
				예약 가능한 객실이 없습니다<i class="fa fa-meh-o" aria-hidden="true"></i></br>
			</c:if>		
		</div>		
		
		<div class = "container-reviewall box" id="review-all">
			
		</div>
		
       	<form action="/booking/new" id="form" method=post>
      		<input type="hidden" name="in" id="form-in" value="${in}">
      		<input type="hidden" name="out" id="form-out" value="${out}">
      		<input type="hidden" name="person" id="form-person" value="<%=person%>">
      		<input type="hidden" name="romNum" id="form-romNum" value="">
      		<input type="hidden" name="romPrice"id="form-romPrice" value="">
			<input type="submit" value="" id="form-submit" style="opacity: 0">
		</form>
		
	</div> <!-- end of contents -->
	<a class="button_scrolltop" href="#" onclick="window.scrollTo(0,0); return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></a>

</div><!-- end of page -->

	<script>

		window.onload = function() {
			// 인원 선택
			document.getElementById("person").value= <%=person%>; 
			// 숙소 평균 별점
			getStar(); 
			// 숙소 사진
			let i = 1;
			<c:forEach items="${pic}" var="pic">
				document.getElementById("pic"+ i).innerHTML = "<img alt='<c:out value="${pic.picAcmpdesc}" />' src='/display?fileName=<c:out value="${pic.picAcmpurl}" /><c:out value="${pic.picAcmpname }" />'>";
				i++;
			</c:forEach>
			// 구글맵 
			initMap(); 
			// 숙소, 객실 옵션
			getAcmOpt(); 
			getRomOpt();
		}

		/* // 객실 선택
		function selectRoom(romNum) {
			let room = document.getElementById(romNum);
			let list = document.getElementsByClassName("rom-list");
			
			for(let i = 0; i< list.length; i++){
				list[i].style.border='10px solid white';
				list[i].style.fontWeight='';
			}
			
			room.style.border='10px solid #61dafb';
			room.style.fontWeight='bold';
		} */
		 
		// 옵션 코드(10진수 옵션코드를 16자리 2진수로 변환한다)
		let acmOpt = pad(dec2bin("${acm.acmOptcode}"));
		let romOpt = new Array(); 

		let j = 0;
		<c:forEach items="${rom}" var="rom">
			romOpt[j] = pad(dec2bin('<c:out value="${rom.romOptcode}" />'));
			j++;
		</c:forEach>
		
		function dec2bin(codeNum){
			return (codeNum >>> 0).toString(2); 
		}
		function pad(code) {
			return code.length >= 16? code : new Array(16 - code.length+1).join('0') + code;
		}
		
		// 숙소 옵션
		function getAcmOpt() {
			let iconArr = new Array(); 
			let codeArr = new Array(); 
			let nameArr = new Array(); 
			
			let j = 0;
			<c:forEach items="${acmCode}" var="acmCode">
				iconArr[j] = '<c:out value="${acmCode.codeIcon}" />';
				codeArr[j] = 'acm' + '<c:out value="${acmCode.codeFull}" />';
				nameArr[j] = '<c:out value="${acmCode.codeCont}" />';
				j++;
			</c:forEach>

			let opt = document.getElementById("acmOpt");
			for(let k=0, cnt=0; k<acmOpt.length; k++){
				if(acmOpt.charAt(15-k) == 1){
					opt.innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>&nbsp;';
					cnt++;
					if(cnt > 1 && cnt % 4 == 0) opt.innerHTML += '</br>';
				}
			}
		}
		
		// 객실 옵션
		function getRomOpt() {
			let iconArr = new Array(); 
			let codeArr = new Array(); 
			let nameArr = new Array(); 
			
			let j = 0;
			<c:forEach items="${romCode}" var="romCode">
				iconArr[j] = '<c:out value="${romCode.codeIcon}" />';
				codeArr[j] = 'acm' + '<c:out value="${romCode.codeFull}" />';
				nameArr[j] = '<c:out value="${romCode.codeCont}" />';
				j++;
			</c:forEach>
			
			let opt = document.getElementsByClassName("romOpt");
			for(let l=0; l<romOpt.length; l++){
				for(let k=0; k<romOpt[l].length; k++){
					if(romOpt[l].charAt(15-k) == 1){
						opt[l].innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>&nbsp;&nbsp;';
					}
				}
			}
		}
		
		// 메일 복사하기
		document.querySelector(".copy").addEventListener("click", function(){
			var temp = document.createElement('textarea'); 
			temp.value = document.getElementById("email").value; 
			document.body.appendChild(temp);
			temp.select();//select()는 textarea, input 같은 form요소에서만 사용 가능
			document.execCommand("copy");
			document.body.removeChild(temp);
			alert("메일이 복사되었습니다!");
		});
		
		// 숙소 만족도(별점)
		function getStar() {
			let star = "${star}";
			let stisf = document.getElementById("stisf");
			let stisfNum = document.getElementById("stisf-num");
			
			for(let i = 0; i < Math.floor(star); i++){
				stisf.innerHTML += '<i class="fa fa-star" aria-hidden="true"></i>';
			}
			
			let half = star-Math.floor(star) < 0.5 ? 0 : 0.5; 
			for(let i = 0; i < half; i++){
				stisf.innerHTML += '<i class="fa fa-star-half" aria-hidden="true"></i>';
			}
			
			document.getElementById("stisf").style.color="#e3cf7a";
			document.getElementById("stisf").style.fontSize="50px";
		}
		
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
		
		// 리뷰(하나만 선택되게)
		for(let i=0; i<document.getElementsByTagName("details").length; i++ ){
			document.getElementsByTagName("details")[i].onclick = function() {
				for(let j=0; j<document.getElementsByTagName("details").length; j++ ){
					if(i==j) continue;
					document.getElementsByTagName("details")[j].open = false;
				}
			}
		}
		
		// 구글맵 api
		var mapLocation = {
			lat : parseFloat("<c:out value="${acm.latitude}" />"),
			lng : parseFloat("<c:out value="${acm.longitude}" />")
		};
		function initMap() { 
			var acmNum = "<c:out value="${acm.acmNum}" />";
			var mapOptions = {
				center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
				zoom : 14, 
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			mapOptions);
			
			var size_x = 50; // 마커로 사용할 이미지의 가로 크기
			var size_y = 50; // 마커로 사용할 이미지의 세로 크기
			
			// 마커로 사용할 이미지 주소
			var image = new google.maps.MarkerImage(
					'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
					new google.maps.Size(size_x, size_y),
					'',
					'',
					new google.maps.Size(size_x, size_y));
			var marker;
			marker = new google.maps.Marker({
				position : mapLocation, // 마커가 위치할 위도와 경도(변수)
				map : map,
				icon : image, // 마커로 사용할 이미지(변수)
				title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			});
			
			var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용
			
			// 마커를 클릭했을 때의 이벤트
			var infowindow = new google.maps.InfoWindow({
				content : content
			});
			google.maps.event.addListener(marker, "click", function() {
				infowindow.open(map, marker);
			});
			
		}
			
		// 검색값 변경
		function search() {
			document.getElementById("form-in").value = document.getElementById("in").value;
			document.getElementById("form-out").value = document.getElementById("out").value;
			document.getElementById("form-person").value = document.getElementById("person").value;
		}
		
		// 예약하기
		function book(romNum, romPrice) {
			// 객실 선택시 실행되어 해당 객실번호와 객실가격을 폼에 저장한다
			document.getElementById("form-romNum").value = romNum;
			document.getElementById("form-romPrice").value = romPrice;

 			// 로그인 확인, 인원 디폴트값, 1박 이상 선택 확인
			if('<%=user%>'=="null" || '<%=user%>' == null){
				alert("로그인이 필요합니다!");
				return false;
			} 
			
			if(person == "null" || person == "") person = 1;
			
			if(document.getElementById("in").value == document.getElementById("out").value){
				alert("1박 이상 선택해주세요!");
				return false;
			}
			
			// 폼의 submit을 실행하여 다음 페이지로 넘어간다
			document.getElementById("form").submit();
		}
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&callback=initMap">
	</script>
<%@include file="../includes/footer.jsp"%>
</html>