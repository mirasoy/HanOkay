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
<nav>
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
  <!-- 수정, 삭제 가능하게  -->
  		  
	<div class="row">
  <div class="col-lg-12">
    <h4><c:out value="${thisrom.romName }"/>의  정보</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">객실 상세보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
		<div class="form-group">
          <label>소속숙소번호</label> <input class="form-control" name='bno'
            value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
        </div>	
        <div class="form-group">
          <label>객실번호</label> <input class="form-control" name='bno'
            value='<c:out value="${thisrom.romNum }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>객실이름</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romName }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 타입</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romType }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실최대수용인원</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romCapa }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>침대 타입</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.bedType }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>침대 갯수</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.bedCnt }"/>' readonly="readonly">
        </div>
		<div class="form-group">
          <label>객실 크기</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romSize }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 1박요금</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romPrice }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 사진</label> <input class="form-control" name='title'
            value='<c:out value="${thisrom.romPurl }"/>' readonly="readonly">
        </div>



<button data-oper='modify' class="btn btn-default">수정하기</button>
<button data-oper='list' class="btn btn-info">뒤로가기</button>
			
	
			
			
			
		</div>


<%@include file="../includes/footer.jsp"%>






