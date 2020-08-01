<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">찜목록get</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">
				<%=userFstName%>의 장바구니
			</div>
			<!-- /.panel-heading -->

			<div class="panel-body">
		
				<div class="form-group info-group">
					<label>#예약번호</label> <input class="form-control" name='wishNum'
						value='<c:out value="${get.wishNum}"/>' readonly="readonly">
				</div>

				<div class="form-group info-group">
					<label>#예약번호</label> <input class="form-control" name='userNum'
						value='<c:out value="${get.userNum}"/>' readonly="readonly">
				</div>
				<div class="form-group info-group">
					<label>#예약번호</label> <input class="form-control" name='acmNum'
						value='<c:out value="${get.acmNum}"/>' readonly="readonly">
				</div>
				<div class="form-group info-group">
					<label>#예약번호</label> <input class="form-control" name='listTitle'
						value='<c:out value="${get.listTitle}"/>' readonly="readonly">
				</div>
				<div class="form-group info-group">
					<label>#예약번호</label> <input class="form-control" name='listContent'
						value='<c:out value="${get.listContent}"/>' readonly="readonly">
				</div>





				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->




	<script type="text/javascript" src="/resources/js/wishlist.js"></script>
	<script type="text/javascript">
	
	console.log("========================");
	console.log("JS TEST");
	
	
	var wishValue = '<c:out value="${get.wishNum}"/>';
	var userValue = '<c:out value="${get.userNum}"/>';
	var acmValue = '<c:out value="${get.acmNum}"/>';
	var titleValue = '<c:out value="${get.listTitle}"/>';
	var contentValue = '<c:out value="${get.listContent}"/>';
	
	
	wishService.add(
			{userNum : userValue, acmNum: acmValue, listTitle: titleValue, listContent: contentValue , wishNum: wishValue}
			,
				function(result){
					/* alert("Result : " + result); */
					console.log("Result : " + result)
				}
			);
	
	
		$(document).ready(function() {
				console.log(wishService);
			})  
	</script>

	<%@include file="../includes/footer.jsp"%>

	</html>