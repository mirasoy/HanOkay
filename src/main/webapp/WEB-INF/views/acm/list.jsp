<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Booking Form HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Alegreya:700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="/resources/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<form>
							<div class="row no-margin">
								<div class="col-md-3">
									<div class="form-header">
										<h2>Book Now</h2>
									</div>
								</div>
								<div class="col-md-7">
									<div class="row no-margin">
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Location</span>
												<input class="form-control" type="search">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Check In</span>
												<input class="form-control" type="date">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<span class="form-label">Check out</span>
												<input class="form-control" type="date">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<span class="form-label">Guests</span>
												<select class="form-control">
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select>
												<span class="select-arrow"></span>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<span class="form-label">Kids</span>
												<select class="form-control">
													<option>0</option>
													<option>1</option>
													<option>2</option>
												</select>
												<span class="select-arrow"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-btn">
										<button class="submit-btn">Check availability</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Acm List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Acm</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#숙소번호</th>
							<th>숙소 이름</th>
							<th>체크인시간</th>
							<th>체크아웃시간</th>
							<th>숙소설명</th>
						</tr>
					</thead>

					<c:forEach items="${list }" var="acm">
						<tr>
							<td><c:out value="${acm.acmNum }" /></td>
							<td><a class='move' href='<c:out value="${acm.acmNum}"/>'>
									<c:out value="${acm.acmName}" />
							</a></td>
							<td><c:out value="${acm.checkinTime }" /></td>
							<td><c:out value="${acm.checkoutTime }" /></td>
							<td><c:out value="${acm.acmDesc }" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- table 태그의 끝 -->
				<div class='row'>
					<div class="col-lg-12">
					
					<form id='searchForm' action="/board/list" method='get'>
						<select name = 'type'>
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
						</select>
						<input type='text' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword }"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
						<button class='btn btn-default'>Search</button>
					</form>
					</div>
				</div>

				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a
								href="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->


				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>
<form id='actionForm' action="/board/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
</form>
<!-- /.row -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}
							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							self.location = "/board/register";
						});

						var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click", function(e){
							e.preventDefault();
							actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
							actionForm.attr("action","/board/get");
							actionForm.submit();
						});
						
						var searchForm = $("#searchForm");
						$("#searchForm button").on("click", function(e){
							if(!searchForm.find("option:selected").val()){
								alert("검색종류를 선택하세요");
								return false;
							}
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력하세요");
								return false;
							}
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
						})
					});
</script>
<%@include file="../includes/footer.jsp"%>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>