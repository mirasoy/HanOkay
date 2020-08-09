<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@include file="../includes/hostheader.jsp"%>
	<style>
		a{
			color: #21292d;
			}
			
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
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
  <!-- 숙소 방 추가 모달로 띄우기-->
		<div class="col-lg-10">
		<button class="btn btn-default" type="button" data-oper='backtolist'>숙소 목록으로</button>
		<button class="btn btn-default" type="button" data-oper='viewMyacm'>숙소 미리보기</button>
		<button class="btn btn-danger" type="button" data-oper='removeAcm'>숙소 삭제하기</button>
		<button id="isDenied" class="btn btn-info" type="button" data-oper='reregAcm'>숙소 재신청</button>
		</div>
		<br><br><br>
		
			
	<div class="col-lg-3">
    <div class="panel panel-default" >

      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소대표사진</label> <div class="pull-right"></div>
	          <div class="slideshow-container">
					<br><br>

					<div class="mySlides" id="mySlide0">
					  <div class="numbertext">1 / 6</div>
					</div>
					
					<div class="mySlides" id="mySlide1">
					  <div class="numbertext">2 / 6</div>
					  
					</div>

					<div class="mySlides" id="mySlide2">
					  <div class="numbertext">3 / 6</div>
					</div>

					<div class="mySlides" id="mySlide3">
					  <div class="numbertext">4 / 6</div>
					</div>

					<div class="mySlides" id="mySlide4">
					  <div class="numbertext">5 / 6</div>
					</div>

					<div class="mySlides" id="mySlide5">
					  <div class="numbertext">6 / 6</div>
					</div>
					
					
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				<!-- 여기에 넣쟈 -->	
					<br>
					
			<div id="dots" style="text-align:center">
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
	</div>	
		
		<!-- 숙소 정보 -->
 	
		<div class="col-lg-9">
		<div class="panel panel-default">
			<!-- /.panel-heading -->
			<div class="panel-body">
			<div class="form-group">
				<label>숙소 정보</label> 
				<span class="pull-right"><c:out value="${acm.acmNum}" />&nbsp;<span id="<c:out value="${acm.acmActi}" />"></span>
				&nbsp;<button type="button" data-oper='editAcm'>숙소 정보 변경</button>
				</span>
				<input type="hidden" name="acmNum" id="acmNum" value='<c:out value="${acm.acmNum}" />'>
				<br><br>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>숙소 이름</th>
							<th>숙소 상태</th>
							<th>숙소 유형</th>
							
							<th>숙소 대표번호</th>
							<th>보조 연락처</th>
							
						</tr>
					</thead>

						<tr>
							<td><c:out value="${acm.acmName}" /></td>
							<td><span style="color:red;"><c:out value="${acm.acmStatus}" /></span></td>
							<td><span id="<c:out value="${acm.acmType}" />"></span></td>
							<td><c:out value="${acm.repPhone}" /></td>
							<td><c:out value="${acm.subPhone}" /></td>
						</tr>
						
					<thead>
						<tr>
							<th>숙소 팩스</th>
							<th>체크인/체크아웃</th>
							<th>숙소 이메일</th>
							<th colspan="2">숙소 위치</th>
						</tr>
					</thead>

						<tr>
							<td><c:out value="${acm.acmFax}" /></td>
							<td><c:out value="${acm.checkinTime}" />&nbsp;/&nbsp;<c:out value="${acm.checkoutTime}" /></td>
							<td><c:out value="${acm.acmEmail}" /></td>							
							<td colspan="2"><c:out value="${acm.acmCity}" />&nbsp;<c:out value="${acm.acmDistr}" />&nbsp;<c:out value="${acm.acmDetailaddr}" /></td>
						</tr>
					<thead>
						<tr>
							<th colspan="5">숙소 소개</th>
						</tr>
					</thead>	
						<tr>
							<td colspan="5"><c:out value="${acm.acmDesc}" /></td>
						</tr>	
					<thead>
						<tr>
							<th colspan="5">숙소 옵션</th>
						</tr>
					</thead>	
						<tr>
							<td colspan="5"><div id="acmOpt">&nbsp;</div></td>
						</tr>
				</table>
				</div>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
		<!-- 객실정보 -->
		
		<div class="col-lg-9">
		<div class="panel panel-default hostonly">
			<div class="panel-heading">
				객실 정보<span class="pull-right"><button type="button" data-oper='editRom'>객실 정보 변경</button>&nbsp;<button type="button" data-oper='newRom'>객실 추가</button></span>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 사진</th>
							<th>객실 이름</th>
							<th>객실 유형</th>
							<th>크기 및 인원</th>
							<th>침대 및 개수</th>
						</tr>
					</thead>

					<c:forEach items="${roms}" var="roms">
						<tr>
							<td>
								<img style=' width: auto; height: 50px; max-width: 100px; margin-left :5px;' id='rPicture' src='/review/display?fileName=<c:out value="${roms.romPurl}" /><c:out value="${roms.romPname }" />'>
							</td>
							<td><c:out value="${roms.romName}" /></td>
							<td><c:out value="${roms.romType}" /></td>
							<td><c:out value="${roms.romSize}" />m2&nbsp;&nbsp;<c:out value="${roms.romCapa}" />명</td>
							<td><c:out value="${roms.bedType}" />&nbsp;&nbsp;<c:out value="${roms.bedCnt}" />개</td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		
		
			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
		</div>
</div>
				
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	//getAcm 페이지가 켜질때
	var stat='<c:out value="${acm.acmStatus}" />';
	if(stat!="DENIED"){
		$("#isDenied").css("display","none"); 
	}
	
	
	//사진크게보기
	var img = document.getElementsByTagName("img");
    for (var x = 0; x < img.length; x++) {
      img.item(x).onclick=function() {window.open(this.src)}; 
    }
	
		
	var acmAc='<c:out value="${acm.acmActi}" />';//숙소ACTIVE여부
		console.log(acmAc);
		if(acmAc.trim()=="ACTIVE"){
			$('#<c:out value="${acm.acmActi}"/>').append("숙소 운영중");
		}
			
		else if(acmAc.trim()=="INACTIVE"){//집천체
			$('#<c:out value="${acm.acmActi}"/>').append("숙소 비운영중");
		}	
		
		
		
		////////////////////
		var acmType='<c:out value="${acm.acmType}" />';//숙소ACTIVE여부
		console.log(acmAc);
		if(acmType.trim()=="H"){
			$('#<c:out value="${acm.acmType}"/>').append("집전체");
		}
			
		else if(acmType.trim()=="PD"||acmType.trim()=="P"){//집천체
			$('#<c:out value="${acm.acmType}"/>').append("객실별");
		}
	
		getAcmOpt();
		//getRomOpt();
		
		//사진슬라이드 펑션 부르기
		let mySlides=new Array();

		for(let i=0;i<6;i++){
			mySlides[i]=document.getElementById("mySlide"+ i);//넣는곳
		}
		
		let j=0;
		<c:forEach items="${acmPics}" var="pic">
			mySlides[j].innerHTML+="<img style='align:center;max-width: 250px; width:auto;height:300px;' src='/display?fileName=<c:out value="${pic.picAcmpurl}" /><c:out value="${pic.picAcmpname }"/>'>";
			j++;
		</c:forEach>
	
	/*<div class="mySlides">
		 <img style='align:center;width: 250px; height:auto;' id='rPicture' src='/review/display?fileName=<c:out value="${acm.acmPurl}" /><c:out value="${acm.acmPname }" />'>
	</div>*/
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
		
		
				
		option= pad(dec2bin("${acm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(option.length-1-k) == 1){
				document.getElementById("acmOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
			}
		}

	}
	
	$(document).ready(function(){
		var formObj = $("#actionForm");
		var acmNum=$('#acmNum').val();

		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtolist'){
				alert("숙소목록으로 돌아갑니다");
				location.href="/hosting/listings";
			} else if(operation==='viewMyacm'){
				alert("==준비중(검색시 객실 연출 페이지)===");
			}else if(operation==='editAcm'){
				formObj.append("<input type='hidden' name='acmNum' value='"+acmNum+"'>");
				formObj.attr("action","/hosting/modiAcm");
				formObj.submit();					
			} else if(operation==='newRom'){
				var openWin;//자식창
				
				var _width='800';
				var _height='800';
				
				var _left=Math.ceil((window.screen.width-_width)/2);
				var _top=Math.ceil((window.screen.width-_height)/2);
				
				
		        window.name = "parentForm";
		        

		        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		        openWin = window.open('/hosting/newRompop?acmNum='+acmNum,'childForm',
		        		'width='+_width+', height='+_height+', left='+_left+', top='+_top+', resizable = no, scrollbars = no');   
		        
			}else if(operation==='editRom'){
				var openWin;//자식창
				
				var _width='800';
				var _height='800';
				
				var _left=Math.ceil((window.screen.width-_width)/2);
				var _top=Math.ceil((window.screen.width-_height)/2);
				
				
		        window.name = "parentForm";
		        

		        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		        openWin = window.open('/hosting/modiRompop?acmNum='+acmNum,'childForm',
		        		'width='+_width+', height='+_height+', left='+_left+', top='+_top+', resizable = no, scrollbars = no');   
		        
				
			}else if(operation==='reregAcm'){
				alert("숙소를 재신청합니다");
				formObj.append("<input type='hidden' name='acmNum' value='"+acmNum+"'>");
				formObj.attr("method","post");
				formObj.attr("action","/hosting/reregAcm");
				formObj.submit();
			}else if(operation==='removeAcm'){
				if(confirm("숙소를 정말 삭제하시겠습니까?")==true){//숙소, 객실 INACTIVE되어야함
					alert(acmNum);
					formObj.append("<input type='hidden' name='acmNum' value='"+acmNum+"'>");
					formObj.attr("method","post");
					formObj.attr("action","/hosting/removeAcm");
					formObj.submit();
				} else {
					return false;
				}
			}  
		});
	});
	

	$(document).ready(function(){
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
	   
	   });
	 
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
		
	 
</script>








<%@include file="../includes/footer.jsp"%>
`