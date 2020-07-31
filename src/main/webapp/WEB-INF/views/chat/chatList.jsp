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
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}
.darker {
  border-color: #ccc;
  background-color: #ddd;
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
    max-height: 60%;
    min-height: 60%;
    overflow: scroll;
    overflow-x: hidden;
    font-size: 1.2em;
    position: relative;
}
.chatList a{
	color: black;
}
.chatrom{
    border-width: 0px;
    background-color: lightblue;
}
.unread{
   background-color: orange;
    width: 30px;
    height: 30px;
    border-radius: 15px;
    text-align: center;
    font-size: 1.3em;
    font-weight: 600;
    position: absolute;
    right: 20px;
    top: 91px;
    }
</style>

<div class="container">
<div class ="wrapCon">
	<h1>대화-목록</h1>
	<div >
	<div class="chatList">
	</div>
	</div>
	</div>
	</div>
	
	
</body>

<script type="text/javascript">
$(document).ready(function () {
		
		messageListLoad();
		
	$(".chatContainer").click(function(e) {
		e.currentTarget.nextSibling.submit()
	});
	
	
});

  
function messageListLoad(){  //변수 안에 function자체를 넣음.
	
	
	var str2 = "";
	
	$(".chatList").empty();
	
	<c:forEach items="${chatList }" var="chatList">
	
	
	var sysdate = '<c:out value="${chatList.udatedate }" />'; 
	var dateArr= sysdate.split(' ');
	
	
	var other ="";
	if('<%=userNum%>'=='<c:out value="${chatList.participant1 }" />'){
		other = '<c:out value="${chatList.participant2 }" />'
	}else{
		other = '<c:out value="${chatList.participant1 }" />'
	}		
	
	
		if(<c:out value="${chatList.unread }" />!=0){
			str2 += "<div class='unread'><p><c:out value="${chatList.unread }" /></p></div>"
		}
		
			str2 += "<div class='chatContainer chatrom' value='<c:out value="${chatList.chatromnum }" />'>"
			str2 += "<img src='http://www.jisadong.com/data/file/fun/3034803641_BYV8GFmL_2391224.jpeg'  class ='right' style='width:100%;'>"
			str2 += "<p><h5><c:out value="${chatList.otherUser.userFstName }" /><c:out value="${chatList.otherUser.userLastName }" /></h5></p>"
			str2 += "<p><c:out value="${chatList.lastchat }" /></p> "
			str2 += "<span class='time-left'>"+dateArr[3]+"</span></div>"
			str2 += "<form name='<c:out value="${chatList.chatromnum }" />'action='/chat/chatRoom' method='POST'>"
			str2 += "<input type='hidden' name=chatromnum value='<c:out value="${chatList.chatromnum }" />'>"
			str2 += "</form>"
	
			
	</c:forEach>
	
	$(".chatList").append(str2);
}
    
  
</script>
</html>