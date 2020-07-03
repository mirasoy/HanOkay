<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% session.setAttribute("loginUserNum", "A1"); 
	String name = (String)session.getAttribute("loginUserNum");
%>
<%@include file="../includes/header.jsp"%>
<style>
	.bookbar{
		width: 100%;
	    height: 40px;
	    list-style: none;
	    padding: 0; 
	}
	
	.bookbar>li{
		float: left;
	    width: 110px;
	    height: 30px;
	    margin: 0;
	    text-align: center;
	    padding-top: 15px;
	}
	
	.panel-heading{
	    padding-left: 25px;
	}
</style>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">취소된 예약 페이지</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
		<div>
			<ul class="bookbar">
				<li class="item1"><a href="/MyPage/bookList">전체목록</a></li>
				<li class="item1"><a href="/MyPage/bookList">투숙예정</a></li>
				<li class="item2"><a href="#">투숙완료</a></li>
				<li class="item3"><a href="/MyPage/cancelled">취소된 예약</a></li>							
			</ul>
		</div>
		
		<div class="panel-heading">
				    
		
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
					
				<!-- 취소된 리스트 불러오기 -->
						
					<c:forEach items="${bookList}" var="board">
						<tr>
							<td><c:out value="${board.acmName}" /></td>																			
							<td><c:out value="${board.bookNum}" /></td>																
					
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>
									
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkoutDate}" /></td>
							<td><c:out value="${board.bookPrice}" /></td>			
							
							<td><a href="/MyPage/info?bookNum=${board.bookNum}">예약정보</a></td>
					
						</tr>																				
					</c:forEach>	
				</table>					
			</div>		
			<!--  end panel-body -->
		</div>	
		<!-- end panel -->
	</div>	
</div>





<%@include file="../includes/footer.jsp"%>
