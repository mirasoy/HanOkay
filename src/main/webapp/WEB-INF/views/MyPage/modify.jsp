<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style>

/* The popup form - hidden by default */
.form-popup {
	display: none;
	position: fixed;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: 3px solid #f1f1f1;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Add styles to the form container */
.form-container {
	max-width: 600px;
	padding: 30px;
	background-color: white;
	margin: auto;
}

/* Set a style for the submit/login button */
.form-container .btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

.form-container .cancel {
	background-color: red;
}

.smoking{
	width: 15px;
}


</style>

<!-- 자바스크립트 정규식 체크 -->
<script language="javascript">
	function validate() {


	
		var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일이 적합한지 검사할 정규식		
		var email = document.getElementById("email");
		
	

/* 	공백일 경우에  */	
		
		if(!$(':input:radio[name=smoking]:checked').val()) {   
		   alert("흡연 여부를 선택해 주세요.");
		   return false;
		}
			

		if (email.value == "") {
			alert("이메일을 입력해 주세요");
			email.focus();
			return false;
		}
		
		if (!check(re, email, "적합하지 않은 이메일 형식입니다.")) {
			return false;
		}
		


	

		alert("정보가 수정되었습니다.");
	}
	
	

	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		return false;
	}

	
	
	

	
	
	
	
	
	
	
</script>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">예약 수정 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">예약 수정 하세요.</div>


			<div class="panel-body">

				<form onsubmit="return validate();" role="form"
					action="/MyPage/modify" method="post">

					<div class="form-group info-group">
						<label>#예약번호</label> <input class="form-control" name='bookNum'
							value='<c:out value="${info.bookNum}"/>' readonly="readonly">
					</div>

					<div class="f9orm-group info-group">
						<label>#회원번호</label> <input class="form-control" name='userNum'
							value='<c:out value="${info.userNum}"/>' readonly="readonly">
					</div>

					<div class="form-group info-group">
						<label>방번호</label> <input class="form-control" name='romNum'
							value='<c:out value="${info.romNum}"/>' readonly="readonly">
					</div>

					<div class="form-group info-group">
						<label>예약일자</label> <input class="form-control" name='bookDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.bookDate}" />'
							readonly>
					</div>


					<div class="form-group info-group">
						<label>체크인날짜</label> <input class="form-control"
							name='checkinDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkinDate}" />'
							readonly>
					</div>

					<div class="form-group info-group">
						<label>체크아웃날짜</label> <input class="form-control"
							name='checkoutDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkoutDate}" />'
							readonly>
					</div>

					<div class="form-group info-group">
						<label>예약숙박일수</label> <input class="form-control" name='staydays'
							value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>예약인원수</label> <input class="form-control" name='guest'
							value='<c:out value="${info.guest}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>객실요금</label> <input class="form-control" name='bookPrice'
							value='<c:out value="${info.bookPrice}"/>' readonly="readonly">
					</div>

					<div class="form-group info-group">
						<label>도착예정시간</label> <input class="form-control"
							name='expectedArr' value='<c:out value="${info.expectedArr}"/>' readonly="readonly">
							
							
					</div>
					<div class="form-group info-group">
						<label>흡연여부</label> <input type="radio" class="form-control smoking" name='smoking'
							value="1"> 흡연O
							<input type="radio" class="form-control smoking" name='smoking' value="0"> 흡연X
							
						
							
					</div>


					<div class="form-group info-group">
						<label>요구사항</label>
						<textarea class="form-control" rows="3" name='request'><c:out
								value="${info.request}" /></textarea>
					</div>


					<div class="form-group info-group">
						<label>실제도착시간</label> <input class="form-control" name='realArr'
							value='<c:out value="${info.realArr}"/>' readonly="readonly">
					</div>

					<div class="form-group info-group">
						<label>방이름</label> <input class="form-control" name='romName'
							value='<c:out value="${info.romName}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>예약자 이름</label> <input id="Lastname" class="form-control"
							name='bookerLastname'
							value='<c:out value="${info.bookerLastname}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>예약자 성</label> <input id="Firstname" class="form-control"
							name='bookerFirstname'
							value='<c:out value="${info.bookerFirstname}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>이메일</label> <input id="email" class="form-control"
							name='bookerEmail' value='<c:out value="${info.bookerEmail}"/>'>
					</div>
					<div class="form-group info-group">
						<label>연락처</label> <input class="form-control" name='bookerPhone'
							value='<c:out value="${info.bookerPhone}"/>' readonly="readonly">
					</div>
					<div class="form-group info-group">
						<label>예약상태</label> <input class="form-control" name='bookStatus'
							value='<c:out value="${info.bookStatus}"/>' readonly="readonly">
					</div>

					<button type="submit" data-oper='modify' class="btn btn-default">정보수정</button>
					<button type="submit" data-oper='remove' class="btn btn-default">예약취소</button>
					<button type="submit" data-oper='bookList' class="btn btn-info">리스트</button>

				</form>

				<div class="form-popup" id="myForm">
					<div class="form-container">
						<h1>정말로 예약을 취소하시겠습니까? 8ㅅ8 ?</h1>
						<button type="submit" class="btn" data-oper='goCancle'>확인</button>
						<button type="button" class="btn cancel" data-oper='can'>취소</button>
					</div>
				</div>



			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->



<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");
		var nav = document.getElementById("side-menu");

		$('button').on("click", function(e) {

			e.preventDefault();
			var operation = $(this).data("oper");

			console.log(operation);
			if (operation === 'remove') {

				document.getElementById("myForm").style.display = "block";
				nav.style.display = "none";
				return false;

			} else if (operation === 'bookList') {
				self.location = "/MyPage/bookList";
				return;
			} else if (operation === 'can') {
				console.log("예약을 취소하지 않습니다.")
				document.getElementById("myForm").style.display = "none";
				return false;
			} else if (operation === 'goCancle') {
				console.log("예약을 취소합니다.")
				formObj.attr("action", "/MyPage/remove");
			}

			formObj.submit();
		});

	});
</script>






<%@include file="../includes/footer.jsp"%>