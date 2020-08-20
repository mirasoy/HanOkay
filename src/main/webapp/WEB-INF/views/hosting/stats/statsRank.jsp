<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
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
      String userPwd = "";
      String userNum = "";
      String userPriv ="";
      String userStatusCode ="";//이걸로 새 숙소등록하기가 보이던지 사업자등록증이 보이던지 결정할거임
      //userNum = "U1";
      
      //user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
      if (user != null) {
         userLastName = user.getUserLastName();
         userFstName = user.getUserFstName();
         userPwd = user.getUserPwd();
         userNum = user.getUserNum();
         userPriv=user.getUserPriv();
         userStatusCode=user.getUserStatusCode();
      }
      
%>
   <style>
   	a{
			color: #21292d !important;
		}
   
	.testbtn {
	  border:none;
	  outline: none;
	  padding: 10px 16px;
	  cursor: pointer;
	  font-size: 18px;
	  color : #000;
	  background-color:#fff;
	  
	}
	.active{   
	  border-bottom: 5px solid #235d6e; 
	}
   
   
   .panel-heading {
       color: white !important;
       background-color: #235d6e !important;
       border-color: #ddd;
    }
   </style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Han:ok- host's place for better places</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
      <!-- 미라 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/stats.css">
   <style>
      html,body{
         font-family:Verdana, sans-serif;
         background-color:white;
      }
      
      #logo{
         width:50px;
         height:20px;
      }
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
     var user='<%=user%>';
      if(user==null){
         alert("회원만 접근할 수 있습니다");
         location.href="/acm/list";
      }
     var priv ='<%=userPriv%>';
      var userStatusCode='<%=userStatusCode%>';        
               
      if(priv!="ADMIN")$("#adminonly").css("display","none"); 
      if(userStatusCode=="ACTIVE"){
         alert("숙소등록을 한 회원만 접근할 수 있습니다");
         location.href="/acm/list";
      } else if(userStatusCode=="HO_PENDING"){
         $("#hostonly").css("display","none"); 
     }
   });
   </script>
<body>

    <div id="wrapper">

        <!-- Navigation -->

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:20px;margin-bottom:0;background-color:white;">

            <div class="navbar-header" style="margin-bottom:15px;">     
            <!-- 로고자리 -->
                <a class="navbar-brand" href="/hosting/hostindex">Han:Ok for Host</a>
            </div>
            <!-- /.navbar-header -->

         <!-- 왼쪽 nav -->
        <ul class="nav navbar-top-links navbar-left" id="hostonly">
            <li class="nav-menu">
               <a href="/hosting/reserv">예약</a><!-- 예약관리 -->
            </li>
            <li class="nav-menu">
               <a href="/hosting/listings">숙소</a>
            </li>
            <li class="nav-menu">
               <a href="/chat/chatList2">메시지</a>
            </li>
            <li class="nav-menu">
               <a href="/hosting/stats/statsChart" class="active">매출관리</a>
            </li>
         </ul>
         
         <!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="nav-menu">
             	  <a id="adminonly" href='/admin/adminindex'>관리자 모드 보기</a>
            	</li>
                 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                           <c:out value="${userFstname}"/>님 환영합니다!<i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                  
                        <li>
                            <a href="#">
                                <div>
                      		                 커뮤니티 센터
                                </div>
                            </a>
                        </li>
                       
                        <li class="divider"></li>
                        <li>
                            <a href="/acm/list">
                                <div>
                                       Han:ok 메인페이지로
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href='/user/logout'>
                                <div>
                     		                  로그아웃
                                </div>
                            </a>
                        </li>
                     </ul>
                     
                     </li>
                     </ul>
                     
        </nav>
</div>


<div class='contaner'>

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/hosting/stats/statsChart"><i class="fa fa-camera fa-fw"></i> 한눈에 보기</a>
				</li>
				<li>
					<a href="/hosting/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 내숙소 랭킹</a>
				</li>
				<li>
					<a href="/hosting/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
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
				<h3>내 숙소 순위</h3>
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
  	   url: '/hosting/stats/change2',
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