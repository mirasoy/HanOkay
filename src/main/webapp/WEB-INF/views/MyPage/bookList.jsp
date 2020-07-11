<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
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
						<h1>메일 보내기</h1>
						<h1>미구현 (2차 개발 예정 사항입니다.)</h1>
						<div id="map"></div>
						<!-- 지도가 붙을 위치 -->
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

		
	
		
		
		
		
	</script>


	<%@include file="../includes/footer.jsp"%>