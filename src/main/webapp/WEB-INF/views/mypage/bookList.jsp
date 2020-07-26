<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>


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
					<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
					<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
					<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
					<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>


				</ul>
			</div>

			<div class="panel-heading">
				<%=userFstName %>의 예약 중인 목록입니다. (숙박예정)
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
							<td name='acmNum' id='acmNum'><c:out value="${board.acmName}" /></td>
							<td><c:out value="${board.bookNum}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkoutDate}" /></td>
							<td><c:out value="${board.bookPrice}" /></td>

							<td><a href="/mypage/info?bookNum=${board.bookNum}">예약관리하기</a></td>
							<td><button data-oper='myBtn' id="myBtn" class="myBtn">예약 확정서 받기</button></td>
							<td><button id="myMap">숙소 위치 확인</button></td>

						</tr>
					</c:forEach>
				</table>


				<!-- The Modal (메일) -->
				<div id="myModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
					
					
						<span id="close" class="close">&times;</span>
						<h1>메일 보내기</h1>						
						<form id="actionForm" method="post" action="${path}/email/send.do">
							<!-- post방식으로 자료를 컨트롤러로 보냄 -->
					
							<label>발신자 이름 : </label>
							<input name="senderName"><br> 
							<label class="sr-only">보낸 사람 이메일 : </label>
							<input class="sr-only" name="senderMail" value="tmpProjAna@gmail.com"><br> 
							<label>받는 사람 이메일 : </label>
							<input name="receiveMail"><br> 
							
							<label>[HanOkay 한:옥케이] 예약정보 안내 드립니다. </label>
							<input class="sr-only" value="[HanOkay 한:옥케이] 예약정보 안내 드립니다." name="subject"><br>
						<c:forEach items="${bookList}" var="board">
							<input id="acmName" value='<c:out value="${board.acmName}"/>'>
							</c:forEach> 
					
							<label class="sr-only">내용 : </label>
							<textarea id="txt" rows="5" cols="80" name="message"></textarea><br> 
		
							
							<input type="submit" value="전송">
						</form>
						<span style="color: red;">${message}</span>
					
						
					</div>
				
				</div>
				<!-- end of myModal -->

				<!-- The Modal (맵) -->
				<div id="myModal2" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span id="close" class="close2">&times;</span>
						<h1>지도 확인하기</h1>
						<h1>미구현 (2차 개발 예정 사항입니다.)</h1>
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
	
	

	//클릭 된것의 value를 가져온다.
		
		
	
		// 모달창 가져오기
		var modal = document.getElementById("myModal");
		var modal2 = document.getElementById("myModal2");

		// 버튼을 누르면 모달창이 열려야하니까, 변수로 선언
		var btn = document.getElementsByClassName("myBtn");
		var btn2 = document.getElementById("myMap");


		// span태그에 close의 이름을 주자
		var span = document.getElementsByClassName("close")[0];
		var span2 = document.getElementsByClassName("close2")[0];
		
		
		
		var txt = document.getElementById("txt");
		
		var acmName = document.getElementById("acmName").value;
		
		console.log(acmName);
		
	/* 	txt.innerHTML = acmName;  */
		
		
		//모달 창 가져오기
		
		
		var formObj = $("#actionForm");
		
		for(
				var i=0 ; i<btn.length ; i++
				){
			btn[i].onclick = function(e){
				console.log(e);
				modal.style.display = "block";
				
				var operation=$(this).data("oper");
				console.log(operation);
			
			};	
		}
		
		
		${board.acmName}
		
		
		
		
/* 		

		// 사용자가 버튼을 클릭하면 모달을 연다
		btn.onclick = function() {
			modal.style.display = "block";
			
			console.log("여기는 가능");
			
		
			
			

		} */

		btn2.onclick = function() {
			modal2.style.display = "block";
			

		}

		// 사용자가 <span> (x)를 클릭하면 모달(모달)을 닫는다.
		span.onclick = function() {
			modal.style.display = "none";

		}

		span2.onclick = function() {
			modal2.style.display = "none";
		}

	
	</script>


	<%@include file="../includes/footer.jsp"%>