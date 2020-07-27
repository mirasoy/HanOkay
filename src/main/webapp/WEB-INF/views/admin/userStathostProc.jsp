<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>

  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;">
 
 <br> <h4>호스트 회원리스트</h4><input type="hidden" id="userNum" name="userNum" value=" <c:out value='${userNum}'/>">
	<br>			
  <!-- 수정, 삭제 가능하게  -->
  		  
<div class="row">
	  <div class="col-lg-12">
	    <h4>'<c:out value="${user.userFstName }"/>' 회원님의  요청</h4>
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
	
			<button data-oper='sendMessage' class="btn btn-default">알림보내기</button>
			<button data-oper='getInactive' class="btn btn-danger">정지먹이기</button>
			<button data-oper='backtoIndex' class="btn btn-info" >회원관리페이지로</button>
			
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
				formObj.attr("action","/admin/userStat");	
				actionForm.submit();
			} else if(operation==='getInactive'){
				alert("회원을 정지시키겠습니까?");
				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				//formObj.attr("method","post");
				//formObj.attr("action","/admin/moditoHost");
			} else if(operation==='sendMessage'){
				alert("알림을 보냅니다");
				//formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				
			}
		});
	});



</script>
<%@include file="../includes/footer.jsp"%>











