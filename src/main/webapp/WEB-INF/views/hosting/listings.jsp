<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
<style>
	a{
		color: #21292d !important;
		}
		
	
</style>


<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h3 align="left">총 <c:out value="${size}"/>개의 숙소</h3><br>
		
		
		<!-- 영업중인 숙소 -->
			
		<div class="col-lg-12" id="activeacm">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span id="acmlist">영업중인 숙소</span>
				<button id="newallowed" type="button" class="btn btn-xs pull-right" data-oper='newAcm'>새 숙소 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 사진</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 위치</th>
						</tr>
					</thead>

					<c:forEach items="${activelist}" var="activeacm">
						<tr>
							<td style="width: 150px;">
							<img style='width: auto; height: 100px; max-width: 100px; margin-left :20px; border-radius:10px;' id='rPicture' src='/review/display?fileName=<c:out value="${activeacm.acmPurl}" /><c:out value="${activeacm.acmPname }" />'>

							</td>
							<td>
								<a class='move' href='<c:out value="${activeacm.acmNum}"/>'>
									<c:out value="${activeacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${activeacm.acmType}'/>"></td>
							<td><c:out value="${activeacm.acmDetailaddr}" /></td>
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
				<div id="acmlist">심사 대기중인 숙소</div>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 사진</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 위치</th>
						</tr>
					</thead>

					<c:forEach items="${pendinglist}" var="pendingacm">
						<tr>
							<td style="width: 150px;">
							<img style='width: auto; height: 100px; max-width: 100px; margin-left :20px; border-radius:10px;' id='rPicture' src='/review/display?fileName=<c:out value="${pendingacm.acmPurl}" /><c:out value="${pendingacm.acmPname }" />'>
							</td>
							<td>
								<a class='move' href='<c:out value="${pendingacm.acmNum}"/>'>
									<c:out value="${pendingacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${pendingacm.acmType}'/>"></td>
							<td><c:out value="${pendingacm.acmDetailaddr}" /></td>
							
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
							<th>숙소 사진</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>숙소 위치</th>
						</tr>
					</thead>

					<c:forEach items="${inactivelist}" var="inactiveacm">
						<tr>
							<td style="width: 150px;">
							<img style=' width: auto; height: 200px; max-width: 300px; margin-left :20px;' id='rPicture' src='/review/display?fileName=<c:out value="${inactiveacm.acmPurl}" /><c:out value="${inactiveacm.acmPname }" />'>
							</td>
							<td>
								<a class='move' href='<c:out value="${inactivelist.acmNum}"/>'>
									<c:out value="${inactiveacm.acmName}" />
								</a>
							</td>
							<td id="<c:out value='${inactiveacm.acmType}'/>"></td>
							<td><c:out value="${inactiveacm.acmDetailaddr}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		</div>	
			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
		</div>

				

<script type="text/javascript">
$(document).ready(function(){
		
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
	$(document).ready(function(){
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='newAcm'){
				alert("새 숙소를 등록합니다");
				location.href="/hosting/become-host0";
			}
		});
	});


	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");

			actionForm.attr("action","/hosting/getAcm");

			actionForm.submit();
		});
	});
	

	 $(document).ready(function() {
		  var priv ='<%=userPriv%>';
	      var userStatusCode='<%=userStatusCode%>';
	      //alert(userStatusCode);
	      if(userStatusCode=="HO_PENDING"){
	   		$("#activeacm").css("display","none"); 
	   		$("#inactiveacm").css("display","none"); 
		  }
	   
	      var newnotallowed=<c:out value="${newnotallowed}" />;
	      if(newnotallowed==true){
	    	  $("#newallowed").css("display","none"); 
	      }
	      
	   });
</script>








<%@include file="../includes/footer.jsp"%>
