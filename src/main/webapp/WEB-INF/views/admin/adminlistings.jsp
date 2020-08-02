<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>


<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>			
<!-- 중앙정렬 -->
<div style="margin-left:15%;margin-right:15%;">		
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h3 align="left">총 <c:out value="${size}"/>개의 숙소</h3><br>
		
		<!-- 대기중인 숙소 -->
		
		<div class="col-lg-12" id="pendingacm">
		<div class="panel panel-default">
			<div class="panel-heading">
				대기중인 숙소<span class="pull-right">회원권한 부여가 필요합니다</span>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>호스트 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>대표 번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>객실수</th>
						</tr>
					</thead>
					<c:forEach items="${pendinglist}" var="pendingacm">
			<input type="hidden" name="pendingacmuserPriv" id="pendingacmuserPriv" value="<c:out value='${pendingacm.userPriv }'/>">
			<input type="hidden" name="pendingacmbizRegnum" id="pendingacmbizRegnum" value="<c:out value='${pendingacm.bizRegnum }'/>">
						<tr>
							<td><c:out value="${pendingacm.userNum}" /></td>
							<td><c:out value="${pendingacm.acmNum}" /></td>
							<td>
								<a class='pendingmove' href='<c:out value="${pendingacm.acmNum}"/>'>
									<c:out value="${pendingacm.acmName}" />
								</a>	
							</td>
							<td><c:out value="${pendingacm.acmType}" /></td>
							<td><c:out value="${pendingacm.repPhone}" /></td>
							
							<td><c:out value="${pendingacm.acmCity}" />&nbsp;<c:out value="${pendingacm.acmDistr}" />&nbsp;<c:out value="${pendingacm.acmDetailaddr}" /></td>
							<td><div id="pendingacmOpt${pendingacm.acmNum}">&nbsp;</div></td>
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
							<th>호스트 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>대표 번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>객실수</th>
						</tr>
					</thead>

					<c:forEach items="${activelist}" var="activeacm">
						<tr>
							<td><c:out value="${activeacm.userNum}" /></td>
							<td><c:out value="${activeacm.acmNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${activeacm.acmNum}"/>'>
									<c:out value="${activeacm.acmName}" />
								</a>
							</td>
							<td><c:out value="${activeacm.acmType}" /></td>
							<td><c:out value="${activeacm.repPhone}" /></td>
							
							<td><c:out value="${activeacm.acmCity}" />&nbsp;<c:out value="${activeacm.acmDistr}" />&nbsp;<c:out value="${activeacm.acmDetailaddr}" /></td>
							<td><div id="activeacmOpt${activeacm.acmNum}">&nbsp;</div></td>
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
							<th>호스트 </th>
							<th>숙소 번호</th>
							<th>숙소 이름</th>
							<th>숙소 유형</th>
							<th>대표 번호 </th>
							<th>숙소 위치</th>
							<th>숙소 옵션 </th>
							<th>객실수</th>
						</tr>
					</thead>

					<c:forEach items="${inactivelist}" var="inactiveacm">
						<tr>
							<td><c:out value="${inactiveacm.userNum}" /></td>
							<td><c:out value="${inactiveacm.acmNum}" /></td>
							<td>
								<a class='move' href='<c:out value="${inactiveacm.acmNum}"/>'><!-- 유일해야하니깐 -->
									<c:out value="${inactiveacm.acmName}" />
								</a>
							</td>
							<td><c:out value="${inactiveacm.acmType}" /></td>
							<td><c:out value="${inactiveacm.repPhone}" /></td>
							
							<td><c:out value="${inactiveacm.acmCity}" />&nbsp;<c:out value="${inactiveacm.acmDistr}" />&nbsp;<c:out value="${inactiveacm.acmDetailaddr}" /></td>
							<td><div id="inactiveacmOpt${inactiveacm.acmNum}">&nbsp;</div></td>
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
			
		</div>	
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
</div>

				
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	//객실 유형 문자바꿔 뿌리기	
	/*<c:forEach items="${pendinglist}" var="pendingacm">
		var pendingacmType='<c:out value="${pendingacm.acmType}" />';
		console.log(pendingacmType);
		
		if(pendingacmType.trim()=="P"){//객실별
			document.getElementById("pendingacmType${pendingacm.acmNum}").innerHTML="객실별";
		}
			
		else if(pendingacmType.trim()=="H"){//집천체
			document.getElementById("pendingacmType${pendingacm.acmNum}").innerHTML="집전체";
		}	
	
	</c:forEach>
	
	
	
	<c:forEach items="${activelist}" var="activeacm">
		var activeacmType='<c:out value="${activeacm.acmType}" />';
		console.log(activeacmType);
		
		if(activeacmType.trim()=="P"){//객실별
			document.getElementById("activeacmType${activeacm.acmNum}").innerHTML="객실별";
		}
			
		else if(activeacmType.trim()=="H"){//집천체
			document.getElementById("activeacmType${activeacm.acmNum}").innerHTML="집전체";
		}
	
	</c:forEach>
		
	
	
	<c:forEach items="${inactivelist}" var="inactiveacm">
		var inactiveacmType='<c:out value="${inactiveacm.acmType}" />';
		console.log(inactiveacmType);
		if(inactiveacmType.trim()=="P"){//객실별
			document.getElementById("inactiveacmType${inactiveacm.acmNum}").innerHTML="객실별";
		}
			
		else if(inactiveacmType.trim()=="H"){//집천체
			document.getElementById("inactiveacmType${inactiveacm.acmNum}").innerHTML="집전체";
		}		
		
	</c:forEach>*/
	
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
		
		
		<c:forEach items="${pendinglist}" var="pendingacm">
				
			option= pad(dec2bin("${pendingacm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
			
		
			for(let k=0; k<option.length; k++){
				if(option.charAt(k) == 1){
					//document.getElementById("pendingacmOpt${pendingacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
					document.getElementById("pendingacmOpt${pendingacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i></span>'+'&nbsp;';
					
				}
			}

		</c:forEach>

		<c:forEach items="${activelist}" var="activeacm">
		
		option= pad(dec2bin("${activeacm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				//document.getElementById("activeacmOpt${activeacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				document.getElementById("activeacmOpt${activeacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i></span>'+'&nbsp;';
				
			}
		}

		</c:forEach>
		
		<c:forEach items="${inactivelist}" var="inactiveacm">
		
		option= pad(dec2bin("${inactiveacm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				//document.getElementById("inactiveacmOpt${inactiveacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				document.getElementById("inactiveacmOpt${inactiveacm.acmNum}").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i></span>'+'&nbsp;';
				
			}
		}

		</c:forEach>
			
		
	}
	
	
	


	//해당 숙소 상세보기(권한 수정 페이지로)
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		
		$(".pendingmove").on("click", function(e){
			e.preventDefault();
			var userPriv=$("#pendingacmuserPriv").val();
			var bizRegnum=$("#pendingacmbizRegnum").val();
			
			if(userPriv!="HOST"){//회원권한을 업시켜야하는경우(guest일때)
				alert("회원권한 부여가 먼저 필요합니다!");
				actionForm.append("<input type='hidden' name='bizRegnum' value='"+bizRegnum+"'>");
				actionForm.attr("action","/admin/userStatPending");
					
			} else { //회원권한이 이미 host일때 
				actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
				//alert("이리로");
				actionForm.attr("action","/admin/adminPendingviewAcm");
			}
			actionForm.submit();
		});

		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/admin/adminviewAcm");
			actionForm.submit();
		});
	});
	

	
</script>








<%@include file="../includes/footer.jsp"%>
