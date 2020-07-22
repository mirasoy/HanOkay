<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<% 
	String person = (String)request.getParameter("person");
%>
<style>


.page-wrapper{
	display: grid;
}

.page-contents{
	width: calc(75% - 1.875rem);
}

.page-sidebar{
	width: 28.5%;
	position: fixed;
	top: 25%;
 	right: 0;
}

.container-search{
	width: 100%;
	display: grid;
	grid-row: 1;
	grid-column: 1;
}

.container-navigation{
	width: 100%;
	display: grid;
	grid-row: 2;
	grid-column: 1/3;
}

.container-info{
	grid-row: 3;
	grid-column: 1;
}

.container-payment {

}


.detail-navigation-list{
	list-style: none;
	text-decoration: none;
	align-content: center;
}

.detail-navigation-list li{
	display: inline;
	padding: 10px;
}

.address{
	font-size: 15px;
}

.desc{
	font-style: italic;
	font-weight: bold;
	font-size: 20px;
}

.desc i{
	font-size: 10px;
	vertical-align: super;
}

#rangestart{
	width: 90%;
	grid-row: 1;
	grid-column: 1;
}

#rangeend{
	width: 90%;
	grid-row: 1;
	grid-column: 2;
}

#person{
	width: 90%;
	grid-row: 1;
	grid-column: 3;
}

details{
	width: 500px;
}

img {
	width: 100%;
}

.sub-title{
	font-size: 20px;
}

.rom-title{
	font-size: 10px;
}
/* 검색부분 */
.section {
	position: relative;
	height: 100vh;
}

.section .section-center {
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
}

#booking {
	font-family: 'Lato', sans-serif;
	background-size: cover;
	background-position: center;
	color: #191a1e;
}

.booking-form {
	position: relative;
	background: #fff;
	width: 95%;
	margin: 2%;
	padding: 20px 20px 20px;
	border-radius: 4px;
	-webkit-box-shadow: 0px 0px 10px -5px rgba(0, 0, 0, 0.4);
	box-shadow: 0px 0px 10px -5px rgba(0, 0, 0, 0.4);
}

.booking-form .booking-group {
	position: relative;
	width: 30%
}

.form-control {
	position: inline;
	background-color: #fff;
	height: 65px;
	padding: 0px 15px;
	padding-top: 24px;
	color: #191a1e;
	border: 2px solid #dfe5e9;
	font-size: 16px;
	font-weight: 700;
	-webkit-box-shadow: none;
	box-shadow: none;
	border-radius: 4px;
	-webkit-transition: 0.2s all;
	transition: 0.2s all;
}

.booking-form .form-control::-webkit-input-placeholder {
	color: #dfe5e9;
}

.booking-form .form-control:-ms-input-placeholder {
	color: #dfe5e9;
}

.booking-form .form-control::placeholder {
	color: #dfe5e9;
}

.booking-form .form-control:focus {
	background: #f9fafb;
}

.booking-form input[type="date"].form-control:invalid {
	color: #dfe5e9;
}

.booking-form select.form-control {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.booking-form select.form-control+.select-arrow {
	position: absolute;
	right: 6px;
	bottom: 6px;
	width: 32px;
	line-height: 32px;
	height: 32px;
	text-align: center;
	pointer-events: none;
	color: #dfe5e9;
	font-size: 14px;
}

.booking-form select.form-control+.select-arrow:after {
	content: '\279C';
	display: block;
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.booking-form .form-label {
	position: absolute;
	top: 6px;
	left: 20px;
	font-weight: 700;
	text-transform: uppercase;
	line-height: 24px;
	height: 24px;
	font-size: 12px;
	color: #98c9ee;
}

.booking-form .form-checkbox input {
	position: absolute !important;
	margin-left: -9999px !important;
	visibility: hidden !important;
}

.booking-form .form-checkbox label {
	position: relative;
	padding-top: 4px;
	padding-left: 30px;
	font-weight: 700;
	color: #191a1e;
}

.booking-form .form-checkbox label+label {
	margin-left: 15px;
}

.booking-form .form-checkbox input+span {
	position: absolute;
	left: 2px;
	top: 4px;
	width: 20px;
	height: 20px;
	background: #fff;
	border: 2px solid #dfe5e9;
	border-radius: 50%;
}

.booking-form .form-checkbox input+span:after {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	width: 0px;
	height: 0px;
	border-radius: 50%;
	background-color: #4fa3e3;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-transition: 0.2s all;
	transition: 0.2s all;
}

.booking-form .form-checkbox input:not(:checked)+span:after {
	opacity: 0;
}

.booking-form .form-checkbox input:checked+span:after {
	opacity: 1;
	width: 10px;
	height: 10px;
}

.booking-form .submit-btn {
	color: #fff;
	background-color: #4fa3e3;
	font-weight: 400;
	height: 65px;
	font-size: 18px;
	border: none;
	width: 30%;
	border-radius: 4px;
	text-transform: uppercase
}

.booking-cta {
	margin-top: 45px;
}

.booking-cta h1 {
	font-size: 52px;
	text-transform: uppercase;
	color: #4fa3e3;
	font-weight: 400;
}

.booking-cta p {
	font-size: 22px;
	color: #191a1e;
}

</style>

<div class = "page-wrapper">
	<div class = "page-contnets" style="width: calc(75% - 1.875rem);">
	
		<!-- 검색 조건 -->
		<div class = "container-search booking-form"" id="datepicker">
				<form>
					<div class="booking-search-row"> 
						<div class="booking-group">
							<span class="form-label">Checkin</span>
							<input class="form-control" type="text" placeholder="Start" id="in" name="in" value="<%=request.getParameter("in")%>">
						</div>
						<div class="booking-group">
							<span class="form-label">Checkout</span>
							<input class="form-control" type="text" placeholder="End" id="out" name="out" value="<%=request.getParameter("out")%>">
						</div>
						<div class="booking-group"  >
							<span class="form-label">Person</span>
								<select name="person" class="form-control select" id="rangeperson" style="height: 65px">
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
				</form>
		</div>

		<!-- 네비게이션 -->
		<div class = "container-navigation booking-form"">
			<ul class = "detail-navigation-list">
				<li><a href="#detail-info">숙소정보</a></li>
				<li><a href="#detail-room">객실정보</a></li>
				<li><a href="#detail-map">숙소위치</a></li>
				<li><a href="#detail-room">숙소리뷰</a></li>
			</ul>
		</div>
		
		<!-- 숙소정보-->
		<div class = "container-info booking-form"" name="detail-info">
			<h2><c:out value="${acm.acmName}" /><span id="stisf"></span></h2>
			<span class="address"><i class="fas fa-map-marker-alt"></i>&nbsp;<c:out value="${acm.acmCity}" />&nbsp;<c:out value="${acm.acmDistr}" />&nbsp;<c:out value="${acm.acmDetailaddr}" /></span></br>	
			<span class="desc"><i class="fa fa-quote-left" aria-hidden="true"></i><c:out value="${acm.acmDesc}" /><i class="fa fa-quote-right" aria-hidden="true"></i></span>
		</div>
		
		<!-- 숙소사진 -->
		<div class = "container-picture booking-form"">
				<table class="pic" style="border-color: red">
					<tr >
						<td id="pic1" rowspan="2" ></td>				
						<td id="pic2"></td><td id="pic3"></td>				
					</tr>
					<tr>
						<td id="pic4"></td><td id="pic5"></td>	
					</tr>
				</table>
		</div>
		
		<!-- 숙소리뷰 -->
		<div class = "container-review booking-form"">
			<label class="sub-title">숙소리뷰</label>
			<table>
				<c:forEach items="${rev}" var="rev" begin="0" end="4">
					<tr style="width:100%;">
						<td>
							<details>						
								<summary>
									<c:out value="${rev.revPtitle}" />
									<label id="stisf" star="${rev.revStisf}"></label>
								</summary>
		  						<p><c:out value="${rev.revContent}" /></p>
		  					</details>
						</td>
						<td style="vertical-align: top;"><fmt:formatDate value="${rev.revPregdate}" pattern="yyyy-MM"/><fmt:formatDate value="${rev.revPupdatedate}" pattern="(yyyy-MM)"/></td>
					</tr>
				</c:forEach>
				<c:if test="${empty rev}">
					<tr><td>첫번째 리뷰의 주인공이 되어보세요!</td></tr>
				</c:if>
			</table>
		</div>		
		
		<!-- 편의시설 -->
		<div class = "container-option booking-form"">
			<label class="sub-title">편의시설</label>
		</div>		
		
		<!-- 숙소위치 -->
		<div class = "container-map booking-form"">
			<label class="sub-title">숙소위치</label>
		</div>		
		
		<!-- 객실리스트 -->
		<div class = "container-roomlist booking-form"">
			<label class="sub-title">객실위치</label></br>
			<c:forEach items="${rom}" var="rom">
			<label class="rom-title"><c:out value="${rom.romName}" /></label>
				<table>
					<tr><td>${rom.romName}</td></tr>
					<tr><td>${rom.romNum}</td></tr>
				</table>
			</c:forEach>			
		</div>		
		
		
	</div> <!-- end of contents -->


	<div class = "page-sidebar ">
	<!-- 결제정보 -->
		<div class = "container-payment" id="payment">
			<div class="booking-form">
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
				결제정보</br>
			</div>
		</div>
	</div> <!-- end of navi -->
</div><!-- end of page -->

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
		
		// 인원 선택
		window.onload = function() {
			document.getElementById("rangeperson").value= <%=person%>;
			let i = 1;
			<c:forEach items="${pic}" var="pic">
				document.getElementById("pic"+ i).innerHTML = "<img alt='<c:out value="${pic.picAcmpdesc}" />' src='/display?fileName=<c:out value="${pic.picAcmpurl}" /><c:out value="${pic.picAcmpname }" />'>";
				i++;
			</c:forEach>
		}
		
		
		// 리뷰(하나만 선택되게)
		for(let i=0; i<document.getElementsByTagName("details").length; i++ ){
			document.getElementsByTagName("details")[i].onclick = function() {
				for(let j=0; j<document.getElementsByTagName("details").length; j++ ){
					if(i==j) continue;
					document.getElementsByTagName("details")[j].open = false;
				}
			}
		}
		
		// 숙소옵션
		// 임의의 숫자에서 32768를 나눈다 - 1이면 해당 옵션o
		// 나머지에서 16484를 나눈다 - 1이면 해당옵션 o
		
				
	</script>
<%@include file="../includes/footer.jsp"%>
</html>