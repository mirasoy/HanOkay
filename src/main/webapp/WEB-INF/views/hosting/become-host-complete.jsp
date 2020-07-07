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
			 <form action="/hosting/listings" method="post">
			 		<h4>확정된 전체 정보 뿌리기</h4>
			 	
			 	
			 		<button type="submit">객실 등록하기</button>
			 </form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
