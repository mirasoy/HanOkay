<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	session.setAttribute("userNum", "U1");
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
</style>
<body>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul class="bookbar">
					<li class="item1"><a href="/review/list">전체목록</a></li>
					<li class="item2"><a href="/review/writtenReviewlist">작성한 리뷰</a></li>
					<li class="item3"><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>
				</ul>
			</div>


			<!-- /.panel-heading -->
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
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
		<c:forEach items="${list }" var="rev">

		if ("<c:out value="${rev.pstNum }" />" == "") {
			$(".bookList").append("<tr>");
			$(".bookList").append("<td ><c:out value="${rev.acmName }" /></td>");
			$(".bookList").append("<td ><c:out value="${rev.bookNum }" /></td>");
			$(".bookList").append("<td ><c:out value="${rev.checkInDay }" /></td>");
			$(".bookList").append("<td ><c:out value="${rev.checkOutDay }" /></td>");
			$(".bookList").append("<button class='button'><a href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</button></a>");
		} 
		$(".bookList").append("</tr>");

		</c:forEach>
	</script>
</body>


</html>