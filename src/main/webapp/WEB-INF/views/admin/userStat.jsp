<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>

<style>
	.circle{
		position:absolute;
		top:-4px;
		left:-1px;
		width:20px;
		height:20px;
		border-radius:50%;
		background-color:red;
	}

</style>

<div id="page-wrapper" style="padding-bottom:50px;margin-left:0px;">
	<br>	
	<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">				
  <!-- 숙소 방 추가 모달로 띄우기-->
<input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
  <h3 align="left">총 <c:out value="${size}"/>개의 회원</h3><br>
	<div class="hostpendingisseo">호스트 대기자가 '<c:out value="${hopensize}"/>'명 있습니다!</div>		
	<br>		  
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-bottom:25px;">
			<div class="circle hostpendingisseo"></div>
				호스트 대기자 명단<label class="pull-right hostpendingisseo">*수락/거절 필요</label>
      
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 이름</th>
							<th>회원 사업자등록</th>
							<th>회원 권한</th>
							<th>회원 상태</th>
						</tr>
					</thead>

					<c:forEach items="${hopendinglist}" var="pendinguser">
						<tr>
							<td><c:out value="${pendinguser.userNum}" /></td>
							<td>
								<a class='pendingmove' href='<c:out value="${pendinguser.bizRegisterNumber}"/>'>
									<c:out value="${pendinguser.userFstName}" />
								</a>
							</td>
							<td><c:out value="${pendinguser.bizRegisterNumber}" /></td>
							<td><c:out value="${pendinguser.userPriv}" /></td>
							<td><c:out value="${pendinguser.userStatusCode}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
			</div>
		</div><!-- end pendinglist -->
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-bottom:25px;">
				일반 회원 명단
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
							<th>신고</th>
						</tr>
					</thead>

					<c:forEach items="${activelist}" var="activeuser">
						<tr>
							<td><c:out value="${activeuser.userNum}" /></td>
							<td>
								<a class='guestmove' href='<c:out value="${activeuser.userNum}"/>'>
									<c:out value="${activeuser.userFstName}" />
								</a>
							</td>
							<td><c:out value="${activeuser.userPriv}" /></td>
							<td><c:out value="${activeuser.userStatusCode}" /></td>
							<td>0</td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
			</div>
		</div><!-- end pendinglist -->		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-bottom:25px;">
				호스트 명단
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 이름</th>
							<th>회원 사업자등록</th>
							<th>회원 권한</th>
							<th>회원 상태</th>
							<th>신고</th>
						</tr>
					</thead>

					<c:forEach items="${hoactivelist}" var="hoactiveuser">
						<tr>
							<td><c:out value="${hoactiveuser.userNum}" /></td>
							<td>
								<a class='hostmove' href='<c:out value="${hoactiveuser.userNum}"/>'>
									<c:out value="${hoactiveuser.userFstName}" />
								</a>
							</td>
							<td><c:out value="${hoactiveuser.bizRegisterNumber}" /></td>
							<td><c:out value="${hoactiveuser.userPriv}" /></td>
							<td><c:out value="${hoactiveuser.userStatusCode}" /></td>
							<td>0</td>
						
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
			</div>
		</div><!-- end hoactivelist -->
		
</div><!-- 중앙정렬 -->

			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
		</div>
				
<script type="text/javascript">
	$(document).ready(function(){ //회원 하나를 선택해 클릭하면  기본은 get이다
		$(".pendingmove").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bizRegisterNumber' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/userStatPending");
			actionForm.submit();
		});
		
		$(".guestmove").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/userStatguest");
			actionForm.submit();
		});
	
		$(".hostmove").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/userStathost");
			actionForm.submit();
		});

		
		//대기자 있음을 보여줌
		var hopensize=<c:out value="${hopensize}"/>;
		
		if(hopensize=='0'){
			$(".hostpendingisseo").css("display","none");
		}
	
	
	});

</script>

<%@include file="../includes/footer.jsp"%>











