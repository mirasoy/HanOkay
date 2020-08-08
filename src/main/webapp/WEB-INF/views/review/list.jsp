<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>

.columns-r {
  float: left;
  width: 33.3%;
  padding: 8px;
}

.acmname {
  list-style-type: none;
  border: 1px solid #eee;
  margin: 0;
  padding: 0;
  -webkit-transition: 0.3s;
  transition: 0.3s;
}

.acmname:hover {
  box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.acmname .header-r {
  background-color: #111;
  color: white;
  font-size: 25px;
  overflow: hidden;
  padding: 0;

}

.acmname li {
  border-bottom: 1px solid #eee;
  padding: 8px;
  text-align: center;
}

.acmname .grey {
  background-color: #eee;
  font-size: 25px;
  white-space: nowrap;
    overflow: hidden;
}

.button-r {
  background-color: #61dafb;
  border: none;
  color: white;
  font-weight: bold;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
}
.button-rv {
  background-color: #fb8561;
  border: none;
  color: white;
  font-weight: bold;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
}

.panel-body{
margin-left: 45px;
    transition: box-shadow .3s ease;
    margin-top: 26px;
    height: 274px;
}


@media only screen and (max-width: 600px) {
  .columns-r {
    width: 100%;
  }
}
</style>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
	
<div class="container">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 리뷰 목록</h1>
			<p><%=userFstName %>님 여행은 즐거우셨나요? 추억을 이곳에 간직하시겠습니까? </p>
		</div>
	</div>


<%@include file="../includes/sidebar.jsp"%>

<section class="contents">
	
	


			<!-- /.panel-heading -->
			<div class="panel-body">
					<div
						class="bookList">
					</div>
				</div>
				<!--  end panel-body -->
		
			<!-- end panel -->

	
	</section>
	<!-- /.row -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
	//append로 리스트목록 붙이기
	
			<c:forEach items="${list }" var="rev">
		var str = "";
		var reviewYN = "";
		if ("<c:out value="${rev.pstNum }" />" == "") {
			reviewYN = "<li class='grey'><a class='button-r' href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</a></li>"
		} else {
			reviewYN = "<li class='grey'><a class='button-rv' href='/review/get?pstNum=<c:out value="${rev.pstNum }" />'>리뷰보기</a></li>"
		}

		
		str += '<div class="columns-r">'
		str += ' <ul class="acmname">'
		str += ' <li class="header-r">'
		str +=	'<img style=" width: auto; height: 270px; max-width: 500px; " id="rPicture" src="/review/display?fileName=<c:out value="${rev.acmpurl }" /><c:out value="${rev.acmpname }" />">'
		str += '</li><li class="grey"><c:out value="${rev.acmName }" /></li>'
		str += '<li><h5>체크인</h5><c:out value="${rev.checkInDay }" /></li>'
		str += '<li><h5>체크아웃</h5><c:out value="${rev.checkOutDay }" /></li>'
		str += reviewYN
		str += ' </ul>'
		str += ' </div>'

		$(".bookList").append(str);
	

		
		</c:forEach>
	</script>
	
	
	
	
</body>
<%@include file="../includes/footer.jsp"%>

</html>