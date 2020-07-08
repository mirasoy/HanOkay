<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
   pageEncoding="UTF-8"%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style>

/* The popup form - hidden by default */
.form-popup {
<<<<<<< HEAD
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
=======
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
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
}

/* Add styles to the form container */
.form-container {
<<<<<<< HEAD
   max-width: 600px;
   padding: 30px;
   background-color: white;
   margin: auto;
=======
	max-width: 600px;
	padding: 30px;
	background-color: white;
	margin: auto;
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
}

/* Set a style for the submit/login button */
.form-container .btn {
<<<<<<< HEAD
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
=======
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
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
}
</style>

<div class="row">
<<<<<<< HEAD
   <div class="col-lg-12">
      <h1 class="page-header">예약 수정 페이지</h1>
   </div>
   <!-- /.col-lg-12 -->
=======
	<div class="col-lg-12">
		<h1 class="page-header">예약 수정 페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
</div>
<!-- /.row -->

<div class="row">
<<<<<<< HEAD
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">예약 수정 하세요.</div>


         <div class="panel-body">

            <form role="form" action="/MyPage/modify" method="post">

               <div class="form-group">
                  <label>#예약번호</label> <input class="form-control" name='bookNum'
                     value='<c:out value="${info.bookNum}"/>' readonly="readonly">
               </div>

               <div class="f9orm-group">
                  <label>#회원번호</label> <input class="form-control" name='userNum'
                     value='<c:out value="${info.userNum}"/>' readonly="readonly">
               </div>

               <div class="form-group">
                  <label>방번호</label> <input class="form-control" name='romNum'
                     value='<c:out value="${info.romNum}"/>' readonly="readonly">
               </div>

               <div class="form-group">
                  <label>예약일자</label> <input class="form-control" name='bookDate'
                     value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.bookDate}" />'
                     readonly>
               </div>


               <div class="form-group">
                  <label>체크인날짜</label> <input class="form-control"
                     name='checkinDate'
                     value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkinDate}" />'
                     readonly>
               </div>

               <div class="form-group">
                  <label>체크아웃날짜</label> <input class="form-control"
                     name='checkoutDate'
                     value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkoutDate}" />'
                     readonly>
               </div>

               <div class="form-group">
                  <label>예약숙박일수</label> <input class="form-control" name='staydays'
                     value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
               </div>
               <div class="form-group">
                  <label>예약인원수</label> <input class="form-control" name='guest'
                     value='<c:out value="${info.guest} "/>'>
               </div>
               <div class="form-group">
                  <label>객실요금</label> <input class="form-control" name='bookPrice'
                     value='<c:out value="${info.bookPrice} "/>' readonly="readonly">
               </div>

               <div class="form-group">
                  <label>도착예정시간</label> <input class="form-control"
                     name='expectedArr' value='<c:out value="${info.expectedArr} "/>'>
               </div>
               <div class="form-group">
                  <label>흡연여부</label> <input class="form-control" name='smoking'
                     value='<c:out value="${info.smoking} "/>'>
               </div>


               <div class="form-group">
                  <label>요구사항</label>
                  <textarea class="form-control" rows="3" name='request'><c:out
                        value="${info.request}" /></textarea>
               </div>


               <div class="form-group">
                  <label>실제도착시간</label> <input class="form-control" name='realArr'
                     value='<c:out value="${info.realArr}"/>' readonly="readonly">
               </div>

               <div class="form-group">
		          <label>방이름</label> <input class="form-control" name='romName'
		            value='<c:out value="${info.romName} "/>' readonly="readonly">
		        </div>
		        <div class="form-group">
		          <label>예약자 이름</label> <input class="form-control" name='bookerLastName'
		            value='<c:out value="${info.bookerLastName} "/>'>
		        </div>
		        <div class="form-group">
		          <label>예약자 성</label> <input class="form-control" name='bookerFirstName'
		            value='<c:out value="${info.bookerFirstName} "/>'>
		        </div>
		        <div class="form-group">
		          <label>이메일</label> <input class="form-control" name='bookerEmail'
		            value='<c:out value="${info.bookerEmail} "/>'>
		        </div>
		        <div class="form-group">
		          <label>연락처</label> <input class="form-control" name='bookerPhone'
		            value='<c:out value="${info.bookerPhone} "/>'>
		        </div>
               <div class="form-group">
                  <label>예약상태</label> <input  class="form-control" name='bookStatus'
                     value='<c:out value="${info.bookStatus}"/>' >
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
=======
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">예약 수정 하세요.</div>


			<div class="panel-body">

				<form role="form" action="/MyPage/modify" method="post">

					<div class="form-group">
						<label>#예약번호</label> <input class="form-control" name='bookNum'
							value='<c:out value="${info.bookNum}"/>' readonly="readonly">
					</div>

					<div class="f9orm-group">
						<label>#회원번호</label> <input class="form-control" name='userNum'
							value='<c:out value="${info.userNum}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>방번호</label> <input class="form-control" name='romNum'
							value='<c:out value="${info.romNum}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>예약일자</label> <input class="form-control" name='bookDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.bookDate}" />'
							readonly>
					</div>


					<div class="form-group">
						<label>체크인날짜</label> <input class="form-control"
							name='checkinDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkinDate}" />'
							readonly>
					</div>

					<div class="form-group">
						<label>체크아웃날짜</label> <input class="form-control"
							name='checkoutDate'
							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkoutDate}" />'
							readonly>
					</div>

					<div class="form-group">
						<label>예약숙박일수</label> <input class="form-control" name='staydays'
							value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>예약인원수</label> <input class="form-control" name='guest'
							value='<c:out value="${info.guest} "/>'>
					</div>
					<div class="form-group">
						<label>객실요금</label> <input class="form-control" name='bookPrice'
							value='<c:out value="${info.bookPrice} "/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>도착예정시간</label> <input class="form-control"
							name='expectedArr' value='<c:out value="${info.expectedArr} "/>'>
					</div>
					<div class="form-group">
						<label>흡연여부</label> <input class="form-control" name='smoking'
							value='<c:out value="${info.smoking} "/>'>
					</div>


					<div class="form-group">
						<label>요구사항</label>
						<textarea class="form-control" rows="3" name='request'><c:out
								value="${info.request}" /></textarea>
					</div>


					<div class="form-group">
						<label>실제도착시간</label> <input class="form-control" name='realArr'
							value='<c:out value="${info.realArr}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>방이름</label> <input class="form-control" name='roomName'
							value='<c:out value="${info.roomName}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>이름</label> <input class="form-control" name='lastName'
							value='<c:out value="${info.lastName}"/>' >
					</div>
					<div class="form-group">
						<label>성</label> <input class="form-control" name='firstName'
							value='<c:out value="${info.firstName}"/>' >
					</div>
					<div class="form-group">
						<label>예약상태</label> <input  class="form-control" name='bookStatus'
							value='<c:out value="${info.bookStatus}"/>' >
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
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
</div>
<!-- /.row -->



<script type="text/javascript">
<<<<<<< HEAD
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
=======
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
>>>>>>> 6b3f903fae1b40b128531276fb019fcafa6e69b1
</script>






<%@include file="../includes/footer.jsp"%>