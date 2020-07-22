<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>

  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;">
 
 <br> <h4><c:out value="${adminFstname}"/> 관리자님환영합니다, HostPending 회원리스트</h4><input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
	<br>			
  <!-- 수정, 삭제 가능하게  -->
  		  
<div class="row">
	  <div class="col-lg-12">
	    <h4><c:out value="${user.userFstName }"/> 회원님의  요청</h4>
	  </div>
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"><c:out value="${user.userFstName }"/> 회원님의 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label> <input class="form-control" name='userNum' id='userNum'
	            value='<c:out value="${user.userNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label> <input class="form-control" name='userFstName' id='userFstName'
	            value='<c:out value="${user.userFstName }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 권한</label> <input class="form-control" name='userPiv'
	            value='<c:out value="${user.userPriv }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>회원 상태</label> <input class="form-control" name='userStatusCode'
	            value='<c:out value="${user.userStatusCode }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label> <input class="form-control" name='bizRegisterNumber'
	            value='<c:out value="${user.bizRegisterNumber }"/>' readonly="readonly">
	        </div>
	
			<button data-oper='uptoHost' class="btn btn-default">호스트 수락</button>
			<button data-oper='returnHost' class="btn btn-danger">호스트 거절</button>
			<button data-oper='backtoIndex' class="btn btn-info" >어드민페이지로</button>
			
		</div>
		</div>
	</div>
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
			
			if(operation==='backtoIndex'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/admin/adminindex");	
			} else if(operation==='uptoHost'){
				alert("Host전환이 처리되었습니다");
				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				formObj.attr("method","post");
				formObj.attr("action","/admin/moditoHost");
			} else if(operation==='returnHost'){
				if(confirm("회원의 요청을 거절하시겠습니까?")==true){
					formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
					formObj.attr("method","post");
					formObj.attr("action","/admin/moditoGuest");
				} else {
					return false;
				}
			}
			actionForm.submit();
		});
	});



</script>
<%@include file="../includes/footer.jsp"%>











