<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 

<%@include file="../../includes/header.jsp"%>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >

<style>

body{
height: 800px;
}

.mouse-icon{
display:none;
}

	.container-1{
	  
	}

	.contents{
	 
	}
	
	.contents-2{

		box-shadow: none !important;
	}


.card1{
    margin-bottom: 50px;
position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    /* background-color: #fff; */
    background-clip: border-box;
    /* border: 1px solid rgba(0,0,0,.125); */
    border-radius: .25rem;

}


.items{
    border-bottom: 1px solid rgb(221, 221, 221) !important;
   margin-bottom: 30px;
    padding-bottom: 30px;

}




.item1>h1{

    font-size: 30px;
    font-weight: 800;
    line-height: 40px;
    margin: 0px !important;
    padding: 0px !important;
}


.item1>p{
    font-size: 14px !important;
    line-height: 18px !important;
    color: #717171 !important;
    margin-bottom: 8px !important;
}


.item2>.user_profile_edit_button{
font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;


}


.item3> h1{
font-size: 22px;
    font-weight: 600;
}

.item3>button{
    font-weight: 800;
    appearance: none !important;
    background: transparent !important;
    border: 0px !important;
    cursor: pointer !important;
    padding: 0;
    text-decoration: underline !important;
}


#peek {
	height : 100%;
	position : relative;
	
	display: none;
	list-style: none;
	padding: 0;
	margin: 20px 0;  
  
  
}

#peek>li{
margin-bottom: 25px;

}


.btn {
    cursor: pointer;
    display: inline-block;
    font-size: 0.85rem;
    font-weight: 400;
    padding: 12px 20px;
}

.btn-primary{

color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

.textToggleArea{

    color: inherit !important;
    min-width: 100% !important;
    max-width: 100% !important;
    appearance: none !important;
    font-size: 16px !important;
    line-height: 20px !important;
    font-weight: 400 !important;
    border-style: none !important;
    box-shadow: rgb(176, 176, 176) 0px 0px 0px 1px inset !important;
    box-sizing: border-box !important;
    color: rgb(34, 34, 34) !important;
    padding: 10px !important;
    border-radius: 8px !important;
    background-color: #fff;

}

.textToggle>p{
    margin: 0;
}

.on{
    display: block !important;
}

/* 스크롤바 때문에 바디가 밀리는 현상 방지 */

body{
margin-left: -5px;
}

.top-bar{
margin-left: -2px;
}




</style>



<div class="container">

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 프로필</h1>
			<p><%=userFstName %>님! 개성있게 프로필을 꾸며 볼까요!?</p>
		</div>
	</div>


<%@include file="../../includes/sidebar.jsp"%>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■메인컨텐츠■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	
<section class="contents">
	<section class="contents-2">
		<div class="card1">
			<div class="item1 items">
				<h1>안녕하세요 저는 <%=userFstName %>입니다.</h1>
				
			</div>
			<div class="item2 items">
			<div class="profileRead">
				<div style="margin-bottom: 20px;">
				<div style="margin-top: 20px;">
				<span style="font-weight:800; font-size: 20px;">자기소개</span>
				<div style="margin-top: 7px; font-weight:400;" id="selfIntrod">
				<c:out value="${profile.userIntroduction}" />
				</div>
				</div>
				
				<div style="margin-top: 20px;">
				<span  style="margin-top: 17px; font-weight:800; font-size: 20px;">사용언어</span>
				<div style="margin-top: 7px; font-weight:400;" id="langu">
				<c:out value="${profile.userLanguage}" />
				</div>
				</div>
				</div>
			
			</div>
			
				<button type="button" class="user_profile_edit_button" >프로필 수정하기</button>
			
				
				<ul id="peek">
					<li>
						<div class="textToggle">
							<p>소개</p>
							<textarea name="about" rows="4" autocomplete="off" id="selfIntro" class="textToggleArea"><c:out value="${profile.userIntroduction}" /></textarea>
						</div>
					</li>
					
					<li>
						<div class="textToggle">
							<p>구사언어</p>
							<textarea name="about" rows="2" autocomplete="off" id="lang" class="textToggleArea">${profile.userLanguage}</textarea>
						</div>
					</li>
					
					<li>
						<div class="textToggle">
							<p>프로필 사진 업로드</p>
							<div class="uploadDiv">
								<input type="file" name="uploadFile">
							<div class="uploadResult">
								<ul>

								</ul>
							</div>
						</div>
						</div>
					</li>
						
					
					<button class="btn btn-primary">수정하기</button>																							
					<button class="btn btn-red">취소하기</button>																							
				</ul>

				
				
			</div>		
			
			<div class="item3 items">
				<h1>★ 후기 <c:out value="${reviewCount}" />개 </h1>
				<button type="button" class="review_edit_button" >내가 작성한 후기</button>
			</div>											
		</div>
	</section>
</section>

<script>
//글자수 유효성 체크 메서드
function checkLetter(){
	let self= $("#selfIntro").val();
	let langu= $("#lang").val();
}

$(".user_profile_edit_button").on('click',function(){	
	$(".profileRead").hide();
	$("#peek").addClass('on')	
});


$(".btn-red").on('click',function(){	
	$(".profileRead").show();
	$("#peek").removeClass('on');	
});

$(".btn-primary").on('click', function(){
	
	let lang= $("#lang").val();
	let selfIntro= $("#selfIntro").val();
	
	$.ajax({
        type: "POST",
        url: "/account/myAccount/updateMyProfile",
        dataType: "json",
        data: {
          userNum: '<%=userNum %>',
          userIntroduction : selfIntro,
          userLanguage : lang
        },
        async: false,
        success: function (data) {
         if(data.msg =='success'){
        	 window.alert("수정 완료!");
        	 
        	
        	 $.ajax({
        	        type: "POST",
        	        url: "/account/myAccount/showUpdatedProfile",
        	        dataType: "json",
        	        data: {
        	          'userNum': '<%=userNum %>',
        	        },
        	        success: 
        	        	function(data, profile) {
        	        	console.log(data);
        	        	console.log("data.profile: "+data.profile.userIntroduction);
        	        	$("#selfIntrod").text(data.profile.userIntroduction);
        	        	$("#langu").text(data.profile.userLanguage);
        	        	}, 
        	        });
        	 
        	 $(".profileRead").show();
        	 $("#peek").removeClass('on');
  
         }
        }
        
   });
});



//사진업로드 관련 부분//by.mira


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




  $(document).ready(function () {
    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);  
    }
  });
</script>

<%@include file="../../includes/footer.jsp"%>
