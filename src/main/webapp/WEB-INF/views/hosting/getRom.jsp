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
    <h4><c:out value="${thisrom.romName }"/>의  정보</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">객실 상세보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
		<div class="form-group">
          <label>소속숙소번호</label> <input class="form-control" name='acmNum' id='acmNum'
            value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
        </div>	
        <div class="form-group">
          <label>객실번호</label> <input class="form-control" name='romNum' id='romNum'
            value='<c:out value="${thisrom.romNum }"/>' readonly="readonly">
        </div>

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
          <label></label> <input class="form-control" name='romPurl'
            value='<c:out value="${thisrom.romPurl }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>객실 위치</label> <input class="form-control" name='romLoca'
            value='<c:out value="${thisrom.romLoca }"/>' readonly="readonly">
        </div>


		<button data-oper='modify' class="btn btn-default">수정하기</button>
		<button data-oper='remove' class="btn btn-danger">삭제하기</button>
		<button data-oper='list' class="btn btn-info" >뒤로가기</button>
			
	</div>


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





