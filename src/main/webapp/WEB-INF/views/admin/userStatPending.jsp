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
	    <h4>'<c:out value="${pendinghostacm.userFstName }"/>' 회원님의 호스트 요청</h4><br>
	  </div>
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
	 <input type="hidden" name="userNum" id="userNum" value="<c:out value='${pendinghostacm.userNum }'/>">
      
<div class="row">
  <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">회원 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label>&nbsp; <c:out value="${pendinghostacm.userNum }"/>
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label>&nbsp; <c:out value="${pendinghostacm.userFstName }"/><c:out value="${pendinghostacm.userLastName }"/></div>
	        <div class="form-group">
	          <label>회원 권한</label>&nbsp;<c:out value="${pendinghostacm.userPriv }"/>
	        </div>
	        <div class="form-group">
	          <label>회원 상태</label>&nbsp; <c:out value="${pendinghostacm.userStatusCode }"/>
	        </div>
	        <div class="form-group">
	          <label>숙소 상태</label>&nbsp; <span style="color:red;"><c:out value="${pendinghostacm.acmStatus }"/></span>
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label>&nbsp; <c:out value="${pendinghostacm.bizRegnum }"/>
	        </div>
			
		</div>
		</div>
		
			<button data-oper='uptoHost' class="btn btn-default">호스트 수락</button>
			<button data-oper='returnHost' class="btn btn-danger">호스트 거절</button><!-- 이유를 써서 알림으로 가게끔 하자2.5차 -->
			<button data-oper='backtoIndex' class="btn btn-info" >홈으로</button>
		
		
	</div><!-- col-lg-4 end -->
	
  <div class="col-lg-6">
    <div class="panel panel-default" >

      <div class="panel-heading">
      	숙소정보<label class="pull-right"><c:out value="${pendinghostacm.acmNum }"/></label>
      </div>
      <input type="hidden" name="acmNum" id="acmNum" value="<c:out value='${pendinghostacm.acmNum }'/>">
      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소이름</label> <input class="form-control" name='acmName' id='acmName'
	            value='<c:out value="${pendinghostacm.acmName}"/>' size="20" readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소유형</label> <input class="form-control" name='acmType' id='acmType'
	            value='<c:out value="${pendinghostacm.acmType}"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 주소</label> <input class="form-control" name='acmAddr'
	            value='<c:out value="${pendinghostacm.acmCity}"/>&nbsp;<c:out value="${pendinghostacm.acmDistr}"/>&nbsp;<c:out value="${pendinghostacm.acmDetailaddr}"/>' readonly="readonly"> 
	        </div>
	        <div class="form-group">
	          <label>숙소 대표번호</label> <input class="form-control" name='repPhone'
	            value='<c:out value="${pendinghostacm.repPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>호스트 연락처</label> <input class="form-control" name='subPhone'
	            value='<c:out value="${pendinghostacm.subPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>체크인, 체크아웃 시간</label> <input class="form-control" name='checkTime'
	            value='<c:out value="${pendinghostacm.checkinTime }"/>/<c:out value="${pendinghostacm.checkoutTime }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 이메일</label> <input class="form-control" name='acmEmail'
	            value='<c:out value="${pendinghostacm.acmEmail }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 팩스번호</label> <input class="form-control" name='acmFax'
	            value='<c:out value="${pendinghostacm.acmFax }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>숙소 설명</label> <textarea class="form-control" name='acmDesc' readonly="readonly"><c:out value="${pendinghostacm.acmDesc }"/></textarea>
	        </div>
	        <div class="form-group">
	          <label>숙소 옵션</label> 
	          	<div id="acmOpt"></div>
	          </div>
	
			
		</div>
		</div>
	</div><!-- col-lg-4 end -->
		
		
	 <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">객실정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 목록 </th>
						</tr>
					</thead>

					<c:forEach items="${pendingroms}" var="rom">
						<tr>
							<td>
								<a class='move' href='<c:out value="${rom.romNum}"/>'>
									<c:out value="${rom.romName}" />
								</a>
							</td>
						
						</tr>
					</c:forEach>
				</table>
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
		getAcmOpt();
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtoIndex'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/admin/adminindex");	
			} else if(operation==='uptoHost'){
				alert("Host전환이 처리되었습니다");//HOST로 격상, 숙소 객실 ACTIVE전환
				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
				
				formObj.attr("method","post");
				formObj.attr("action","/admin/moditoHost");
			} else if(operation==='returnHost'){
				if(confirm("회원의 요청을 거절하시겠습니까?")==true){//숙소, 객실 INACTIVE되어야함
					formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
					formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");	
					formObj.attr("method","post");
					formObj.attr("action","/admin/moditoGuest");
				} else {
					return false;
				}
			}
			actionForm.submit();
		});
	});

	//숙소옵션뿌리기
	function dec2bin(codeNum){
		return (codeNum >>> 0).toString(2); 
	}
	function pad(code) {
		return code.length >= 16? code : new Array(16 - code.length+1).join('0') + code;
	}
	
	function getAcmOpt() {
		var iconArr = new Array(); 
		var codeArr = new Array(); 
		var nameArr = new Array(); 
		let option;
		let j = 0;

		<c:forEach items="${acmCode}" var="acmCode">
		
			iconArr[j] = '<c:out value="${acmCode.codeIcon}" />';
			codeArr[j] = 'acm' + '<c:out value="${acmCode.codeFull}" />';
			nameArr[j] = '<c:out value="${acmCode.codeCont}" />';
			j++;

		</c:forEach>
		
		
				
		option= pad(dec2bin("${pendinghostacm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("acmOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				
			}
		}
	
	}
	

</script>
<%@include file="../includes/footer.jsp"%>











