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
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#숙소사진</th>
							<th>#숙소번호</th>
							<th>숙소 이름</th>
							<th>지역</th>
							<th>번호</th>
							<th>숙소설명</th>
						</tr>
					</thead>

					<c:forEach items="${list }" var="acm">
						<tr>
							<td><a href="#" ><img alt="" src="<c:out value="${acm.acmPurl}"/>" width="100"></a></td>
							<td><c:out value="${acm.acmNum }" /></td>
							<td><a class='move' href='<c:out value="${acm.acmNum}"/>'>
									<c:out value="${acm.acmName}" />
							</a></td>
							<td><c:out value="${acm.acmCity }" /></td>
							<td><c:out value="${acm.repPhone }" /></td>
							<td><c:out value="${acm.acmDesc }" /></td>
						</tr>
					</c:forEach>
				</table>
	
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
							self.location = "/acm/register";
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
							actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
							actionForm.attr("action","/acm/get");
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