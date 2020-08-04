<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/png"  href="resources/images/svnicon.png"/> <!-- favicon fix -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> 
	
	<title>Chatting page</title>
</head>
<body>
	<h1>Chatting Page (id: ${Userid})</h1>
	<div>
		<input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
	</div>
	<br>
	<div>
		<div>
			<input type="text" id="message"/>
    		<input type="button" id="sendBtn" value="전송"/>
    	</div>
    	<br>
    	<div class="well" id="chatdata">
    		<!-- User Session Info Hidden -->
    		<input type="hidden" value='${Userid}' id="sessionuserid">
    	</div>
	</div>
</body>

<script type="text/javascript">


//websocket을 지정한 URL로 연결
var sock= new SockJS("<c:url value="/echo"/>");

//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;

//websocket 과 연결을 끊고 싶을때 실행하는 메소드
sock.onclose = onClose;

$(function(){
	$("#sendBtn").click(function(){
		console.log('send message...');
        sendMessage();
    });
});
        
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
  	sock.send($('#sessionuserid').val()+'|'+$("#message").val());     
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	//문자열을 splite//
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id: ' + currentuser_session);
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	if(sessionid == currentuser_session){
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-info'>";
		printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	} else{
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-warning'>";
		printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	}
	
	console.log('chatting data: ' + data);
	
  	/* sock.close(); */
}
    
function onClose(evt){
	$("#data").append("연결 끊김");
}    
</script>
</html>