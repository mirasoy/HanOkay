<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>

<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>			
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h3 align="left">총 <c:out value="${size}"/>개의 숙소</h3><br>
		
		
		<!-- 영업중인 숙소 -->
			
		<div class="col-lg-12" id="activeacm">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span id="acmlist">영업중인 숙소</span>
				<!-- button type="button" class="btn btn-xs pull-right" data-oper='newAcm'>새 숙소 등록</button-->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 호스트 </th>
							<th>사업자번호 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 대표번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>숙소 객실수</th>
						</tr>
					</thead>

					<c:forEach items="${activelist}" var="activeacm">
						<tr>
							<td><c:out value="${activeacm.userNum}" /></td>
							<td><c:out value="${activeacm.bizRegnum}" /></td>
							<td><c:out value="${activeacm.acmNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${activeacm.bizRegnum}"/>'>
									<c:out value="${activeacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${activeacm.acmType}'/>"></td>
							<td><c:out value="${activeacm.repPhone}" /></td>
							
							<td><c:out value="${activeacm.acmCity}" />&nbsp;<c:out value="${activeacm.acmDistr}" />&nbsp;<c:out value="${activeacm.acmDetailaddr}" /></td>
							<td><c:out value="${activeacm.acmOptcode}" /></td>
							<td><c:out value="${activeacm.romSize}" /></td>
						
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 대기중인 숙소 -->
		
		<div class="col-lg-12" id="pendingacm">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div id="acmlist">대기중인 숙소</div>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 호스트 </th>
							<th>사업자번호 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 대표번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>숙소 객실수</th>
						</tr>
					</thead>

					<c:forEach items="${pendinglist}" var="pendingacm">
						<tr>
							<td><c:out value="${pendingacm.userNum}" /></td>
							<td><c:out value="${pendingacm.bizRegnum}" /></td>
							<td><c:out value="${pendingacm.acmNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${pendingacm.bizRegnum}"/>'>
									<c:out value="${pendingacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${pendingacm.acmType}'/>"></td>
							<td><c:out value="${pendingacm.repPhone}" /></td>
							
							<td><c:out value="${pendingacm.acmCity}" />&nbsp;<c:out value="${pendingacm.acmDistr}" />&nbsp;<c:out value="${pendingacm.acmDetailaddr}" /></td>
							<td><c:out value="${pendingacm.acmOptcode}" /></td>
							<td><c:out value="${pendingacm.romSize}" /></td>
						
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 비활성화된 숙소 -->
		
		<div class="col-lg-12" id="inactiveacm">
		<div class="panel panel-default hostonly">
			<div class="panel-heading">
				<div id="acmlist">비활성화 된 숙소</div>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 호스트 </th>
							<th>사업자번호 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 대표번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>숙소 객실수</th>
						</tr>
					</thead>

					<c:forEach items="${inactivelist}" var="inactiveacm">
						<tr>
							<td><c:out value="${inactiveacm.userNum}" /></td>
							<td><c:out value="${inactiveacm.bizRegnum}" /></td>
							<td><c:out value="${inactiveacm.acmNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${inactiveacm.bizRegnum}"/>'>
									<c:out value="${inactiveacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${inactiveacm.acmType}'/>"></td>
							<td><c:out value="${inactiveacm.repPhone}" /></td>
							
							<td><c:out value="${inactiveacm.acmCity}" />&nbsp;<c:out value="${inactiveacm.acmDistr}" />&nbsp;<c:out value="${inactiveacm.acmDetailaddr}" /></td>
							<td><c:out value="${inactiveacm.acmOptcode}" /></td>
							<td><c:out value="${inactiveacm.romSize}" /></td>
						
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
$(document).ready(function(){
	//객실 유형 문자바꿔 뿌리기	
	<c:forEach items="${pendinglist}" var="pendingacm">
		var pendingacmType='<c:out value="${pendingacm.acmType}" />';
		console.log(pendingacmType);
		
		if(pendingacmType.trim()=="P"){//객실별
			$('#<c:out value="${pendingacm.acmType}"/>').append("객실별");
		}
			
		else if(pendingacmType.trim()=="H"){//집천체
			$('#<c:out value="${pendingacm.acmType}"/>').append("집천체");
		}	
	
	</c:forEach>
	
	
	
	<c:forEach items="${activelist}" var="activeacm">
		var activeacmType='<c:out value="${activeacm.acmType}" />';
		console.log(activeacmType);
		
		if(activeacmType.trim()=="P"){//객실별
			$('#<c:out value="${activeacm.acmType}"/>').append("객실별");
		}
			
		else if(activeacmType.trim()=="H"){//집천체
			$('#<c:out value="${activeacm.acmType}"/>').append("집천체");
		}	
	
	</c:forEach>
		
	
	
	<c:forEach items="${inactivelist}" var="inactiveacm">
		var inactiveacmType='<c:out value="${inactiveacm.acmType}" />';
		console.log(inactiveacmType);
		if(inactiveacmType.trim()=="P"){//객실별
			$('#<c:out value="${inactiveacm.acmType}"/>').append("객실별");
		}
			
		else if(inactiveacmType.trim()=="H"){//집천체
			$('#<c:out value="${inactiveacm.acmType}"/>').append("집천체");
		}	
		
	</c:forEach>
	
	
	
	});

	//해당 숙소 상세보기(권한 수정 페이지로)
	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bizRegnum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/adminviewAcm");
			actionForm.submit();
		});
	});
	

	
</script>








<%@include file="../includes/footer.jsp"%>
