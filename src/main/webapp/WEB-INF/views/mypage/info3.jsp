<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >
<style>

.page-header-content{
padding-bottom: 20px;
}


.contents_info{
    width: 100%;
    height: 525px;
}

	.contents_info>.form-group{
	width: 33.333336%;
	}

</style>

<div class="container">



<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">취소예약 페이지</h1>
			<p><%=userFstName %>님, 마음이 바뀌시면 저희와 함께해요!</p>
		</div>
	</div>


<section class="contents_info">
		
	<section class="contents_info">
       

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
          <label>흡연여부</label> <input class="form-control" name='smoking'
            value='' readonly="readonly">
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
          <label>예약상태</label> <input class="form-control" name='bookStatus'
            value='<c:out value="${info.bookStatus} "/>' readonly="readonly">
        </div>


		</section>
</section>


<div class="info_btn">
<button data-oper='bookList' class="btn btn-info" onclick="location.href='/mypage/cancelled'">List</button>




</div>
</div>



<script>
	var s = '<c:out value="${info.smoking} "/>';
	var s2 = s.trim();
	if(s2=='1'){
		$('input[name=smoking]').val("YES, 흡연을 원합니다.");
	}else{
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
</script>


<%@include file="../includes/footer.jsp"%>