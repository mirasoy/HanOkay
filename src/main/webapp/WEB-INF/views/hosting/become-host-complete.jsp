<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@include file="../includes/becomehostheader.jsp"%>

<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                         <li>
                           <a><c:out value="${userFstname}"/>님 !<br> 숙소 등록이 완료되었습니다</a> 
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
			<br>	
			 <!-- 숙소설명 -->
			 <form action="/hosting/listings" method="post">
			 		<h4><c:out value="${userFstname}"/>님의 새 숙소 "<c:out value="${userFstname}"/>"가 등록되었습니다</h4>
			 	
			 	
			 		<button type="submit">숙소관리 페이지로</button>
			 </form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
