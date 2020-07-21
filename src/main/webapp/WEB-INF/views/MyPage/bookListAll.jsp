<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
				<li class="item1"><a href="/MyPage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/MyPage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/MyPage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/MyPage/cancelled">취소된 예약</a></li>		

						
			</ul>
		</div>
		
		<div class="panel-heading">
				   <%=userFstName %>의 예약 목록입니다.	
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


		// 예약상태를 확인 하기 위해, 값을 불러오는 반복문을 여기에 둔다.

		<c:forEach items="${bookListAll}" var="board">
		
	 		var bookStatus = '<c:out value="${board.bookStatus} "/>'
			
	 		console.log(bookStatus);
				 
		//만약에, 내 예약상태가 "RS_STT_BK" 이라면, "투숙예정"을 출력하게끔 + 페이지는 info로 이동한다.
			if(bookStatus.trim()=='RS_STT_BK'){
				
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='투숙예정' readonly='readonly'>");				
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
				
		//만약에, 내 예약상태가 "RS_STT_BC" 이라면, "예약취소"을 출력하게끔 + 페이지는 info3로 이동한다.		
			}else if(bookStatus.trim()=='RS_STT_BC'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='예약취소' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info3?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
		
		//만약에, 내 예약상태가 "RS_STT_AC" 이라면, "투숙완료"을 출력하게끔 + 페이지는 info2로 이동한다.		
			}else if(bookStatus.trim()=='RS_STT_AC'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='투숙완료' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
		
		//만약에, 내 예약상태가 "RS_STT_CI" 이라면, "체크아웃"을 출력하게끔 + 페이지는 info2로 이동한다.	
			}else if(bookStatus.trim()=='RS_STT_CI'){
				$('#<c:out value="${board.bookNum}" />').append("<input class='form-control' name='bookStatus' value='체크아웃' readonly='readonly'>");
				$('#<c:out value="${board.bookNum}" />').append("<td><a href='/MyPage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기<a></td>");
			}
			
		
		</c:forEach>

	

</script>
