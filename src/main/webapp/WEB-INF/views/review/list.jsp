<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	session.setAttribute("userNum", "U2");
String name = (String) session.getAttribute("userNum");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>review List</title>

<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="../resources/css/bootstrap.min.css" />

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />

</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1>나의 예약 목록</h1>
				</div>
				<div class="panel-body">
					<table
						class="table table-striped table-bordered table-hover bookList">
						<thead>
							<tr>
								<th>숙소이름</th>
								<th>예약번호</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>리뷰</th>
							</tr>
						</thead>


					</table>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
		<c:forEach items="${list }" var="rev">

		$(".bookList").append("<tr>");
		$(".bookList").append("<td ><c:out value="${rev.acmName }" /></td>");
		$(".bookList").append("<td ><c:out value="${rev.bookNum }" /></td>");
		$(".bookList").append("<td ><c:out value="${rev.checkInDay }" /></td>");
		$(".bookList")
				.append("<td ><c:out value="${rev.checkOutDay }" /></td>");

		if ("<c:out value="${rev.pstNum }" />" == "") {
			$(".bookList").append("<button class='button'><a href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</button></a>");
		} else {
			$(".bookList").append("<button class='button'><a href='/review/get?pstNum=<c:out value="${rev.pstNum }" />'>리뷰보기</button></a>");
		}

		$(".bookList").append("</tr>");

		</c:forEach>
	</script>
</body>


</html>