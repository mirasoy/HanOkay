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
	
	button{
		width:350px;
		height:50px;
	}
</style>
<%@include file="../includes/becomehostheader.jsp"%>

<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
       <div class="sidebar-nav navbar-collapse">
       <input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">

           <ul class="nav" id="side-menu">
                <li>
                  <a><c:out value="${userFstname}"/>님 !<br> 숙소 등록이 완료되었습니다</a> 
               </li>
               <li>
                   <a><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
               </li>
               <li>
                   <a><i class="fa fa-male fa-fw"></i> 상세 정보</a>
               </li>
               <li>
                   <a><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
               </li>
               <li>
                   <a class="active"><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
               </li>
           </ul>
       </div>
                <!-- /.sidebar-collapse -->
</div>
            <!-- /.navbar-static-side -->
        
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<br>
	<div style="margin-left:20%;margin-right:15%;">	
			 <!-- 숙소설명 -->
		 		<img style='position: relative;margin-bottom: 3%;left: 20px;width: auto;height: 500px;' src='/resources/img/welcomehome.gif'>
			 <div style="margin-left:20%;">
				<button data-oper='pendingAcm' class="btn btn-default">숙소 신청 확인/수정</button>&nbsp;&nbsp; 
				<button data-oper='home' class="btn btn-default">Han:ok 메인페이지로</button> 
			</div>
		
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
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
			
			if(operation==='pendingAcm'){
				formObj.attr("action","/hosting/listings");
				
			} else if(operation==='home'){
				alert("돌아갑니다");
				formObj.attr("action","/acm/list");
			} 
			
			actionForm.submit();
		});
	});



</script>
