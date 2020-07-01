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
    	

        <div class="form-group">
          <label>#예약번호</label> <input class="form-control" name='bookNum'
            value='<c:out value="${info.bookNum}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>#회원번호</label> <input class="form-control" name='userNum'
            value='<c:out value="${info.userNum}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>방번호</label> <input class="form-control" name='romNum'
            value='<c:out value="${info.romNum}"/>' readonly="readonly">
        </div>
        
        <div class ="form-group">
       		<label>예약일자</label>
       		<input class="form-control" name='bookDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.bookDate}" />' readonly> 
        </div>

      
        <div class ="form-group">
       		<label>체크인날짜</label>
       		<input class="form-control" name='checkinDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.checkinDate}" />' readonly> 
        </div>
        
        <div class ="form-group">
       		<label>체크아웃날짜</label>
       		<input class="form-control" name='chekoutDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${info.chekoutDate}" />' readonly> 
        </div>                   
      
        <div class="form-group">
          <label>예약숙박일수</label> <input class="form-control" name='staydays'
            value='<c:out value=" ${info.staydays}"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>예약인원수</label> <input class="form-control" name='guest'
            value='<c:out value="${info.guest} "/>' readonly="readonly">
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
            value='<c:out value="${info.expectedArr} "/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>흡연여부</label> <input class="form-control" name='smoking'
            value='<c:out value="${info.smoking} "/>' readonly="readonly">
        </div> 
 
        
       <div class="form-group">
          <label>요구사항</label>
          <textarea class="form-control" rows="3" name='request'
            readonly="readonly"><c:out value="${info.request}" /></textarea>
        </div>      
        
        
        <div class="form-group">
          <label>실제도착시간</label> <input class="form-control" name='realArr'
            value='<c:out value="${info.realArr} "/>' readonly="readonly">
        </div> 


<button data-oper='modify' class="btn btn-default" onclick="location.href='/MyPage/modify?bookNum=<c:out value="${info.bookNum}"/>'">Modify</button>
<button data-oper='bookList' class="btn btn-info" onclick="location.href='/MyPage/bookList'">List</button>


<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form> --%>




      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- <script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script> -->


<%@include file="../includes/footer.jsp"%>
