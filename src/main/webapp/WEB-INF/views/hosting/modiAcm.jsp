<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.ana.domain.UserVO"%>
<!-- 세션에 user라는 키로 저장된 userVO 인스턴스를 가져온다 -->
<%
      UserVO user = (UserVO) session.getAttribute("user");
      String userLastName = "";
      String userFstName = "";
      String userPwd = "";
      String userNum = "";
      String userPriv ="";
      String userStatusCode ="";//이걸로 새 숙소등록하기가 보이던지 사업자등록증이 보이던지 결정할거임
      //userNum = "U1";
      
      //user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
      if (user != null) {
         userLastName = user.getUserLastName();
         userFstName = user.getUserFstName();
         userPwd = user.getUserPwd();
         userNum = user.getUserNum();
         userPriv=user.getUserPriv();
         userStatusCode=user.getUserStatusCode();
      }
      
%>
   <style>
   
   
.testbtn {
  border:none;
  outline: none;
  padding: 10px 16px;
  cursor: pointer;
  font-size: 18px;
  color : #000;
  background-color:#fff;
  
}


.acttive{   
  border-bottom: 5px solid #235d6e; 
}
   
   
   
   
   .panel-heading {
       color: #333;
       background-color: #235d6e !important;
       border-color: #ddd;
    }
   </style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Han:ok- host's place for better places</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- 미라 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/stats.css">
   <style>
      html,body{
         font-family:Verdana, sans-serif;
         background-color:white;
      }
      
      #logo{
         width:50px;
         height:20px;
      }
   </style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:20px;margin-bottom:0;background-color:white;">

            <div class="navbar-header" style="margin-bottom:15px;">     
            <!-- 로고자리 -->
                <a class="navbar-brand" href="/hosting/hostindex">Han:Ok for Host</a>
            </div>
            <!-- /.navbar-header -->

         <!-- 왼쪽 nav -->
        <ul class="nav navbar-top-links navbar-left" id="hostonly">
            <li class="nav-menu">
               <a href="/hosting/reserv" >예약</a><!-- 예약관리 -->
            </li>
            <li class="nav-menu">
               <a href="/hosting/listings" class="acttive">숙소</a>
            </li>
            <li class="nav-menu">
               <a href="/chat/chatList2">메시지</a>
            </li>
            <li class="nav-menu">
               <a href="/hosting/stats/statsChart">성취도</a>
            </li>
         </ul>
         
         <!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="nav-menu">
             	  <a id="adminonly" href='/admin/adminindex'>관리자 모드 보기</a>
            	</li>
                 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                           <c:out value="${userFstname}"/>님 환영합니다!<i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="/memmode/profile">
                                <div>
                                       프로필
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="/memmode/account">
                                <div>
                                       계정
                                </div>
                            </a>
                        </li>
                        
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                       커뮤니티 센터
                                </div>
                            </a>
                        </li>
                       
                        <li class="divider"></li>
                        <li>
                            <a href="/acm/list">
                                <div>
                                       Han:ok 메인페이지로
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href='/user/logout'>
                                <div>
                                       로그아웃
                                </div>
                            </a>
                        </li>
                     </ul>
                     
                     </li>
                     </ul>
                     
        </nav>
</div>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
     var user='<%=user%>';
      if(user==null){
         alert("회원만 접근할 수 있습니다");
         location.href="/acm/list";
      }
     var priv ='<%=userPriv%>';
      var userStatusCode='<%=userStatusCode%>';        
               
      if(priv!="ADMIN")$("#adminonly").css("display","none"); 
      if(userStatusCode=="ACTIVE"){
         alert("숙소등록을 한 회원만 접근할 수 있습니다");
         location.href="/acm/list";

      } else if(userStatusCode=="HO_PENDING"){
         $("#hostonly").css("display","none"); 
     }
   });
   
/*    
   $('#hostonly li').click(function(e) {
       console.log("잘된다");
       e.preventDefault();
       $('#hostonly li').removeClass('acttive');
       $(this).addClass('acttive');
    });      
 }); */


   
</script>


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
		
	input[type=checkbox] {
            display:none;
            margin:10px;
        }
    
     input[type=checkbox] + label {
         display:inline-block;
         margin:2px;
         padding: 4px 10px;
         background-color: #e7e7e7;
         border-color: #ddd;
         border-radius: 10px;
     }
     /*
      Change background color for label next to checked radio button
      to make it look like highlighted button
     */
     input[type=checkbox]:checked + label {
        background-image: none;
         background-color:cornflowerblue;
         color: white;
     }
     
     #this{
     	background-color:cornflowerblue
     	 color: white;
     }		
	</style>
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
	<br>		
		<!-- 중앙정렬 -->
	<div style="margin-left:15%;margin-right:15%;">		
  <!-- 숙소 방 추가 모달로 띄우기-->
		<div class="col-lg-10">
		<button class="btn btn-default" type="button" data-oper='backtolist'>숙소 목록으로</button>
		<button class="btn btn-default" type="button" data-oper='back'>숙소 변경 취소</button>
		<button class="btn btn-info" type="button" data-oper='modiAcm'>숙소 정보 변경</button>
		</div>
		<br><br><br>
		
			
	<div class="col-lg-3">
    <div class="panel panel-default" >

      <!-- /.panel-heading -->
	      <div class="panel-body">
			
	        <div class="form-group">
	          <label>숙소대표사진</label> <button class="pull-right" type="button" data-oper='editAcmPic'>숙소 사진 변경</button>
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
				<label>숙소 정보</label> <span class="pull-right"><c:out value="${acm.acmNum}" />&nbsp;<span id="<c:out value="${acm.acmActi}" />"></span></span>
				
				
				<form id="acmForm"><!-- 보내는 정보 -->
				<input type="hidden" name='acmNum' id='acmNum' value='<c:out value="${acm.acmNum}"/>'>
				<br>
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
							<td>
							<select class="form-control"  style="width:100px;display:inline-block;" name="acmType" id="acmType">
							  <option value="PD">객실별</option>
							  <option value="H">집전체</option>
							</select>
							</td>
							<td><input size="10" class="form-control" name='repPhone' id='repPhone'
						            value='<c:out value="${acm.repPhone }"/>'></td>
							<td>
								<input size="10" class="form-control" name='subPhone' id='subPhone'
						            value='<c:out value="${acm.subPhone }"/>'>
							</td>
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
							<td>
							<input size="10" class="form-control" name='acmFax' id='acmFax'
						            value='<c:out value="${acm.acmFax}" />'>
							</td>
							<td>
							
							<select class="form-control"  style="width:150px;" name="checkinTime" id="checkinTime">
							  <option value="PM12">점심12시이후</option>
							  <option value="PM01">1시이후</option>
							  <option value="PM02">2시이후</option>
							  <option value="PM03">3시이후</option>
							  <option value="PM04">4시이후</option>
							  <option value="PM05">5시이후</option>
							  <option value="PM06">6시이후</option>
							  <option value="PM07">7시이후</option>
							  <option value="PM08">8시이후</option>
							  <option value="PM09">9시이후</option>
							  <option value="PM10">10시이후</option>
							  <option value="anytime">상관없음</option>
							</select>
							<select class="form-control"  style="width:150px;" name="checkoutTime" id="checkoutTime">
							  <option value="PM09">오전9시이전</option>
							  <option value="PM10">오전10시이전</option>
							  <option value="PM11">오전11시이전</option>
							  <option value="PM12">12시이전</option>
							  <option value="PM01">1시이전</option>
							  <option value="PM02">2시이전</option>
							  <option value="PM03">3시이전</option>
							  <option value="PM04">4시이전</option>
							  <option value="PM05">5시이전</option>
							</select>
							
							</td>
							<td>
								<input size="10" class="form-control" name='acmEmail' id='acmEmail'
						            value='<c:out value="${acm.acmEmail}" />'>
							</td>							
							<td colspan="2"><c:out value="${acm.acmCity}" />&nbsp;<c:out value="${acm.acmDistr}" />&nbsp;<c:out value="${acm.acmDetailaddr}" /></td>
						</tr>
					<thead>
						<tr>
							<th colspan="5">숙소 소개</th>
						</tr>
					</thead>	
						<tr>
							<td colspan="5"><textarea class="form-control" name="acmDesc" id="acmDesc" cols="50" rows="5"><c:out value='${acm.acmDesc}' /></textarea>
</td>
						</tr>	
					<thead>
						<tr>
							<th colspan="5">숙소 옵션</th>
						</tr>
					</thead>	
						<tr>
							<td colspan="5">
								<input type="checkbox" id="SW" name="acmOptcodeChk" value="1"><label for="SW">수영장</label>
							   <input type="checkbox" id="PK" name="acmOptcodeChk" value="2"><label for="PK">주차장</label>
							   <input type="checkbox" id="PU" name="acmOptcodeChk" value="4"><label for="PU">픽업 서비스</label>
							   <input type="checkbox" id="GM" name="acmOptcodeChk" value="8"><label for="GM">체육관/피트니스</label>
							   <input type="checkbox" id="FD" name="acmOptcodeChk" value="16"><label for="FD">24시간 프런트</label>
							   <input type="checkbox" id="FA" name="acmOptcodeChk" value="32"><label for="FA">가족/아동 친화형</label>
							   <input type="checkbox" id="NS" name="acmOptcodeChk" value="64"><label for="NS">금연</label>
							   <input type="checkbox" id="SP" name="acmOptcodeChk" value="128"><label for="SP">스파/사우나</label><br>
							   <input type="checkbox" id="RT" name="acmOptcodeChk" value="256"><label for="RT"> 레스토랑</label>
							   <input type="checkbox" id="SA" name="acmOptcodeChk" value="512"><label for="SA"> 흡연구역</label>
							   <input type="checkbox" id="WP" name="acmOptcodeChk" value="1024"><label for="WP">반려동물 동반</label>
							   <input type="checkbox" id="AD" name="acmOptcodeChk" value="2048"><label for="AD">장애우 시설/서비스</label>
							   <input type="checkbox" id="VC" name="acmOptcodeChk" value="4096"><label for="VC">비즈니스 특화</label>
							   <input type="checkbox" id="WF" name="acmOptcodeChk" value="8192"><label for="WF">인터넷</label>
							   
							   <input type="checkbox" id="BF" name="acmOptcodeChk" value="16384"><label for="BF">조식</label>
							   <input type="checkbox" id="DN" name="acmOptcodeChk" value="32768"><label for="DN">석식</label>
							
							
							</td>
						</tr>
				</table>
				</form>
				
				
				
				</div>
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
	
	
	var acmOptsum=0;
	
	$(document).ready(function(){
		var formObj = $("#actionForm");
		var acmForm = $("#acmForm");
		var acmNum="<c:out value='${acm.acmNum}'/>";

		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='backtolist'){
				alert("숙소목록으로 돌아갑니다");
				location.href="/hosting/listings";
			} else if(operation==='back'){//getAcm 페이지
				alert("취소되었습니다");
				formObj.append("<input type='hidden' name='acmNum' value='"+acmNum+"'>");
				formObj.attr("action","/hosting/getAcm");
				formObj.submit();
			} else if(operation==='modiAcm'){
				if(readyForreg()===true){
				alert("숙소를 수정합니다");
				acmForm.append("<input type='hidden' name='acmOptcode' value='"+acmOptsum+"'>");
				acmForm.attr("method","post");
				acmForm.attr("action","/hosting/modiAcm");
				acmForm.submit();
				}
			}  
		});
	});

	var chkArr = []; //배열 초기화
	function readyForreg() {
	    acmOptsum=0;//초기화
	    $("input[name=acmOptcodeChk]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
	       //console.log('checkbox값:'+$(this).val());
	       chkArr.push($(this).val());
	    	acmOptsum=parseInt(acmOptsum)+parseInt($(this).val());
	    });
	
	    if(chkArr.length==0){
	       alert('하나 이상의 숙소옵션을 골라주셔야합니다');
			return false;	       
	    }
	    
	    var repPhone=document.getElementById("repPhone");
		if (repPhone.value.trim()=='') {
			alert("대표 전화번호를 입력해주세요(16자리이내)");
			repPhone.focus();
			return false;		
		}
		
		if (repPhone.value.length > 17) {
			alert("대표 전화번호는 16자리 이내입니다");
			repPhone.value=repPhone.value.substring(0, 17);
			repPhone.focus();
			return false;		
		}
		
		var acmEmail=document.getElementById("acmEmail");
		if (acmEmail.value.trim()=='') {
			alert("이메일을 입력해주세요");
			acmEmail.focus();
			return false;		
		}
		if(!CheckEmail(acmEmail.value)) {
			alert("이메일 형식에 어긋납니다");
			acmEmail.focus();
			return false;
		}
		
		var subPhone=document.getElementById("subPhone");
		if (subPhone.value.trim()=='') {
			if(confirm("보조 연락처를 작성하셔야 숙소운영에 도움이 됩니다.계속 진행하시겠습니까?")==false){
				subPhone.focus();
				return false;	
			} else{
				subPhone.value="-";
			}
		}
		
		if (subPhone.value.length > 17) {
			alert("보조연락처는 16자리 이내입니다");
			subPhone.value=subPhone.value.substring(0, 17);
			subPhone.focus();
			return false;		
		}
	    
	    var acmDesc =document.getElementById("acmDesc");
	    
	    if(acmDesc.value.length>400){
		       alert('숙소에 대한 설명이 너무 깁니다!(400자 내)');
				return false;	       
		}
	    
	    var acmFax=document.getElementById("acmFax");
		if (acmFax.value.trim()=='') {
			acmFax.value="-";
		}
		
		if (acmFax.value.length > 17) {
			alert("팩스번호는 16자리 이내입니다");
			acmFax.value=acmFax.value.substring(0, 17);
			acmFax.focus();
			return false;		
		}
	    
	    return true;
	 }


	

	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='acmNum' value='"+$(this).attr("href")+"'>");
			
			actionForm.attr("action","/hosting/getAcm");
			actionForm.submit();
		});
	});
	
	//이메일 정규식
	function CheckEmail(str){                                                 
		// 이메일이 적합한지 검사할 정규식    
		var re =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
		if(!re.test(str)) {                            
	          return false;         
	     }                            
	     else {                       
	          return true;         
	     }                            
	} 

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