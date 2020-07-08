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

<style>
#star a {
	text-decoration: none;
	color: gray;
}

#star a.on {
	color: red;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1>Write Review</h1>
				</div>
				<div class="panel-body">
					<form role="form" action="/review/register" method="post">
						<table
							class="table table-striped table-bordered table-hover bookList">
							<thead>
								<tr>
									<td><c:out value="${booking.acmName }" /></td>
								</tr>
								<tr>
									<P id="star">

										<a href="#" value="1">★</a> <a href="#" value="2">★</a> <a
											href="#" value="3">★</a> <a href="#" value="4">★</a> <a
											href="#" value="5">★</a>
									<p>
										<input type="hidden" name="stisf" id="stisf" value=""><br />
								</tr>
								<tr>
									<input type="text" name='title' />
									<br />
								</tr>
								<tr>
									<textarea name='content' style="resize: none;"></textarea>
									<br />
									<input type="hidden" name="bookNum" value ='<c:out value="${booking.bookNum }" />' >
								</tr>
								<button type="submit">등록하기</button>
							</thead>


						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$('#star a').click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");

			$('#stisf').val($(this).attr("value"));
		});
	</script>

</body>

<%@include file="../includes/footer.jsp"%>

</html>