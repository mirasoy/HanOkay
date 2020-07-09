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
					<form id="form" action="/review/register" method="post">
						<table class="table table-striped table-bordered table-hover bookList">
							
								<tr>
									<td colspan="2">
										<c:out value="${booking.acmName }" />
									</td>
								</tr>
								<tr>
									<td><label>별점</label></td>
									<td>
										<P id="star">
											<a href="#" value="1">★</a> <a href="#" id="2" value="2">★</a> <a href="#"
												value="3">★</a> <a href="#" value="4">★</a> <a href="#" value="5">★</a>
										<p>
											<input type="hidden" name="stisf" id="stisf">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" name='title' required />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<textarea name='content' style="resize: none;" required></textarea>


										<input type="hidden" name="bookNum"
											value='<c:out value="${booking.bookNum }" />'>
								</tr>
								<button  id="submit">등록하기</button>
		
								<a href="/review/list"><button type="button" >리스트로 돌아가기</button></a>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			//별점주는메서드
			$('#star a').click(function () {
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on");
				$('#stisf').val($(this).attr("value"));
			});
			//폼 객체화 
			let formObj = $("#form");
			//유효성검사 (공백없이)
			$('#submit').click(function () {
					if($('#stisf').val()==""){
						$(this).attr("type","button")
						alert("별점을 입력해주세요");
					}else if( $('input[name=title]').val().trim()==""){	
						$(this).attr("type","button")
						alert("제목을 입력해주세요");
					}else if( $('textarea[name=content]').val().trim()==""){
						$(this).attr("type","button")
						alert("내용을 입력해주세요");
					}else{
				 		$(this).attr("type","submit")
						alert("별점ok");
						
					} 
				
			});
		});
	</script>

</body>

<%@include file="../includes/footer.jsp"%>

</html>