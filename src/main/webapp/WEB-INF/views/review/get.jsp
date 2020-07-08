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
<%@include file="../includes/header.jsp"%>
<head>
<title>review List</title>

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
									<tr><td colspan = "2"><c:out value="${review.title }" /></td></tr>
									<tr>
									<td><c:out value="${review.pstNum }" /></td>
									<td id="star"></td>
									</tr>
									<tr>
									<td><c:out value="${review.checkInDay }" /></td>
									<td><c:out value="${review.checkOutDay }" /></td>
									</tr>
									<tr><td colspan = "2"><c:out value="${review.content }" /></td></tr>
									
							</thead>
							<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
							

						</table>
							<button type="submit" >리뷰수정/삭제</button>
					</form>
							<a href="/review/list"><button type="submit" >리스트로 돌아가기</button></a>
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

<%@include file="../includes/footer.jsp"%>
</html>