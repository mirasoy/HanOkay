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
					<p><%=userFstName%>님, 추억이 떠오르시나요?
					</p>
				</div>
			</div>
			<%@include file="../includes/sidebar.jsp"%>
			<section class="contents">
				<div class="panel-body">
					<form id="operForm" action="/review/modify" method="get">

						<div class="postRV"
							style="border: 3px solid #f1f1f1; background-color: white; border-radius: 5em; margin: 2%; padding: 5%;">
							<b
								style="font-size: 2em; border-right: 5px solid #f1f1f1; margin-right: 1em; padding-right: 1em;">${review.title }
							</b> <span id="star"
								style="padding-right: 1em; color: red; font-size: 1.5em; margin-right: 1em;">
							</span>
							<hr style="border: 2px solid #f1f1f1">
							<span style="margin-left: 1em; font-size: 1.5em;"><b>${review.acmName }</b></span>
							<span>${review.checkInDay }~${review.checkOutDay }</span>
							<hr style="border: 3px solid #f1f1f1">
							${review.content }
							<hr style="border: 3px solid #f1f1f1">
							<div id='revPicture'></div>
							<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
						</div>
						<div class="right">
							<button class='btn' type="submit">리뷰수정/삭제</button>
							<a href="/review/list"><button type="button" class='btn'>리스트로
									돌아가기</button></a>
						</div>
					</form>
				</div>
		</div>
	</div>
	</div>
	</section>
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