<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 

<%@include file="../includes/header.jsp"%>
<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >

<div class="container">
		<div class="col-lg-12">
			<div class="panel panel-default">
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">리뷰보기</h1>
			<p><%=userFstName %>님, 추억이 떠오르시나요?</p>
		</div>
	</div>
				<div class="panel-body">
					<form id="operForm" action="/review/modify" method="get">
						<table class="table table-striped table-bordered table-hover bookList">
							<thead>
								<tr>
									<td colspan="1">
										<c:out value="${review.bookNum }" />
									</td>
									<td colspan="2">
										<c:out value="${review.acmName }" />
									</td>
									<td id="star"></td>
								</tr>
								<tr>
									<td>
										<b>체크인</b>
									</td>
									<td>
										<c:out value="${review.checkInDay }" />
									</td>
									<td>
										<b>체크아웃</b>
									</td>
									<td>
										<c:out value="${review.checkOutDay }" />
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<B><c:out value="${review.title }" /></B>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<c:out value="${review.content }" />
									</td>
								</tr>
								

							</thead>
							<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
						</table>
						<div id='revPicture' style='margin-bottom: 40px'>
						</div>
						<button class='btn' type="submit">리뷰수정/삭제</button>
						<a href="/review/list"><button type="button" class='btn'>리스트로 돌아가기</button></a>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document)
			.ready(
				function () {

				//숫자를 별로 변경하기 
					let star = "";
					var sti = <c:out value="${review.stisf }" /> +0 
					if('<c:out value="${review.stisf }" />'!=""){
					for (let a = 0; a < sti ; a++) {
						star = star + '★';
					}
					document.getElementById('star').innerHTML = star;
					}
					//리뷰사진뿌리기
					
					<c:forEach items="${reviewP }" var="picture">

					$("#revPicture").append
					("<img style=' width: auto; height: 200px; max-width: 300px; margin-left :20px;' id='rPicture' src='/review/display?fileName=<c:out value="${picture.purl }" /><c:out value="${picture.pname }" />'>");
		
					</c:forEach>
				
					
				});
	</script>

</body>

<%@include file="../includes/footer.jsp"%>

</html>