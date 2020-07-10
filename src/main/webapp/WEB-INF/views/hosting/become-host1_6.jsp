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
                            <a href=""><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
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
			<form action="/hosting/become-host1_6" method="post">
			  
			  <input type="text" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
			  <h4>5.숙소에서 공통적으로 제공하는 옵션</h4><br>
			  
			  <h4>5-1.시설 옵션</h4> <!-- checkbox는 name값을 key값으로 갖기때문에 같게 두고, value값만 다르게 준다 -->	
			  	<input type="checkbox" id="SW" name="acmOptcode" value="SW"><label for="SW">수영장</label>
			   <input type="checkbox" id="PK" name="acmOptcode" value="PK"><label for="PK">주차장</label>
			   <input type="checkbox" id="PU" name="acmOptcode" value="PU"><label for="PU">공항 등 교통편 서비스</label>
			   <input type="checkbox" id="GM" name="acmOptcode" value="GM"><label for="GM">체육관/피트니스</label>
			   <input type="checkbox" id="FD" name="acmOptcode" value="FD"><label for="FD">24시간 프런트 데스크</label>
			   <input type="checkbox" id="FA" name="acmOptcode" value="FA"><label for="FA">가족/아동 여행객 친화형 시설</label>
			   <input type="checkbox" id="NS" name="acmOptcode" value="NS"><label for="NS">금연</label>
			   <input type="checkbox" id="SP" name="acmOptcode" value="SP"><label for="SP">스파/사우나</label><br>
			   <input type="checkbox" id="RT" name="acmOptcode" value="RT"><label for="RT"> 레스토랑</label>
			   <input type="checkbox" id="SA" name="acmOptcode" value="SA"><label for="SA"> 흡연구역</label>
			   <input type="checkbox" id="WP" name="acmOptcode" value="WP"><label for="WP">반려동물 동반 가능</label>
			   <input type="checkbox" id="AD" name="acmOptcode" value="AD"><label for="AD">장애인용 편의시설/서비스</label>
			   <input type="checkbox" id="VC" name="acmOptcode" value="VC"><label for="VC">비즈니스 관련 편의 시설</label>
			   <input type="checkbox" id="GP" name="acmOptcode" value="GP"><label for="GP">골프장</label>
			   <input type="checkbox" id="WF" name="acmOptcode" value="WF"><label for="WF">인터넷</label>
			   
				<br><br>
							  
			  <h4>5-2.식사 옵션</h4>
			   <input type="checkbox" id="BF" name="acmOptcode" value="BF"><label for="BF">조식</label>
			   <input type="checkbox" id="LC" name="acmOptcode" value="LC"><label for="LC">중식</label>
			   <input type="checkbox" id="DN" name="acmOptcode" value="DN"><label for="DN">석식</label>
			   
			   
			   <br><br>
					
			  <h4>6.숙소에 대한 설명과 교통편,지켜야할 사항 등을 적어주세요</h4>
			  <textarea name="acmDesc" id="acmDesc" cols="50" rows="5"></textarea>
			 	
			
			  
				  
			  <!-- 총 검토 -->
			  <br><br><br>
			  <button type="submit">다음으로</button>
			</form>
		</div>


<%@include file="../includes/footer.jsp"%>
<script>
	
</script>