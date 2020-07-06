<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/Hostheader.jsp"%>



	
<div class="row">
	<div class="col-lg-12" style="padding-left:50px; padding-right: 50px;">
		<h1 class="page-header">숙소 <span>n개</span></h1><!-- 갯수받아와서 넣어주기 -->
            <div class="input-group custom-search-form" style="width:500px;padding-bottom:20px;">
                <input type="text" class="form-control" size="30" placeholder="숙소 이름, 위치 등으로 검색">
                <span class="input-group-btn">
                 <button class="btn btn-default" type="button">
                     <i class="fa fa-search"></i>
                 </button>
           		</span>
            </div>


	
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				숙소 목록
				<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick='location.href="/hosting/become-host"'>새숙소 등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소이름</th>
							<th>등록여부</th>
							<th>방 갯수</th>
							<th>침대 갯수</th>
							<th>욕실 갯수</th>
							<th>위치</th>
							<th>최종 수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>

							<td><a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" />
							</a></td>

							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>

			

			<!-- Modal  추가 -->
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
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->






<%@include file="../includes/footer.jsp"%>
