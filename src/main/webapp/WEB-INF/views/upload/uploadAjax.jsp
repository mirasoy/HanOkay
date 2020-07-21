<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>upload with Ajax</h1>
	<div class='uploadDiv'>
		<input type="file" name="uploadFile" multiple>
	</div>
	<button id="uploadBtn">upload</button>
</body>
 <script
  src="https://code.jquery.com/jquery-migrate-3.3.1.js"
  integrity="sha256-lGuUqJUPXJEMgQX/RRaM6mZkK6ono5i5bHuBME4qOCo="
  crossorigin="anonymous"></script>
  <script>
  $(document).ready(function(){
	  $("#uploadBtn").on("click",function(e){
		var formData = new FormData();
		var inputFile= $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//add filedata to formdata
		for(var i=0;i<files.length;i++){
			formData.append("uploadFile",files[i]);
		}
		
		
		
		
		
	  });
  });
  </script>
</html>



