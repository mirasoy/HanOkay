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
<%@include file="../includes/header.jsp"%>
<head>
<title>review List</title>

</head>

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
	//append로 리스트목록 붙이기
		<c:forEach items="${list }" var="rev">

		$(".bookList").append("<tr>");
		$(".bookList").append("<a href='/acm/get?type=&keyword=&person=1&in=&out=&acmNum=<c:out value="${rev.acmNum }" />'><td ><c:out value="${rev.acmName }" /></td><a>");
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
<%@include file="../includes/footer.jsp"%>

</html>