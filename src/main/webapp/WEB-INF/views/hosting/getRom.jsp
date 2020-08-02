<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/becomehostheader.jsp"%>
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
               <li>
                   <a><c:out value="${userFstname}"/>님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                </li>
                <li>
                    <a><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                </li>
                <li>
                    <a><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                </li>
                <li>
                    <a class="active"><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                </li>
                <li>
                    <a><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
<!-- nav-end -->
	
  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;margin-left:0px;">
	<br>	
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">			
  <!-- 수정, 삭제 가능하게  -->
	    <div class="col-lg-10">
			<button class="btn btn-default" type="button" data-oper='backtolist'>목록으로</button>
			<button class="btn btn-danger" type="button" data-oper='romDelete'>객실 삭제</button>
		
		</div>
		<br><br><br>
<div class="row">
 <input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${thisrom.acmNum}'/>" readonly="readonly">
  <input type="hidden" id="romNum" name="romNum" value=" <c:out value='${thisrom.romNum}'/>" readonly="readonly">
	</div><!-- col-lg-4 end -->
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				객실 '<c:out value="${thisrom.romName}" />'
				
				<button type="button" class="btn btn-xs pull-right" data-oper='editAcmPic'>숙소 사진 편집</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>대표 객실 사진</th>
						</tr>
					</thead>
						<tr>
							<th height="210px;">
								<img style=' width: auto; height: 150px; max-width: 300px; margin-left :20px;' id='rPicture' src='/review/display?fileName=<c:out value="${thisrom.romPurl}" /><c:out value="${thisrom.romPname }" />'>
							</th>
						</tr>
				</table>
				
				
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 객실 정보 -->
		
		<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				객실 정보 <span class="pull-right"><c:out value="${thisrom.romNum}" />&nbsp;&nbsp;<button type="button" data-oper='editRom'>객실 정보 변경</button></span>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 이름</th>
							<th>객실 유형</th>
							<th>객실 가격</th>
							<th>객실 크기/수용인원</th>
							<th>침구 정보</th>
							
						</tr>
					</thead>

						<tr>
							<td><c:out value="${thisrom.romName}" /></td>
							<td><c:out value="${thisrom.romType}" /></td>
							<td><c:out value="${thisrom.romPrice}" /></td>
							<td><c:out value="${thisrom.romSize}" />&nbsp;/&nbsp;<c:out value="${thisrom.romCapa}" /></td>
							<td><c:out value="${thisrom.bedType}" />&nbsp;/&nbsp;<c:out value="${thisrom.bedCnt}" />개</td>
						</tr>
						
					<thead>
						<tr>
							<th colspan="5">객실 옵션</th>
						</tr>
					</thead>

						<tr>
							<td colspan="5"><div id="romOpt">&nbsp;</div></td>
						</tr>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	
</div>
</div>
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
</div>
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		getRomOpt();
		
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtolist'){
				alert("목록으로 돌아갑니다");
				formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
				formObj.attr("action","/hosting/become-host2_6");	
			} else if(operation==='romDelete'){
				
				if(confirm("객실을 정말 삭제하시겠습니까?")==true){
					formObj.append("<input type='hidden' name='romNum' value='"+$('#romNum').val()+"'>");
					formObj.attr("method","post");
					formObj.attr("action","/hosting/removeRom");
				} else {
					return false;
				}
			
			} else if(operation==='editRom'){
				alert("pop으로 띄우기 수정목록")
			} else if(operation==='editAcmPic'){
				alert("사진 바꾸기!")
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
	
	function getRomOpt() {
		var iconArr = new Array(); 
		var codeArr = new Array(); 
		var nameArr = new Array(); 
		let option;
		let j = 0;

		<c:forEach items="${romCode}" var="romCode">
		
			iconArr[j] = '<c:out value="${romCode.codeIcon}" />';
			codeArr[j] = 'acm' + '<c:out value="${romCode.codeFull}" />';
			nameArr[j] = '<c:out value="${romCode.codeCont}" />';
			j++;

		</c:forEach>
		
		
				
		option= pad(dec2bin("${thisrom.romOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("romOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				
			}
		}
	
	}
	


</script>
<%@include file="../includes/footer.jsp"%>











