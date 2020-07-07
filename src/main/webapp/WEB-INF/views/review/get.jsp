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
					<form id="operForm" action="/review/modify" method="get">
						<table
							class="table table-striped table-bordered table-hover bookList">
							<thead>
								<tr>
									<td><c:out value="${review.pstNum }" /></td>
									<td><c:out value="${review.title }" /></td>
									<td id="star"></td>
								</tr>
								<tr>
									<td><c:out value="${review.content }" /></td>
									<td><c:out value="${review.pstNum }" /></td>

								</tr>
							</thead>
							<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
							<button type="submit" >리뷰수정/삭제</button>
							

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							let star = "";
							for (let a = 0; a < <c:out value="${review.stisf }" />; a++) {
								star = star + '★';
							}		
							document.getElementById('star').innerHTML = star;
					
						})
	</script>

</body>


</html>