<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.ana.domain.UserVO"%>
<!-- 세션에 user라는 키로 저장된 userVO 인스턴스를 가져온다 -->
<%
		UserVO user = (UserVO) session.getAttribute("user");
		String userLastName = "";
		String userFstName = "";
		String userPriv="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userLastName = user.getUserLastName();
			userFstName = user.getUserFstName();
			userPriv = user.getUserPriv();
			
		}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Han:ok- Make yourself at home in Korea</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
	<style>
		html,body{
			font-family:Verdana, sans-serif;
			background-color:white;
		}
		
		#logo{
			width:50px;
			height:20px;
		}
		
		.acttive{   
		  border-bottom: 5px solid #775062; 
		}
		
		.panel-heading {
			color: white !important;
			background-color: #775062 !important;
			border-radius: 0px !important;
			border-color: #ddd;
		}
	</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:20px;margin-bottom:0;background-color:white;">

            <div class="navbar-header" style="margin-bottom:15px;">
                
				<!-- 로고자리 -->
                <a class="navbar-brand" href="/admin/adminindex">Han:Ok for Admin</a>
            </div>
            <!-- /.navbar-header -->

			<!-- 왼쪽 nav -->
            <ul class="nav navbar-top-links navbar-left">
				<li class="nav-menu">
					<a href="/admin/adminlistings">숙소관리</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/userStat" class="acttive">회원관리</a>
				</li>
				<li class="nav-menu" class="testbtn">
					<a href="#">메시지</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/stats/mapChart">매출관리</a>
				</li>
				
			</ul>
			
			
			<!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
           		<li class="nav-menu">
					<a href='/acm/list'>메인으로</a>
				</li>
				<li class="nav-menu">
					<a href='/hosting/listings'>호스트 모드 보기</a>
				</li>
				
					
            </ul>
        </nav>
        </div>

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	 $(document).ready(function() {
		  var user='<%=user%>';
		   if(user==null){
			   alert("회원만 접근할 수 있습니다");
			   location.href="/acm/list";
		   }
		   
		   
		  var priv ='<%=userPriv%>';
	      if(priv!="ADMIN"){
	    	  alert("관리자만 접속할수 있습니다");
	    	  location.href="/acm/list";
	      } 
	 });

	   
	</script>

  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
 
	<br>			
  <!-- 수정, 삭제 가능하게  -->
 <!-- 중앙정렬 -->
<div style="margin-left:15%;margin-right:15%;">		
<div class="row">
	  
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-3">
    <div class="panel panel-default">

      <div class="panel-heading"><c:out value="${user.userFstName }"/> 회원님의 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
		       <img style=' width: 200px; height: 200px; margin-left :20px; border-radius:100px;' id='rPicture' src='/review/display?fileName=<c:out value="${user.userProfilePicUrl}" /><c:out value="${user.userProfilePicName}" />'>
			</div>	
	        
			
		</div>
		</div>
	</div>
	
	<div class="col-lg-5">
    <div class="panel panel-default">

      <div class="panel-heading"><c:out value="${user.userFstName }"/> 회원님의</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label> <input class="form-control" name='userNum' id='userNum'
	            value='<c:out value="${user.userNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label> <input class="form-control" name='userFstName' id='userFstName'
	            value='<c:out value="${user.userFstName }"/>&nbsp;<c:out value="${user.userLastName }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 권한/상태</label> <input class="form-control" name='userPiv'
	            value='<c:out value="${user.userPriv }"/>/<c:out value="${user.userStatusCode }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>회원이메일/가입경로</label> <input class="form-control" name='userStatusCode'
	            value='<c:out value="${user.userEmail }"/>/<c:out value="${user.userRegisterMethod}"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 언어</label>
	          <input class="form-control" name='userStatusCode'
	            value='<c:out value="${user.userLanguage }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>회원 자기소개</label>
	          <textarea class="form-control" readonly="readonly"><c:out value="${user.userIntroduction }"/></textarea>
	        </div>
	
			<button data-oper='sendMessage' class="btn btn-default">알림보내기</button>
			<button data-oper='getInactive' class="btn btn-danger">정지먹이기</button>
			<button data-oper='backtoIndex' class="btn btn-info" >회원관리페이지로</button>
			
		</div>
		</div>
	</div>
	 <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">예약 현황</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>예약 목록 </th>
						</tr>
					</thead>

				</table>
		</div>
		</div>
		
		
	</div><!-- col-lg-3 end -->	
	
</div>
</div>
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtoIndex'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/admin/userStat");	
				actionForm.submit();
			} else if(operation==='getInactive'){
				alert("회원을 정지시키겠습니까?");
				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				//formObj.attr("method","post");
				//formObj.attr("action","/admin/moditoHost");
			} else if(operation==='sendMessage'){
				alert("알림을 보냅니다");
//				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				
			}
		});
	});



</script>
<%@include file="../includes/footer.jsp"%>











