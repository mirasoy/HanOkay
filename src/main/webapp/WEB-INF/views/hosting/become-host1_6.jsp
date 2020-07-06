<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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

		<!-- 기억하기가 되면 좋겠다  중간저장?-->
			<br><br>
			  <h4>1.숙소에서 공통적으로 제공하는 옵션</h4><br>
			  
			  <h4>1-1.시설 옵션</h4>
			  	<input type="checkbox" id="AC_OPT_SW" name="AC_OPT_SW"><label for="AC_OPT_SW">수영장</label>
			   <input type="checkbox" id="AC_OPT_PK" name="AC_OPT_PK"><label for="AC_OPT_PK">주차장</label>
			   <input type="checkbox" id="AC_OPT_PU" name="AC_OPT_PU"><label for="AC_OPT_PU">공항 등 교통편 서비스</label>
			   <input type="checkbox" id="AC_OPT_GM" name="AC_OPT_GM"><label for="AC_OPT_GM">체육관/피트니스</label>
			   <input type="checkbox" id="AC_OPT_FD" name="AC_OPT_FD"><label for="AC_OPT_FD">24시간 프런트 데스크</label>
			   <input type="checkbox" id="AC_OPT_FA" name="AC_OPT_FA"><label for="AC_OPT_FA">가족/아동 여행객 친화형 시설</label>
			   <input type="checkbox" id="AC_OPT_NS" name="AC_OPT_NS"><label for="AC_OPT_NS">금연</label>
			   <input type="checkbox" id="AC_OPT_SP" name="AC_OPT_SP"><label for="AC_OPT_SP">스파/사우나</label><br>
			   <input type="checkbox" id="AC_OPT_RT" name="AC_OPT_RT"><label for="AC_OPT_RT"> 레스토랑</label>
			   <input type="checkbox" id="AC_OPT_SA" name="AC_OPT_SA"><label for="AC_OPT_SA"> 흡연구역</label>
			   <input type="checkbox" id="AC_OPT_WP" name="AC_OPT_WP"><label for="AC_OPT_WP">반려동물 동반 가능</label>
			   <input type="checkbox" id="AC_OPT_AD" name="AC_OPT_AD"><label for="AC_OPT_AD">장애인용 편의시설/서비스</label>
			   <input type="checkbox" id="AC_OPT_VC" name="AC_OPT_VC"><label for="AC_OPT_VC">비즈니스 관련 편의 시설</label>
			   <input type="checkbox" id="AC_OPT_GP" name="AC_OPT_GP"><label for="AC_OPT_GP">골프장</label>
			   <input type="checkbox" id="AC_OPT_WF" name="AC_OPT_WF"><label for="AC_OPT_WF">인터넷</label>
			   
				<br><br>
							  
			  <h4>1-2.식사 옵션</h4>
			   <input type="checkbox" id="AC_OPT_BF" name="AC_OPT_BF"><label for="AC_OPT_BF">조식</label>
			   <input type="checkbox" id="AC_OPT_LC" name="AC_OPT_LC"><label for="AC_OPT_LC">중식</label>
			   <input type="checkbox" id="AC_OPT_DN" name="AC_OPT_DN"><label for="AC_OPT_DN">석식</label>
			   
			  
			
			  
			  <!-- 방에대한 사진(각각 할것인가), 아님 모아서 받을것인가 선택해야함 -->
			  <!-- 게스트 설정: 숙소 이용규칙, 게스트 필수조건 검토 -->
			  <!-- 체크인을 위한 최소한의 일자, 체크인 가능시간 설정, 최대 최소 숙박일수 설정-->
			  <!-- 달력으로 예약 가능 날짜, 예약받지 않는날 설정하기 -->
			  <!-- 요금설정 -->
			  
			  
			  <!-- 총 검토 -->
			  <br>
			</form>
		</div>


<%@include file="../includes/footer.jsp"%>
<script>
	
</script>