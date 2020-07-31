<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
	<style>
		a{
			color: #21292d;
			}
			
	</style>
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
  <!-- 숙소 방 추가 모달로 띄우기-->
		<div class="col-lg-10">
		<button type="button" data-oper='backtolist'>숙소 목록으로</button>
		<button type="button" data-oper='viewMyacm'>숙소 미리보기</button>
		</div>
		<br><br><br>
		<!-- 숙소사진편집 -->
		
			
		<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				숙소 '<c:out value="${acm.acmName}" />'
				
				<button type="button" class="btn btn-xs pull-right" data-oper='editAcmPic'>숙소 사진 편집</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>대표 숙소 사진</th>
						</tr>
					</thead>
						<tr>
							<th>
								<img style=' width: auto; height: 200px; max-width: 300px; margin-left :20px;' id='rPicture' src='/review/display?fileName=<c:out value="${acm.acmPurl}" /><c:out value="${acm.acmPname }" />'>
							</th>
						</tr>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 숙소 정보 -->
		
		<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				숙소 정보 <span class="pull-right"><c:out value="${acm.acmNum}" />&nbsp;&nbsp;&nbsp;<span id="<c:out value="${acm.acmActi}" />"></span>&nbsp;&nbsp;&nbsp;<button type="button" data-oper='editAcm'>숙소 정보 변경</button></span>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 이름</th>
							<th>숙소 상태</th>
							<th>숙소 유형</th>
							
							<th>숙소 대표번호</th>
							<th>보조 연락처</th>
							
						</tr>
					</thead>

						<tr>
							<td><c:out value="${acm.acmName}" /></td>
							<td><c:out value="${acm.acmStatus}" /></td>
							<td><span id="<c:out value="${acm.acmType}" />"></span></td>
							<td><c:out value="${acm.repPhone}" /></td>
							<td><c:out value="${acm.subPhone}" /></td>
						</tr>
						
					<thead>
						<tr>
							<th>숙소 팩스</th>
							<th>체크인/체크아웃</th>
							<th>숙소 이메일</th>
							<th colspan="2">숙소 소개</th>
						</tr>
					</thead>

						<tr>
							<td><c:out value="${acm.acmFax}" /></td>
							<td><c:out value="${acm.checkinTime}" />&nbsp;/&nbsp;<c:out value="${acm.checkoutTime}" /></td>
							<td><c:out value="${acm.acmEmail}" /></td>							
							<td colspan="2"><c:out value="${acm.acmDesc}" /></td>
						</tr>
						
					<thead>
						<tr>
							<th colspan="5">숙소 옵션</th>
						</tr>
					</thead>	
						<tr>
							<td colspan="5"><div id="acmOpt">&nbsp;</div></td>
						</tr>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 객실정보 -->
		
		<div class="col-lg-9">
		<div class="panel panel-default hostonly">
			<div class="panel-heading">
				객실 정보<span class="pull-right"><a>전체보기</a>&nbsp;&nbsp;<a>운영중</a>&nbsp;&nbsp;<a>비운영중</a></span>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 이름</th>
							<th>객실 유형</th>
							<th>크기 및 수용인원</th>
							<th></th>
						</tr>
					</thead>

					<c:forEach items="${inactivelist}" var="inactiveacm">
						<tr>
							<td style="width: 350px;">
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

				
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	var acmAc='<c:out value="${acm.acmActi}" />';//숙소ACTIVE여부
		console.log(acmAc);
		if(acmAc.trim()=="ACTIVE"){
			$('#<c:out value="${acm.acmActi}"/>').append("숙소 운영중");
		}
			
		else if(acmAc.trim()=="INACTIVE"){//집천체
			$('#<c:out value="${acm.acmActi}"/>').append("숙소 비운영중");
		}	
		
		
		
		////////////////////
		var acmType='<c:out value="${acm.acmType}" />';//숙소ACTIVE여부
		console.log(acmAc);
		if(acmType.trim()=="H"){
			$('#<c:out value="${acm.acmType}"/>').append("집전체");
		}
			
		else if(acmType.trim()=="P"){//집천체
			$('#<c:out value="${acm.acmType}"/>').append("객실별");
		}
	
		getAcmOpt();	
		
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
		
		
				
		option= pad(dec2bin("${acm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("acmOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
			}
		}

	}
	
	$(document).ready(function(){
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtolist'){
				alert("숙소목록으로 돌아갑니다");
				location.href="/hosting/listings";
			} else if(operation==='viewMyacm'){
				alert("==준비중(팝업으로)===")
			} else if(operation==='editAcmPic'){
				alert("==사진수정(팝업으로)===")
			} else if(operation==='editAcm'){
				alert("==숙소정보 변경(팝업으로)===")
			}else if(operation==='editRom'){
				alert("==객실정보 변경(팝업으로)===")
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
	   
	   });
</script>








<%@include file="../includes/footer.jsp"%>
