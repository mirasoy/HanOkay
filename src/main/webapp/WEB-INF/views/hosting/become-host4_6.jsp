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
                            <a href="/hosting/become-host_complete"><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                            
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
			 <form action="" method="post">
			 	<h4>4-1. 게스트가 지켜야할 숙소 이용규칙을 정하세요</h4>
			 	<div class="exp">게스트는 예약하기 전에 숙소 이용규칙에 동의해야합니다.</div>
			 	
			 	<div>어린이(2~12세) 숙박에 적합함 <button type="button">ok</button></div>
			 	<div>유아(2세 미만) 숙박에 적합함 <button type="button">ok</button></div>
			 	<div>행사나 파티 허용 <button type="button">ok</button></div>
			 	
			 	<br><br>
			 	
			 	<h4>추가 규칙</h4>
			 	<input type="text" class="addrules" id="op_addedrule" placeholder="조용히 해야하는 시간, 실내 신발 착용여부.."><button id="ruleadd" type="button">추가</button>
			 	
			 	<br><br>
			 	
			 	<h4>게스트가 숙소에 대해 알아두어야할 세부 사항</h4>
			 	<input type="checkbox" id="op_detail1" name="op_detail1"><label for="op_detail1">계단을 올라가야 함</label>
			  	<input type="checkbox" id="op_detail2" name="op_detail2"><label for="op_detail2">소음이 발생할 수 있음</label>
			  	<input type="checkbox" id="op_detail3" name="op_detail3"><label for="op_detail3">숙소에 반려동물 있음</label>
			  	<input type="checkbox" id="op_detail4" name="op_detail4"><label for="op_detail4">숙소에 감시 또는 녹화 장치 설치</label>
			 	
			 	<br><br>
			 	
			 	<h4>4-2. 체크인/ 체크아웃</h4>
			 	<label for="checkin">체크인 가능시간</label><input type="text" id="checkin" name="chekin" placeholder="3시이후"><br>
			  	<label for="checkout">체크아웃 시간</label><input type="text" id="checkout" name="chekout" placeholder="12시이전"><br>
			  	
			 	
			 
			 </form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
