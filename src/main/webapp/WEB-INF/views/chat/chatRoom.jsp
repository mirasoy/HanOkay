<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>

.wrapCon{
	margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.chatContainer {
  border: 2px solid #dedede;
  background-color: #ffe6e6;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #e6f7ff;
}

.chatContainer::after {
  content: "";
  clear: both;
  display: table;
}

.chatContainer img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.chatContainer img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
#message{
	width: 90%;
    height: 40px;
}
.chatList{
     overflow: scroll;
    overflow-x: hidden;
    font-size: 1.2em;
    position: relative;
    height: 500px;
    padding: 20px;
    margin: 1%;
    border: solid 2px #ddd;
    background-color: white;
    border-radius: 2%;
}


</style>

<div class="container">
<div class ="wrapCon">
	<a href="/chat/chatList"><button class = "btn"><i class="fa fa-angle-double-left" style="font-size: 2em;" aria-hidden="true"></i></button></a>
	<b class = "right" style="font-size: 2em;">${toUser.userFstName }님과 대화중</b>
	<div> 
	<div class="chatList">
	</div>
		<div>
			<input type="text" id="message"/>
    		<input type="button" class="btn" id="sendBtn" value="전송"/>
    	</div>
    	<br>
    	<div class="well" id="chatdata">
    		<!-- User Session Info Hidden -->
    		<input type="hidden" value='${user.userEmail}' id="call">
    		<input type="hidden" value='${toUser.userEmail}' id="recive">
    		<input type="hidden" value='${user.userNum}' id="callUsernum">
    		<input type="hidden" value='${toUser.userNum}' id="reciveUsernum">
    		<input type="hidden" value='${chatromnum }' id="chatromnum">
    	</div>
		</div>
	</div>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function () {
	sendMessage();
	setInterval(() => {
		loadMessage()
	}, 500);
});

    
$("#sendBtn").click(function () {
	sendBt();
})
	function sendBt(){
	console.log('send message...');
	sendMessage();
	$("#message").val('');
}

$("#message").keypress(function (e) {
    if (e.which == 13){
    	sendBt();  // 실행할 이벤트
    }
});
        
function sendMessage(){      
	
	var msgInfo = {
			unumFrom   : $('#callUsernum').val(),
			unumTo 	   : $('#reciveUsernum').val(),
			msgContent : $("#message").val(),
			chatromnum : $("#chatromnum").val(),
  	   }
	
	
	 $.ajax({
  	   type: 'POST',
  	   url: '/chat/sendMsg',
  	   dataType: 'json',
  	   data: msgInfo,
  	   success: function(resultArr){
  		 onMessage(resultArr);
  		$(".chatList").scrollTop($(".chatList")[0].scrollHeight);
  	   },
  	   error: function(resultArr){
  		   console.log("실패...");
  	   }
  	 });
}
var newChat = 0;           
function loadMessage(){      
	

	var msgInfo = {
			unumFrom   : $('#callUsernum').val(),
			unumTo 	   : $('#reciveUsernum').val(),
			msgContent : ''
  	   }
	
	
	 $.ajax({
  	   type: 'POST',
  	   url: '/chat/sendMsg',
  	   dataType: 'json',
  	   data: msgInfo,
  	   success: function(resultArr){
  		 onMessage(resultArr);
  		if (newChat < resultArr.length){
  			$(".chatList").scrollTop($(".chatList")[0].scrollHeight);
  		}
  		newChat = resultArr.length;
  	   },
  	   error: function(resultArr){
  		 console.log("실패...");
  	   }
  	 });
}


function onMessage(resultArr){  //변수 안에 function자체를 넣음.
	
	

	
	$(".chatList").empty();
	var str = "";
	$(resultArr).each(function (i,obj) {
		str = "";
		var msgdate = new Date(obj.msgDate); // Timestamp 값을 가진 Number 타입 값을 Date 타입으로 변환
		
		var month   = msgdate.getMonth();
		var day     = msgdate.getDay();
		var hour    = msgdate.getHours();
		var minute  = msgdate.getMinutes();
		if(minute < 10){
			minute = "0"+minute;
		}
		var seconds = msgdate.getSeconds();  
		
	if(obj.unumFrom==$('#callUsernum').val()){
			str += "<div class='chatContainer darker'>"
			str += "<img src='http://www.jisadong.com/data/file/fun/3034803641_BYV8GFmL_2391224.jpeg'  class ='right' style='width:100%;'>"
			str += "<p id='"+obj.msgNum+"'>"+"</p>"
			str += "<span class='time-right'>"+month+"/"+day+" "+hour+":"+minute+"</span></div>"
	
	}else{
			str += "<div class='chatContainer '>"
			str += "<img src='http://www.jisadong.com/data/file/fun/3034803641_BYV8GFmL_2391224.jpeg' class  style='width:100%;'>"
			str += "<p id='"+obj.msgNum+"'>"+"</p>"
			str += "<span class='time-right'>"+month+"/"+day+" "+hour+":"+minute+"</span></div>"
	}
	$(".chatList").append(str);
	
	
	$("#"+obj.msgNum).text(obj.msgContent);
	
	});


	
	


	
}
    
function onClose(evt){
	$("#data").append("연결 끊김");
}    
</script>
</html>