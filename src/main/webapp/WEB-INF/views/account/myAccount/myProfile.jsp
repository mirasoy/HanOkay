<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 

<%@include file="../../includes/header.jsp"%>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >

<style>

	.container-1{
	  
	}

	.contents{
	 
	}
	
	.contents-2{

		box-shadow: none !important;
	}


.card1{
    margin-bottom: 50px;
position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    /* background-color: #fff; */
    background-clip: border-box;
    /* border: 1px solid rgba(0,0,0,.125); */
    border-radius: .25rem;

}


.items{
    border-bottom: 1px solid rgb(221, 221, 221) !important;
   margin-bottom: 30px;
    padding-bottom: 30px;

}




.item1>h1{

    font-size: 30px;
    font-weight: 800;
    line-height: 40px;
    margin: 0px !important;
    padding: 0px !important;
}


.item1>p{
    font-size: 14px !important;
    line-height: 18px !important;
    color: #717171 !important;
    margin-bottom: 8px !important;
}


.item2>.user_profile_edit_button{
font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;


}


.item3> h1{
font-size: 22px;
    font-weight: 600;
}

.item3>button{
    font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;
}


#peek {
	height : 100%;
	position : relative;
	
	display: none;
	list-style: none;
	padding: 0;
	margin: 20px 0;  
  
  
}

#peek>li{
margin-bottom: 25px;

}


.btn {
    cursor: pointer;
    display: inline-block;
    font-size: 0.85rem;
    font-weight: 400;
    padding: 12px 20px;
}

.btn-primary{

color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

.textToggleArea{

    color: inherit !important;
    min-width: 100% !important;
    max-width: 100% !important;
    appearance: none !important;
    font-size: 16px !important;
    line-height: 20px !important;
    font-weight: 400 !important;
    border-style: none !important;
    box-shadow: rgb(176, 176, 176) 0px 0px 0px 1px inset !important;
    box-sizing: border-box !important;
    color: rgb(34, 34, 34) !important;
    padding: 10px !important;
    border-radius: 8px !important;
    background-color: #fff;

}

.textToggle>p{
    margin: 0;
}

.on{
    display: block !important;
}






</style>



<div class="container-1">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">내 프로필</h1>
			<p><%=userFstName %>님 반갑습니다.</p>
		</div>
	</div>



<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■사이드바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	
	<section class="sidebar">
	    <div class="sidebar_detail">
	
	        <div class="sidebar-header">
	            <div class="user-pic"> <img src="${request.contextPath}/resources/img/user.jpg" alt="유저이미지"></div>
	            <div class="user-info">
	                <span class="user-name">	               
	             		<strong><%=userFstName%></strong>님
	                </span>
	                <span class="user-role">Administrator</span>
	                <span class="user-status">
	                    <i class="fa fa-circle"></i>
	                    <span>Online</span>
	                </span>
	            </div>
	        </div>
	        <button class="mypage_btn nav_btn">마이페이지</button>
	        

	        <button class="noaccordion nav_btn">프로필</button>
	        
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
				<li class="item3"><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>             	              
	          </ul>
	        </div>
	           

	            
	         <button class="noaccordion nav_btn nav_btn_last" onclick="location.href='/chat/chatList'">나의 채팅</button>
	           
	
	    </div>
	
	</section>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■메인컨텐츠■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	
<section class="contents">
	<section class="contents-2">
		<div class="card1">
			<div class="item1 items">
				<h1>안녕하세요 저는 <%=userFstName %>입니다.</h1>
				<p id="userRegisterDate">회원가입일 : 2020</p>
			</div>
			<div class="item2 items">
			<div class="profileRead">
				<div>
				<span>자기소개</span>
				<div>
				<c:out value="${profile.userIntroduction}" />
				</div>
				
				<span>사용언어</span>
				<div>
				<c:out value="${profile.userLanguage}" />
				</div>
				</div>
			</div>
				<button type="button" class="user_profile_edit_button" >프로필 수정하기</button>
				
				<ul id="peek">
					<li>
						<div class="textToggle">
							<p>소개</p>
							<textarea name="about" rows="4" autocomplete="off" id="selfIntro" class="textToggleArea"><c:out value="${profile.userIntroduction}" /></textarea>
						</div>
					</li>
					
					<li>
						<div class="textToggle">
							<p>구사언어</p>
							<textarea name="about" rows="2" autocomplete="off" id="lang" class="textToggleArea">${profile.userLanguage}</textarea>
						</div>
					</li>
					
					<li>
						<div class="textToggle">
							<p>프로필 사진 업로드</p>
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple="multiple">
							<div class="uploadResult">
								<ul>

								</ul>
							</div>
						</div>
						</div>
					</li>
						
					
					<button class="btn btn-primary">수정하기</button>																							
					<button class="btn btn-red">취소하기</button>																							
				</ul>

				
				
			</div>		
			
			<div class="item3 items">
				<h1>★ 후기 <c:out value="${reviewCount}" />개 </h1>
				<button type="button" class="review_edit_button" >내가 작성한 후기</button>
			</div>											
		</div>
	</section>
</section>

<script>
//글자수 유효성 체크 메서드
function checkLetter(){
	let self= $("#selfIntro").val();
	let langu= $("#lang").val();
}

$(".user_profile_edit_button").on('click',function(){	
	$(".profileRead").hide();
	$("#peek").addClass('on')	
});


$(".btn-red").on('click',function(){	
	$(".profileRead").show();
	$("#peek").removeClass('on');	
});

$(".btn-primary").on('click', function(){
	
	let lang= $("#lang").val();
	let selfIntro= $("#selfIntro").val();
	
	$.ajax({
        type: "POST",
        url: "/account/myAccount/updateMyProfile",
        dataType: "json",
        data: {
          userNum: '<%=userNum %>',
          userIntroduction : selfIntro,
          userLanguage : lang
        },
        //async: false,
        success: function (data) {
         if(data.msg =='success'){
        	 window.alert("수정 완료!");
        	 $(".profileRead").show();
        	 $("#peek").removeClass('on');
  
         }
        }
        
   });
});


var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("side-active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}


  $(document).ready(function () {
    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);  
    }
  });
</script>

<%@include file="../../includes/footer.jsp"%>
