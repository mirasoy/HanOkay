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
		 <h3><c:out value="${userFstname}"/> 호스트님의 숙소, 객실별 모아보기</h3>

	      <select class="form-control" style="width:160px;display:inline-block;" name="ACM_NUM" id="ACM_NUM" onchange="categChange(this)">
	        <option>숙소 선택</option>
	        
	     </select>
	
	      <select class="form-control" style="width:160px;display:inline-block;" name="ROM_NUM" id="ROM_NUM" onchange="selectRom(this)">
	        <option>객실 선택</option>
	     </select>
	
		<div id="content">
		    <div>
				<!-- /top -->
				<div class="space">
				    <span id="start">${todays}</span> <a href="#" onclick="picker.show(); return false;">월별로 찾기</a>
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

    
    var dp = new DayPilot.Month("dp");

    // view
    dp.startDate = "2020-08-01";  // or just dp.startDate = "2013-03-25";

    // generate and load events
    // for (var i = 0; i < 10; i++) {
        var duration = Math.floor(Math.random() * 1.2);
        var start = Math.floor(Math.random() * 6) - 3; // -3 to 3

        /*var e = new DayPilot.Event({
            start: new DayPilot.Date("2020-08-04T00:00:00"),
            end: new DayPilot.Date("2020-08-15T12:00:00"),
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
    dp.init();

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
	function categChange(e){
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
	      		   
	      		  // $("#ROM_NUM").empty();
	      		   
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
	}
	
	function selectRom(e){
		alert("객실 선택!"+e.value);
	}


</script>	
	
	
	
	
	
	
	
	
	
<%@include file="../includes/footer.jsp"%>
