<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">예약 수정 페이지</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				예약 수정 하세요.			
			</div>

      
      <div class="panel-body">
    	
     <form role="form" action="/MyPage/modify" method="post">
     
        <div class="form-group">
          <label>#예약번호</label> 
          <input class="form-control" name='bookNum'
            value='<c:out value="${info.bookNum}"/>' readonly="readonly">
        </div>

        <div class="f9orm-group">
          <label>#회원번호</label> 
          <input class="form-control" name='userNum'
            value='<c:out value="${info.userNum}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>방번호</label> 
          <input class="form-control" name='romNum'
            value='<c:out value="${info.romNum}"/>' readonly="readonly">
        </div>
        
        <div class ="form-group">
       		<label>예약일자</label>
       		<input class="form-control" name='bookDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.bookDate}" />' readonly> 
        </div>

      
        <div class ="form-group">
       		<label>체크인날짜</label>
       		<input class="form-control" name='checkinDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkinDate}" />' readonly> 
        </div>
        
        <div class ="form-group">
       		<label>체크아웃날짜</label>
       		<input class="form-control" name='checkoutDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.checkoutDate}" />' readonly> 
        </div>                   
      
        <div class="form-group">
          <label>예약숙박일수</label> <input class="form-control" name='staydays'
            value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>예약인원수</label> <input class="form-control" name='guest'
            value='<c:out value="${info.guest} "/>' >
        </div>                             
       <div class="form-group">
          <label>객실요금</label> <input class="form-control" name='bookPrice'
            value='<c:out value="${info.bookPrice} "/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>계약금</label> <input class="form-control" name='deposit'
            value='<c:out value="${info.deposit} "/>' readonly="readonly">
        </div>
       <div class="form-group">
          <label>예약취소여부</label> <input class="form-control" name='canceled'
            value='<c:out value="${info.canceled} "/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>도착예정시간</label> <input class="form-control" name='expectedArr'
            value='<c:out value="${info.expectedArr} "/>' >
        </div>
        <div class="form-group">
          <label>흡연여부</label> <input class="form-control" name='smoking'
            value='<c:out value="${info.smoking} "/>' >
        </div> 
 
        
       <div class="form-group">
          <label>요구사항</label>
          <textarea class="form-control" rows="3" name='request'><c:out value="${info.request}" /></textarea>
        </div>      
        
        
        <div class="form-group">
          <label>실제도착시간</label> <input class="form-control" name='realArr'
            value='<c:out value="${info.realArr} "/>' readonly="readonly">
        </div> 



<button type="submit" data-oper='modify' class="btn btn-default">정보수정</button>
<button type="submit" data-oper='remove' class="btn btn-default" >예약취소</button>
<button type="submit" data-oper='bookList' class="btn btn-info" >리스트</button>

</form>


      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->



<script type="text/javascript">
$(document).ready(function() {
  
  var formObj = $("form"); 
  
  $('button').on("click", function(e){
    
	  e.preventDefault();
	  var operation = $(this).data("oper");
	  
	  console.log(operation);
	  if(operation==='remove'){
		  formObj.attr("action", "/MyPage/remove"); 
		 
	  }else if(operation === 'bookList'){
		  self.location="/MyPage/bookList";
		  return;
	  }
	 
	  formObj.submit();
  });
    
  });
  
</script>






<%@include file="../includes/footer.jsp"%>
