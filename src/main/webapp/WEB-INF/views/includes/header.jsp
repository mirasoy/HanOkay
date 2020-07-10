<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ page import="com.ana.domain.UserVO"%>
	<% UserVO user= (UserVO)session.getAttribute("user"); 
String userLastName="";
String userFstName="";
String userPwd="";
String userNum="";
userNum = "U1";
if(user != null){
userLastName= user.getLastname();
userFstName=user.getFstname();
userPwd= user.getPwd();
userNum= user.getUserNum();
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

<title>Ana -korea homestay</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style>
body {
	background-color: #eee;
	 margin-top: 120px;
	
}




#wrapper {
	width: 100%;
	/* 전체 세로 길이를 넓게 구성 : 원페이지에서 스크롤 이동을 보고자함 */
	height: 4000px;
}

/* 하단의 컨텐츠에 여백을 주고자함  */
.row {
	margin-right: 50px;
	margin-left: 50px;
}

.content { /* 부모  */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	z-index: 1000;
	transition: all 0.2s ease-in-out;
	height: 119px;
	background: white;
}

.top_bar {
	width: 100%;
	padding-top: 28px;
	/* 중간맞춤 */
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

/* 로고 */
.navbar-logo-link {
	color: #61dafb;
	font-size: 45px;
	font-family: 'Open Sans', sans-serif;
	text-decoration: none
}

/* 메뉴 */
.navbar {
	font-weight: 700;
	width: 100%;
	padding-top: 0;
	padding-bottom: 0;
}

.navbar-logo {
	float: left;
}

.navbar-logo>a:hover {
	color: #61dafb;
	text-decoration: none
}

.navbar-top-links {
	float: right;
	/* padding-top: 20px; */
}

.navbar-top-links>li {
	margin-left: 20px;
}

.navbar-top-links>li>a {
	padding-bottom: 5px;
	border-radius: 100px;
	color: #61dafb;
}

.navbar-top-links>li>a:hover {
	text-decoration: none;
	color: #fff;
	background-color: #61dafb;
}

/* 마이페이지 드롭박스 */
.dropdown {
	padding-top: 24px;
}

.dropdown-menu {
	border-color: #61dafb;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .12);
	background: #fff;
	width: 300px;
	height: 360px;
	padding: 0;
	margin-top: 25px;
	margin-left: -22px;
}

.dropdown-menu:after {
	position: absolute;
	left: 15%;
	top: -10px;
	width: 0;
	height: 0;
	margin-left: -8px;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-bottom: 10px solid #61dafb;
	content: '';
}

.header-menu {
	color: #fff;
	background-color: #61dafb;
	width: 100%;
	padding: 14px 26px;
	height: 40px;
	text-transform: uppercase;
	font-size: 90%;
	display: block;
	font-weight: 400;
	line-height: 1.1;
}

.dropdown-menu>li {
	display: block;
	padding: 12px 5px;
	color: #333;
	line-height: 1.9rem;
	margin-bottom: 0;
}

}
.dropdown-menu>li>a:hover {
	color: #61dafb;
}

#header-menu {
	box-sizing: border-box;
	line-height: 1.43;
	width: 100%;
	display: flex;
	padding: 0 16px 30px;
}

/* 드롭박스 내 로그아웃 버튼 */
#sign-out-btn {
	position: relative;
	padding-left: 12px;
	padding-right: 12px;
	padding-top: 12px;
	padding-bottom: 12px;
	color: #61dafb;
	background-color: #fff;
	width: 100%;
	border-radius: 4px;
	border-width: 1px;
	border-style: solid;
	border-image: initial;
	border-color: #61dafb;
	transition: all 0.15s ease-in-out 0s;
	margin: 5px 15px;
}

/* 타이틀 : 나의 예약  */
.title {
	margin-top: 110px;
}

/*  RGB(97,218,251) #61dafb */
#nav {
	position: relative;
	/* height: 80px; */
	width: 320px;
	/* background-color: #eee; */
	box-shadow: 0 0 black;
	float: left;
}

#nav>.bg_sub {
	/* 서브메뉴의 전체배경 bar */
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 49px;
}

#nav>div {
	position: relative;
	background-color: #FFF;
}

#nav>div>#gnb {
	width: 800px;
	margin: 0 auto;
}

#nav>div>#gnb>li {
	float: left;
	width: 18%;
}

#nav>div>#gnb>li>a {
	display: block;
	width: 100%;
	height: 40px;
	font-size: 1.125em;
	line-height: 40px;
	text-transform: uppercase;
	text-align: center;
	background-color: #FFF;
	color: black;
	font-family: 'Open Sans', sans-serif;
}

#nav>div>#gnb>li>a:hover {
	color: #61dafb;
	text-decoration: none;
}

.btn-gnb {
	display: none;
}

@media screen and (max-width: 992px) {
	.container {
		width: 100%;
		height: 66px;
	}
	.container>.btn-gnb {
		/*반응형 메뉴버튼*/
		display: block;
		position: absolute;
		right: 7%;
		top: 45px;
		width: 100px;
		height: 40px;
		border: 0;
		outline: 0;
		background-color: #fff;
		cursor: pointer;
		border: 1px solid #61dafb;
		border-radius: 40px;
		color: #61dafb;
		font-weight: 700;
		font-family: 'Open Sans', sans-serif;
	}
	.container>.navbar>.navbar-top-links {
		display: none;
	}
}

	.bookbar{
		width: 100%;
	    height: 40px;
	    list-style: none;
	    padding: 0; 
	}
	
	.bookbar>li{
		float: left;
	    width: 110px;
	    height: 30px;
	    margin: 0;
	    text-align: center;
	    padding-top: 15px;
	}
	
	.panel-heading{
	    padding-left: 25px;
	}
	




</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
        if('<%=userNum %>'==""){
            $("#loginout").append("<a href='/user/login'>로그인</a>")
           
        }else{
            $("#loginout").append("<a href='/user/logout'>로그아웃</a>")
        	   
        };

    });
</script>


</head>

<body>
	<div id="wrapper">
		<div class="content">
			<div class="top_bar">
				<div class="container">
					<!-- 숨겨둔 햄버거메뉴 -->
					<button class="btn-gnb" type="button">
						MENU <i class="fa fa-caret-down"></i>
					</button>
					<!-- Navigation -->
					<nav class="navbar" role="navigation" style="margin-bottom: 0">
					<!-- Logo -->
					<div class="navbar-logo">
						<a class="navbar-logo-link" href="/acm/list">ANA</a>
					</div>
					<!-- navbar -->
					<ul class="navbar-top-links">
						<!-- dropdown -->

						<li class="menu1"><a href="#"> <i
								class="fa fa-globe fa-2x"></i></a></li>
						<!-- <li class="menu2"><a href="#"> <i
								class="fa fa-bell fa-2x"></i></a></li> -->

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-2x"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">저세상 숙소의 예약이 완료되었습니다</a></li>
								<li><a href="#">ana의 회원가입을 환영합니다!</a></li>

							</ul></li>


						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> <i class="fa fa-user fa-2x"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">계정</a></li>
								<li><a href="/MyPage/bookListAll">나의 예약</a></li>
								<li><a href="/review/list">나의 리뷰</a></li>
								<li><a href="#">내 관심 숙소</a></li>
								<li><a href="/hosting/hostindex">호스트 모드</a></li>

								<li id="header-menu"><a href="/user/login" id="sign-out-btn"
										data-selenium="sign-out" data-element-name="sign-out-btn"
										color="primary">
										<div>
											<div id="loginout">
												<span ></span>
											</div>
										</div>
									</a></li>
							</ul></li>
					</ul>
					</nav>
				</div>
				<!-- end of. container -->
			</div>
			<!-- end of. top_bar -->
		</div>
		<!-- end of. content -->