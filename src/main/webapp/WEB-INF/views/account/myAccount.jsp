<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/header1.jspf"%>
<style type="text/css">

</style>
<%@include file="../includes/header2.jspf"%>
<%@include file="../includes/header3.jspf"%>


	<h4><%=userFstName %>의 계정</h4>
	<script>
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
        
        
    }
	});
	</script>

<%@include file="../includes/footer.jsp"%>
