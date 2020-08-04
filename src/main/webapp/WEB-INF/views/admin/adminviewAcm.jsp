<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/adminheader.jsp"%>
<style>
	* {box-sizing: border-box}
	body {font-family: Verdana, sans-serif; margin:0}
	.mySlides {display: none}
	img {vertical-align: middle;}
	
	/* Slideshow container */
	.slideshow-container {
	  max-width: 1000px;
	  position: relative;
	  margin: auto;
	}
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  padding: 16px;
	  margin-top: -22px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	}
	
	/* Caption text */
	.text {
	  color: #f2f2f2;
	  font-size: 15px;
	  padding: 8px 12px;
	  position: absolute;
	  bottom: 8px;
	  width: 100%;
	  text-align: center;
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* The dots/bullets/indicators */
	.dot {
	  cursor: pointer;
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}
	
	.active, .dot:hover {
	  background-color: #717171;
	}
	
	/* Fading animation */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	/* On smaller screens, decrease text size */
	@media only screen and (max-width: 300px) {
	  .prev, .next,.text {font-size: 11px}
	}


</style>
  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;margin-left:0px;">
 
	<br>	
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">			
  <!-- 수정, 삭제 가능하게  -->
  		  
<div class="row">
	  <div class="col-lg-12">
	    <h4>'<c:out value="${getuseracm.userFstName }"/>' 회원님의 숙소상세</h4><br>
	  </div>
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">회원 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label> <input class="form-control" name='userNum' id='userNum'
	            value='<c:out value="${getuseracm.userNum }"/>' readonly="readonly">
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label> <input class="form-control" name='userFstName' id='userFstName'
	            value='<c:out value="${getuseracm.userFstName }"/><c:out value="${pendinghostacm.userLastName }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>회원 권한</label> <input class="form-control" name='userPiv'
	            value='<c:out value="${getuseracm.userPriv }"/>' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>회원 상태</label> <input class="form-control" name='userStatusCode'
	            value='<c:out value="${getuseracm.userStatusCode }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label> <input class="form-control" name='bizRegnum' id='bizRegnum'
	            value='<c:out value="${getuseracm.bizRegnum }"/>' readonly="readonly">
	        </div>
			
		</div>
		</div>
		
			<button data-oper='sendmsg' class="btn btn-danger">메세지 보내기</button><!-- 이유를 써서 알림으로 가게끔 하자2.5차 -->
			<button data-oper='backtoIndex' class="btn btn-info" >관리자 페이지로</button>
	</div><!-- col-lg-4 end -->
	
	
	
	
  <div class="col-lg-6">
    <div class="panel panel-default" >

      <div class="panel-heading">
      	'<c:out value="${getuseracm.acmName}"/>' 숙소정보<label class="pull-right"><c:out value="${getuseracm.acmNum }"/>&nbsp;<c:out value="${getuseracm.acmType}"/></label>
      </div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소 주소</label> <input class="form-control" name='acmAddr'
	            value='<c:out value="${getuseracm.acmCity}"/>&nbsp;<c:out value="${getuseracm.acmDistr}"/>&nbsp;<c:out value="${getuseracm.acmDetailaddr}"/>' readonly="readonly"> 
	        </div>
	        <div class="form-group">
	          <label>숙소 대표번호, 연락처</label> <input class="form-control" name='repPhone'
	            value='<c:out value="${getuseracm.repPhone }"/>/<c:out value="${getuseracm.subPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>체크인, 체크아웃 시간</label> <input class="form-control" name='checkTime'
	            value='<c:out value="${getuseracm.checkinTime }"/>/<c:out value="${getuseracm.checkoutTime }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 이메일, 팩스번호</label> <input class="form-control" name='acmEmail'
	            value='<c:out value="${getuseracm.acmEmail }"/>/<c:out value="${getuseracm.acmFax }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>숙소 설명</label> <textarea class="form-control" name='userPiv' readonly="readonly"><c:out value="${getuseracm.acmDesc }"/></textarea>
	        </div>
	        <div class="form-group">
				<label>숙소 옵션</label><div id="acmOpt"></div>

	        </div>
	
			
		</div>
		</div>
	</div><!-- col-lg-4 end -->
		
<div class="col-lg-3">
    <div class="panel panel-default" >

      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소대표사진</label> 
	          <div class="slideshow-container">
					
					<div class="mySlides">
					  <div class="numbertext">1 / 3</div>
					  <img style='align:center;width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${getuseracm.acmPurl}" /><c:out value="${getuseracm.acmPname }" />'>
							
					</div>
					
					<div class="mySlides">
					  <div class="numbertext">2 / 3</div>
					 <img style='width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${getuseracm.acmPurl}" /><c:out value="${getuseracm.acmPname }" />'>
					</div>
					
					<div class="mySlides">
					  <div class="numbertext">3 / 3</div>
					  <img style='width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${getuseracm.acmPurl}" /><c:out value="${getuseracm.acmPname }" />'>
					
					  <!--  <div class="text">Caption Three</div>-->
					</div>
					<div class="mySlides">
					  <div class="numbertext">3 / 3</div>
					  <img style='width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${getuseracm.acmPurl}" /><c:out value="${getuseracm.acmPname }" />'>
					
					  <!--  <div class="text">Caption Three</div>-->
					</div>
					<div class="mySlides">
					  <div class="numbertext">3 / 3</div>
					  <img style='width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${getuseracm.acmPurl}" /><c:out value="${getuseracm.acmPname }" />'>
					
					  <!--  <div class="text">Caption Three</div>-->
					</div>
					
					
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
					
					</div>
					<br>
					
					<div style="text-align:center">
					  <span class="dot" onclick="currentSlide(1)"></span> 
					  <span class="dot" onclick="currentSlide(2)"></span> 
					  <span class="dot" onclick="currentSlide(3)"></span> 
					  <span class="dot" onclick="currentSlide(4)"></span> 
					  <span class="dot" onclick="currentSlide(5)"></span> 
					  <span class="dot" onclick="currentSlide(6)"></span> 
					</div>
	          
	          
              </div>
			
		</div>
		</div>
	</div><!-- col-lg-3 end -->
	
		
		
	 <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">객실정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 목록 </th>
						</tr>
					</thead>

					<c:forEach items="${roms}" var="rom">
						<tr>
							<td>
								<a class='move' href='<c:out value="${rom.romNum}"/>'>
									<c:out value="${rom.romName}" />
								</a>
							</td>
						
						</tr>
					</c:forEach>
				</table>
		</div>
		</div>
		
		
	</div><!-- col-lg-4 end -->	
	
	
	
	
</div>
</div>
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
</div>

<script type="text/javascript">
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
	
	
	
	$(document).ready(function(){
		getAcmOpt();
		
		
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtoIndex'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/admin/adminindex");	
				actionForm.submit();
			} else if(operation==='sendmsg'){
				alert("메세지를 보냅니다");
			} 
			
		});
	});

	//숙소옵션뿌리기
	function dec2bin(codeNum){
		return (codeNum >>> 0).toString(2); 
	}
	function pad(code) {
		return code.length >= 16? code : new Array(16 - code.length+1).join('0') + code;
	}
	
	function getAcmOpt() {
		var iconArr = new Array(); 
		var codeArr = new Array(); 
		var nameArr = new Array(); 
		let option;
		let j = 0;

		<c:forEach items="${acmCode}" var="acmCode">
		
			iconArr[j] = '<c:out value="${acmCode.codeIcon}" />';
			codeArr[j] = 'acm' + '<c:out value="${acmCode.codeFull}" />';
			nameArr[j] = '<c:out value="${acmCode.codeCont}" />';
			j++;

		</c:forEach>
		
		
				
		option= pad(dec2bin("${getuseracm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("acmOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				
			}
		}
	
	}


</script>
<%@include file="../includes/footer.jsp"%>











