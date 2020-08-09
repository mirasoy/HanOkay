<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>
a{
color: black;
}
a:hover{
color: black;
}
.heading-rPost {
	font-size: 25px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.checked {
	color: orange;
}
.reveiwPst{
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    background-color: white;
    margin: 2%;
    padding: 2%
}

.panel-body{

    margin-top: 26px;

}

</style>

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >

<div class="container">

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 작성한 리뷰</h1>
			<p><%=userFstName %>님이 작성해주신 리뷰입니다. '추억'을 통해 과거로의 시간여행을 다녀오셔요 !</p>
		</div>
	</div>

<%@include file="../includes/sidebar.jsp"%>

<section class="contents">
	<div class="col-lg-12">
		<div class="panel panel-default">


			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="bookList"></div>
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
	
	$(document).ready(
			function() {
			
			//테이블 리스트 만들기
		<c:forEach items="${list }" var="rev">
		
		//리뷰유무확인
		if ("<c:out value="${rev.pstNum }" />" != "") {
			var str = "";
			
			str += '<a href="/review/get?pstNum=<c:out value="${rev.pstNum }" />" /><div class="reveiwPst">'
				+'<span class="heading-rPost"><c:out value="${rev.title }" /></span>'
			
					if('<c:out value="${rev.stisf }" />'!=''){				
					for (let a = 0; a < <c:out value="${rev.stisf }" />+0; a++) {
					str += '<span class="fa fa-star checked"></span>'
				}		
					for (let a = 0; a < 5-<c:out value="${rev.stisf }" />+0; a++) {
					str += '<span class="fa fa-star "></span>'
				}		
					}
			
			str += '<p>투숙기간 : <c:out value="${rev.checkInDay }" />  ~  <c:out value="${rev.checkOutDay }" /></p>'
			str += '<hr style="border:3px solid #f1f1f1">'
			str += '<h5><c:out value="${rev.acmName }" /></h5></div></a>'
			
			
			$(".bookList").append(str);
			}

	
			</c:forEach>
	
		let msg = '<c:out value="${msg }" />'
		if(msg!=''){
		alert(msg);
		}
	});
	
			
	
	
	</script>
</body>

<%@include file="../includes/footer.jsp"%>
</html>