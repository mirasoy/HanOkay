<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<div class="container">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1>Write Review</h1>
			</div>
			<div class="panel-body">
				<form id="form">
					<table class="table table-striped table-bordered table-hover bookList">
						<tr>
							<td colspan="2">
								<c:out value="${review.acmName }" />
							</td>
						</tr>
						<tr>
							<td><label>별점</label></td>
							<td>
								<P id="star">
									<a href="#" value="1">★</a> <a href="#" id="2" value="2">★</a> <a href="#"
										value="3">★</a>
									<a href="#" value="4">★</a> <a href="#" value="5">★</a>
								</p>
								<input type="hidden" name="stisf" id="stisf" value='<c:out value="${review.stisf }" />'>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name='title' id='title' value='<c:out value="${review.title }" />'
									required autofocus />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name='content' rows="10" style="resize: none; width:100%;"
									required><c:out value="${review.content } " /></textarea>
								<input type="hidden" name="bookNum" value='<c:out value="${review.bookNum }" />'>
								<input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
							</td>
						</tr>
						<td colspan="2">
							<button class="btn btn-primary movebtn" data-oper="modify">수정하기</button>
							<button class="btn btn-red movebtn" data-oper="delete">삭제하기</button>
							<a href="/review/list"><button class="btn" type="button">리스트로</button></a>
						</td>
						</tr>
					</table>


				</form>
				
					<div class='MR-contain'>
						<div class='MR-heading'>
							첨부사진
						</div>
						<div class='MR-body'>
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple="multiple">
							<div class="uploadResult">
								<ul>

								</ul>
							</div>
						</div>
						</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(document).ready(function () {
		//기존별점불러오기
		$('#star').children().eq(<c:out value="${review.stisf }" /> - 1).addClass("on").prevAll("a").addClass("on");
		//별점변경 메서드
		$('#star a').click(function () {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			$('#stisf').val($(this).attr("value"));
		});

		
		//기존 첨부사진 불러오기
		var regPic ="";
		var regfilecallPath ;
		var uploadResult = $(".uploadResult ul");
		
		
		<c:forEach items="${reviewP }" var="reviewP">
		
		 regfilecallPath = encodeURIComponent('<c:out value="${reviewP.purl }" />/<c:out value="${reviewP.pname }" />');
		
		//originPath = originPath.replace(new RegExp(/\\/g), "/");
		
		regPic += "<li data-path='" + "<c:out value="${reviewP.purl }" />" + "'";
		regPic += "data-filename='<c:out value="${reviewP.pname }" /> '";
		regPic += "data-type='<c:out value="${reviewP.image }" /> '><div>";
		regPic += "<img src = '/review/display?fileName=" + regfilecallPath + "'>";
		regPic += "<button type='button' data-file=\'"+regfilecallPath+"\' "
		regPic += "data-type = 'image' class ='btn'><i class='fa fa-times'></i></button><br>"
		regPic += "</div></li>";
		</c:forEach>

		console.log(regPic);
		uploadResult.append(regPic);
		
		
		
		
		//글자수 제한
		$('input[name=title]').on('keyup', function () {
			if ($(this).val().length > 40) {
				alert("글자수는 40자로 이내로 제한됩니다.");
				$(this).val($(this).val().substring(0, 40));

			}

		});

		$('textarea[name=content]').on('keyup', function () {
			if ($(this).val().length > 1000) {
				alert("글자수는 1000자로 이내로 제한됩니다.");
				$(this).val($(this).val().substring(0, 1000));

			}

		});


		let formObj = $("form");


		//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
		$('.movebtn').on("click", function (e) {
			e.preventDefault();
			let operation = $(this).data("oper");
			//지울때
			if (operation === 'delete') {

				formObj.attr("action", "/review/delete");
				formObj.attr("method", "post");
				$(this).attr("type", "submit");
				formObj.submit();
			}
			//수정할때
			if (operation === 'modify') {
				formObj.attr("action", "/review/modify");
				//내용여부 유효성검사
				if ($('input[name=title]').val().trim() == "") {
					$(this).attr("type", "button")
					$('input[name=title]').focuce();
					alert("제목을 입력해주세요");
				} else if ($('textarea[name=content]').val().trim() == "") {
					$(this).attr("type", "button")
					alert("내용을 입력해주세요");
				} else {
					formObj.attr("method", "post");
					$(this).attr("type", "submit");
				}

				var str2 = "";

				$(".uploadResult ul li").each(function (i, obj) {

					var jobj = $(obj);
					console.dir(jobj);

					str2 += "<input type = 'hidden' name = 'picList[" + i + "].pstNum' value='<c:out value="${review.pstNum }" />'>";
					str2 += "<input type = 'hidden' name = 'picList[" + i + "].pname' value='" + jobj.data("filename") + "'>";
					str2 += "<input type = 'hidden' name = 'picList[" + i + "].purl' value='" + jobj.data("path") + "'>";
					str2 += "<input type = 'hidden' name = 'picList[" + i + "].image' value='" + jobj.data("type") + "'>";
				});

				formObj.append(str2);
				formObj.submit();
			}


		});
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
					str += "<img src = '/review/display?fileName=" + fileCallPath + "'>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type = 'image' class ='btn'><i class='fa fa-times'></i></button><br>"
					str += "</div></li>";
				}
			});
			uploadResult.append(str);
		}

		//파일 삭제관련
		$(".uploadResult").on("click","button",function(e){
			var targetFile = $(this).data("file");
			var type =  $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/review/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType: 'text',
				type: 'POST',
				success: function (result) {
					alert("삭제되었습니다");
					targetLi.remove();
				}
			});
		})

		
		
		//파일 업로드
		var cloneObj = $(".uploadDiv").clone();

		$("input[type='file']").change(function (e) {
			var formData = new FormData;
			formData.append("bookNum", '<c:out value="${booking.bookNum }" />');
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
				}
			});
		});
		
		
		
		
		
		
		
		
	}); 
</script>

</body>
<%@include file="../includes/footer.jsp"%>

</html>