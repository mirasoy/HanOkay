<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<link rel="icon" type="image/png" href="resources/images/svnicon.png" /> <!-- favicon fix -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- Zebra-Dialog CDN
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

	<title>Chatting page</title>
	<style>
		.chat {
			background-color: darkgrey;
			padding-bottom: 2%;

		}

		.chatPan-head {
			text-align: center;
		}

		.cchatPan-body {
			padding: 20%;
			background-color: dimgray;
		}

		.chat-room {
			margin: 20px 20px 20px 20px;
			background-color: floralwhite;
			height: 70px;
		}

		.photoZone {
			display: inline-grid;
			height: 40px;
			width: 40px;
			background-color: lightblue;
			border-radius: 50%;
			margin: 0.6%;
			text-align: center;
			overflow: hidden;
		}

		.photoZone img {
			height: 40px;
		}

		.chat-text-cen {
			display: inline-block;
			height: 40px;
			margin-left: 2%;
			;
		}
	</style>
</head>

<body>

	<div class="contaner">
		<div class="chat">
			<div class="chatPan-head">
				<h3>나의 대화 목록</h3>
			</div>
			<a href="/chat/chattingView?toID=serin@naver.com">
				<div class="chatPan-body">
					<div class="chat-room">
						<div class="photoZone">
							<img src="https://t1.daumcdn.net/cfile/tistory/21340A3650ED95850C" alt="">
						</div>
						<div class="chat-text-cen">
							<div class="chat-id">
								상대방 id
							</div>
							<div class="chat-content">
								최근대화가 여기에 뿌려진다.
							</div>
						</div>
					</div>
				</div>
			</a>

		</div>
	</div>

</body>

<script type="text/javascript">



	$(".chat-room").on("click", function () {

	})



</script>

</html>