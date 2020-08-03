<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../includes/header1.jspf"%>

<style type="text/css">

main, section, header {
	display: block;
}

.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }
  
.out_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
  }

.out_SR:before {
    content: " " !important;
    display: table !important;
  }
  
.header1_SR{
  	color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
  }
  
.header2_SR{
  	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 32px !important;
    font-weight: 800 !important;
    line-height: 1.125em !important;
    color: rgb(72, 72, 72) !important;
    margin-left: 4px !important;
  }
  
.content_SR{
	margin-left: -8px !important;
    margin-right: -8px !important;

}

.content_SR::before{
    content: " " !important;
    display: table !important;
}
 
 @media (min-width: 744px)
.contentOfInfo_SR{
    width: 58.3333% !important;
    float: left !important;
}
 
.contentOfInfo_SR{
	padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.oneInfo_SR{
	border-bottom: 1px solid rgb(235, 235, 235) !important;
}

.in1_SR{
	display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
}

.tableCell_SR{
	display: table-cell !important;
    width: 100% !important;
    vertical-align: top !important;
}

.titleOfOneInfo_SR{
	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.realInfo_SR{
	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.btn_box{
	display: table-cell !important;
    vertical-align: top !important;
    white-space: nowrap !important;
}

.btn_box2{
 	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.btn_box3{
 --color-text-muted: #EBEBEB !important;
}

.btn_modify{
	color: #008489 !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
}

</style>

<%@include file="../../includes/header2.jspf"%>
<%@include file="../../includes/header3.jspf"%>

	 <div class="container">
    <div class="out_SR">
      <section>
        <div
          style="
            position: relative;
            margin-top: 64px;
            margin-bottom: 56px;
            margin-left: 16px;">
          <h1 tabindex="-1" class="header1_SR">
            <div class="header2_SR">개인정보</div>
          </h1>
        </div>
      </section>
	</div>
	
      <div class="content_SR">
        <section class="contentOfInfo_SR">


          <!-- 하나의 정보칸 -->
          <div class="oneInfo_SR">
            <div style="margin-top: 24px;">
              <div class="in1_SR">
                <div class="tableCell_SR">
                  <div class="titleOfOneInfo_SR">실명</div>
                  <div style="margin-top: 8px; margin-bottom: 24px;">
                    <div class="realInfo_SR">
                      <!-- 세션에서 이름 -->
                    </div>
                  </div>
                </div>

                <div class="btn_box">
                  <div class="btn_box2">
                    <div class="btn_box3">
                      <button
                        type="button"
                        class="btn_modify"
                        aria-busy="false"
                      >수정
                     </button>
                    </div>
                  </div>
                </div>


              </div>
            </div>
          </div>
          
          <!-- 하나의 정보칸 -->
          <div class="oneInfo_SR">
            <div style="margin-top: 24px;">
              <div class="in1_SR">
                <div class="tableCell_SR">
                  <div class="titleOfOneInfo_SR">생년월일</div>
                  <div style="margin-top: 8px; margin-bottom: 24px;">
                    <div class="realInfo_SR">
                     <!-- 유저 생년월일 -->
                    </div>
                  </div>
                </div>

                <div class="btn_box">
                  <div class="btn_box2">
                    <div class="btn_box3">
                      <button
                        type="button"
                        class="btn_modify"
                        aria-busy="false"
                      >수정
                     </button>
                    </div>
                  </div>
               	 </div>
				</div>
			</div>
		</div>
 <!-- 하나의 정보칸 -->
             

          <div class="oneInfo_SR">
            <div style="margin-top: 24px;">
              <div class="in1_SR">
                <div class="tableCell_SR">
                  <div class="titleOfOneInfo_SR">이메일 주소</div>
                  <div style="margin-top: 8px; margin-bottom: 24px;">
                    <div class="realInfo_SR">
                      <!-- 여기에 세션의 이메일 들어가게-->
                    </div>
                  </div>
                </div>

                <div class="btn_box">
                  <div class="btn_box2">
                    <div class="btn_box3">
                      <button
                        type="button"
                        class="btn_modify"
                        aria-busy="false"
                      >수정
                     </button>
                    </div>
                  </div>
                </div>
               </div>
              </div>
             </div>
 <!-- 하나의 정보칸 -->
            
          <div class="oneInfo_SR">
            <div style="margin-top: 24px;">
              <div class="in1_SR">
                <div class="tableCell_SR">
                  <div class="titleOfOneInfo_SR">연락처</div>
                  <div style="margin-top: 8px; margin-bottom: 24px;">
                    <div class="realInfo_SR">
                      <!-- 여기에 유저의 연락처 들어가게-->
                    </div>
                  </div>
                </div>

                <div class="btn_box">
                  <div class="btn_box2">
                    <div class="btn_box3">
                      <button
                        type="button"
                        class="btn_modify"
                        aria-busy="false"
                      >수정
                     </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </section>
     
     
     
    </div>
  </div>
	<script>
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;

	    return [year, month, day].join('/');
	}
	 
	//DOM이 만들어지면
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	
	//실명에 세션에 있는 정보들을을 넣어주자1
	let userName=document.getElementsByClassName("realInfo_SR")[0];
	let userBday=document.getElementsByClassName("realInfo_SR")[1];
	let userEmail= document.getElementsByClassName("realInfo_SR")[2];
	let userPhoneNumber= document.getElementsByClassName("realInfo_SR")[3];
	
	if(<%=userFstName != null%>){
		userName.innerHTML= '<%=userLastName%> <%=userFstName%>';
		userEmail.innerHTML= '<%=userEmail%>'; 
		
	}
	
	if(<%=user.getUserBirthday() != null %>){
		let bday= '<%=user.getUserBirthday() %>';
		let array = bday.split(" ");
		userBday.innerHTML= array[5]+"/"+ array[1]+ "/"+ array[2];
	}
	
	if(<%=user.getUserPhone() != null %>){
		userPhoneNumber.innerHTML= '+<%=user.getUserPhone() %>';
	}
	
	});
	</script>

<%@include file="../../includes/footer.jsp"%>