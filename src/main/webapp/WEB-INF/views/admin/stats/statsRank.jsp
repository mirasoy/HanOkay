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
		
		.active{   
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
					<a href="/admin/userStat">회원관리</a>
				</li>
				<li class="nav-menu">
					<a href="#">메시지</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/stats/statsChart" class="active">매출관리</a>
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
	 	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/admin/stats/statsChart"><i class="fa fa-camera fa-fw"></i> 한눈에 보기</a>
				</li>
				<li>
					<a href="/admin/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 숙소 랭킹</a>
				</li>
				<li>
					<a href="/admin/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
				</li>
				
			</ul>

		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- nav-end -->
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<div class=" containerMR">
			<br>
			<div style="margin-left:15%;margin-right:15%;">
				<h3>숙소 순위</h3>
				<div id="optChoice">
					<button class="btn opt"  onclick="$('#criteria').val('sumt');sendoption(); ">매출순</button>
					<button class="btn opt"  onclick="$('#criteria').val('stisf');sendoption();">별점순</button>
					<input type="hidden" id="criteria">
				</div>
				<div class = "containBody">
					<table class="table table-striped table-bordered table-hover salesList ">
						<thead>
							<tr class='fixed_top'>
								<th style="width: 10%">순위</th>
								<th style="width: 50%">숙소이름</th>
								<!-- 여기 호스트 이름도 있으면 좋겠다 -->
								<th style="width: 10%">평점</th>
								<th style="width: 30%">총 결제금액</th>
							</tr>
						</thead>
					</table>
					<div class="tableArea" id="acm">
						<table class="table table-striped table-bordered table-hover salesList" id="salesList">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../../includes/footer.jsp"%>
<script src="/resources/js/datepicker.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	sendoption();

})



function sendoption(){   
	
	var criteria;
	
	if($('#criteria').val()==""){
		criteria = 'sumt'
	}else{
		criteria=$('#criteria').val();
	}
	
	
	 $.ajax({
  	   type: 'POST',
  	   url: '/admin/stats/change2',
  	  data:{
  		  "criteria" : criteria
  	   },
  	   dataType: 'json',
  	   success: function(result){
  		   console.log("성공...");
  		   updateList(result);
  	   },
  	   error: function(){
  		   console.log("실패...");
  	   }
  	 });
}


function updateList(result) {
	$("#salesList").empty();
	
	var updateListstr = "";
	
	$(result).each(function (i,obj) {
		updateListstr +=("<tr><td >"+(i+1)+"</td>");
		updateListstr +=("<td>"+obj.acmName+"</td>");
		updateListstr +=("<td>"+numeral(obj.starPoint).format('0.0[0000]')+"</td>");
		updateListstr +=("<td>"+numeral(obj.sumTotal).format('0,0')+"</td></tr>");
	});
	$("#salesList").append(updateListstr);
}

</script>