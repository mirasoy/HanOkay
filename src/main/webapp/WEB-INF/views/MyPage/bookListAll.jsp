<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<% session.setAttribute("loginUserNum", "U1"); 
String name = (String)session.getAttribute("loginUserNum");
int i=0;
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
				<li class="item1"><a href="/MyPage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/MyPage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/MyPage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/MyPage/cancelled">취소된 예약</a></li>		

						
			</ul>
		</div>
		
		<div class="panel-heading">
				   <%=userFstname %>의 예약 목록입니다.	
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
							<th>상태</th>																
																				
						</tr>
					</thead>

					<c:forEach items="${bookListAll}" var="board">
						<tr id="test1">
							<td><c:out value="${board.acmName}" /></td>																			
							<td><c:out value="${board.bookNum}" /></td>																
					
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>
									
							<td><fmt:formatDate pattern="yyyy-MM-dd"

									value="${board.checkoutDate}" /></td>						
														
							<td id="<c:out value="${board.bookNum}" />"> </td>
							
							<%-- <td><a href="/MyPage/info?bookNum=${board.bookNum}">예약정보</a></td> --%>							
							<!-- 여기에 추가하기 -->
      			
					

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


<script>


		 
		<c:forEach items="${bookListAll}" var="board">
		
	 		var bookStatus = '<c:out value="${board.bookStatus} "/>'
			
	 		console.log(bookStatus);
				 
			
			if(bookStatus.trim()=='RS_STT_BK'){
				
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='투숙예정' readonly='readonly'>");				
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
				
				
			}else if(bookStatus.trim()=='RS_STT_BC'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='예약취소' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info3?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
				
			}else if(bookStatus.trim()=='RS_STT_AC'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='투숙완료' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
			}else if(bookStatus.trim()=='RS_STT_CI'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='체크아웃' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
			}
			
		
		</c:forEach>

	

</script>
