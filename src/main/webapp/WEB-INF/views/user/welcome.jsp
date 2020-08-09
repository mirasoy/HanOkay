<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ include file="../includes/header1.jspf"%>
<title>Han:Ok - 어서오세요</title>
<style>
*, ::after, ::before {
    box-sizing: border-box;
}

@media (min-width: 992px){
.container {
    max-width: 960px;
	}
}

.container_SR {
    margin-left: auto !important;
    margin-right: auto !important;
    width: auto !important;
    padding-right: 24px !important;
    padding-left: 24px !important;
}

.out_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
}

.header1_SR {
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
}
.header2_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 32px !important;
    font-weight: 800 !important;
    line-height: 1.125em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.outerbox_SR {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.container3_SR {
    padding-left: 24px !important;
    padding-right: 24px !important;
    margin: 5px auto!important;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    background-color: #ffffff !important;
    height: 480px;
    width: 446px;
}

#goBackIndex:hover{
	cursor:pointer;
}

</style>
<%@ include file="../includes/header2.jspf"%>
<%@ include file="../includes/header3.jspf"%>

<main style="display: block;">
	<div class="container">
		<div class="container_SR">
		<div class="out_SR">
		
		<section style="display: block;">		
		<div style="margin-top: 64px; margin-bottom: 56px; margin-left: 16px;">
			<h1 tabindex="-1" class="header1_SR">
				<div class="header2_SR">
				<label>	<%=userLastName %><%=userFstName %>님 환영합니다. </label>
				</div>
			</h1>
		</div>
		</section>
		
		
		<div class="outerbox_SR">
			<div class="container3_SR">
				<div style="margin: 49px auto;">
					<div style="font-size: 25px; text-align:center;">
					<p>오늘은 우리나라의 <br>어느 곳을 여행하고 싶으신가요?</p>
					<div style="margin-top: 44px; text-align:center; font-weight:400">
					<p>검색만 하세요.</p>
					</div>
					<div style="margin-top:5px; text-align:center;">
					<p>
					저희 한오케이가 <br> <%=userFstName %>님이 그동안 모르고 지냈던<br>
					아름다운 우리나라를 보여드릴게요.</p>
					</div>
					</div>
				
					<div style="margin-top:106px; margin-left:215px; font-size: 20px;">
					<a href="../acm/list" style="color:#077bff" id="goBackIndex">한옥 검색하러 가기</a>
					</div>
				
				</div>
			</div>
		</div>
		
		
		</div>
		</div>
	</div>
</main>			


<%@include file="../includes/footer.jsp"%>