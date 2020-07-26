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
	<style>
		html,body{
			font-family:"타이포_쌍문동";
		}
		
		
		#logo{
			width:50px;
			height:20px;
		}
	</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> -->
                
                
				<!-- 로고자리 -->
                <a class="navbar-brand" href="/hosting/hostindex">Han:Ok</a>
            </div>
            <!-- /.navbar-header -->

			<!-- 왼쪽 nav -->
            <ul class="nav navbar-top-links navbar-left">
				<li class="nav-menu">
					<a href="/hosting/reserv">예약</a><!-- 예약관리 -->
				</li>
				<li class="nav-menu">
					<a href="/hosting/listings">숙소</a>
				</li>
				<li class="nav-menu">
					<a href="/hosting/inbox">메시지</a>
				</li>
				<li class="nav-menu">
					<a href="/hosting/progress/reviews">성취도</a>
				</li>
				<li class="nav-menu">
					<a href="/hosting/help">도움말</a>
				</li>
			</ul>
			
			
			<!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
           		
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        	<c:out value="${userFstname}"/>님 환영합니다!<i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="/memmode/profile">
                                <div>
                                    	프로필
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="/memmode/account">
                                <div>
                                    	계정
                                </div>
                            </a>
                        </li>
                        
                        <li class="divider"></li>
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
                            <a href="#">
                                <div>
                                    	로그아웃
                                </div>
                            </a>
                        </li>
                     </ul>
        </nav>

        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
	  var priv ='<%=userPriv%>';
      var userStatusCode='<%=userStatusCode%>';        
               
   
   
   
   });
</script>












