<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>


<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>			
  <!-- 숙소 방 추가 모달로 띄우기-->
<input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
  <h3 align="left">총 <c:out value="${size}"/>개의 회원 호스트요청</h3>
			
			  
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-bottom:25px;">
				
				<button type="button" class="btn btn-xs pull-right" onclick="location.href='/hosting/become-host'">새 숙소 등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 이름</th>
							<th>회원 권한</th>
							<th>회원 상태</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="user">
						<tr>
							<td><c:out value="${user.userNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${user.userNum}"/>'>
									<c:out value="${user.userFstName}" />
								</a>
							</td>
							<td><c:out value="${user.userPriv}" /></td>
							<td><c:out value="${user.userStatusCode}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
			
			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
		</div>
				
<script type="text/javascript">
	$(document).ready(function(){ //회원 하나를 선택해 클릭하면  기본은 get이다
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/userStatProc");
			actionForm.submit();
		});
	});

</script>

<%@include file="../includes/footer.jsp"%>











