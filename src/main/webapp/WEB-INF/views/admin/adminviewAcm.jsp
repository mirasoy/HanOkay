<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>

  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;margin-left:0px;">
 
	<br>	
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">			
  <!-- 수정, 삭제 가능하게  -->
  		  
<div class="row">
	  <div class="col-lg-12">
	    <h4>'<c:out value="${getuseracm.userFstName }"/>' 회원님의 숙소상세</h4><br>
	  </div>
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">회원 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label> <input class="form-control" name='userNum' id='userNum'
	            value='<c:out value="${getuseracm.userNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label> <input class="form-control" name='userFstName' id='userFstName'
	            value='<c:out value="${getuseracm.userFstName }"/><c:out value="${pendinghostacm.userLastName }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 권한</label> <input class="form-control" name='userPiv'
	            value='<c:out value="${getuseracm.userPriv }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>회원 상태</label> <input class="form-control" name='userStatusCode'
	            value='<c:out value="${getuseracm.userStatusCode }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label> <input class="form-control" name='bizRegnum' id='bizRegnum'
	            value='<c:out value="${getuseracm.bizRegnum }"/>' readonly="readonly">
	        </div>
			
		</div>
		</div>
		
			<button data-oper='uptoHost' class="btn btn-default">호스트 수락</button>
			<button data-oper='returnHost' class="btn btn-danger">호스트 거절</button><!-- 이유를 써서 알림으로 가게끔 하자2.5차 -->
			<button data-oper='backtoIndex' class="btn btn-info" >관리자 페이지로</button>
		
		
	</div><!-- col-lg-4 end -->
	
  <div class="col-lg-6">
    <div class="panel panel-default" >

      <div class="panel-heading">
      	숙소정보<label class="pull-right"><c:out value="${getuseracm.acmNum }"/></label>
      </div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소이름</label> <input class="form-control" name='acmName' id='acmName'
	            value='<c:out value="${getuseracm.acmName}"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소유형</label> <input class="form-control" name='acmType' id='acmType'
	            value='<c:out value="${getuseracm.acmType}"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 주소</label> <input class="form-control" name='acmAddr'
	            value='<c:out value="${getuseracm.acmCity}"/>&nbsp;<c:out value="${getuseracm.acmDistr}"/>&nbsp;<c:out value="${getuseracm.acmDetailaddr}"/>' readonly="readonly"> 
	        </div>
	        <div class="form-group">
	          <label>숙소 대표번호</label> <input class="form-control" name='repPhone'
	            value='<c:out value="${getuseracm.repPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>호스트 연락처</label> <input class="form-control" name='subPhone'
	            value='<c:out value="${getuseracm.subPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>체크인, 체크아웃 시간</label> <input class="form-control" name='checkTime'
	            value='<c:out value="${getuseracm.checkinTime }"/>/<c:out value="${getuseracm.checkoutTime }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 이메일</label> <input class="form-control" name='acmEmail'
	            value='<c:out value="${getuseracm.acmEmail }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 팩스번호</label> <input class="form-control" name='acmFaxr'
	            value='<c:out value="${getuseracm.acmFax }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>숙소 설명</label> <textarea class="form-control" name='userPiv' readonly="readonly"><c:out value="${getuseracm.acmDesc }"/></textarea>
	        </div>
	
			
		</div>
		</div>
	</div><!-- col-lg-4 end -->
		
		
	 <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">객실정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label> <input class="form-control" name='userNum' id='userNum'
	            value='<c:out value="${getuseracm.userNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label> <input class="form-control" name='userFstName' id='userFstName'
	            value='<c:out value="${getuseracm.userFstName }"/><c:out value="${getuseracm.userLastName }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 권한</label> <input class="form-control" name='userPiv'
	            value='<c:out value="${getuseracm.userPriv }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>회원 상태</label> <input class="form-control" name='userStatusCode'
	            value='<c:out value="${getuseracm.userStatusCode }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label> <input class="form-control" name='bizRegnum' id='bizRegnum'
	            value='<c:out value="${getuseracm.bizRegnum }"/>' readonly="readonly">
	        </div>
			
		</div>
		</div>
		
		
	</div><!-- col-lg-4 end -->	
	
	
	
	
	
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
				formObj.append("<input type='hidden' name='bizRegnum' value='"+$('#bizRegnum').val()+"'>");
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











