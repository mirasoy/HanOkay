<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
	.room{
		float:left;
		width:350px;
		height:250px;
	}
	
	.exp{
		font-size:8px;
	}
</style>

<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                           <a>user님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        
                        <li>
                            <a href="/hosting/become-host"><i class="fa fa- fa-fw"></i> 시작하기</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host1_6"><i class="fa fa-gear fa-fw"></i> 숙소 정보</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host2_6"><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host3_6"><i class="fa fa-map fa-fw"></i> 숙소 설명</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host4_6"><i class="fa fa-male fa-fw"></i> 게스트 설정</a>
                            
                        </li>
                        <li>
                            <a href="/hosting/become-host5_6"><i class="fa fa-calendar fa-fw"></i> 달력 및 예약 가능여부</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host6_6"><i class="fa fa-credit-card fa-fw"></i> 요금</a>
                            
                        </li>
                        <li>
                            <a href="/hosting/become-host-complete"><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">
			<br>	
			 <!-- 숙소설명 -->
			 <form action="/hosting/become-host6_6" method="post">
			 	<h4>5-1. 체크인까지 최소한 어느 정도의 시간 여유가 있어야 하나요?</h4>
			 	<div class="exp">팁: 늦어도 2일 전까지만 예약할 수 있도록 설정하면 호스팅 준비 시간을 확보할 수 있지만, 막바지 예약은 놓칠수있습니다.<br> 
			 	숙소와 주변 지역에 대한 정보에서 시작해 게스트와 어떻게 소통하고 싶은지 등의 내용을 적어주세요 </div>
			 	<input type="radio" id="today" name="chkinPeriod" >
				<label for="today">당일</label><br>
				<input type="radio" id="onebefore" name="chkinPeriod">
				<label for="onebefore">1일</label><br>
				<input type="radio" id="twobefore" name="chkinPeriod">
				<label for="twobefore">2일</label><br>
				<input type="radio" id="threebefore" name="chkinPeriod">
				<label for="threebefore">3일</label><br>
				<input type="radio" id="weekbefore" name="chkinPeriod">
				<label for="weekbefore">7일</label><br>
				
				<br>
				
				<h4>5-2. 얼마나 먼 날짜까지 예약할수있나요?</h4>
			 	<div class="exp">팁: 호스팅할 수 있는 날짜만 예약 가능하도록 설정하면 예약을 취소하거나 예약 요청을 거절할 필요가 없습니다 </div>
			 	<input type="radio" id="always" name="rsvPeriod" >
				<label for="always">항상</label><br>
				<input type="radio" id="3month" name="rsvPeriod">
				<label for="3month">3개월 전</label><br>
				<input type="radio" id="6month" name="rsvPeriod">
				<label for="6month">6개월 전</label><br>
				<input type="radio" id="9month" name="rsvPeriod">
				<label for="9month">9개월 전</label><br>
				<input type="radio" id="yearbefore" name="rsvPeriod">
				<label for="yearbefore">1년</label><br>
			
				<br>
				
				<h4>5-3. 게스트가 얼마동안 숙박할 수 있나요?</h4>
			 	<div class="exp">팁: 숙박 기간이 짧으면 예약을 더 많이 받을 수 있지만, 그만큼 예약을 자주 받아야합니다 </div>
			 	<label for="minrsv">최소</label><input type="text" id="minrsv" name="minrsv" size="5" placeholder="1">박<br>
			  	<label for="maxrsv">최대</label><input type="text" id="maxrsv" name="maxrsv" size="5" placeholder="2">박<br>
			  	
			  	
			  	<br>
			  	<button type="submit">다음으로</button>
			 </form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
