<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "A1");
String name = (String) session.getAttribute("loginUserNum");
%>
<%@include file="../includes/header.jsp"%>

<style>
.bookbar {
	width: 100%;
	height: 40px;
	list-style: none;
	padding: 0;
}

.bookbar>li {
	float: left;
	width: 110px;
	height: 30px;
	margin: 0;
	text-align: center;
	padding-top: 15px;
}

.panel-heading {
	padding-left: 25px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

/* The Close Button */
#close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

#close:hover, #close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">나의 예약</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div>
				<ul class="bookbar">
					<li class="item1"><a href="/MyPage/bookListAll">전체목록</a></li>
					<li class="item2"><a href="/MyPage/bookList">투숙예정</a></li>
					<li class="item3"><a href="/MyPage/checkout">투숙완료</a></li>
					<li class="item4"><a href="/MyPage/cancelled">취소된 예약</a></li>


				</ul>
			</div>

			<div class="panel-heading">
				<%=name%>의 예약 중인 목록입니다. (숙박예정)
			</div>


			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소이름</th>
							<th>#예약번호</th>
							<th>체크인날짜</th>
							<th>체크아웃날짜</th>
							<th>객실요금</th>
							<th>버튼1</th>
							<th>버튼2</th>
							<th>버튼3</th>
						</tr>
					</thead>

					<c:forEach items="${bookList}" var="board">
						<tr>
							<td><c:out value="${board.acmName}" /></td>
							<td><c:out value="${board.bookNum}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkoutDate}" /></td>
							<td><c:out value="${board.bookPrice}" /></td>

							<td><a href="/MyPage/info?bookNum=${board.bookNum}">예약정보</a></td>
							<td><button id="myBtn">예약 확정서 받기</button></td>
							<td><button id="myMap">
									숙소 위치 확인</a></td>

						</tr>
					</c:forEach>
				</table>


				<!-- The Modal (메일) -->
				<div id="myModal" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span id="close" class="close">&times;</span>
						<h1>예약 확정서 받기</h1>
						<!-- 				  <form action="mailSending.do" method="post">
					  <div>
					        <input type="text" name="tomail" size="120"
					        style="width: 100%" placeholder="당신의 이메일"
					        class="form-control">
					      </div> <br>
					      <div align="center">
					        <input type="submit" value="메일 보내기" class="btn btn-warning">
					      </div>
					</form> -->
						<form action="mailSending.jsp" method="post">
							<div>
								<input type="text" name="tomail" size="120" style="width: 100%"
									placeholder="상대의 이메일" class="form-control">
							</div>
							<div align="center">
								<!-- 제목 -->
								<input type="text" name="title" size="120" style="width: 100%"
									placeholder="제목을 입력해주세요" class="form-control">
							</div>
							<p>
							<div align="center">
								<!-- 내용 -->
								<textarea name="content" cols="120" rows="12"
									style="width: 100%; resize: none" placeholder="내용#"
									class="form-control"></textarea>
							</div>
							<p>
							<div align="center">
								<input type="submit" value="메일 보내기" class="btn btn-warning">
							</div>
						</form>
					</div>
				</div>
				<!-- end of myModal -->

				<!-- The Modal (맵) -->
				<div id="myModal2" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span id="close" class="close2">&times;</span>
						<h1>지도 확인하기</h1>
						<div id="map"></div>
						<!-- 지도가 붙을 위치 -->
					</div>
					<!-- end of myModal -->


				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->

	<script>
		var address = null;

		function getAddr() {

			$.ajax({

				type : 'post',

				headers : {

					"Content-Type" : "application/json"

				},

				async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.

				url : "/board/category/getAddr?userId=${boardDTO.userId}",

				dataType : "text",

				success : function(result) {

					if (result != null) {

						console.log("넘어온 값 : " + result);

						address = result;

					}

				}

			});

		};

		function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수

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

			var marker;

			marker = new google.maps.Marker({

				position : mapLocation, // 마커가 위치할 위도와 경도(변수)

				map : map,

				icon : image, // 마커로 사용할 이미지(변수)

				title : "${boardDTO.userId}(님) 의 거래 희망 위치" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀

			});

			var content = "${boardDTO.userId} 님은 " + address
					+ " 근처에서 거래를 희망합니다."; // 말풍선 안에 들어갈 내용

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


	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9doHEOny5z2QCXaCBWMm84aCRbPs0YVA&callback=initMap">
		
	</script>



	<script>
		// Get the modal
		var modal = document.getElementById("myModal");
		var modal2 = document.getElementById("myModal2");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		var btn2 = document.getElementById("myMap");

		var nav = document.getElementById("side-menu");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		var span2 = document.getElementsByClassName("close2")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
			nav.style.display = "none";

		}

		btn2.onclick = function() {
			modal2.style.display = "block";
			nav.style.display = "none";

		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";

		}

		span2.onclick = function() {
			modal2.style.display = "none";
		}

		/* 
		
		 /// When the user clicks anywhere outside of the modal, close it
		 window.onclick = function(event) {
		 if (event.target == modal) {
		 modal.style.display = "none";
		 }
		 } 
		 */
	</script>


	<%@include file="../includes/footer.jsp"%>