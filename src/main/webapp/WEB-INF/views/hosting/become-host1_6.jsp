<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/hostheader.jsp"%>
<!-- nav-sidebar -->
 <style>
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
        
  </style>


<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       <li>
                           <a><c:out value="${userFstname}"/>님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        <li>
                            <a href=""><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">

		<!-- 기억하기가 되면 좋겠다  중간저장?-->
		<br><br>
		<form id="actionForm" action="/hosting/become-host1_6" method="post">
			  
			  
			<div class="opt" id="opt">  
			  
			  <input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
			  <h4>5.숙소에서 공통적으로 제공하는 옵션</h4><br>
			  <h6>한개 이상의 옵션을 선택하셔야합니다</h6>	
			  
			  <h4>5-1.시설 옵션</h4> <!-- checkbox는 name값을 key값으로 갖기때문에 같게 두고, value값만 다르게 준다 -->
			  	<input type="checkbox" id="SW" name="acmOptcode" value="1"><label for="SW">수영장</label>
			   <input type="checkbox" id="PK" name="acmOptcode" value="2"><label for="PK">주차장</label>
			   <input type="checkbox" id="PU" name="acmOptcode" value="4"><label for="PU">공항 등 교통편 서비스</label>
			   <input type="checkbox" id="GM" name="acmOptcode" value="8"><label for="GM">체육관/피트니스</label>
			   <input type="checkbox" id="FD" name="acmOptcode" value="16"><label for="FD">24시간 프런트 데스크</label>
			   <input type="checkbox" id="FA" name="acmOptcode" value="32"><label for="FA">가족/아동 여행객 친화형 시설</label>
			   <input type="checkbox" id="NS" name="acmOptcode" value="64"><label for="NS">금연</label>
			   <input type="checkbox" id="SP" name="acmOptcode" value="128"><label for="SP">스파/사우나</label><br>
			   <input type="checkbox" id="RT" name="acmOptcode" value="256"><label for="RT"> 레스토랑</label>
			   <input type="checkbox" id="SA" name="acmOptcode" value="512"><label for="SA"> 흡연구역</label>
			   <input type="checkbox" id="WP" name="acmOptcode" value="1024"><label for="WP">반려동물 동반 가능</label>
			   <input type="checkbox" id="AD" name="acmOptcode" value="2048"><label for="AD">장애인용 편의시설/서비스</label>
			   <input type="checkbox" id="VC" name="acmOptcode" value="4096"><label for="VC">비즈니스 관련 편의 시설</label>
			   <input type="checkbox" id="WF" name="acmOptcode" value="8192"><label for="WF">인터넷</label>
			   
			   <br><br>
							  
			   <h4>5-2.식사 옵션</h4>
			   <input type="checkbox" id="BF" name="acmOptcode" value="16384"><label for="BF">조식</label>
			   <input type="checkbox" id="DN" name="acmOptcode" value="32768"><label for="DN">석식</label>
			   
			 </div>
			   

			   <br><br>
			  <h4>6.숙소에 대한 설명과 교통편,지켜야할 사항 등을 적어주세요</h4>
			  <textarea name="acmDesc" id="acmDesc" placeholder="꼼꼼한 숙소설명은 고객들이 숙소를 더 많이 찾게하는 요소입니다"cols="50" rows="5"></textarea>
			 	
			  
				  
		  <!-- 총 검토 -->
		  <br><br><br>
		  <button type="button" onclick="if(readyForreg()){romRegit()}">다음으로</button>
		</form>
		</div>

<!-- return readyForreg() -->


<script type="text/javascript">
	var chkArr = []; //배열 초기화

	function readyForreg() {
	    
	    $("input[name=acmOptcode]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
	       //console.log('checkbox값:'+$(this).val());
	       chkArr.push($(this).val());
	    });
	
	    if(chkArr.length==0){
	       alert('하나 이상의 숙소유형을 골라주셔야합니다');
	       $(this).focus();
			return false;	       
	    }
	    
	    var acmDesc =document.getElementById("acmDesc");
	    
	    if(acmDesc.value.length>400){
		       alert('숙소에 대한 설명이 너무 깁니다!(400자 내)');
				return false;	       
		}
	    
	    return true;
	 }
	
	//안쓴다앗
	function romRegit(){
	
		alert("숙소 옵션이 추가되었습니다");
		document.getElementById('actionForm').submit();
	}
	

</script>














