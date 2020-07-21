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
	//userNum = "U1";
	//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
	if (user != null) {
		userLastName = user.getUserLastName();
		userFstName = user.getUserFstName();
		userPwd = user.getUserPwd();
		userNum = user.getUserNum();
	}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ana - Make yourself at home in Korea</title>


<!-- load stylesheets -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet"
	href="${request.contextPath}/resources/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${request.contextPath}/resources/css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/slick/slick-theme.css" />
<link rel="stylesheet" href="${request.contextPath}/resources/css/templatemo-style.css">
<link rel="stylesheet" href="${request.contextPath}/resources/css/review.css">

<!-- 메인 CSS style -->

<!-- load JS files -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery (https://jquery.com/download/) -->
<script src="${request.contextPath}/resources/js/popper.min.js"></script>
<!-- https://popper.js.org/ -->
<script src="${request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="${request.contextPath}/resources/js/datepicker.min.js"></script>
<!-- https://github.com/qodesmith/datepicker -->
<script src="${request.contextPath}/resources/js/jquery.singlePageNav.min.js"></script>
<!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
<script src="${request.contextPath}/resources/slick/slick.min.js"></script>
<!-- http://kenwheeler.github.io/slick/ -->
<script src="${request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
<!-- https://github.com/flesler/jquery.scrollTo -->

<script src="${request.contextPath}/resources/js/index.js"></script>


<!-- 달력 변경(수희) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="${request.contextPath}/resources/js/select2.js"></script>
<link href="${request.contextPath}/resources/css/select2.css" rel="stylesheet">


<script type="text/javascript">
	$(document)
			.ready(
					
					function() {
						//만약 user에 해당하는 세션이 없으면 
						
					if (
						<%=user == null%>
						) {
							// $("#loginout").append("<a href='/user/login'>로그인</a>");
							//알림 드랍 다운 내부 텍스트를 모두 지우고
							$('#notification').empty();
							//회원 가입하라고 메세지 주기
							//드랍 다운 상자를 responsive로 변경하면 좋겠다
							$('#notification')
									.append(
											"<li><a href='#'>ana의 회원이 되셔서 <br>더 많은 혜택을 누려보세요!</a></li>");
							//내 메뉴 드랍다운 상자는 없애버리고 클릭하면 로그인 사이트로 이동하게 하자
							$('#myMenuIcon').removeAttr("data-toggle");
							$('#myMenuIcon').attr("href", "/user/login");
						} else {
							$("#loginout").append(
									"<a href='/user/logout'>로그아웃</a>")
						}
						;
						
					});
</script>

</head>

<!-- 뒤로가기 방지 -->
<!-- 

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack(); onunload="">"
 -->

<body>

	<!-- main-content -->
	<div class="main-content" id="top">

		<div class="top-bar-bg"></div>

		<!-- Start : top-bar - 메인 네비게이션 바 : 동적 active 적용 -->
		<div class="top-bar" id="top-bar">
			<!-- Start : container-->
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-lg">
						<!-- Start : Main Logo : ana의 로고 삽입-->
						<a class="navbar-brand mr-auto #top" 
							onclick="location.href='${request.contextPath}/acm/list'" style="cursor: pointer"><img
							src="${request.contextPath}/resources/img/logo.png" alt="Site logo">ANA</a>
						<!-- End : Main Logo -->

						<!-- Start : hidden button-->
						<button type="button" id="nav-toggle"
							class="navbar-toggler collapsed" data-toggle="collapse"
							data-target="#mainNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<!-- End : hidden button-->

						<!-- Start : mainNav : ana 메뉴-->
						<div id="mainNav" class="collapse navbar-collapse tm-bg-white">
							<ul class="navbar-nav ml-auto">



								<!-- Start : mainNav1 - 글러벌-->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown"
									href="#"> <i class="fa fa-globe fa-2x"></i></a>
									<ul class="dropdown-menu">
										<li><a href="#">ENGLISH(미구현)</a></li>
										<li><a href="#">KOREAN</a></li>
									</ul></li>

								<!-- Start : mainNav2 - 알림-->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown"
									href="#"> <i class="fa fa-bell fa-2x"></i></a>
									<ul class="dropdown-menu" id="notification">
										<li><a href="#">예약이 완료되었습니다</a></li>
										<li><a href="#">ana의 회원가입을 환영합니다!</a></li>

									</ul></li>

								<!-- Start : mainNav3 - 마이페이지-->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="myMenuIcon"
									data-toggle="dropdown" href="#"> <i
										class="fa fa-user fa-2x"></i></a>
									<ul class="dropdown-menu">
										<span class="header-menu">마이페이지</span>
										<li><a href="#">계정</a></li>
										<li><a onclick="location.href='/MyPage/bookListAll'"
											style="cursor: pointer">나의 예약</a></li>
										<li><a onclick="location.href='/review/list'"
											style="cursor: pointer">나의 리뷰</a></li>
										<li><a href="#">내 관심 숙소</a></li>
										<li><a onclick="location.href='/hosting/hostindex'"
											style="cursor: pointer">호스트 모드</a></li>



										<li id="header-menu"><a
											onclick="location.href='/user/login'" style="cursor: pointer"
											id="sign-out-btn" data-selenium="sign-out"
											data-element-name="sign-out-btn" color="primary">
												<div>
													<div id="loginout"></div>
												</div>
										</a></li>
									</ul></li>
							</ul>
						</div>
						<!-- End : mainNavr -->
					</nav>
					<!-- End : GNB -->
				</div>
				<!-- row -->
			</div>
			<!-- End :  container -->
		</div>
		<!-- End : top-bar - 메인 네비게이션 바 -->
	</div>