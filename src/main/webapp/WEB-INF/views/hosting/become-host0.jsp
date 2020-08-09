<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/becomehostheader.jsp"%>
                  
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
                            <a><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                    </ul>
                    
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<br>
		<div style="margin-left:15%;margin-right:15%;">		
		<!-- 기억하기가 되면 좋겠다  중간저장?-->
			<div class="pull-right" style="width: 150px;position: sticky;top: 10px;">
			  	<button class="form-control"style="width:150px;" type="button" onclick="if(readyForreg()){romRegit()}">다음으로</button><!-- ajax처리안함 -->
		   </div>
				<br><br>
			<div class="acm" id="acm">
				<h4>게스트가 묵게 될 숙소의 유형을 골라주세요!</h4>
				<input type="radio" id="acmType_house" name="acmTypes" value="H"><label for="rentType1">집 천제</label> 
				<input type="radio" id="acmType_priv" name="acmTypes" value="PD"><label for="rentType2">객실별 대여</label>
			
		<form id="actionForm" action="/hosting/become-host" method="post">
			<br>	
			  <h4>숙소 이름과 정보를 입력합니다</h4>
			   <input class="form-control"  style="width:200px;display:inline-block;" id="acmName" name="acmName" placeholder="숙소의 이름"><br><br>
			   <!-- 구글 API추가해야함 /우선 다음 API 사용하겠음-->
			   
			   <!-- <input type="text" id="acmCity" name="acmCity" placeholder="숙소 시도"><br>
			   <input type="text" id="acmDistr" name="acmDistr" placeholder="숙소 구군"><br>
			   <input type="text" id="acmDetailaddr" name="acmDetailaddr" placeholder="숙소 상세주소"><br><br>
 				-->

				<input type="hidden" id="sample6_postcode" placeholder="우편번호">
				<input type="hidden" id="sample6_address" placeholder="주소"><br>
				<input type="hidden" id="sample6_detailAddress" value="sth" placeholder="상세주소">
				<input type="hidden" id="sample6_extraAddress" value="sth" placeholder="참고항목">



				<div id="notphoto" style="display:inline-block;">
				
				<div class="form-group">
				<input class="form-control" type="button" class="form-control" style="width:100px;inline-block;" onclick="sample6_execDaumPostcode()" value="주소 찾기">
				<!-- 주소 중복체크으!!!! -->
				<span style="color: black;" id="msg"><c:out value="${msg}" /></span><br>
				
				<input class="form-control"  style="width:130px;display:inline-block;" id="acmCity" name="acmCity" size="10" placeholder="숙소시도" readonly="readonly">
				<input class="form-control"  style="width:130px;display:inline-block;" id="acmDistr" name="acmDistr" size="20" placeholder="숙소구군" readonly="readonly"><br>
				<input class="form-control"  style="width:265px;display:inline-block;" id="acmDetailaddr" name="acmDetailaddr" size="20" placeholder="숙소상세"  onchange="jungbok()" readonly="readonly"><br>
				</div>
				<span id="guide" style="color:#999;display:none"></span>

			   <input class="form-control"  style="width:200px;display:inline-block;" id="repPhone" name="repPhone" placeholder="숙소 대표번호(-없이)" numberOnly><br>
			   <input class="form-control"  style="width:200px;display:inline-block;" id="subPhone" name="subPhone" value="" placeholder="보조연락처 및 개인번호" numberOnly><br><br>
			   
			   <input class="form-control"  style="width:200px;display:inline-block;"" id="acmEmail" name="acmEmail" placeholder="숙소  이메일 주소"><br>
			   <input class="form-control"  style="width:200px;display:inline-block;" id="acmFax" name="acmFax" value="" placeholder="숙소  팩스번호(필수아님)" numberOnly><br><br>

				<!-- 위도경도 임시로 넣어줌 ********* 위도경도 바꾸는 api 넣어야함
				<input type="hidden" id="latitude" name="latitude" value="36.7307216">
				<input type="hidden" id="longitude" name="longitude" value="128.6216116">-->
			
				
			 
				  
				  <input type="hidden"  style="width:200px;display:inline-block;" id="bizRegnum" name="bizRegnum" value="<c:out value='${biznum}'/>" placeholder="사업자등록번호" numberOnly><br><br>
			
				   
				   <br>
				  <h4>숙소의 체크인 체크아웃 타임을 설정해주세요</h4><br>
				  <label for="checkinTime">체크인시간</label>&nbsp;
					<select class="form-control"  style="width:150px;display:inline-block;" name="checkinTime" id="checkinTime">
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
					&nbsp;&nbsp;
				  <label for="checkouTime">체크아웃시간</label>&nbsp;
					<select class="form-control"  style="width:150px;display:inline-block;" name="checkoutTime" id="checkoutTime">
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
				 <br><br> <br><br>
				  <h4>대표사진 한 장을 포함해 최대 7개의 숙소사진을 업로드해주세요!</h4>
			  <div class="uploadDiv" style="display:inline-block;">
                    <input type="file" name="uploadFile" multiple="multiple">
                 <div class="uploadResult" style="border-style: dashed;border-color: #337AB7; width:1235px; height:224px;">
                    <ul>

                    </ul>
           		 </div>
			  
			  </div>
			  
			  
			</form>
		</div>
		</div>
		</div>

<%@include file="../includes/footer.jsp"%>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00edf13596a79c29680f481ec4a2fc03&libraries=services"></script> -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
var full='';
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
            	//return;	
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
        	full=document.getElementById("sample6_address");
        	var parts=full.value.split(' ');
        	
        	var acmCity=document.getElementById("acmCity");
        	acmCity.value=parts[0]; //앞도시부분을 담는다
        	
        	var acmDistr=document.getElementById("acmDistr");
        	acmDistr.value=parts[1];
        	                
        	var extra=full.value.substring(parts[0].length+parts[1].length+2);
        	
        	var acmDetailaddr=document.getElementById("acmDetailaddr");
        	acmDetailaddr.value=extra;
            
    		var chkacmDetailaddr=document.getElementById("acmDetailaddr").value;
    	
    		
    	     $.ajax({
          	   type: 'POST',
          	   url: '/hosting/chkaddr',
          	   dataType: 'json',
          	   data: {
          		   'acmDetailaddr': chkacmDetailaddr
          	   },
          	   //async: false,
          	   success: function(data){
          		   console.log(data);
          		   $('span#msg').text(data.msg);
          		
          		   var chkaddr=document.getElementById("chkaddr");
	     	    	if(chkaddr==null){//없으면 추가시켜주고
		     	    	formObj.append("<input type='hidden' id='chkaddr' name='chkaddr' value='"+data.msg+"'>");
		     	    	
		     	    	
		     	    	//임시
		     	    	formObj.append("<input type='hidden' id='latitude' name='latitude' value='"+35.8133295+"'>");
		     	    	formObj.append("<input type='hidden' id='longitude' name='longitude' value='"+129.1894108+"'>");
	     	    	}
	     	    		else chkaddr.value=data.msg;//이미 있으면 바꿔치기
          	   },
          	   error: function(data){
          		  window.location.href ="../error/error";
          	   }
          	 });
    	     
    	     
    	   //주소-좌표 변환 객체를 생성
    	  /* var geocoder = new kakao.maps.services.Geocoder();
    	   geocoder.addressSearch(addr, function(results, status) {
               // 정상적으로 검색이 완료됐으면
               if (status === kakao.maps.services.Status.OK) {
                   var result = results[0]; //첫번째 결과의 값을 활용
                   // 해당 주소에 대한 좌표를 받아서
                   var coords = new kakao.maps.LatLng(result.y, result.x);
                  
                  var latitude=document.getElementById("latitude");
                  var longitude=document.getElementById("longitude");
                  
	     	    	if(latitude==null && longitude==null){//없으면 추가시켜주고
		     	    	formObj.append("<input type='text' id='latitude' name='latitude' value='"+result.y+"'>");
		     	    	formObj.append("<input type='text' id='longitude' name='longitude' value='"+result.x+"'>");
	     	    	} else {
	     	    		latitude.value=result.y;//이미 있으면 바꿔치기
	     	    		longitude.value=result.x;
	     	    	}
                  
               }
           });  
    	  */   
    	     
        }
    }).open();
}
	//html이 그려지면 실행되는 메서드
	$(document).ready(function() {
		//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
		if ( window.history.replaceState) {
	           window.history.replaceState( null, null, window.location.href );
	       }
		
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
	var formObj = $("#actionForm");
	//유효성 검사
	function readyForreg() {
		var chkArr=[];
		var acmTypevalue="";
	    $("input[name=acmTypes]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
	       //console.log('checkbox값:'+$(this).val());
	    	chkArr.push($(this).val())  
	   		 acmTypevalue=acmTypevalue.concat($(this).val());
	    });
	    if(chkArr.length==0){
	       alert('하나 이상의 숙소유형을 골라주셔야합니다');
	       $(this).focus();
	       return false;
	    } else {
	    	var acmType=document.getElementById("acmType");
	    	if(acmType==null)//없으면 추가시켜주고
	    	formObj.append("<input type='hidden' id='acmType' name='acmType' value="+acmTypevalue+">");
	    	else acmType.value=acmTypevalue;//이미 있으면 바꿔치기
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
		
		//주소 중복검사
		var chkaddr=document.getElementById("chkaddr");
		if (chkaddr.value.charAt(0)=='*') {
			alert("같은 주소지에 숙소가 이미 등록되어있습니다! 주소를 확인해주세요");
			return false;		
		}
		
		//null허용값들 실험
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
		
		
		
		if($("input[name='rep']:checked").val()==undefined){
			alert("대표사진을 선택해주세요.");
			return false;		
		}
		
		
	    return true;
	 }
	
	//숙소등록을 시작하면서 위도경도 정보를 넣어주자
	function romRegit(){
		regiPhoto();
		alert("숙소 등록을 시작합니다");
		document.getElementById('actionForm').submit();
	}
	
	
	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	   
	
	
	
	//사진 배열로 정리해서 보내는 함수
	function regiPhoto() {
		let formObj = $("#actionForm");
		var str2 = "";

		$(".uploadResult ul li").each(function (i, obj) {

			var jobj = $(obj);
			console.dir(jobj);

			str2 += "<input type = 'hidden' name = 'picList[" + i + "].ptitle' value='" + jobj.data("filename") + "'>";
			str2 += "<input type = 'hidden' name = 'picList[" + i + "].purl' value='" + jobj.data("path") + "'>";
			str2 += "<input type = 'hidden' name = 'picList[" + i + "].image' value='" + jobj.data("type") + "'>";
		});
	
		
		var rep = $("input[name='rep']:checked");
		
		str2 += "<input type = 'hidden' name = 'acmPurl' value='" + rep.data('path')+"'>";
		str2 += "<input type = 'hidden' name = 'acmPname' value='" + rep.data('filename')+"'>";
		formObj.append(str2);
	
		

	}
	
	


	//사진업로드 관련 부분

	// 파일유효성체크
	let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp|JPG|JPEG|PNG|GIF|BMP)$")
	let maxSize = 5242880;
	function checkExtension(fileName, fileSize) {
		if (fileSize > maxSize) {
			alert("파일사이즈초과");
			return false;
		}
		if (!(regex.test(fileName))) {
			alert("그림파일만 가능합니다.")
			return false;
		}
		return true;
	}


	//파일 미리보기 관련()
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uplodResultArr) {
		var str = "";
		$(uplodResultArr).each(function (i, obj) {
			if (!obj.image) {
				//이거는 이미지 외 파일도 받을때
				//str += "<li><img src='../resources/img/logo.png'>" + obj.fileName + "</li>"
				alert("그림파일만 가능합니다.")
				return false;
			} else {

				var fileCallPath = encodeURIComponent(obj.purl + "/" + obj.pname);
				var originPath = obj.purl + "/" + obj.pname;

				originPath = originPath.replace(new RegExp(/\\/g), "/");

				str += "<li data-path='" + obj.purl + "'";
				str += "data-filename='" + obj.pname + "'";
				str += "data-type='" + obj.image + "'><div>";
				str += "<img src = '/display?fileName=" + fileCallPath + "'>";
				str += "<input type='radio' name='rep'  data-path='" + obj.purl + "'";
				str += "data-filename='" + obj.pname + "' value='" + obj.pname + "'> 대표사진여부";
				str += "<button type='button' data-file=\'" + fileCallPath + "\' "
				str += "data-type = 'image' class ='btn'><i class='fa fa-times'></i></button><br>"
				str += "</div></li>";
			}
		});
		uploadResult.append(str);
	}

	//파일 삭제관련
	$(".uploadResult").on("click", "button", function (e) {
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");

		$.ajax({
			url: '/deleteFile',
			data: { fileName: targetFile, type: type },
			dataType: 'text',
			type: 'POST',
			success: function (result) {
				alert("삭제되었습니다.");
				targetLi.remove();
			}
		});
	})

	//파일 업로드
	var cloneObj = $(".uploadDiv").clone();

	$("input[type='file']").change(function (e) {
		var formData = new FormData;
		
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;

		console.log(files);

		// 총 갯수 구하기
		var total = $(".uploadResult ul >li").length+files.length
		if(total>7){
			alert("7장의 사진만 등록이 가능합니다.")
			return false;
		}
		
		for (let i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]);
		}

		$.ajax({
			url: '/review/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function (result) {
				console.log(result);
				showUploadedFile(result);
			}
		});
	});

	
	
	
</script>