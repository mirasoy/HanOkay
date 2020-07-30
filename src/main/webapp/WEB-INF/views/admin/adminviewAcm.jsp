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
	.container-option{
		padding: 20px;
	}
</style>

<%@include file="../includes/adminheader.jsp"%>
<!-- nav-sidebar -->

<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>			
  <!-- 수정, 삭제 가능하게  -->
  		  
	<div class="row">
  <div class="col-lg-12">
    <h4>'<c:out value="${thisrom.romName }"/>'의  정보</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
	<input type="hidden" name='acmNum' id='acmNum' value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
	<input type="hidden" name='romNum' id='romNum' value='<c:out value="${thisrom.romNum }"/>' readonly="readonly">
   
      <div class="panel-heading">객실 상세보기
      <label class="pull-right"><c:out value="${thisrom.acmNum }"/><c:out value="${thisrom.romNum }"/></label>
      </div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group">
          <label>객실이름</label> <input class="form-control" name='romName'
            value='<c:out value="${thisrom.romName }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 타입</label> <input class="form-control" name='romType'
            value='<c:out value="${thisrom.romType }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실최대수용인원</label> <input class="form-control" name='romCapa'
            value='<c:out value="${thisrom.romCapa }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>침대 타입</label> <input class="form-control" name='bedType'
            value='<c:out value="${thisrom.bedType }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>침대 갯수</label> <input class="form-control" name='bedCnt'
            value='<c:out value="${thisrom.bedCnt }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>객실 크기</label> <input class="form-control" name='romSize'
            value='<c:out value="${thisrom.romSize }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 1박요금</label> <input class="form-control" name='romPrice'
            value='<c:out value="${thisrom.romPrice }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 사진</label> <input class="form-control" name='romPurl'
            value='<c:out value="${thisrom.romPurl }"/>' readonly="readonly">
        </div>
		<!-- 편의시설 -->
		<div class = "container-option booking-form" name="romOptcode">
			<label>객실 옵션정보(여기 icon 뿌리자)</label>
			<div id=romOpt>&nbsp;</div>
		</div>	
		<div class="form-group">
          <label>객실 옵션정보</label> <input class="form-control" name='romOptcode'
            value='<c:out value="${thisrom.romOptcode }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>객실 등록일</label> <input class="form-control" name='romRegdate'
            value='<c:out value="${thisrom.romRegdate }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 최근 수정일</label> <input class="form-control" name='romUpdatedate'
            value='<c:out value="${thisrom.romUpdatedate }"/>' readonly="readonly">
        </div>

		<div class="pull-right">
			<button data-oper='modify' class="btn btn-default">수정하기</button>
			<button data-oper='remove' class="btn btn-danger">삭제하기</button>
			<button data-oper='list' class="btn btn-info" >뒤로가기</button>
		</div>	
	</div>
</div></div></div></div>

<!-- 빈 폼 -->
<form id="actionForm">
</form>
				

<script type="text/javascript">
	//Option출력
	window.onload=function(){
		//getRomOpt();
	}
	
	let option = pad(dec2bin("${thisrom.romOptcode }"));
	function dec2bin(codeNum){
		return (codeNum >>> 0).toString(2); 
	}
	function pad(code) {
		return code.length >= 16? code : new Array(16 - code.length+1).join('0') + code;
	}
	
	// 숙소 옵션
	/*function getAcmOpt() {
		var iconArr = new Array(); 
		var codeArr = new Array(); 
		var nameArr = new Array(); 
		let j = 0;
		<c:forEach items="${acmCode}" var="acmCode">
			iconArr[j] = '<c:out value="${acmCode.codeIcon}" />';
			codeArr[j] = 'acm' + '<c:out value="${acmCode.codeFull}" />';
			nameArr[j] = '<c:out value="${acmCode.codeCont}" />';
			j++;
		</c:forEach>
		
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("romOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
			}
		}
	}*/
	


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





