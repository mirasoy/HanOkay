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
					<form id="form" method="post">
						<table class="table table-striped table-bordered table-hover bookList">
							<tr>
								<td colspan="2">
									<c:out value="${review.acmName }" />
								</td>
							</tr>
							<tr>
								<td><label>별점</label></td>
								<td>
									<P id="star">
										<a href="#" value="1">★</a> <a href="#" id="2" value="2">★</a> <a href="#"
											value="3">★</a> <a href="#" value="4">★</a> <a href="#" value="5">★</a>
									<p>
										<input type="hidden" name="stisf" id="stisf"
											value='<c:out value="${review.stisf }" />'>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" name='title' value='<c:out value="${review.title }" />' required
										autofocus />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name='content'
										style="resize: none;"><c:out value="${review.content } " /></textarea>

									<input type="hidden" name="bookNum" value='<c:out value="${review.bookNum }" />'>
									<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
								</td>
							</tr>


						<button class="btn" data-oper="delete">삭제하기</button>
						<button class="btn" data-oper="modify">수정하기</button>
						<a href="/review/list"><button type="button" >리스트로</button></a>
						</table>


					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		//기존별점불러오기
		$('#star').children().eq(<c:out value="${review.stisf }" /> - 1).addClass("on").prevAll("a").addClass("on");
		//별점주는메서드
		$('#star a').click(function () {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			$('#stisf').val($(this).attr("value"));
		});

		let formObj = $("form");

		//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
		$('#btn').on("click", function (e) {
			e.preventDefault();
			let operation = $(this).data("oper");
			//지울때
			if (operation === 'delete') {
				$(this).attr("type", "submit");
				formObj.attr("action", "/review/delete");
				formObj.submit();
			}
			//수정할때
			if (operation === 'modify') {
				formObj.attr("action", "/review/modify");
				//내용여부 유효성검사
				if ($('input[name=title]').val().trim() == "") {
					$(this).attr("type", "button")
					alert("제목을 입력해주세요");
				} else if ($('textarea[name=content]').val().trim() == "") {
					$(this).attr("type", "button")
					alert("내용을 입력해주세요");
				} else {
					$(this).attr("type", "submit")
					formObj.submit();
				}


			}


		}); 
	</script>

</body>
<%@include file="../includes/footer.jsp"%>

</html>