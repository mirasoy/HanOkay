<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.ana.domain.UserVO"%>
<!-- 세션에 user라는 키로 저장된 userVO 인스턴스를 가져온다 -->
<%
		UserVO user = (UserVO) session.getAttribute("user");
		String userLastName = "";
		String userFstName = "";
		String userPriv="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userLastName = user.getUserLastName();
			userFstName = user.getUserFstName();
			userPriv = user.getUserPriv();
			
		}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Han:ok- Make yourself at home in Korea</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
	<style>
		html,body{
			font-family:Verdana, sans-serif;
			background-color:white;
		}
		
		#logo{
			width:50px;
			height:20px;
		}
		
		.acttive{   
		  border-bottom: 5px solid #775062; 
		}
		
		.panel-heading {
			color: white !important;
			background-color: #775062 !important;
			border-radius: 0px !important;
			border-color: #ddd;
		}
		
		
		/*사진*/
		
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
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:20px;margin-bottom:0;background-color:white;">

            <div class="navbar-header" style="margin-bottom:15px;">
                
				<!-- 로고자리 -->
                <a class="navbar-brand" href="/admin/adminindex">Han:Ok for Admin</a>
            </div>
            <!-- /.navbar-header -->

			<!-- 왼쪽 nav -->
            <ul class="nav navbar-top-links navbar-left">
				<li class="nav-menu">
					<a href="/admin/adminlistings">숙소관리</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/userStat" class="acttive">회원관리</a>
				</li>
				<li class="nav-menu" class="testbtn">
					<a href="#">메시지</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/stats/mapChart">매출관리</a>
				</li>
				
			</ul>
			
			
			<!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
           		<li class="nav-menu">
					<a href='/acm/list'>메인으로</a>
				</li>
				<li class="nav-menu">
					<a href='/hosting/listings'>호스트 모드 보기</a>
				</li>
				
					
            </ul>
        </nav>
        </div>

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	 $(document).ready(function() {
		  var user='<%=user%>';
		   if(user==null){
			   alert("회원만 접근할 수 있습니다");
			   location.href="/acm/list";
		   }
		   
		   
		  var priv ='<%=userPriv%>';
	      if(priv!="ADMIN"){
	    	  alert("관리자만 접속할수 있습니다");
	    	  location.href="/acm/list";
	      } 
	 });

	   
	</script>
  <!-- 숙소 방 추가 모달로 띄우기-->
<div id="page-wrapper" style="padding-bottom:50px;margin-left:0px;">
 
	<br>	
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">			
  <!-- 수정, 삭제 가능하게  -->
  		  
<div class="row">
	  <div class="col-lg-12">
	    <h4>'<c:out value="${pendinghostacm.userFstName }"/>' 회원님의 호스트 요청</h4><br>
	  </div>
	  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
	 <input type="hidden" name="userNum" id="userNum" value="<c:out value='${pendinghostacm.userNum }'/>">
      
<div class="row">
  <div class="col-lg-3">
    <div class="panel panel-default" >

      <div class="panel-heading">회원 정보</div>
      <!-- /.panel-heading -->
	      <div class="panel-body">
			<div class="form-group">
	          <label>회원번호</label>&nbsp; <c:out value="${pendinghostacm.userNum }"/>
	        </div>	
	        <div class="form-group">
	          <label>회원이름</label>&nbsp; <c:out value="${pendinghostacm.userFstName }"/><c:out value="${pendinghostacm.userLastName }"/></div>
	        <div class="form-group">
	          <label>회원 권한/상태</label>&nbsp;<c:out value="${pendinghostacm.userPriv }"/>/<c:out value="${pendinghostacm.userStatusCode }"/>
	        </div>
	        <div class="form-group">
	          <label>숙소 상태</label>&nbsp; <span style="color:red;"><c:out value="${pendinghostacm.acmStatus }"/></span>
	        </div>
			<div class="form-group">
	          <label>회원 사업자번호</label>&nbsp; <c:out value="${pendinghostacm.bizRegnum }"/>
	        </div>
			
		</div>
		</div>
		
			<button data-oper='uptoHost' class="btn btn-default">호스트 수락</button>
			<button data-oper='returnHost' class="btn btn-danger">호스트 거절</button><!-- 이유를 써서 알림으로 가게끔 하자2.5차 -->
			<button data-oper='backtoIndex' class="btn btn-info" >홈으로</button>
		
		
	</div><!-- col-lg-4 end -->
	
  <div class="col-lg-6">
    <div class="panel panel-default" >

      <div class="panel-heading">
      	숙소정보<label class="pull-right"><c:out value="${pendinghostacm.acmNum }"/>&nbsp;<c:out value="${pendinghostacm.acmType}"/></label>
      </div>
      <input type="hidden" name="acmNum" id="acmNum" value="<c:out value='${pendinghostacm.acmNum }'/>">
      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소이름</label> <input class="form-control" name='acmName' id='acmName'
	            value='<c:out value="${pendinghostacm.acmName}"/>' size="20" readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 주소</label> <input class="form-control" name='acmAddr'
	            value='<c:out value="${pendinghostacm.acmCity}"/>&nbsp;<c:out value="${pendinghostacm.acmDistr}"/>&nbsp;<c:out value="${pendinghostacm.acmDetailaddr}"/>' readonly="readonly"> 
	        </div>
	        <div class="form-group">
	          <label>숙소 대표번호/호스트연락처</label> <input class="form-control" name='repPhone'
	            value='<c:out value="${pendinghostacm.repPhone }"/>/<c:out value="${pendinghostacm.subPhone }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>체크인, 체크아웃 시간</label> <input class="form-control" name='checkTime'
	            value='<c:out value="${pendinghostacm.checkinTime }"/>/<c:out value="${pendinghostacm.checkoutTime }"/>' readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label>숙소 이메일/팩스번호</label> <input class="form-control" name='acmEmail'
	            value='<c:out value="${pendinghostacm.acmEmail }"/>/<c:out value="${pendinghostacm.acmFax }"/>' readonly="readonly">
	        </div>
			<div class="form-group">
	          <label>숙소 설명</label> <textarea class="form-control" name='acmDesc' readonly="readonly"><c:out value="${pendinghostacm.acmDesc }"/></textarea>
	        </div>
	        <div class="form-group">
	          <label>숙소 옵션</label> 
	          	<div id="acmOpt"></div>
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
					<br><br>

					<div class="mySlides" id="mySlide0">
					  <div class="numbertext">1 / 7</div>
					</div>
					
					<div class="mySlides" id="mySlide1">
					  <div class="numbertext">2 / 7</div>
					  
					</div>

					<div class="mySlides" id="mySlide2">
					  <div class="numbertext">3 / 7</div>
					</div>

					<div class="mySlides" id="mySlide3">
					  <div class="numbertext">4 / 7</div>
					</div>

					<div class="mySlides" id="mySlide4">
					  <div class="numbertext">5 / 7</div>
					</div>

					<div class="mySlides" id="mySlide5">
					  <div class="numbertext">6 / 7</div>
					</div>
					<div class="mySlides" id="mySlide6">
					  <div class="numbertext">6 / 7</div>
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
			    <span class="dot" onclick="currentSlide(7)"></span> 
			</div>
          </div>
			
		</div>
		</div>
	</div><!-- col-lg-3 end -->
	
</div>	
		
		
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

					<c:forEach items="${pendingroms}" var="rom">
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

<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>
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
		
		//사진크게보기
		var img = document.getElementsByTagName("img");
	    for (var x = 0; x < img.length; x++) {
	      img.item(x).onclick=function() {window.open(this.src)}; 
	    }
		
	  //사진슬라이드 펑션 부르기
		let mySlides=new Array();

		for(let i=0;i<7;i++){
			mySlides[i]=document.getElementById("mySlide"+ i);//넣는곳
		}
		
		let j=0;
		<c:forEach items="${acmPics}" var="pic">
			mySlides[j].innerHTML+="<img style='align:center;max-width:250px;width: auto; height:200px;' src='/display?fileName=<c:out value="${pic.picAcmpurl}" /><c:out value="${pic.picAcmpname }"/>'>";
			j++;
		</c:forEach>
	    
	    
	    		getAcmOpt();
		var formObj = $("#actionForm");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtoIndex'){
				alert("목록으로 돌아갑니다");
				formObj.attr("action","/admin/adminindex");	
			} else if(operation==='uptoHost'){
				alert("Host전환이 처리되었습니다");//HOST로 격상, 숙소 객실 ACTIVE전환
				formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
				formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
				
				formObj.attr("method","post");
				formObj.attr("action","/admin/moditoHost");
			} else if(operation==='returnHost'){
				if(confirm("회원의 요청을 거절하시겠습니까?")==true){//숙소, 객실 INACTIVE되어야함
					formObj.append("<input type='hidden' name='userNum' value='"+$('#userNum').val()+"'>");
					formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");	
					formObj.attr("method","post");
					formObj.attr("action","/admin/moditoGuest");
				} else {
					return false;
				}
			}
			actionForm.submit();
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
		
		
				
		option= pad(dec2bin("${pendinghostacm.acmOptcode}"));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
		
	
		for(let k=0; k<option.length; k++){
			if(option.charAt(k) == 1){
				document.getElementById("acmOpt").innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true"></i>'+nameArr[k]+'</span>'+'&nbsp;';
				
			}
		}
	
	}
	

</script>
<%@include file="../includes/footer.jsp"%>











