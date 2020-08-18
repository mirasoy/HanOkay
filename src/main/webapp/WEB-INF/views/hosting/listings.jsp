<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
<style>
   a{
      color: #21292d !important;
      }
   
	   /* Lazy Load Styles */
	.card-image {
		display: block;
		min-height: 20rem; /* layout hack */
		background: #fff center center no-repeat;
		background-size: cover;
		filter: blur(3px); /* blur the lowres image */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
	}
	
	
	
	
	/* Layout Styles */
	html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		font-size: 16px;
		font-family: sans-serif;
	}
	
	.card-list {
		display: block;
		margin: 1rem auto;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
	}
	
	.card {
		display: inline-block;
		width: 90%;
		max-width: 20rem;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0,0,0,0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0,0,0,0.5);
	}
	
	.card-description {
		display: block;
		padding: 1em 0.5em;
		color: #515151;
		text-decoration: none;
	}
	
	.card-description > h2 {
		margin: 0 0 0.5em;
	}
	
	.card-description > p {
		margin: 0;
	}
</style>


<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
   <br>      
      <!-- 중앙정렬 -->
   <div style="margin-left:15%;margin-right:15%;">      
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h3 align="left">'<c:out value="${userFstname}"/>'&nbsp;호스트님의 총 <c:out value="${size}"/>개의 숙소</h3><br>
      
      
      <!-- 영업중인 숙소 -->
      <ul class="card-list">
		
		<!-- 대기중인 숙소 -->
		 <c:forEach items="${pendinglist}" var="pendingacm">
			<li class="card">
				<a class="card-image move" href="<c:out value="${pendingacm.acmNum}"/>" data-image-full="/review/display?fileName=<c:out value='${pendingacm.acmPurl}' /><c:out value='${pendingacm.acmPname }' />">
					<img style="filter:gray;" src="/review/display?fileName=<c:out value='${pendingacm.acmPurl}' /><c:out value='${pendingacm.acmPname}' />" alt="<c:out value='${pendingacm.acmName}' />" />
				</a>
				<a class="card-description">
					<h3><c:out value="${pendingacm.acmName}" /></h3>
					<p><span style="color:red;"> <c:out value='${pendingacm.acmStatus}'/></span></p>
				</a>
			</li>
		 </c:forEach>
		
		
		<!-- 새객실 추가 -->
		 <li class="card" id="newallowed">
				<a class="card-image" id="newAcm" data-image-full="/resources/img/logohost.png">
					<img src="/resources/img/logohost.png" alt="" />
				</a>
				<a class="card-description">
					<h3>새객실 추가하기</h3>
					
				</a>
			</li>
		
		
		 <c:forEach items="${activelist}" var="activeacm">
			<li class="card">
				<a class="card-image move" href="<c:out value="${activeacm.acmNum}"/>" data-image-full="/review/display?fileName=<c:out value='${activeacm.acmPurl}' /><c:out value='${activeacm.acmPname }' />">
					<img style="filter:gray;" src="/review/display?fileName=<c:out value='${activeacm.acmPurl}' /><c:out value='${activeacm.acmPname}' />" alt="<c:out value='${activeacm.acmName}' />" />
				</a>
				<a class="card-description">
					<h3><c:out value="${activeacm.acmName}" /></h3>
					<p><p><span style="color:red;"> <c:out value='${activeacm.acmStatus}'/></span></p></p>
				</a>
			</li>
		 </c:forEach>
			
	</ul>   
         
         
       <!-- 비활성화 된 숙소 -->
         
         
      <ul class="card-list">
		 <c:forEach items="${inactivelist}" var="inactiveacm">
			<li class="card">
				<a style="-webkit-filter: grayscale(100%);filter: gray;" class="card-image move" href="<c:out value='${inactiveacm.acmNum}'/>"  data-image-full="/review/display?fileName=<c:out value='${inactiveacm.acmPurl}' /><c:out value='${inactiveacm.acmPname }' />">
					<img src="/review/display?fileName=<c:out value='${inactiveacm.acmPurl}' /><c:out value='${inactiveacm.acmPname}' />" alt="<c:out value='${inactiveacm.acmName}' />" />
				</a>
				<a class="card-description">
					<h3><c:out value="${inactiveacm.acmName}" /></h3>
					<p><span style="color:red;"> <c:out value='${inactiveacm.acmStatus}'/></span></p>
				</a>
			</li>
		 </c:forEach>
		
	  </ul>       
      
   
      </div>   
         
      <!-- 빈 폼 -->
      <form id="actionForm">
      </form>
            
         
      </div>

            

<script type="text/javascript">
$(document).ready(function(){
   
	
   <c:forEach items="${pendinglist}" var="pendingacm">
   var pendingacmType='<c:out value="${pendingacm.acmType}" />';
   var pendingacmStatus='<c:out value="${pendingacm.acmStatus}" />';
   console.log(pendingacmType);
   console.log(pendingacmStatus);
   
   if(pendingacmType.trim()=="PD"||pendingacmType.trim()=="P"){//객실별
      $("#<c:out value='${pendingacm.acmType}'/><c:out value='${pendingacm.acmNum}'/>").append("객실별");
   }
      
   else if(pendingacmType.trim()=="H"){//집천체
      $("#<c:out value='${pendingacm.acmType}'/><c:out value='${pendingacm.acmNum}'/>").append("집천체");
   }
   
   if(pendingacmStatus.trim()=="PENDING"){//
	      $("#<c:out value='${pendingacm.acmStatus}'/><c:out value='${pendingacm.acmNum}'/>").append("승인대기중");
	   }
   else if(pendingacmStatus.trim()=="DENIED"){//집천체
     $("#<c:out value='${pendingacm.acmStatus}'/><c:out value='${pendingacm.acmNum}'/>").append("숙소거절");
  	}
	      
 	else if(pendingacmStatus.trim()=="REREG"){//집천체
     $("#<c:out value='${pendingacm.acmStatus}'/><c:out value='${pendingacm.acmNum}'/>").append("재승인대기중");
  	}
   </c:forEach>
   
   
   
   
   <c:forEach items="${activelist}" var="activeacm">
   var activeacmType='<c:out value="${activeacm.acmType}" />';
   console.log(activeacmType);
   if(activeacmType.trim()=="PD"||activeacmType.trim()=="P"){//객실별
      $("#<c:out value='${activeacm.acmType}'/><c:out value='${activeacm.acmNum}'/>").append("객실별");
   }
      
   else if(activeacmType.trim()=="H"){//집천체
      $("#<c:out value='${activeacm.acmType}'/><c:out value='${activeacm.acmNum}'/>").append("집천체");
   }   
   </c:forEach>
      
   <c:forEach items="${inactivelist}" var="inactiveacm">
   var inactiveacmType='<c:out value="${inactiveacm.acmType}" />';
   console.log(inactiveacmType);
   if(inactiveacmType.trim()=="PD"){//객실별
      $("#<c:out value='${inactiveacm.acmType}'/><c:out value='${inactiveacm.acmNum}'/>").append("객실별");
   }
      
   else if(inactiveacmType.trim()=="H"){//집천체
      $("#<c:out value='${inactiveacm.acmType}'/><c:out value='${inactiveacm.acmNum}'/>").append("집천체");
   }   
   
   </c:forEach>
   
   });


   $(document).ready(function(){

	   $('#newAcm').on("click", function(){
           alert("새 숙소를 등록합니다");
            location.href="/hosting/become-host0";
        
      });
      
	   $(".move").on("click", function(e){
         var actionForm = $("#actionForm");
         
         e.preventDefault();
         actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");

         actionForm.attr("action","/hosting/getAcm");

         actionForm.submit();
      });
   });
   

    $(document).ready(function() {
        var priv ='<%=userPriv%>';
         var userStatusCode='<%=userStatusCode%>';
         //alert(userStatusCode);
         if(userStatusCode=="HO_PENDING"){
            $("#activeacm").css("display","none"); 
            $("#inactiveacm").css("display","none"); 
        }
      
         var newnotallowed="<c:out value='${newnotallowed}' />";
         if(newnotallowed=="true"){
            $("#newallowed").css("display","none"); 
         } 
         
      });
    
		
    	//카드펑션
    	window.addEventListener('load', function() {
		 	
		 	// setTimeout to simulate the delay from a real page load
		 	setTimeout(lazyLoad, 1000);
		 	
		 });
		
		 function lazyLoad() {
		 	var card_images = document.querySelectorAll('.card-image');
		 	
		 	// loop over each card image
		 	card_images.forEach(function(card_image) {
		 		var image_url = card_image.getAttribute('data-image-full');
		 		var content_image = card_image.querySelector('img');
		 		
		 		// change the src of the content image to load the new high res photo
		 		content_image.src = image_url;
		 		
		 		// listen for load event when the new photo is finished loading
		 		content_image.addEventListener('load', function() {
		 			// swap out the visible background image with the new fully downloaded photo
		 			card_image.style.backgroundImage = 'url(' + image_url + ')';
		 			// add a class to remove the blur filter to smoothly transition the image change
		 			card_image.className = card_image.className + ' is-loaded';
		 		});
		 		
		 	});
		 	
		 }


</script>








<%@include file="../includes/footer.jsp"%>