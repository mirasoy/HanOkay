<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/hostheader.jsp"%>
<!-- nav-sidebar -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                
	              //내가추가(지번주소를 자른다)
	            	var full=document.getElementById("sample6_address");
	            	var parts=full.value.split(' ');
	            	
	            	var acmCity=document.getElementById("acmCity");
	            	acmCity.value=parts[0]; //앞도시부분을 담는다
	            	
	            	var acmDistr=document.getElementById("acmDistr");
	            	acmDistr.value=parts[1];
	            	                
	            	var extra=full.value.substring(parts[0].length+parts[1].length+2);
	            	
	            	var acmDetailaddr=document.getElementById("acmDetailaddr");
	            	acmDetailaddr.value=extra;
	                
	                
	                
	                
	            }
	        }).open();
	    }
	</script>



<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <!-- 사업자 등록도 받을것 -->
                    
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
		<form id="actionForm" action="/hosting/become-host" method="post">


			<div class="acm" id="acm"><br><h6>*항목은 필수입력값입니다</h6>	  
				<h4>*1.게스트가 묵게 될 숙소의 유형을 골라주세요(중복허용)</h4>
				<input type="checkbox" id="acmType_house" name="acmType" value="house"><label for="rentType1">집 천제</label> 
				<input type="checkbox" id="acmType_priv" name="acmType" value="priv"><label for="rentType2">개인실</label> 
				<input type="checkbox" id="acmType_multi" name="acmType" value="multi"><label for="rentType3">도미토리</label> 
			
			<br>	
			  <h4>*2.숙소 이름과 정보</h4>
			   <input type="text" id="acmName" name="acmName" placeholder="숙소의 이름"><br><br>
			   <!-- 구글 API추가해야함 /우선 다음 API 사용하겠음-->
			   
			   <!-- <input type="text" id="acmCity" name="acmCity" placeholder="숙소 시도"><br>
			   <input type="text" id="acmDistr" name="acmDistr" placeholder="숙소 구군"><br>
			   <input type="text" id="acmDetailaddr" name="acmDetailaddr" placeholder="숙소 상세주소"><br><br>
 				-->

				<input type="hidden" id="sample6_postcode" placeholder="우편번호">
				<input type="hidden" id="sample6_address" placeholder="주소"><br>
				<input type="hidden" id="sample6_detailAddress" value="sth" placeholder="상세주소">
				<input type="hidden" id="sample6_extraAddress" value="sth" placeholder="참고항목">

				
				<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
				<input type="text" id="acmCity" name="acmCity" size="10" placeholder="숙소시도" readonly="readonly">
				<input type="text" id="acmDistr" name="acmDistr" size="20" placeholder="숙소구군" readonly="readonly"><br>
				<input type="text" id="acmDetailaddr" name="acmDetailaddr" size="20" placeholder="숙소상세" readonly="readonly"><br>
				
				<span id="guide" style="color:#999;display:none"></span>

			   <input type="text" id="repPhone" name="repPhone" placeholder="숙소 대표번호(-없이)" numberOnly><br>
			   <input type="text" id="acmEmail" name="acmEmail" placeholder="숙소  이메일 주소"><br>
			   <input type="text" id="acmFax" name="acmFax" placeholder="숙소  팩스번호(-없이)" numberOnly><br><br>

			<!-- 위도경도 임시로 넣어줌 -->
			<input type="hidden" id="latitude" name="latitude" value="36.7307216">
			<input type="hidden" id="longitude" name="longitude" value="128.6216116">
			

			  
			  <br><br>
			  <h4>*3.Ana에 숙소를 등록하시려면 사업자 등록증은 필수입니다!</h4>
			  <input type="text" id="bizRegnum" name="bizRegnum" placeholder="사업자등록번호" numberOnly><br><br>
			  <!-- 우선 숨겨두겠음 -->
			  <!-- <input type="hidden" id="bizRegpurl" name="bizRegpurl" placeholder="사업자등록증"><br>
			   -->
			  <h4>*4.숙소의 체크인 체크아웃 타임을 설정해주세요</h4><br>
			  <label for="checkinTime">체크인시간</label>
				<select name="checkinTime" id="checkinTime">
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
			  <label for="checkouTime">체크아웃시간</label>
				<select name="checkoutTime" id="checkoutTime">
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
			 </div> 
			  
			  <br><br>
			  <button type="button" onclick="if(readyForreg()){romRegit()}">다음으로</button><!-- ajax처리안함 -->
			</form>
		</div>

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">

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

	function readyForreg() {
		chkArr = [];
		
	    $("input[name=acmType]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
	       //console.log('checkbox값:'+$(this).val());
	       chkArr.push($(this).val());
	    });

	    if(chkArr.length==0){
	       alert('하나 이상의 숙소유형을 골라주셔야합니다');
	       $(this).focus();
	       return false;
	    }

	    var acmName=document.getElementById("acmName");
		if (acmName.value.length > 10 || acmName.value.trim()=='') {
			alert("숙소이름은 10자로 이내로 정해주세요~");
			acmName.value=acmName.value.substring(0, 10);
			acmName.focus();
			return false;		
		}
	
		var acmDetailaddr=document.getElementById("acmDetailaddr");
		if (acmDetailaddr.value.trim()=='') {
			alert("주소찾기버튼을 눌러 주소를 입력해주세요 ");
			acmDetailaddr.focus();
			return false;		
		}
	    
		var repPhone=document.getElementById("repPhone");
		if (repPhone.value.trim()=='') {
			alert("전화번호를 입력해주세요(10자리이내)");
			repPhone.focus();
			return false;		
		}
		
		if (repPhone.value.length > 11) {
			alert("전화번호는 10자리 이내입니다");
			repPhone.value=repPhone.value.substring(0, 10);
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
		
		var acmFax=document.getElementById("acmFax");
		if (acmFax.value.trim()=='') {
			alert("팩스번호를 입력해주세요(10자리이내)");
			acmFax.focus();
			return false;		
		}
		if (acmFax.value.length > 11 ) {
			alert("팩스번호는 10자리이내로 입력하셔야합니다");
			acmFax.value=acmFax.value.substring(0, 10);
			acmFax.focus();
			return false;		
		}
		
		var bizRegnum=document.getElementById("bizRegnum");
		if (bizRegnum.value.trim()=='') {
			alert("사업자등록번호를 입력해주세요(10자리)");
			bizRegnum.focus();
			return false;		
		}
		if (bizRegnum.value.length!=10) {
			alert("사업자등록번호형식 10자리로 입력하셔야합니다");
			bizRegnum.value=bizRegnum.value.substring(0, 10);
			bizRegnum.focus();
			return false;		
		}
		
	
	    return true;
	 }


	   
	
	
	function romRegit(){
		alert("숙소 등록을 시작합니다");
		document.getElementById('actionForm').submit();
	}
	
	
	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	
	
	
	
	
	
	
	
	
	
	////////안씀여
	function acmRegitstart(){
		var chkArr=[];
		
		var acmName=$("#acmName").val();
		var acmCity=$("#acmCity").val();
		var acmDistr=$("#acmDistr").val();
		var acmDetailaddr=$("#acmDetailaddr").val();
		var repPhone=$("#repPhone").val();
		var acmFax=$("#acmFax").val();
		var acmEmail=$("#acmEmail").val();
		var bizRegnum=$("#bizRegnum").val();
		//var bizRegpurl=$("#bizRegpurl").val();
		
		$("input[name=acmType]:checked").each(function(i){//체크박스값들을 모조리 배열에 담는다
			console.log('checkbox값:'+$(this).val());//크롬쪽에서 확인할수있다
			chkArr.push($(this).val());
		});
		
		var allData={"acmName":acmName, "acmCity":acmCity, "acmDistr":acmDistr, "acmDetailaddr":acmDetailaddr,
				"repPhone":repPhone,"acmFax":acmFax, "acmEmail":acmEmail, "bizRegnum":bizRegnum, //"bizRegpurl":"-",
				"acmTypeArr":chkArr		
		}
		
		$.ajax({
			url:"/hosting/become-host",
			type:"POST",
			data:allData,
			success: function(data){
				alert("객실 등록을 시작합니다.");
				//window.location.href = "/hosting/become-host1_6";

			}, error:function(){
	            alert("에러 발생~~ ");
	        }
		});
		
	}


	


</script>

