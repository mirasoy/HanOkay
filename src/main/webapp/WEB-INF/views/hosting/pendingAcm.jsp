<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.room{
		float:left;
		width:350px;
		height:250px;
	}
	
	.exp{
		font-size:8px;
	}
</style>

<%@include file="../includes/hostheader.jsp"%>

<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>			
  <!-- 수정, 삭제 가능하게  -->
  		  
	<div class="row">
  <div class="col-lg-12">
    <h4>[승인 전]<c:out value="${pendingacm.acmName }"/>의  정보</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">숙소 상세보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
		<div class="form-group">
          <label>숙소번호</label> <input class="form-control" name='acmNum' id='acmNum'
            value='<c:out value="${pendingacm.acmNum }"/>' readonly="readonly">
        </div>	
        <div class="form-group">
          <label>숙소이름</label> <input class="form-control" name='acmName' id='acmName'
            value='<c:out value="${pendingacm.acmName }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>숙소 시도</label> <input class="form-control" name='acmCity'
            value='<c:out value="${pendingacm.acmCity }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>숙소 구군</label> <input class="form-control" name='acmDistr'
            value='<c:out value="${pendingacm.acmDistr }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>숙소 상세주소</label> <input class="form-control" name='acmDetailaddr'
            value='<c:out value="${pendingacm.acmDetailaddr }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>대표번호</label> <input class="form-control" name='repPhone'
            value='<c:out value="${pendingacm.repPhone }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>보조번호</label> <input class="form-control" name='repPhone'
            value='<c:out value="${pendingacm.subPhone }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>사업자번호</label> <input class="form-control" name='bizRegnum'
            value='<c:out value="${pendingacm.bizRegnum }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>체크인시간</label> <input class="form-control" name='checkinTime'
            value='<c:out value="${pendingacm.checkinTime}"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>체크아웃시간</label> <input class="form-control" name='checkoutTime'
            value='<c:out value="${pendingacm.checkoutTime }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>숙소 1박요금 평균</label> <input class="form-control" name='romPrice'
            value='<c:out value=""/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>숙소 옵션 정보</label> <input class="form-control" name='romPrice'
            value='<c:out value=""/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>숙소 등록일</label> <input class="form-control" name='romPurl'
            value='<c:out value="${pendingacm.acmRegdate}"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>숙소 수정일</label> <input class="form-control" name='romPurl'
            value='<c:out value="${pendingacm.acmUpdatedate}"/>' readonly="readonly">
        </div>


		<button data-oper='modify' class="btn btn-default">수정하기</button>
		<button data-oper='remove' class="btn btn-danger">삭제하기</button>
		<button data-oper='list' class="btn btn-info" >뒤로가기</button>
			
	</div>

</div></div></div></div>

		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='list'){
				alert("목록으로 돌아갑니다");
				formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
				formObj.attr("action","/hosting/become-host2_6");	
			} else if(operation==='modify'){
				alert("객실을 수정합니다");
				formObj.append("<input type='hidden' name='romNum' value='"+$('#romNum').val()+"'>");
				formObj.attr("action","/hosting/modifyRom");
			} else if(operation==='remove'){
				if(confirm("정말 삭제하시겠습니까??")==true){
					formObj.append("<input type='hidden' name='romNum' value='"+$('#romNum').val()+"'>");
					formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
					formObj.attr("action","/hosting/removeRom");
				} else {
					return false;
				}
			}
			actionForm.submit();
		});
	});



</script>





