<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
<div class="body">
		<form>
		<div align="center">
			 <h4> 안녕하세요, 저는 <c:out value="${userFstname}"/> 입니다</h4>
			 <h6>회원가입 : <c:out value="${userRegisterDate}"/></h6> 
			 <div>사진들어갈자리</div>
			 <textarea name="userLanguage" id="userLanguage" placeholder="구사 언어 : 예.한국어 영어"cols="10" rows="2"></textarea>
		
			<textarea name="userIntroduction" id="userIntroduction" placeholder="예.안녕하세요 저는 한국문화를 사랑하는 Sam입니다"cols="50" rows="5"></textarea>
		
		<button type="button" onclick="if(readyForreg()){romRegit()}">수정하기</button>
		
		 </form>	
			  
		 
		 
		</div>
	</div>
<%@include file="../includes/footer.jsp"%>
