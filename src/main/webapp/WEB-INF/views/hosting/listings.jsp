<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>

<div id="page-wrapper" style="padding-bottom:50px;">
	<br>			
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h4><c:out value="${userFstname}"/> 호스트님의 숙소 관리</h4><input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
  <h3 align="left">총 <c:out value="${size}"/>개의 숙소</h3>
			
			  
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-bottom:25px;">
				
				<button type="button" class="btn btn-xs pull-right" data-oper='newAcm'>새 숙소 등록</button>
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

					<c:forEach items="${list}" var="acm">
						<tr>
							<td><c:out value="${acm.acmPurl}" /></td>
							<td>
								<a class='move' href='<c:out value="${acm.acmNum}"/>'>
									<c:out value="${acm.acmName}" />
								</a>
							</td>
							<td><c:out value="${acm.acmType}" /></td>
							<td><c:out value="${acm.acmDetailaddr}" /></td>
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
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='newAcm'){
				alert("목록으로 돌아갑니다");
				formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
				formObj.attr("action","/hosting/become-host2_6");	
			}
			//actionForm.submit();
		});
	});


	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/hosting/become-host2_6");
			actionForm.submit();
		});
	});
	

</script>








<%@include file="../includes/footer.jsp"%>
