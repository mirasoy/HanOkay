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

.search-container{
	width: 100%;
	display: grid;
	grid-row: 1;
	grid-column: 1;
}

.detail-navigation{
	width: 100%;
	display: grid;
	grid-row: 2;
	grid-column: 1/3;
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

#payment{
	width: 90%;
	grid-row: 1;
	grid-column: 2;
}


</style>

<div class = page-wrapper>

	<!-- 검색 조건 a -->
	<div class = "a search-container" id="datepicker">
		<div class="ui calendar" id="rangestart">
			<label>Check-in</label>
			<div class="ui input left icon">
				<i class="calendar icon"></i> 
				<input class="form-control" type="text" placeholder="Start" id="in" name="in" value="<%=request.getParameter("in")%>">
			</div>
		</div>
		<div class="ui calendar" id="rangeend">
			<label>Check-out</label>
			<div class="ui input left icon">
				<i class="calendar icon"></i> 
				<input class="form-control" type="text" placeholder="End" id="out" name="out" value="<%=request.getParameter("out")%>">
			</div>
		</div>
		<div id="person">
			<label for="inputAdult">Guests</label> 
			<select name="person" class="form-control select" id="rangeperson">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select>
		</div>
	</div>
	
	<!-- 결제정보 b -->
	<div class = "b" id="payment">
		결제정보
	</div>
	<!-- 숙소정보 c -->
	<div class = "c detail-navigation">
		<ul class = "detail-navigation-list">
			<li><a href="#detail-info">숙소정보</a></li>
			<li><a href="#detail-room">객실정보</a></li>
			<li><a href="#detail-map">숙소위치</a></li>
			<li><a href="#detail-room">숙소리뷰</a></li>
		</ul>
	</div>
	
	<div class = "d acm-dtail" name="detail-info">
		<h1><c:out value="${acm.acmName}" /></h1> ★★★★★
		<span><img alt="마커" src="C:\upload\img\maker.jpg"><c:out value="${acm.acmCity}" /><c:out value="${acm.acmDistr}" /><c:out value="${acm.acmDetailaddr}" /></span>	
			<c:out value="${acm.acmDesc}" />
	</div>
	<div class = "e acm-dtail" name="detail-room">
		객실어쩌구
	</div>
	<div class = "f acm-dtail" name="detail-map">
		위치 어쩌구
	</div>
	<div class = "g acm-dtail" name="detail-review">
		리뷰 어쩌구
	</div>
	
</div>
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
		}
	</script>
<%@include file="../includes/footer.jsp"%>
</html>