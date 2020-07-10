<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                           <a>user님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
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
		<form id="actionForm" method="post">
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
	            value='<c:out value="${thisrom.romCapa }"/>'>
	        </div>
	        <div class="form-group">
	          <label>침대 타입</label> <input class="form-control" name='bedType' id='bedType'
	            value='<c:out value="${thisrom.bedType }"/>'>
	        </div>
			<div class="form-group">
	          <label>침대 갯수</label> <input class="form-control" name='bedCnt' id='bedCnt'
	            value='<c:out value="${thisrom.bedCnt }"/>' >
	        </div>
			<div class="form-group">
	          <label>객실 크기</label> <input class="form-control" name='romSize' id='romSize'
	            value='<c:out value="${thisrom.romSize }"/>' >
	        </div>
	        <div class="form-group">
	          <label>객실 1박요금</label> <input class="form-control" name='romPrice' id=romPrice'
	            value='<c:out value="${thisrom.romPrice }"/>' >
	        </div>
	        <div class="form-group">
	          <label>객실 사진</label> <input class="form-control" name='romPurl' id='romPurl'
	            value='<c:out value="${thisrom.romPurl }"/>'>
	        </div>
			<div class="form-group">
	        <label>객실 위치</label> <input class="form-control" name='romLoca' id='romLoca'
	            value='<c:out value="${thisrom.romLoca }"/>'>
    	    </div>
			
	
	
			<button data-oper='modify' class="btn btn-default">수정완료</button>
			<button data-oper='list' class="btn btn-info">뒤로가기</button>
				
		</form>
		</div>
</div>
</div>
</div>
</div>

	
				

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='list'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/hosting/become-host2_6");	
			} else if(operation==='modify'){
				alert("객실 수정이 완료되었습니다");
				formObj.attr("action","/hosting/modifyRom");//홈의 내용과 다같이 들어간다
			}
			
			actionForm.submit();
		});
	});



</script>





