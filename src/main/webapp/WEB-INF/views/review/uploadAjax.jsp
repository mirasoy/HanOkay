<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>I</title>
	<style>
		.uploadResult {
			width: 100%;
			background-color: gray;
		}

		.uploadResult ul {
			display: flex;
			flex-flow: row;
			justify-content: center;
			align-items: center;
		}

		.uploadResult ul li {
			list-style: none;
			padding: 10px;
		}

		.uploadResult ul li img {
			width: 20px;
		}
	</style>
</head>

<body>

	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple="multiple">
	</div>

	<div class="uploadResult">
		<ul>

		</ul>

	</div>
	<button id='uploadBtn'>Upload</button>
   
      




	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

		$(document).ready(function () {



			// 파일유효성체크

			let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp|txt)$")
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
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"+obj.uuid+"_"+obj.fileName);
						var originPath =  obj.uploadPath + "/"+obj.uuid+"_"+obj.fileName;
                  originPath = originPath.replace(new RegExp(/\\/g),"/");

                  str += "<li><a href=\"javascript:showImage()\'"+originPath+"\')\">"+
                        "<img src = '/review/display?fileName="+fileCallPath+"'></a>"+
                        "<span daea-file=\'"+fileCallPath+"\' date=type='image'>x </span>"+"</li>";
					}
				});
				uploadResult.append(str);
			}
	
			
			//파일 삭제관련
			
		

			//파일 업로드
			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click", function (e) {

				var formData = new FormData;

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);


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
						$(".uploadDiv").html(cloneObj.html());
					}
				});


			});
			
		



		})
	</script>

</body>

</html>