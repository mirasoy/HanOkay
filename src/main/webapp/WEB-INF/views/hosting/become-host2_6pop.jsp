<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
   .room {
      width: 350px;
   }

   .exp {
      font-size: 8px;
   }

   #image_container {
      border: 1px dotted blue;
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
     
    button{
    	width:100px;
    	height:30px;
    }    
	
</style>
<%@include file="../includes/becomehostheader.jsp"%>
<script type="text/javascript">
	
	//acmNum넘겨받는부분
	function _GET(search) {
	    var obj = {};
	    var uri = decodeURI(search);
	        uri = uri.slice(1,uri.length);
	
	    var param = uri.split('&');
	    
	    for (var i = 0; i < param.length; i++) {
	        var devide = param[i].split('=');
	        obj[devide[0]] = devide[1];
	    }
	
	    return obj;
	}
	
	window.onload = function () {
	    var search = window.location.search;
	    var getData =  _GET(search);
	    var acmNum = document.querySelector('#ACM_NUM'); //hidden된 acmNum을 읽는다4
	    acmNum.value=getData.acmNum.trim();
//	    acmNum.innerText=getData.acmNum;

	}
	
</script>
<body>


<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
   <input type="hidden" id="ACM_NUM" name="ACM_NUM" value="" readonly="readonly">
   <!-- 숙소 방 추가 모달로 띄우기-->
   <form action="/hosting/become-host2_6" method="get" id='roomForm'>
<br>
		<div class="pull-right">
	  	<button class="form-control"style="width:150px;" type="button" onclick="if(readyForreg()){romRegit()}">객실 등록</button><!-- ajax처리안함 -->
		</div>
		
		
      <h4>개별객실(베드룸) 추가하기</h4>

     <!-- <div id="image_container" style="width:200px;height:200px;"></div>
      <input type="file" id="ROM_PURL" name="ROM_PURL" placeholder="객실 사진" onchange="setThumbnail(event);"> --> 

    <div class="room" id="room" style="width:500px; display:inline-block;">
      <div class="form-group">
           <input class="form-control" id="ROM_NAME" name="ROM_NAME" placeholder="객실 이름" style="width:300px;"> 
      </div>
      
      	<label for="ROM_TYPE">객실 타입</label>
         <select class="form-control" name="ROM_TYPE" id="ROM_TYPE" style="width:100px;display:inline-block;">
            <option value="싱글룸">싱글</option>
            <option value="더블룸">더블</option>
            <option value="프리미엄">프리미엄</option>
            <option value="도미토리">도미토리</option>
         </select>
         <label for="ROM_CAPA">객실 최대 인원수</label>
          <select class="form-control" style="width:100px;display:inline-block;" name="ROM_CAPA" id="ROM_CAPA">
            <option value="1">1명</option>
            <option value="2">2명</option>
            <option value="3">3명</option>
            <option value="4">4명</option>
            <option value="5">5명</option>
            <option value="6">6명</option>
            <option value="7">7명</option>
            <option value="8">8명</option>
            <option value="9">9명</option>
            <option value="10">10명</option>
         </select>
        
		<br>
     <label for="BED_TYPE">침대 유형</label>
          <select class="form-control" style="width:120px;display:inline-block;" name="BED_TYPE" id="BED_TYPE" onchange="categChange(this)">
            <option value="온돌">온돌(이불)</option>
            <option value="싱글">싱글</option>
            <option value="퀸">퀸</option>
            <option value="킹">킹</option>
            <option value="2층침대">2층침대</option>
            
         </select>
         <label for="BED_CNT">침대 갯수</label>
          <select class="form-control" style="width:120px;display:inline-block;" name="BED_CNT" id="BED_CNT">
            <option value="0">온돌(이불)</option>
         </select><br>
         
         <label for="ROM_SIZE">객실 크기 </label>&nbsp;<input class="form-control" style="width:150px;display:inline-block;" id="ROM_SIZE" name="ROM_SIZE" placeholder="m2" numberOnly>
        <label for="ROM_PRICE">객실 가격 </label>&nbsp;<input class="form-control" style="width:150px;display:inline-block;" id="ROM_PRICE" name="ROM_PRICE" placeholder="원" numberOnly><br>

   
      <!-- 여기에 appendChild하고 싶닷 -->
		<br><br>
      <h4>객실 옵션</h4>

      <!-- checkbox는 name값을 key값으로 갖기때문에 같게 두고, value값만 다르게 준다 -->
      <input type="checkbox" name="romOptcode" id="RM_OPT_ES" value="1"><label for="RM_OPT_ES">필수품목(수건,화장지, 이불, 씻는도구)</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WF" value="2"><label for="RM_OPT_WF">무선인터넷</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_TV" value="4"><label for="RM_OPT_TV">tv</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_HT" value="8"><label for="RM_OPT_HT">난방/에어컨</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_IO" value="16"><label for="RM_OPT_IO">다림질 도구</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_HR" value="32"><label for="RM_OPT_HR">헤어드라이어</label><br>
      <input type="checkbox" name="romOptcode" id="RM_OPT_CP" value="64"><label for="RM_OPT_CP"> 커피/티메이커 </label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WM" value="128"><label for="RM_OPT_WM"> 세탁기 </label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_DK" value="256"><label for="RM_OPT_DK">업무 가능한 공간/책상</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_DW" value="512"><label for="RM_OPT_DW">옷장/서랍장</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WP" value="1024"><label for="RM_OPT_WP">반려동물 동반 가능</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_BT" value="2048"><label for="RM_OPT_BT">욕조</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_RG" value="4096"><label for="RM_OPT_RG">냉장고</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_BC" value="8192"><label for="RM_OPT_BC">발코니/테라스</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_SM" value="16384"><label for="RM_OPT_SM">흡연</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_KC" value="32768"><label for="RM_OPT_KC">개별주방</label>
    </div>
    
    <br><br><br>
 	<div class="uploadDiv" style="display:inline-block;">
          <input type="file" name="uploadFile">
       <div class="uploadResult" style="border-style: dashed;border-color: #337AB7; width:400px; height:200px;">
          <ul>

          </ul>
 		 </div>

	</div>
 
   </form>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var chkArr = []; //배열 초기화
	var romOptcode=0;
	function readyForreg() {
		
		var roomNotNull = $(".room input");
		var flag = true;
		 chkArr = [];
		$(".room input").each(function () {
			val = $(this).val().trim();
			if (val == '') {
				alert('모든 항목을 입력해주십시오.');
				$(this).focus();
				flag = false;
				return false; // break
			}
		});
		
		$("input[name=romOptcode]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
			//console.log('checkbox값:'+$(this).val());
			chkArr.push($(this).val());
			romOptcode=parseInt(romOptcode)+parseInt($(this).val());
		});
		if(chkArr.length==0){
			alert('하나 이상의 옵션을 선택해주세요.');
			$(this).focus();
			flag = false;
			
		}
		
		if($("#ROM_CAPA").val() > 25){
			alert('25명 이하의 숫자만 등록 가능합니다.');
			flag = false;
		};//객실최대인원수
		if($("#ROM_SIZE").val()> 500){
			alert('500이하의 숫자만 등록 가능합니다.');
			flag = false;
		};//객실크기
		
		if($(".uploadResult ul >li").length < 1){
			alert('사진을 등록해주세요.');
			flag = false;
		}//사진유무
		
		
		return flag;
	}

	function categChange(e){
	      var bed_ondol=["이불"];
	      var bed_single=["1","2","3"];
	      var bed_queen=["1","2","3"];
	      var bed_king=["1","2","3"];
	      var bed_2f=["1","2","3","4","5"];
	      var target=document.getElementById("BED_CNT");
	      
	      if(e.value=="온돌")var cnt=bed_ondol;
	      else if(e.value=="싱글")var cnt=bed_single;
	      else if(e.value=="퀸")var cnt=bed_queen;
	      else if(e.value=="킹")var cnt=bed_king;
	      else if(e.value=="2층침대")var cnt=bed_2f;
	      
	      target.options.length = 0;

	      for (x in cnt) {
	         var opt = document.createElement("option");
	         opt.value = cnt[x];
	         opt.innerHTML = cnt[x];
	         target.appendChild(opt);
	      }   
	   }
	   

	function romRegit() {
		
		regiPhoto();
				
		var acmNum = $("#ACM_NUM").val();//숙소번호
		var romName = $("#ROM_NAME").val();//객실이름
		var romCapa = $("#ROM_CAPA").val();//객실최대인원수
		var bedType = $("#BED_TYPE").val();//침대유형
		var bedCnt = $("#BED_CNT").val();//침대갯수
		var romSize = $("#ROM_SIZE").val();//객실크기
		var romPrice = $("#ROM_PRICE").val();//객실가격
		var romType = $("#ROM_TYPE").val();//룸타입
		var romPname =$("input[name='romPname']").val();//사진이름
		var romPurl = $("input[name='romPurl']").val();//사진이름
		
		//name/value 형태로 담는다
		var allData = {
			"acmNum": acmNum, "romType": romType, "romName": romName,
			"romCapa": romCapa, "bedType": bedType, "bedCnt": bedCnt, "romSize": romSize,
			"romPrice": romPrice, "romOptcode": romOptcode, "romPurl":romPurl, "romPname":romPname
		}
		$.ajax({
			url: 'become-host2_6pop',
			type: "POST",
			data: allData,
			success: function (data) {
				alert("객실이 추가되었습니다.");
				self.close();
				opener.document.location.href="/hosting/become-host2_6?acmNum="+acmNum;
			}
		});
	}
	
	
	
	
	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	
	
	
	

	//사진업로드 관련 부분

	
	
	
	//사진 배열로 정리해서 보내는 함수
	function regiPhoto() {
		let formObj = $("#roomForm");
		var str2 = "";

		$(".uploadResult ul li").each(function (i, obj) {

			var jobj = $(obj);
			console.dir(jobj);

			str2 += "<input type = 'hidden' name = 'romPname' value='" + jobj.data("filename") + "'>";
			str2 += "<input type = 'hidden' name = 'romPurl' value='" + jobj.data("path") + "'>";
		});
	
		//alert(str2);
		formObj.append(str2);
	

	}
	
	
	
	
	
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
		if(total>1){
			alert("1장의 사진만 등록이 가능합니다.")
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
</html></html>