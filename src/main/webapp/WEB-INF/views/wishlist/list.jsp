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
							<th>삭제버튼</th>				
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
							<!-- <td><button data-oper='delete' id="deleteBtn" class="deleteBtn">삭제</button></td>  -->
 						<%-- 	<td><a href=remove?wishNum=<c:out value="${board.wishNum}"/> data-oper='deleteBtn' id="deleteBtn" class="deleteBtn">삭제</a></td> --%>
 							
 					<%-- 	<form role="form" action="/remove=<c:out value="${board.wishNum}"/>" method="post">
 							<button type="submit" id="deleteBtn" class="deleteBtn" data-oper='deleteBtn'>삭제하기</button>
 						</form> --%>
 						
 						<%--  <a href="${path}/shop/cart/delete.do?cartId=${row.cartId}">삭제</a> --%>
 						
 						<td><a href="${path}/wishlist/remove.do?wishNum=${board.wishNum}" id="deleteBtn" class="deleteBtn">삭제</a></td>

						</tr>
					</c:forEach>
				</table>

				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
<script type="text/javascript" src="/resources/js/wishlist.js"></script>	
	<script>
	
	
	/* var wishNumValue = '<c:out value="${get.wishNum}"/>';
	
	alert("wishNumValue"); */
/* 	
	wishService.remove(W334, function(count){
		console.log(count);
		if(count==="success"){
			alert("삭제완료");
			}
		}, function(err){
			alert('ERROR...');
		
	});
	 */
	
	
	
	
		
	var deleteBtn = document.getElementsByClassName("deleteBtn");
	for(
			var i=0 ; i<deleteBtn.length ; i++
			){
		deleteBtn[i].onclick = function(e){			
		
			alert("삭제클릭")	;
		
		};	
	}
	
	
	</script>


	<%@include file="../includes/footer.jsp"%>