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
		<h1 class="page-header">찜목록</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">
				<%=userFstName %>의 장바구니
			</div>
			<!-- /.panel-heading -->
			
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>찜번호</th>
							<th>유저번호</th>
							<th>숙소번호</th>
							<th>목록타이틀</th>
							<th>목록내용</th>				
						</tr>
					</thead>


<!-- Model에 담긴 데이터 출력 : list를 실행하였을때 boardController는 model을 이용해서 게시물을 목록음 담아서 전달했으므로 이를 출력한다. -->

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.wishNum}" /></td>
							<td><c:out value="${board.userNum}" /></td>
							<td><c:out value="${board.acmNum}" /></td>
							<td><c:out value="${board.listTitle}" /></td>
							<td><c:out value="${board.listContent}" /></td>

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