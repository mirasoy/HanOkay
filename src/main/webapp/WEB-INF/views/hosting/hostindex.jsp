<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	a{
		color: #21292d !important;
		}
		
	#rsvSum > div{
		display:inline-block;
		padding-left:70px;
		padding-right:70px;
		
	}
	
	.well{
		background-color:white !important; 
	
	}
</style>

<%@include file="../includes/hostheader.jsp"%>
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;background-color: #f5f5f5;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
		 <h1><c:out value="${userFstname}"/> 호스트님 안녕하세요!</h1>
		<br>	

 <!-- /.row -->
            <div class="row">
                
                <!-- /.col-lg-4 -->
                <div class="col-lg-10">
                    <div class="well well-lg" style="height: 200px;">
                    	<div align="center">
	                        <h5 style="color:blue;">Today</h5>
	                        <h3 style="margin-top:0px;margin-bottom:20px;">2020.8.5(수)</h3>
	                        <div id="rsvSum">
	                        <div>
	                        	<div style="font-size:30px;">17</div>
                    			<span>입금대기</span>
                    		</div>
	                        <div >
	                        	<div style="font-size:30px;">3</div>
                    			<span>예약완료</span>
                    		</div>
                    		 <div >
	                        	<div style="font-size:30px;">0</div>
                    			<span>예약취소</span>
                    		</div>
                    		</div>
                    	</div>
                    </div>
                </div>
              	<div class="col-lg-2">
                    <div class="well well-lg" style="height: 200px;">
                    	<div align="center">
	                       
	                        <p>여기 날씨를 넣을거얌</p>
                    	</div>
                    </div>
                </div> <!-- /.col-lg-2 -->
               
                
                
                  <div class="col-lg-6">
                    <div class="well well-lg" style="height: 200px;">
                    	오늘 입실
                    	
                    </div>
                </div><!-- /.col-lg-6 -->
                
                  <div class="col-lg-6">
                    <div class="well well-lg" style="height: 200px;">
						오늘 퇴실
                    </div>
                </div><!-- /.col-lg-6 -->
                
            </div>
            <!-- /.row -->

		</div>
	</div>

<%@include file="../includes/footer.jsp"%>
