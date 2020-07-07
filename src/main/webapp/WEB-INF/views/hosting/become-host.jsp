<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <!-- 사업자 등록도 받을것 -->
                    
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
			<h4><br><br>0-1.게스트가 묵게 될 숙소의 유형을 골라주세요(중복허용)</h4><br>
			<form action="/become-host1_6.php" method="post">
				<input type="checkbox" id="rentType1" name="rentType1" value="house"><label for="rentType1">집 천제</label> 
				<input type="checkbox" id="rentType2" name="rentType2" value="priv"><label for="rentType2">개인실</label> 
				<input type="checkbox" id="rentType3" name="rentType3" value="multi"><label for="rentType3">도미토리</label> 
			
				
			    
			  
			  <!-- 설명넣기<span>
			  	게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로<br>
			  	일반적으로 침실, 욕실, 부엌이 포함됩니다.
			  </span>
			  <span>
			  	게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용 일 수 있습니다.
			  </span>
			  <span>
			  	게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다. 
			  </span>-->
			  <br><br>
			  
			  <h4>0-2.숙소 이름과 정보</h4><br>
			   <input type="text" id="stayname" name="stayname" placeholder="숙소의 이름"><br>
			   <input type="text" id="stayloca" name="stayloca" placeholder="숙소의  간략한 위치 예)강남구"><br>
			   <input type="text" id="staytel" name="staytel" placeholder="숙소의  대표번호"><br>
			   <input type="text" id="stayFax" name="stayFax" placeholder="숙소의  팩스번호"><br>
			   <input type="text" id="stayEmail" name="stayEmail" placeholder="숙소의  이메일 주소"><br>
			  
			  <br><br>
			  <h4>0-3.Ana에 숙소를 등록하시려면 사업자 등록증은 필수입니다!</h4><br>
			  <input type="text" id="businame" name="businame" placeholder="사업자이름"><br>
			  <input type="text" id="busicode" name="busicode" placeholder="사업자등록번호"><br>
			  <input type="file" id="busifile" name="busifile" placeholder="사업자등록증"><br>
			  
			  
			  <br>
			  <button type="submit">다음으로</button>
			</form>
		</div>


<%@include file="../includes/footer.jsp"%>
<script>
	
</script>