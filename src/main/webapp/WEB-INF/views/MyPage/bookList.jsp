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
		
		<div class="panel-heading">
				당신의 예약 목록입니다			
			</div>
			

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#예약번호</th>
							<th>#회원번호</th>
							<th>방번호</th>
							<th>예약일자</th>
							<th>체크인날짜</th>
							<th>체크아웃날짜</th>
							<th>예약숙박일수</th>
							<th>예약인원수</th>
							<th>객실요금</th>					
							<th>계약금</th>
							<th>예약취소여부</th>
							<th>도착예정시간</th>
							<th>흡연여부</th>
							<th>요구사항</th>
							<th>실제도착시간</th>
							<th>예약정보</th>
							
						</tr>
					</thead>

					<c:forEach items="${bookList}" var="board">
						<tr>
							<td><c:out value="${board.bookNum}" /></td>							
<%-- 							<td><a href="/MyPage/info?book_Num=${board.bookNum}"><c:out value="${board.bookNum}" /></a></td>							 --%>
													

							<td><c:out value="${board.userNum}" /></td>
							<td><c:out value="${board.romNum}" /></td>				
						
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.bookDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkinDate}" /></td>
									
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.checkoutDate}" /></td>
									
							<td><c:out value="${board.staydays}" /></td>		
							<td><c:out value="${board.guest}" /></td>		
							<td><c:out value="${board.bookPrice}" /></td>		
							<td><c:out value="${board.deposit}" /></td>		
							<td><c:out value="${board.canceled}" /></td>		
							<td><c:out value="${board.expectedArr}" /></td>		
							<td><c:out value="${board.smoking}" /></td>		
							<td><c:out value="${board.request}" /></td>		
							<td><c:out value="${board.realArr}" /></td>		
							<td><a href="/MyPage/info?bookNum=${board.bookNum}">예약정보</a></td>
					
						</tr>
						
<%-- 	<tr>
							<td><c:out value="${board.bookNum}" /></td>
							<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>

							<td><a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" />
							</a></td>

							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr> --%>					
						
						
					</c:forEach>
				</table>

			
<%-- 
				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
				
			<div class="panel-heading">
			
				<button id='regBtn' type="button" class="btn btn-xs pull-right">정보수정</button>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">리스트</button>
			</div>
				
			</div>

			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form> --%>

<!-- 
			Modal  추가
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
					/.modal-content
				</div>
				/.modal-dialog
			</div> -->
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	
	<!-- end panel -->
</div>


	

</div>
<!-- /.row -->




<!-- 

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

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>
 -->





<%@include file="../includes/footer.jsp"%>
