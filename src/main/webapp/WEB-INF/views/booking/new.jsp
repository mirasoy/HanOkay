<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%
	String checkin = request.getParameter("in");
	String checkout = request.getParameter("out");
	String person = request.getParameter("person");
	String romNum = request.getParameter("romNum");
	String romPrice = request.getParameter("romPrice");
	String days = request.getParameter("days");
%>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/suhee.css">

<div class = "page-wrapper page-new">
	<div class = "page-contnets" style="width: 65%;">
		<form action="/booking/get" id="form" method=post>	
		<div class = "container-new box" >
			<table>
				<tr><td class="acm-pic" rowspan="4">
						<img alt='숙소사진' src='/display?fileName=<c:out value="${info.acmPurl}" /><c:out value="${info.acmPname}" />' />
					</td>
					<td>&nbsp;</td><td class="acm-title"><c:out value="${info.acmName}" /></td></tr>
				<tr><td></td><td><span id="stisf">&nbsp;</span>
					<span id="stisf-num">
						<c:choose>
						    <c:when test="${star eq 0.0}"></c:when>
						    <c:otherwise>(<c:out value="${star}" /> / 5.0)</c:otherwise>
						</c:choose>
					</span></td></tr>
				<tr><td></td><td><c:out value="${info.acmCity} "/> <c:out value="${info.acmDistr} "/> <c:out value="${info.acmDetailaddr} "/></td></tr>
			</table>
			</br>
			<table class = "tb-booker">
				<tr><td rowspan="4" class="td-title">예약</br>정보</td><td colspan="2"><p class="info"><input type="checkbox" id="cb" checked="checked" onclick="setInfo()">회원정보와 동일</p></td><td colspan="2"><p class="info"><label class="label-required"></label>표시는 필수 입력사항입니다.</p></td></tr>
				<tr><td><label class="table-lb label-required">First Name</label></td><td><input id="userInfo1" name="bookerFirstname" required type="text" value='<%=user.getUserFstName()%>' readonly="readonly"/></td>
					<td><label class="table-lb label-required">Last Name</label></td><td><input id="userInfo2" name="bookerLastname" required type="text" value='<%=user.getUserLastName()%>' readonly="readonly"/></td>
				<tr><td><label class="table-lb label-required">Email</label></td><td colspan="3"><input id="userInfo3" name="bookerEmail" required type="email" value='<%=user.getUserEmail()%>' readonly="readonly"/></td></tr>
				<tr><td><label class="table-lb ">Phone</label></td><td colspan="3"><input id="userInfo4" name="bookerPhone" type="tel" value='<%=user.getUserPhone()%>' readonly="readonly" /></td></tr>
			</table>
			</br>
			<table class = "tb-request">
				<tr><td rowspan="5" class="td-title">추가</br>요청</td>
					<td><label class="table-lb">도착 예정시간</label></td>
					<td colspan="2"><select id="expArr">
							<option value="">-----</option>
							<option value="PM02">PM02</option>
							<option value="PM03">PM03</option>
							<option value="PM04">PM04</option>
							<option value="PM05">PM05</option>
							<option value="PM06">PM06</option>
							<option value="PM07">PM07</option>
							<option value="PM08">PM08</option>
							<option value="PM09">PM09</option>
							<option value="PM10">PM10</option>
							<option value="PM11">PM11</option>
							<option value="PM12">PM12</option>
							<option value="AM01">AM01</option>
							<option value="AM02">AM02</option>
							<option value="AM03">AM03</option>
							<option value="AM04">AM04</option>
							<option value="AM05">AM05</option>
							<option value="AM06">AM06</option>
							<option value="AM07">AM07</option>
							<option value="AM08">AM08</option>
							<option value="AM09">AM09</option>
							<option value="AM10">AM10</option>
							<option value="AM11">AM11</option>
							<option value="AM12">AM12</option>
						</select></td></tr>
				<tr><td colspan="4"><p class="info"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>기본 체크인 시간 ${info.checkinTime} 이전에 도착할 경우, 대기시간이 소요될 수 있습니다.</p></td></tr>
				<tr><td><label class="table-lb">흡연여부</label></td>
					<td colspan="3"><label class="table-lb">금연객실</label><input type="radio" name="smoking" value="0" checked="checked">&emsp;&emsp;<label class="table-lb">흡연객실</label><input type="radio" name="smoking" value="1"></td></tr>
				<tr><td><label class="table-lb">메세지</label></td>
					<td colspan="3"><input type="text" id="request" name="request" value="" maxlength="100"></td></tr>
				<tr><td colspan="4"><p class="info"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 요청사항을 최대한 제공해 드릴 수 있도록 노력하고 있으나 상황에 따라선 어려울 수 있습니다.</p></td></tr>
			</table>
			<input type="hidden" name="bookStatus" value="RS_STT_BK" >
			</br>	 
		</div>
	</div> <!-- end of contents -->
	
	<div class = "page-sidebar" style="width: 20%;">
		<div class = "input-hidden-area">
			<input type="hidden" name="userNum" id="userNum" value="<%=user.getUserNum()%>">
			<input type="hidden" name="romNum" id="romNum" value="<%=romNum%>">
			<input type="hidden" name="checkinDate" id="checkinDate" value="">
			<input type="hidden" name="checkoutDate" id="checkoutDate" value="">
			<input type="hidden" name="staydays" id="staydays" value="${days}">
			<input type="hidden" name="guest" id="guest" value="<%=person%>">
			<input type="hidden" name="bookPrice" id="bookPrice" value="0">
			<input type="hidden" name="expectedArr" id="expectedArr" value="">
			<input type="hidden" name="payMethod" id="payMethod" value="PY_METHOD_LATER">
			<input type="hidden" name="acmNum" id="acmNum" value="${info.acmNum}">
			<input type="hidden" name="price" id="price" value="<%=romPrice%>">
			<input type="hidden" name="vat" id="vat" value="0">
			<input type="hidden" name="subtotal" id="subtotal" value="0">
			<input type="hidden" name="coupon" id="coupon" value="0">
			<input type="hidden" name="mileage" id="mileage" value="0">
			<input type="hidden" name="discount" id="discount" value="0">
			<input type="hidden" name="total" id="total" value="0">
			<input type="hidden" name="payStatus" id="payStatus" value="PY_STATUS_COMP">
		</div>
		
		<div class = "container-payment box" >
			<table class = "info">
				<tr class = "tr-title"><td><%=checkin %> ~ <%=checkout %>&nbsp;(${days}박)</td></tr>
				<tr class = "tr-title"><td>${info.romName}&nbsp;(${info.romType})</td></tr>
				<tr class = "tr-title"><td>인원 <%=person %>명&nbsp;(최대: ${info.romCapa}명)</td></tr>
			</table>
			</br>
			<table>
				<tr><td class = "td-title2">객실 요금(${days}박 x <i class="fa fa-krw" aria-hidden="true"></i><%=romPrice%>)</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblPrice"></label></td></tr>
				<tr><td class = "td-title2">세금 10%</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblVat"></label></td></tr>
				<tr class="tr-line"><td class = "td-title3">총액</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblSubtotal"></label></td></tr>
				<tr><td></td></tr>
				<tr><td class = "td-title2">쿠폰</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblCoupon"></label></td></tr>
				<tr><td class = "td-title2">마일리지</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblMileage"></label></td></tr>
				<tr class="tr-line"><td class = "td-title3">할인액</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblDiscount"></label></td></tr>
				<tr><td></td></tr>
				<tr><td class = "td-title4">결제금액</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblTotal"></label></td></tr>
				<tr><td class = "td-title2">(1박당)</td><td><i class="fa fa-krw" aria-hidden="true"></i><label id="lblPerDay"></label></td></tr>
			</table>
			</br>
			<table>
				<tr><td colspan="3"><p class="info"><label><input type="checkbox" id="agreement">  <a href="../policies/terms" target="_blank">이용약관</a>, <a href="../policies/privacy" target="_blank">개인정보 보호정책</a>을 읽었으며 이에 동의합니다.</label></p></td></tr>
				<tr><td><input type="button" value='카드 결제' onclick="book('PY_METHOD_CARD')"></td><td><input type="button" value='페이팔 결제' onclick="book('PY_METHOD_PAYPAL')"></td><td><input type="button" value='나중에 결제' onclick="book('PY_METHOD_LATER')"></td></tr>
				<tr><td colspan="3"><p class="info"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> '나중에 결제'로 숙소에서 현장결제를 할 수 있습니다!</p></td></tr>
				
			</table>
			
		</div>
	</div>
	</form>
	
	</div>
	
	<a class="button_scrolltop" href="#" onclick="window.scrollTo(0,0); return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></a>

</div><!-- end of page -->
	<script>
	
		let form = document.getElementById("form");
		window.onload = function() {
			// 불러온 유저정보의 연락처가 null일 때 공백으로 치환하여 출력
			document.getElementById("userInfo4").value= '<%=user.getUserPhone()%>' == "null" ? "" : '<%=user.getUserPhone()%>';
			
			// 숙소별 리뷰 별점 평균
			getStar(); 
			
			// 금액 계산하여 출력
			getPrice();
			
			// 결제
			var IMP = window.IMP; 
			IMP.init('imp83534119'); 
			
		}
		
		//
		 
		

		
 		// 모달
	/*	let modal = document.getElementById("paymentModal");
		let btn = document.getElementById("modalBtn");
		let span = document.getElementsByClassName("close")[0];
		
		btn.onclick = function() {
			if(checkValidation()){
				modal.style.display = "block";
			}
		}
		span.onclick = function() {
		  modal.style.display = "none";
		} */
		
		// 예약
		function book(method) {
			if(checkValidation()){
				setValue(method);
				if(method == 'PY_METHOD_CARD'){
					payCard();
				}else if(method == 'PY_METHOD_PAYPAL'){
					payPaypal();
				}else{
					form.submit();
				}
			}
		}

		// 카드결제
		function payCard() {
	        
			const email = document.getElementById("userInfo3").value;
			const name = document.getElementById("userInfo1").value + document.getElementById("userInfo2").value;
			const tel = document.getElementById("userInfo4").value;
			const amount = document.getElementById("total").value;
				
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '${info.acmName}:${info.romName}(${days})',
			    amount : amount,
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : tel,
			    buyer_addr : '테스트',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'localhost/acm/list'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        alert(msg);
			        form.submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
		}
		
		// 페이팔결제
		function payPaypal() {
			
			const email = document.getElementById("userInfo3").value;
			const name = document.getElementById("userInfo1").value + document.getElementById("userInfo2").value;
			const tel = document.getElementById("userInfo4").value;
			const amount = document.getElementById("total").value;
				
			IMP.request_pay({
			    pg : 'paypal',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '${info.acmName}:${info.romName}(${days})',
			    amount : amount,
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : tel,
			    buyer_addr : '테스트',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'localhost/acm/list'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        alert(msg);
			        form.submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
		}
		

		// 금액
		function getPrice() {
			const romPrice = '<%=romPrice%>';
			const days = "${days}";
			let price = romPrice * days;
			let vat = Math.ceil(price / 10);
			let subtotal = price + vat;
			let coupon  = 0;
			let mileage = 0;
			let discount = 0;
			let total = subtotal - discount;
			let perDay = Math.ceil(subtotal / days);
			
			// 예약페이지 화면 우측의 금액 부분
			document.getElementById("lblPrice").innerHTML = price;
			document.getElementById("lblVat").innerHTML = vat; 
			document.getElementById("lblSubtotal").innerHTML = subtotal;

			document.getElementById("lblCoupon").innerHTML = coupon;
			document.getElementById("lblMileage").innerHTML = mileage;
			document.getElementById("lblDiscount").innerHTML = discount;

			document.getElementById("lblTotal").innerHTML = total;
			
			document.getElementById("lblPerDay").innerHTML = perDay;
			
			// 예약하기 버튼을 눌렀을 때 저장할 정보 셋팅			
			document.getElementById("vat").value = vat;
			document.getElementById("subtotal").value = subtotal; 
			document.getElementById("total").value = total;
			document.getElementById("bookPrice").value = total;
		}
		
		// 예약하기 버튼 클릭시 input 태그 안에 필요한 값들을 셋팅
		function setValue(method) {
			document.getElementById("payMethod").value = method; 
			document.getElementById("expectedArr").value = document.getElementById("expArr").value;
			document.getElementById("checkinDate").value = toDate('<%=checkin%>');
			document.getElementById("checkoutDate").value = toDate('<%=checkout%>');
		}
		
		// 날짜 String을 Date로 변환
		function toDate(str) {
			let year = str.substring(0,4);
			let month = str.substring(5,7);
			let day = str.substring(8,10);
			return new Date(Number(year), Number(month)-1, Number(day));
		}
		
		// 유효성검사
		function checkValidation() {
			return firstnameValid()&&lastnameValid()&&emailValid()&&phoneValid()&&checkAgreement();
		}
		
		// 유효성검사 정규식
		const regFirstnameKo = /^[가-힣]{1,20}$/; //   "U_FSTNAME" Varchar2(60 ) NOT NULL,
		const regFirstnameEn = /^[a-zA-Z]{1,60}$/; //   "U_FSTNAME" Varchar2(60 ) NOT NULL,
		const regLastnameKo = /^[가-힣]{1,13}$/; //  "U_LASTNAME" Varchar2(40 ) NOT NULL,
		const regLastnameEn = /^[a-zA-Z]{1,40}$/; //  "U_LASTNAME" Varchar2(40 ) NOT NULL,
		const regEmail = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;   // "EMAIL" Varchar2(800 ) NOT NULL,
		const regPhone = /^[0-9\s]{0,16}$/; //  "U_PHONE" Varchar2(16),
	
		const firstname = document.getElementById("userInfo1");
		const lastname = document.getElementById("userInfo2");
		const email = document.getElementById("userInfo3");
		const phone = document.getElementById("userInfo4");
		
		const agreement = document.getElementById("agreement");
		
		function firstnameValid() {
			if (!firstname.value) {
				firstname.placeholder = "이름을 입력하지 않았습니다.";
				firstname.focus();
				return false;
			} else if ((!regFirstnameKo.test(firstname.value)&&(!regFirstnameEn.test(firstname.value))) ) {
				firstname.placeholder = "이름은 1~60자의 영문 또는 1~20자의 한글만 사용 가능합니다.";
				firstname.focus();
				return false;
			}
				return true;
		}
		
		function lastnameValid() {
			if (!lastname.value) {
				lastname.placeholder = "성을 입력하지 않았습니다.";
				lastname.focus();
				return false; 
			} else if ((!regLastnameKo.test(lastname.value)&&(!regLastnameEn.test(lastname.value))) ) {
				lastname.placeholder = "성은 1~40자의 영문 또는 1~13자의 한글만 사용 가능합니다.";
				lastname.focus();
				return false; 
			}
				return true;
		}
		
		function emailValid() {
			if (!email.value) {
				email.placeholder = "이메일을 입력하지 않았습니다.";
				email.focus();
				return false;
			} else if (!regEmail.test(email.value) ) {
				email.placeholder = "올바른 이메일 형식이 아닙니다.";
				email.focus();
				return false;
			}
				return true;
		}
		
		function phoneValid() {
			if (!regPhone.test(phone.value) ) {
				phone.placeholder = "연락처는 1~16자의 숫자 또는 공백만 가능합니다.";
				phone.focus();
				return false;
			}else{
				return true;
			}
		}
		
		function checkAgreement() {
			if(!agreement.checked){
				agreement.focus();
				alert("계속 진행하려면 약관에 동의하세요");
				return false;				
			}
				return true;
		}
		
		// 예약자정보: 체크박스를 눌렀을 때 실행되는 메서드
		function setInfo() {
			if(document.getElementById("cb").checked){
				
				// 예약자 정보를 로드하고 입력이 불가능한 상태가 된다
				document.getElementById("userInfo1").value='<%=user.getUserFstName() %>';
				document.getElementById("userInfo2").value='<%=user.getUserLastName()%>';
				document.getElementById("userInfo3").value='<%=user.getUserEmail()%>';
				document.getElementById("userInfo4").value= '<%=user.getUserPhone()%>' == "null" ? "" : '<%=user.getUserPhone()%>';
				
				for(let i = 1; i <= 4; i++){
					document.getElementById("userInfo"+i).setAttribute('readonly', 'readonly');
					document.getElementById("userInfo"+i).style.opacity=0.5;
					document.getElementById("userInfo"+i).style.backgroundColor="#eee";
				}	
			}else{
				
				// 예약자 정보를 입력 가능한 상태가 된다
				for(let i = 1; i <= 4; i++){
					document.getElementById("userInfo"+i).removeAttribute('readonly');
					document.getElementById("userInfo"+i).style.opacity=1;
					document.getElementById("userInfo"+i).style.backgroundColor="white";
				}	
			}
		}
	
		// 별점
		function getStar() {
			let star = "${star}";
			let stisf = document.getElementById("stisf");
			
			for(let i = 0; i < Math.floor(star); i++){
				stisf.innerHTML += '<i class="fa fa-star" aria-hidden="true"></i>';
			}
			
			let half = star-Math.floor(star) < 0.5 ? 0 : 0.5; 
			for(let i = 0; i < half; i++){
				stisf.innerHTML += '<i class="fa fa-star-half" aria-hidden="true"></i>';
			}
			
			document.getElementById("stisf").style.color="#e3cf7a";
			document.getElementById("stisf").style.fontSize="18px";
		}
		
	</script>

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<%@include file="../includes/footer.jsp"%>
</html>