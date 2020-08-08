<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>







<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■사이드바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	
	<section class="sidebar">
	    <div class="sidebar_detail">	
	        <div class="sidebar-header">
	            <div class="user-pic"> <img src="${request.contextPath}/resources/img/user.jpg" alt="유저이미지"></div>
	            <div class="user-info">
	                <span class="user-name">	               
	             		<strong><%=userFstName %></strong>님
	                </span>
	                <span class="user-role">Administrator</span>
	                <span class="user-status">
	                    <i class="fa fa-circle"></i>
	                    <span>Online</span>
	                </span>
	            </div>
	        </div> 
	        
	      
	        
	  		<button class="mypage_btn nav_btn">마이페이지</button>
	        
	        <button class="noaccordion nav_btn mypro_btn"> <a href="/account/myAccount/myProfile">프로필</a></button>	     
	            
	        <button class="accordion nav_btn">나의 예약</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>	              	              
	          </ul>
	        </div>
	        
	        <button class="accordion nav_btn">나의 리뷰</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/review/list">전체목록</a></li>
				<li class="item2"><a href="/review/writtenReviewlist">작성한 리뷰</a></li>
			<!-- 	<li class="item3"><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>   -->           	              
	          </ul>
	        </div>           	            
	         <button class="noaccordion nav_btn nav_btn_last" onclick="location.href='/chat/chatList'">나의 채팅</button>	
	    </div>
	</section>