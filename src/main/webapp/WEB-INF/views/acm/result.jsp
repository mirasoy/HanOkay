<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String location = (String)session.getAttribute("location"); %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Booking Form HTML Template</title>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<style>
#map {
	width: 33%;
    height: 990px;
    background-color: grey;
    display: inline-block;
}

#myTable {
	width: 65%;
	height: 990px;
	display: inline-block;
}


</style>

<link href="../resources/css/select2.css" rel="stylesheet">
<script src="../resources/js/select2.js"></script>
    <script>
        $(document).ready(function() { $("#e1").select2(); });
    </script>
</head>

<body>

	<div class="row">
		<div class="booking-form">
			<form action="/acm/result" method='get'>
				<div class="row no-margin">
				
					<div class="col-md-7">
						<div class="row no-margin">
							<div class="col-md-4">
								<div class="form-group">
									<span class="form-label">Location</span> 
									<input type="hidden" value="CW" name="type">
									<select class="form-control" name="keyword" id="e1" value='<c:out value="${pageMaker.cri.keyword}"/>' >
        								<option value="서울">서울특별시</option>
        								<option value="경기">경기도</option>
        								<option value="충북">충청북도</option>
        								<option value="충남">충청남도</option>
        								<option value="경북">경상북도</option>
        								<option value="경남">경상남도</option>
        								<option value="대구">대구광역시</option>
        								<option value="대전">대전광역시</option>
        								<option value="부산">부산광역시</option>
        								<option value="인천">인천광역시</option>
        								<option value="강원">강원도</option>
        								<option value="전북">전라북도</option>
        								<option value="전남">전라남도</option>
        								<option value="제주">제주특별자치도</option>
    								</select>
								</div>
							</div>
							
							<div class="col-md-4">
								<div class="form-group">
									<span class="form-label">Check In</span> 
									<div class="ui calendar" id="rangestart">
										<div class="ui input left icon">
											<i class="calendar icon"></i> 
											<input type="text" placeholder="Start" id="in" name="in" value="<c:out value="${pageMaker.cri.in}"/>">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<span class="form-label">Check out</span> 
									<div class="ui calendar" id="rangeend">
										<div class="ui input left icon">
											<i class="calendar icon"></i> 
											<input type="text" placeholder="End" id="out" name="out" value="<c:out value="${pageMaker.cri.out}"/>">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<span class="form-label">Guests</span>
												<select class="form-control" id="person" name="person">
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
					</div>
					<div class="col-md-2">
						<div class="form-btn">

							<button class="submit-btn" type="submit">Check
								availability</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end of row -->
	
	
	
	<div id="myTable">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>숙소사진</th>
				<th>숙소 이름</th>
				<th>주소</th>
				<th>숙소설명</th>
			</tr>
		</thead>

		<c:forEach items="${list }" var="acm">
		  
			<tr class='move' href='<c:out value="${acm.acmNum}"/>' onclick="location.href='<c:out value="${acm.acmNum}"/>'" style="cursor:pointer;"> 
				<td><img alt="" src="<c:out value="${acm.acmPurl}"/>" width="100"></td>
				<td><c:out value="${acm.acmName}" /></td>
				<td><c:out value="${acm.acmCity }" /> <c:out value="${acm.acmDistr }" /> <c:out value="${acm.acmDetailaddr }" /></td>
				<td><c:out value="${acm.acmDesc }" /></td>
			</tr>
			<input type="hidden" id="latitude"
				value='<c:out value="${acm.latitude }" />'>
			<input type="hidden" id="longitude"
				value='<c:out value="${acm.longitude }" />'>
		</c:forEach>
	</table>
	<div class='pull-right'>
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a
					href="${num}">${num}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id='actionForm' action="/acm/result" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
		<input type='hidden' name='person' value='<c:out value="${pageMaker.cri.person}"/>'>
		<input type='hidden' name='in' value='<c:out value="${pageMaker.cri.in}"/>'>
		<input type='hidden' name='out' value='<c:out value="${pageMaker.cri.out}"/>'>	
	</form>
	
	</div>
<!-- GoogleMap API 연동(황영롱) -->
	
	<div id="map"></div>
	<!-- 지도가 붙을 위치 -->

	
	<script>
	<!-- 달력 변경(수희) -->
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
	</script>            
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<!-- 달력 변경. 끝 -->

	<script>	
	/* 
	datePickerId.min = new Date().toISOString().split("T")[0];
	
	document.getElementById("datePickerId2").disabled = true;
	$("#datePickerId").on("change", function() {
	      console.log($(this).val()); 
	     var testDate= $(this).val();
	     var date_regex = /^\d{4}-\d{2}-\d{2}$/;
	     if((date_regex.test(testDate)))
	      document.getElementById("datePickerId2").disabled = false;
	     
	     var end_ymd= document.getElementById("datePickerId").value;
	     
	     var yyyy = end_ymd.substr(0,4);
	     var mm = end_ymd.substr(5,2);
	     var dd = end_ymd.substr(8,2);
	     var com_ymd = new Date(yyyy,mm-1,dd);
	     
	     com_ymd.setDate(com_ymd.getDate() + 1);
	     var yyyy= com_ymd.getFullYear();
	     var mm = com_ymd.getMonth()+1;
	     var dd = com_ymd.getDate();
	     
	     function dateToYYYYMMDD(date){
	    	    function pad(num) {
	    	        num = num + '';
	    	        return num.length < 2 ? '0' + num : num;
	    	    }
	    	    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	    	}
	     
	 	 datePickerId2.min = dateToYYYYMMDD(com_ymd);
	}); 
	*/
	
	

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
			var latitude = document.getElementById("latitude").value;
			var longitude = document.getElementById("longitude").value;
			
			<c:forEach items="${list }" var="acm">
			if("${acm.acmNum}"===acmNum){
				
				var latitude = ${acm.latitude};
				var longitude = ${acm.longitude};
			}
			</c:forEach>
			
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

				zoom : 15, // 지도 zoom단계

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
			var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
			
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&callback=initMap">
	</script>
	<script type="text/javascript">
		$("#person").val('<c:out value="${pageMaker.cri.person}"/>');
		$("#e1").val('<c:out value="${pageMaker.cri.keyword}"/>');
	
		$(document)
				.ready(
						function() {
							var result = '<c:out value="${result}"/>';

							checkModal(result);

							history.replaceState({}, null, null);

							function checkModal(result) {
								if (result === '' || history.state) {
									return;
								}
								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}
								$("#myModal").modal("show");
							}

							$("#regBtn").on("click", function() {
								self.location = "/acm/register";
							});

							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							 $(".move").on("click",function(e) {
												e.preventDefault();
												actionForm.append("<input type='hidden' name='acmNum' value='"
																+ $(this).attr("href")
																+ "'>");
												actionForm.attr("action","/acm/get");
												actionForm.submit();
											}); 

// 							$(".move").on("click",function(e) {
//                                 e.preventDefault();
//                                 actionForm.append("<input type='hidden' name='acmNum' value='"
//                                             + $(this).attr("href")
//                                             + "'>");
//                                 actionForm.append("<input type='hidden' name='in' value='2020-08-01'>");
//                                 actionForm.append("<input type='hidden' name='out' value='2020-08-03'>");
//                                 actionForm.append("<input type='hidden' name='person' value='2'>");
//                                 actionForm.attr("action","/acm/get");
//                                 actionForm.submit();
//                              }); 
// >>>>>>> develop
						/* 	$(".move").on("click",function(e) {
								e.preventDefault();
								var acmnum= ${acm.acmNum};
								console.log(acmnum);
								initMap();
								
							}); */

							var searchForm = $("#searchForm");
							$("#searchForm button")
									.on(
											"click",
											function(e) {
												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요");
													return false;
												}
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();

												searchForm.submit();
											});
						});
	</script>
	<%@include file="../includes/footer.jsp"%>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>