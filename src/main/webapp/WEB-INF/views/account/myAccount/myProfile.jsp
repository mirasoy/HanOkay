<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../includes/header1.jspf"%>
<style type="text/css">
.outerbox {
	max-width: 800px;
	margin: 0 auto 1em auto;
	background-color: #fff;
	padding: 20px;
	/* border-radius: 5px; */
}

.cards {
	margin: 0;
	padding: 0;
	list-style: none;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-rows: repeat(3, 100px);
	/* grid-template-areas: "a a a b" "a a a b" "c d d d"; */
	grid-gap: 20px;
	align-items: start;
	border-radius: 5px;
	
}
.cards li {
    background-color: #e3fafc;
    border: 1px solid #99e9f2;
    margin: 0 10px 10px 10px;
    padding: 10px;
    border-radius: 5px;
    
}
</style>
<%@include file="../../includes/header2.jspf"%>
<%@include file="../../includes/header3.jspf"%>

	<h1>내 프로필</h1>
	<div class="outerbox">
	<ul class="cards">
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	</ul>
	</div>
	
	<script>
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	});
	</script>

<%@include file="../../includes/footer.jsp"%>
