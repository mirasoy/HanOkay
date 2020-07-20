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
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                           <a></a> 
                        </li>
                        <li>
                            <a href=""><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">
	<br>			
  <!-- 수정, 삭제 가능하게  -->
  		  
	<div class="row">
  <div class="col-lg-12">
    <h4><c:out value="${thisrom.romName }"/>의  정보 수정하기</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">객실 수정하기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
		<form id="actionForm">
			<div class="form-group">
	          <label>소속숙소번호</label> <input class="form-control" name='acmNum' id='acmNum'
	            value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>객실번호</label> <input class="form-control" name='romNum' id='romNum'
	            value='<c:out value="${thisrom.romNum }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>객실이름</label> <input class="form-control" name='romName' id='romName'
	            value='<c:out value="${thisrom.romName }"/>'>
	        </div>
	        <div class="form-group">
	          <label>객실 타입</label> <input class="form-control" name='romType' id='romType'
	            value='<c:out value="${thisrom.romType }"/>'>
	        </div>
	        <div class="form-group">
	          <label>객실최대수용인원</label> <input class="form-control" name='romCapa' id='romCapa'
	            value='<c:out value="${thisrom.romCapa }"/>' numberonly>
	        </div>
	        <div class="form-group">
	          <label>침대 타입</label> <input class="form-control" name='bedType' id='bedType'
	            value='<c:out value="${thisrom.bedType }"/>'>
	        </div>
			<div class="form-group">
	          <label>침대 갯수</label> <input class="form-control" name='bedCnt' id='bedCnt'
	            value='<c:out value="${thisrom.bedCnt }"/>' numberonly>
	        </div>
			<div class="form-group">
	          <label>객실 크기</label> <input class="form-control" name='romSize' id='romSize'
	            value='<c:out value="${thisrom.romSize }"/>' numberonly>
	        </div>
	        <div class="form-group">
	          <label>객실 1박요금</label> <input class="form-control" name='romPrice' id=romPrice'
	            value='<c:out value="${thisrom.romPrice }"/>' numberonly>
	        </div>
	        <div class="form-group">
	          <label></label> <input class="form-control" name='romPurl'
	            value='<c:out value="${thisrom.romPurl }"/>' readonly="readonly">
	        </div>
	        
			<div class="form-group">
	        <label>객실 위치</label> <input class="form-control" name='romLoca' id='romLoca'
	            value='<c:out value="${thisrom.romLoca }"/>'>
    	    </div>
			
	
	
			<button data-oper='modify' class="btn btn-default">수정완료</button>
			<button data-oper='getRom' class="btn btn-info">수정취소</button>
				
		</form>
		</div>
</div>
</div>
</div>
</div>

	
				

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("#actionForm");
		var acmNum = $("#acmNum").val();
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			//취소 버튼을 누르면 getRom으로 
			if(operation==='getRom'){
				alert("수정이 취소되었습니다");
				//formObj안에 romNum값이 있으니~
				formObj.attr("action","/hosting/getRom");	
				
			} else if(operation==='modify'){
				var flag=true;
				
				$("input").each(function () {
					val = $(this).val().trim();
					if (val == '') {
						alert('모든 항목을 입력해주십시오.');
						$(this).focus();
						flag = false;
						return flag; // break
					}
				});
				
				if(flag){alert("객실 수정이 완료되었습니다");
					formObj.attr("method","post");
					formObj.attr("action","/hosting/modifyRom");//홈의 내용과 다같이 들어간다
				
				}else return;
			}
			
			actionForm.submit();
		});
	});

	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});

</script>





