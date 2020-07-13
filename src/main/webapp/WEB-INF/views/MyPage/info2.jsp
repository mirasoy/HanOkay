<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">예약 상세 페이지 (수정 불가능)</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            예약 수정 가능            
         </div>

      
      <div class="panel-body">
       

        <div class="form-group info-group">
          <label>#예약번호</label> <input class="form-control" name='bookNum'
            value='<c:out value="${info.bookNum}"/>' readonly="readonly">
        </div>

        <div class="form-group info-group">
          <label>#회원번호</label> <input class="form-control" name='userNum'
            value='<c:out value="${info.userNum}"/>' readonly="readonly">
        </div>

        <div class="form-group info-group">
          <label>방번호</label> <input class="form-control" name='romNum'
            value='<c:out value="${info.romNum}"/>' readonly="readonly">
        </div>
        
        <div class ="form-group info-group">
             <label>예약일자</label>
             <input class="form-control" name='bookDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.bookDate}" />' readonly> 
        </div>

      
        <div class ="form-group info-group">
             <label>체크인날짜</label>
             <input class="form-control" name='checkinDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.checkinDate}" />' readonly> 
        </div>
        
        <div class ="form-group info-group">
             <label>체크아웃날짜</label>
             <input class="form-control" name='checkoutDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.checkoutDate}" />' readonly> 
        </div>                   
      
        <div class="form-group info-group">
          <label>예약숙박일수</label> <input class="form-control" name='staydays'
            value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>예약인원수</label> <input class="form-control" name='guest'
            value='<c:out value="${info.guest} "/>' readonly="readonly">
        </div>                             
       <div class="form-group info-group">
          <label>객실요금</label> <input class="form-control" name='bookPrice'
            value='<c:out value="${info.bookPrice} "/>' readonly="readonly">
        </div>
   
        <div class="form-group info-group">
          <label>도착예정시간</label> <input class="form-control" name='expectedArr'
            value='<c:out value="${info.expectedArr} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>흡연여부</label> <input class="form-control" name='smoking'
            value='' readonly="readonly">
        </div> 
 
        
       <div class="form-group info-group">
          <label>요구사항</label>
          <textarea class="form-control" rows="3" name='request'
            readonly="readonly"><c:out value="${info.request}" /></textarea>
        </div>      
        
        
        <div class="form-group info-group">
          <label>실제도착시간</label> <input class="form-control" name='realArr'
            value='<c:out value="${info.realArr} "/>' readonly="readonly">
        </div> 
        
        <div class="form-group info-group">
          <label>방이름</label> <input class="form-control" name='romName'
            value='<c:out value="${info.romName} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>예약자 이름</label> <input class="form-control" name='bookerLastname'
            value='<c:out value="${info.bookerLastname} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>예약자 성</label> <input class="form-control" name='bookerFirstname'
            value='<c:out value="${info.bookerFirstname} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>이메일</label> <input class="form-control" name='bookerEmail'
            value='<c:out value="${info.bookerEmail} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>연락처</label> <input class="form-control" name='bookerPhone'
            value='<c:out value="${info.bookerPhone} "/>' readonly="readonly">
        </div>
        <div class="form-group info-group">
          <label>예약상태</label> <input class="form-control" name='bookStatus'
            value='<c:out value="${info.bookStatus} "/>' readonly="readonly">
        </div>


<button data-oper='bookList' class="btn btn-info" onclick="location.href='/MyPage/bookList'">List</button>


      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script>
	var s = '<c:out value="${info.smoking} "/>';
	var s2 = s.trim();
	if(s2=='1'){
		$('input[name=smoking]').val("YES, 흡연을 원합니다.");
	}else{
		$('input[name=smoking]').val("NO, 금연을 원합니다.");
	}
</script>


<%@include file="../includes/footer.jsp"%>