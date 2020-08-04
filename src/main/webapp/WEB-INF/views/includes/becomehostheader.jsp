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



<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	html, body {
		font-family: Verdana, sans-serif;
		background-color: white;
	}
	
	img {
		position: absolute;
		left: 20px;
		width: 200px;
		height: 160px;
	}
	
	.uploadResult {
		width: 100%;
		background-color: white;
		margin-top: 10px;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
	}
	
	.uploadResult ul li img {
		width: 150px;
		position: static;
	}
	
	.panel-heading {
		color: #333;
		background-color: #D2AC70 !important;
		border-color: #ddd;
	}
	.containerMR{
		margin-left: 100px;
	}
	

</style>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:15px;margin-bottom:0;background-color:white;">
            <div class="navbar-header" style="margin-bottom:5px;">     
		      
				<!-- 로고자리 -->
                <a class="navbar-brand" href="/hosting/hostindex" >Han:Ok for Host</a>
               
                 
            </div>
            <!-- /.navbar-header -->

			
			
			
			<!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
           		
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                        	<div id="who"><c:out value="${userFstname}"/>님 환영합니다!<i class="fa fa-caret-down"></i></div>

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
                            <a href='/user/logout'>
                                <div>
                                    	로그아웃
                                </div>
                            </a>
                        </li>
                     </ul>
        </nav>

</div>

        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {

		var pathname= window.location.pathname;
		
	   	if(pathname=="/hosting/become-host2_6pop"){
	   		$("#who").css("display","none"); 
	   		//$("#who").append("<button type='button' onclick='if(readyForreg()){romRegit()}'>객실 등록</button>");
	   	}

   });
</script>












