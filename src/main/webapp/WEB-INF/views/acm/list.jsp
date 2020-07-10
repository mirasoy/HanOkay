<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/resources/css/bootstrap.min.css" />

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/resources/css/style.css" />



<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Booking Form HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Alegreya:700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="../resources/css/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>



<body>
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<form action="/acm/result" method='get'>
							<div class="row no-margin">
								<div class="col-md-3">
									<div class="form-header">
										<h2>Book Now</h2>
									</div>
								</div>
								<div class="col-md-7">
									<div class="row no-margin">
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Location</span>
												<input class="form-control" type="text" name="keyword">
												<input type="hidden" value="CW" name="type">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Check In</span>
												<input class="form-control" type="date" name="in" id="datePickerId">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Check out</span>
												<input class="form-control" type="date" name="out" id="datePickerId2">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<span class="form-label">Guests</span>
												<select class="form-control" name="person">
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
										<div class="col-md-2">
											<div class="form-group">
												<span class="form-label">Kids</span>
												<select class="form-control">
													<option>0</option>
													<option>1</option>
													<option>2</option>
												</select>
												<span class="select-arrow"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-btn">
									
						
										<button class="submit-btn" type="submit">Check availability</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div><!-- end of row -->
			</div>
		</div>
	</div>
	
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Acm List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Acm</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#숙소번호</th>
							<th>숙소 이름</th>
							<th>지역</th>
							<th>번호</th>
							<th>숙소설명</th>
						</tr>
					</thead>

					<c:forEach items="${list }" var="acm">
						<tr>
							<td><c:out value="${acm.acmNum }" /></td>
							<td><a class='move' href='<c:out value="${acm.acmNum}"/>'>
									<c:out value="${acm.acmName}" />
							</a></td>
							<td><c:out value="${acm.acmCity }" /></td>
							<td><c:out value="${acm.repPhone }" /></td>
							<td><c:out value="${acm.acmDesc }" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- table 태그의 끝 -->
				<div class='row'>
					<div class="col-lg-12">
					
					<form id='searchForm' action="/acm/list" method='get'>
						<select name = 'type'>
							<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>숙소이름</option>
							<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>숙소지역</option>
							<option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>숙소이름 or 숙소지역</option>
							<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>숙소이름 or 작성자</option>
							<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>숙소이름 or 숙소지역 or 작성자</option>
						</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
						<button class='btn btn-default'>Search</button>
					</form>
					</div>
				</div>

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
				<!-- end Pagination -->


				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
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
<!-- /.row -->
<script type="text/javascript">
//참고
function initAutocomplete(){
autocomplete = new google.maps.places.Autocomplete(
		/** @type{!HTMLInputElement} */(document.getElementById('autocomplete')),
		{types: ['geocode'],componentRestrictions: {country: 'kr'}});
autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress(){
	var place = autocomplete.getPlace();
	$('#lat').prop('value',place.geometry.location.lat());
	$('#lng').prop('value',place.geometry.location.lng());
	console.log(place.formatted_address);
	console.log('?');
	if(document.getElementById('country')!=null){
		fill_addr();
	}
}
//참고 끝


datePickerId.min = new Date().toISOString().split("T")[0];
	
	document.getElementById("datePickerId2").disabled = true;
	$("#datePickerId").on("change paste keyup", function() {
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
	     
	     
	     var checkout = yyyy+"-"+mm+"-"+dd; 120-7-21 
	     
	 	 datePickerId2.min = dateToYYYYMMDD(com_ymd);
	});
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
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click", function(e){
							e.preventDefault();
							actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
							actionForm.attr("action","/acm/get");
							actionForm.submit();
						});
						
						var searchForm = $("#searchForm");
						$("#searchForm button").on("click", function(e){
							if(!searchForm.find("option:selected").val()){
								alert("검색종류를 선택하세요");
								return false;
							}
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력하세요");
								return false;
							}
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
						})
					});
</script>
<%@include file="../includes/footer.jsp"%>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>