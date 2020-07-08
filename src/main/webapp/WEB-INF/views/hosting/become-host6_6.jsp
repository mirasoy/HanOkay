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
			 <form action="/hosting/become-host-complete" method="post">
			 	<h4>6-1.숙소 요금 설정하기</h4>
			 	객실별 기본요금 책정-DB연동 필요
			 	
			 	<br><br>
			 	<h4>6-2.통화 단위</h4>
			 	<select>
			 		<option>KRW 한국 원</option>
			 		<option>JPY 일본 엔</option>
			 		<option>EUR 유로</option>
			 		<option>CNY 중국 위안</option>
			 		<option>GBP 영국파운드</option>
			 		<option>USD 미국달러</option>
			 		<option>RUB 러시아 루블</option>
			 	</select>
			 	
			 	
			 	<br><br><br>
			 	<button type="submit">다음으로</button>
			 	
			 </form>
			
			 	</div>


<%@include file="../includes/footer.jsp"%>
