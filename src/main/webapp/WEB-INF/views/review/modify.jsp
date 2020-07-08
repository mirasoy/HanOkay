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
					<form role="form"  method="post">
						<table class="table table-striped table-bordered table-hover bookList">
							<thead>
								<tr>
									<td>
										<c:out value="${review.acmName }" />
									</td>
								</tr>
								<tr>
									<P id="star">

										<a href="#" value="1">★</a> <a href="#" id="2" value="2">★</a> <a href="#"
											value="3">★</a> <a href="#" value="4">★</a> <a href="#" value="5">★</a>
									<p>
										<input type="hidden" name="stisf" id="stisf" value="<c:out value="${review.stisf }" />"><br />
								</tr>
								<tr>
									<input type="text" name='title' value='<c:out value="${review.title }" />'/>
									<br />
								</tr>
								<tr>
									<textarea name='content' style="resize: none;"><c:out value="${review.content } " /></textarea>
									<br />
								</tr>
								<input type="hidden" name="bookNum" value='<c:out value="${review.bookNum }" />'>
								<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
								
								<button data-oper = "delete">삭제하기</button>
								<button  data-oper = "modify">수정하기</button>
							</thead>


						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	 
	$('#star').children().eq(<c:out value="${review.stisf }" />-1).addClass("on").prevAll("a").addClass("on");
	
	$('#star a').click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		$('#stisf').val($(this).attr("value"));
	});
	
		let formObj = $("form");

		//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
		$('button').on("click", function(e) {
			e.preventDefault();
			let operation = $(this).data("oper");

			if (operation === 'delete') {
				formObj.attr("action", "/review/delete");
			}
			if (operation === 'modify') {
				formObj.attr("action", "/review/modify");
			}
			formObj.submit();
		}); 
	</script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>