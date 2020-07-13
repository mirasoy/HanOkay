<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                
                //내가추가(지번주소를 자른다)
                var full=document.getElementById("sample4_jibunAddress");
                var parts=full.value.split(' ');
                
                var acmCity=document.getElementById("acmCity");
                acmCity.value=parts[0]; //앞도시부분을 담는다
                
                var acmDistr=document.getElementById("acmDistr");
                acmDistr.value=parts[1];
                                
                var extra=full.value.substring(parts[0].length+parts[1].length+2);
                
                var acmDetailaddr=document.getElementById("acmDetailaddr");
                acmDetailaddr.value=extra;
                
                
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
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

			<input type="hidden" id="sample4_roadAddress" name="FullroadAddr" size="40" placeholder="도로전체주소" readonly="readonly">
			<input type="hidden" id="sample4_jibunAddress" name="FulljibunAddr" size="40" placeholder="도로지번주소" readonly="readonly">
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"><br><br>

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


				<input type="hidden" id="sample4_postcode" placeholder="우편번호">
				
				
				<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" readonly="readonly"><br>
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


	//바로반응하는것들
	$(document).ready(function () {
		
		$('input[name=acmName]').focusout(function () {
	
			if ($(this).val().length > 10) {
				alert("숙소이름은 10자로 이내로 정해주세요~");
				$(this).val($(this).val().substring(0, 10));
		
			}
	
		});//한타스 완성
		
		$('input[name=repPhone]').focusout(function () {
			
			if ($(this).val().length > 12) {
				alert("전화번호가 너무깁니다!");
				$(this).val($(this).val().substring(0, 12));
		
			}
	
		});//한타스 완성
	
		$('input[name=acmFax]').focusout(function () {
			
			if ($(this).val().length > 12) {
				alert("팩스번호가 너무 깁니다!");
				$(this).val($(this).val().substring(0, 12));
		
			}
	
		});//한타스 완성

		var email=document.getElementById("acmEmail");
		//좀더 생각해보고 만들겠음
		$('input[name=acmEmail]').focusout(function () {
			
			if(!CheckEmail(email.value)) {
				alert("이메일 형식에 어긋납니다");
				email.value="";
		
			}
	
		});//한타스 완성*/
	
		var bizRegnum=document.getElementById("bizRegnum");
		$('input[name=bizRegnum]').focusout(function(){
			if(bizRegnum.value.length!=10){
				alert("사업자등록코드의 형식에 벗어납니다(10글자)");
				bizRegnum.value="";
			}
		})
	
		
	}); //바로 반응하는것들

	
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
	    
	    var acmmNotNull = $(".acm input");
	    var flag = true;
	     chkArr = [];
	    $(".acm input").each(function () {
	       val = $(this).val().trim();
	       if (val == '') {
	          alert('입력하지 않은 필수항목이 있습니다');
	          flag = false;
	          return flag; // break
	       }
	    });
	
	    
	    $("input[name=acmType]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
	       //console.log('checkbox값:'+$(this).val());
	       chkArr.push($(this).val());
	    });
	
	    if(chkArr.length==0){
	       alert('하나 이상의 숙소유형을 골라주셔야합니다');
	       $(this).focus();
	       flag = false;
	    }
	    
	    return flag;
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

