<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<style>
		a{
			color: #21292d !important;
		}
	</style>	

	<%@include file="../../includes/hostheader.jsp"%>
 	<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type='text/javascript'>
     google.charts.load('current', {
       'packages': ['geochart'],
       // Note: you will need to get a mapsApiKey for your project.
       // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
       'mapsApiKey': 'AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo'
     });
     google.charts.setOnLoadCallback(drawMarkersMap);

      function drawMarkersMap() {
      var data = google.visualization.arrayToDataTable([
        ['City',   'Population', 'Area'],
        ['Seoul',      2761477,    1285.31],
        ['Busan',     1324110,    181.76],
        ['Daegu',     907563,     130.17],
        ['Incheon',    959574,     117.27],
        ['Daejeon',   655875,     158.9],
        ['Gwangju',     607906,     243.60],
        ['Ulsan',  371282,     102.41],
        ['Sejong',   380181,     140.7],
        ['Gyeonggi', 67370,      213.44],
        ['Gangwon',     52192,      43.43],
        ['North Chungcheong',  38262,      243.60],
        ['South Chungcheong',  38262,      243.60],
        ['North Jeolla',  38262,      243.60],
        ['South Jeolla',  38262,      243.60],
        ['North Gyeongsang',  38262,      243.60],
        ['South Gyeongsang',  38262,      243.60],
        ['Jeju',  38262,      243.60]
        
      ]);

      var options = {
        region: 'KR',
        displayMode: 'markers',
        colorAxis: {colors: ['green', 'blue']}
      };

      var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    };
    </script>




	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/admin/stats/mapChart"><i class="fa fa-camera fa-fw"></i> 숙소 한눈에 보기</a>
				</li>
				<li>
					<a href="/admin/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 내숙소 랭킹</a>
				</li>
				<li>
					<a href="/admin/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
				</li>
				
			</ul>

		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- nav-end -->
	<div id="page-wrapper" style="padding-bottom:50px; margin-left: 0px;">
		<div style="margin-left:15%;margin-right:15%;">    
		
		 <div id="chart_div" style="width: 700px; height: 700px;"></div>	
		
		
		
		</div>
	</div>	
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<script type="text/javascript">

</script>