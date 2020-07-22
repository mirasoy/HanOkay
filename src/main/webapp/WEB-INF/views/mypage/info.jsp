<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">예약 상세 페이지</h1>
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

        <div class="form-group info-group sr-only">
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
      
        <div class="form-group info-group sr-only">
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
          <label>흡연여부</label> 
          <input class="form-control" name='smoking' value='' readonly="readonly">
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
          <label>요구사항</label>
          <textarea class="form-control" rows="3" name='request'
            readonly="readonly"><c:out value="${info.request}" /></textarea>
        </div>      
        
        
        
        <div class="form-group info-group">
          <label>예약상태</label>           
          <input class="form-control" name='bookStatus' value='' readonly="readonly">
        </div>


<button data-oper='modify' class="btn btn-default" onclick="location.href='/mypage/modify?bookNum=<c:out value="${info.bookNum}"/>'">Modify</button>
<button data-oper='bookList' class="btn btn-info" onclick="location.href='/mypage/bookList'">List</button>


      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script>


//당신의 흡연상태를 수정합니다.

	var s = '<c:out value="${info.smoking} "/>';
	
	var s2 = s.trim(); //뛰어쓰기를 없앤다
	
//당신이 흡연을 원하면 값은 1을 가져온다. 그리고 흡연을 원한다는 메세지를 출력한다.	

	if(s2=='1'){
		$('input[name=smoking]').val("YES, 흡연을 원합니다.");
	}else{ // 만약 금연을 원한다면 값은 0을 불러오고, 금연을 원한다는 메세지를 출력한다.
		$('input[name=smoking]').val("NO, 금연을 원합니다.");
	}
	
//예약상태를 출력하는 코드이다.	
	var bookStatus = '<c:out value="${info.bookStatus} "/>';
	var bookStatus2 = bookStatus.trim();
	/* alert(bookStatus2); */

// 당신의 투숙상태를 변경
	if(bookStatus2=='RS_STT_BK'){
		$('input[name=bookStatus]').val("투숙예정"); 
	}else if(bookStatus2=='RS_STT_BC'){
		$('input[name=bookStatus]').val("예약취소"); 
	}else if(bookStatus2=='RS_STT_AC'){
		$('input[name=bookStatus]').val("투숙완료"); 
	}
	
	
	var bookerPhone = document.getElementsByName("bookerPhone")[0].value;
	if(bookerPhone==" "){
		$('input[name=bookerPhone]').val("번호없음"); 
	}
	
	
</script>


<%@include file="../includes/footer.jsp"%>