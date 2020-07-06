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
			 	<h4>3-1. 게스트에게 숙소에 대해 설명해주세요</h4>
			 	<div class="exp">숙소에 대해 간략히 설명해 주세요.<br> 
			 	숙소와 주변 지역에 대한 정보에서 시작해 게스트와 어떻게 소통하고 싶은지 등의 내용을 적어주세요 </div>
			 	<textarea id="exp3_1" cols="25" rows="5"></textarea>
			 	
			 	<br><br>
			 	
			 	<h4>3-2.숙소가 위치한 지역 (선택사항)</h4>
			 	<div class="exp">주변 환경이 어떤지 게스트에게 알려주세요.<br> 
			 	자주가는 커피숍, 공원, 독특한 명소 등 동네를 특별하게 만드는 장소를 소개하세요 </div>
			 	<textarea id="exp3_2" cols="25" rows="5"></textarea>
			 	
			 	<br><br>
			 	
			 	<h4>3-3.교통편 (선택사항)</h4>
			 	<div class="exp">근처의 대중교통 수단, 운전 정보, 편리한 도보 경로 등 <br> 도시와 동네를 돌아다니는 방법을 알려주세요</div>
			 	<textarea id="exp3_3" cols="25" rows="5"></textarea>
			 	
			 
			 </form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
