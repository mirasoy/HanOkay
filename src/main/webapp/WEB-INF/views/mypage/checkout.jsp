<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<% session.setAttribute("loginUserNum", "U1"); 
String name = (String)session.getAttribute("loginUserNum");
%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">나의 예약</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
		<div>
			<ul class="bookbar">
				<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>	

						
			</ul>
		</div>
		
		<div class="panel-heading">
				    <%=userFstName %>의 예약 완료 목록입니다.(체크아웃, 투숙완료)
			</div>
			

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소이름</th>
							<th>#예약번호</th>										
							<th>체크인날짜</th>
							<th>체크아웃날짜</th>							
							<th>객실요금</th>																
							<th>버튼</th>																
						</tr>
					</thead>

					<c:forEach items="${checkout}" var="board">
						<tr>
							<td><c:out value="${board.acmName}" /></td>																			
							<td><c:out value="${board.bookNum}" /></td>																
					
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>
									
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkoutDate}" /></td>
							<td><c:out value="${board.bookPrice}" /></td>			
							
							<td><a href="/mypage/info2?bookNum=${board.bookNum}">예약관리하기</a></td>
					
						</tr>																				
					</c:forEach>
				</table>
			</div>
			<!--  end panel-body -->
		</div>	
		<!-- end panel -->
	</div>	
</div>
<!-- /.row -->




<%@include file="../includes/footer.jsp"%>
