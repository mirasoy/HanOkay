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
		<h1 class="page-header">나의 예약</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">
				<%=userFstName %>의 예약 중인 목록입니다. (숙박예정)
			</div>
			<!-- /.panel-heading -->
			
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>상품명</th>
							<th>#번호</th>
							<th>가격</th>				
						</tr>
					</thead>

					<c:forEach items="${wishList}" var="board">
						<tr>
							<td name='acmNum' id='acmNum'><c:out value="${board.acmName}" /></td>
							<td><c:out value="${board.bookNum}" /></td>

			

						</tr>
					</c:forEach>
				</table>

				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->


	<%@include file="../includes/footer.jsp"%>