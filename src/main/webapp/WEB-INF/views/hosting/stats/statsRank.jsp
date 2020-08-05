<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../../includes/hostheader.jsp"%>
<div class='contaner'>

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/hosting/stats/statsChart"><i class="fa fa-camera fa-fw"></i> 한눈에 보기</a>
				</li>
				<li>
					<a href="/hosting/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 내숙소 랭킹</a>
				</li>
				<li>
					<a href="/hosting/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
				</li>
				
			</ul>

		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- nav-end -->
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<div class=" containerMR">
			<br>
			<div style="margin-left:15%;margin-right:15%;">
				<h3>내 숙소 순위</h3>
				<div id="optChoice">
					<button class="btn opt"  onclick="$('#criteria').val('sumt');sendoption(); ">매출순</button>
					<button class="btn opt"  onclick="$('#criteria').val('stisf');sendoption();">별점순</button>
					<input type="hidden" id="criteria">
				</div>
				<div class = "containBody">
					<table class="table table-striped table-bordered table-hover salesList ">
						<thead>
							<tr class='fixed_top'>
								<th style="width: 10%">순위</th>
								<th style="width: 50%">숙소이름</th>
								<th style="width: 10%">평점</th>
								<th style="width: 30%">총 결제금액</th>
							</tr>
						</thead>
					</table>
					<div class="tableArea" id="acm">
						<table class="table table-striped table-bordered table-hover salesList" id="salesList">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../../includes/footer.jsp"%>
<script src="/resources/js/datepicker.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	sendoption();

})



function sendoption(){   
	
	var criteria;
	
	if($('#criteria').val()==""){
		criteria = 'sumt'
	}else{
		criteria=$('#criteria').val();
	}
	
	
	 $.ajax({
  	   type: 'POST',
  	   url: '/hosting/stats/change2',
  	  data:{
  		  "criteria" : criteria
  	   },
  	   dataType: 'json',
  	   success: function(result){
  		   console.log("성공...");
  		   updateList(result);
  	   },
  	   error: function(){
  		   console.log("실패...");
  	   }
  	 });
}


function updateList(result) {
	$("#salesList").empty();
	
	var updateListstr = "";
	
	$(result).each(function (i,obj) {
		updateListstr +=("<tr><td >"+(i+1)+"</td>");
		updateListstr +=("<td>"+obj.acmName+"</td>");
		updateListstr +=("<td>"+numeral(obj.starPoint).format('0.0[0000]')+"</td>");
		updateListstr +=("<td>"+numeral(obj.sumTotal).format('0,0')+"</td></tr>");
	});
	$("#salesList").append(updateListstr);
}

</script>