<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
 	<!-- demo stylesheet -->
    	<link type="text/css" rel="stylesheet" href="/resources/calendar/helpers/demo.css?v=2018.2.232" />    
        <link type="text/css" rel="stylesheet" href="/resources/calendar/helpers/media/layout.css?v=2018.2.232" />    
        <link type="text/css" rel="stylesheet" href="/resources/calendar/helpers/media/elements.css?v=2018.2.232" />   

	<!-- helper libraries -->
	<script src="/resources/calendar/helpers/jquery-1.9.1.min.js" type="text/javascript"></script>
    
	<!-- daypilot libraries -->
        <script src="/resources/calendar/js/daypilot-all.min.js?v=2018.2.232" type="text/javascript"></script>

        <!-- daypilot themes -->
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/month_white.css?v=2018.2.232" />
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/month_green.css?v=2018.2.232" />    
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/month_transparent.css?v=2018.2.232" />    
        
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/calendar_transparent.css?v=2018.2.232" />    
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/calendar_white.css?v=2018.2.232" />    
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/calendar_green.css?v=2018.2.232" />    

	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/navigator_green.css?v=2018.2.232" />    
	<link type="text/css" rel="stylesheet" href="/resources/calendar/themes/navigator_white.css?v=2018.2.232" />    





<style>
	a{
		color: #21292d !important;
	}
</style>
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<br>		
		<!-- 중앙정렬 -->
		<div style="margin-left:15%;margin-right:15%;">		
		 <h3><c:out value="${userFstname}"/> 호스트님의 숙소별 모아보기</h3>

	      <select class="form-control" style="width:160px;display:inline-block;" name="ACM_NUM" id="ACM_NUM" onchange="categChange(this)">
	        <option>숙소 선택</option>
	        
	     </select>
	
	     <!--  <select class="form-control" style="width:160px;display:inline-block;" name="ROM_NUM" id="ROM_NUM" onchange="selectRom(this)">
	        <option>객실 선택</option>
	     </select> -->
	
		<div id="content">
		    <div>
				<!-- /top -->
				<div class="space">
				    <span id="start" style="font-size:20px;">${todays}</span> <a href="#" onclick="picker.show(); return false;">달력에서 선택</a>
				</div>
			</div>
		</div>
		<div id="dp"></div>
		
		
		</div><!-- 중앙정렬 -->
	</div><!-- page wrapper -->
	
	
	
<script type="text/javascript">
    var picker = new DayPilot.DatePicker({
        target: 'start', 
        pattern: 'yyyy-MM-dd', 
        onTimeRangeSelected: function(args) { 
            dp.startDate = args.start;
            dp.update();
        }
    });

    
    // behavior and appearance 기본셋팅값
    var dp = new DayPilot.Month("dp");
    dp.theme = "month_green";
   
    
    
    
    var today=document.getElementById("start").innerText;
	//alert("오늘:"+today);
    // view
    dp.startDate = today;  // or just dp.startDate = "2013-03-25";

    // generate and load events
    // for (var i = 0; i < 10; i++) {
        var duration = Math.floor(Math.random() * 1.2);
        var start = Math.floor(Math.random() * 6) - 3; // -3 to 3
	    dp.init();

        /*var e = new DayPilot.Event({
            start: new DayPilot.Date("2020-08-04"),
            end: new DayPilot.Date("2020-08-15"),
            id: DayPilot.guid(),
            text: "dd " 
        });
        dp.events.add(e);
        
        var e = new DayPilot.Event({
            start: new DayPilot.Date("2020-08-09T00:00:00"),
            end: new DayPilot.Date("2020-08-15T12:00:00"),
            id: DayPilot.guid(),
            text: "ddddd " 
        });
        dp.events.add(e);
    }
    */

    // event creating 이벤트 생성은 막겠따
    
   /* dp.onTimeRangeSelected = function (args) {
        var name = prompt("New event name:", "Event");
        dp.clearSelection();
        if (!name) return;
        var e = new DayPilot.Event({
            start: args.start,
            end: args.end,
            id: DayPilot.guid(),
            text: name
        });
        dp.events.add(e);
    };
    
	    dp.onEventClicked = function(args) {
        alert("clicked: " + args.e.id());
    };
    */
    

	$(document).ready(function() {
	    var url = window.location.href;
	    var filename = url.substring(url.lastIndexOf('/')+1);
	    if (filename === "") filename = "index.html";
	    $(".menu a[href='" + filename + "']").addClass("selected");


	});
	        
	$(document).ready(function(){
		var acmSelect=document.getElementById("ACM_NUM");
		
		//회원(호스트)에 대한 숙소 깔아주기
		<c:forEach items="${acms}" var="acms">
		 	var opt = document.createElement("option");
			opt.value="${acms.acmNum}";
		 	opt.innerHTML="${acms.acmName}";
		 	acmSelect.appendChild(opt);
		</c:forEach>
		
	});

	//숙소가 선택되면 일어나는 이벤트
	/*function categChange(e){
		//선택되면 객실 option 다 비워주기
		$("select#ROM_NUM option").remove();
		//alert(e.value);//숙소 번호나옴
		
		//객체에 property추가
		var obj= new Object();
		obj.romNum="romNum";
		obj.romName="romName";
		
		var jsonData = JSON.stringify(obj);
		var acmNum=e.value;
		   $.ajax({
	      	   type: 'POST',
	      	   url: '/hosting/returnRoms',
	      	   dataType: 'json',
	      	   data: {
	      		   'acmNum': acmNum
	      	   },
	      	   //async: false,
	      	   success: function(data){
	      		   console.log("제이슨이가지고 돌아와따:"+data);
					
	      		   var romSelect=document.getElementById("ROM_NUM");
	     			console.log("길이:"+data.length);	
	      		   for(var i=0;i<data.length;i++){
	      			   //alert(data[i]);
	      			   var splited=data[i].split('=');
	      			   
	      			   var opt = document.createElement("option");
		     		 	opt.innerHTML=splited[0];
		     			opt.value=splited[1];
		     		 	romSelect.appendChild(opt);
	      		   }
	      	   
	      	   },
	      	   error: function(data){
	      		   alert("제이슨에러!");
	      		  window.location.href ="../error/error";
	      	   }
	      	 });
	}*/
	//객실이 선택되면 예약된 정보들을 다 가져오자
	function categChange(e){
		var acmNum=e.value;
		//초기화인가..
		 dp = new DayPilot.Month("dp");
		 dp.theme = "month_green";
		 
		 
		 
		var obj= new Object();
		obj.romNum="romNum";
		obj.romName="romName";
		obj.checkinDate="checkinDate";
		obj.checkoutDate="checkoutDate";
		obj.bookNum="bookNum";
		obj.bookerFirstname="bookerFirstname";
		obj.bookPrice="bookPrice";	
		
		obj.userNum="userNum";		
		obj.bookerFirstname="bookerFirstname";		
		
		var jsonData = JSON.stringify(obj);
		
		 
		$.ajax({
	      	   type: 'POST',
	      	   url: '/hosting/returnRsrvs',
	      	   dataType: 'json',
	      	   data: {
	      		   'acmNum': acmNum
	      	   },
	      	   //async: false,
	      	   success: function(data){
	      		   console.log("제이슨예약정보를 가지고 돌아와따:"+data);//개많을거임
					
	     			console.log("길이:"+data.length);	
	      		   for(var i=0;i<data.length;i++){
	      			   //alert(data[i]);
	      			   var splited=data[i].split('=');
	      			   
	      			   var chkinDate=splited[0];
	      			   console.log("변환전:"+chkinDate);
	      			   chkinDate = getFormatDate(chkinDate);
	      			   console.log("변환되어 받음:"+chkinDate);
	      			   
	      			   var chkoutDate=splited[1];
	      			   console.log("변환전:"+chkoutDate);
	      			   chkoutDate = getFormatDate(chkoutDate);
	      			   console.log("변환되어 받음:"+chkoutDate);
	      			   
	      			   
	      			   var bookNum=splited[2];
	      			   var userNum=splited[3];
	      			   var bookerFirstname=splited[4];
	      			   var bookPrice=splited[5];
	      			   var romNum=splited[6];
	      			   var romName=splited[7];
	      			   
	      			   
	      			   
	      			    console.log(chkinDate);
	      			 	console.log(chkoutDate);
		      			console.log(userNum);
		      			console.log(bookerFirstname);
		      			console.log(bookPrice);
	      			   	
		      			var note="["+bookNum+"]"+romName+"/"+userNum+"_"+bookerFirstname+"/"+bookPrice+"원";
		      			
	      			 var e = new DayPilot.Event({
	      	            start: new DayPilot.Date(chkinDate),
	      	            end: new DayPilot.Date(chkoutDate),
	      	            id: DayPilot.guid(),
	      	            text: note
	      	        });
	      			dp.clearSelection();
	      			 dp.events.add(e);
	      		   
	      		   }
	      		 	
	      		   dp.init();
	      	   },
	      	   error: function(data){
	      		   alert("제이슨에러!");
	      		  window.location.href ="../error/error";
	      	   }
	      	 });
		
	
	}
	
	
	function getFormatDate(date){
		//Sun Nov 22 00:00:00 KST 2020 의 형식으로 옴..
		
		var year=date.substring(date.length-4);
	    var month = date.substring(4,7);
	    if(month=="Jan")month="01";
	    else if(month=="Feb")month="02";
	    else if(month=="Mar")month="03";
	    else if(month=="Apr")month="04";
	    else if(month=="May")month="05";
	    else if(month=="Jun")month="06";
	    else if(month=="Jul")month="07";
	    else if(month=="Aug")month="08";
	    else if(month=="Sep")month="09";
	    else if(month=="Oct")month="10";
	    else if(month=="Nov")month="11";
	    else if(month=="Dec")month="12";
	    
	    var day=date.substring(8,10);
	    
	    
	    var date=year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	    console.log("변환:"+date);
	    return date;        
	}

</script>	
	
	
	
	
	
	
	
	
	
<%@include file="../includes/footer.jsp"%>
