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
</script>
<%@include file="../includes/footer.jsp"%>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>