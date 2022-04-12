<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
</div>
<button id='uploadBtn'>Upload</button>


<!-- 업로드 파일명 출력부분 -->
<div class='uploadResult'>
	<ul>
	
	</ul>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>     
<script>

$(document).ready(function(){

	// 파일 확장자/크기 사전 처리
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과! 5MB 이하의 파일을 선택해주세요.");
			return false;
		}

		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	} // end checkExtension()

	
	// 업로드 파일 이름 출력
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr){

		var str = "";

		$(uploadResultArr).each(function(i, obj){

			// 공백/한글 -> 적합한 문자열로 인코딩 처리
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			str += "<li><img src='display?fileName="+fileCallPath+"'></li>";
			
		});
		
		uploadResult.append(str);
	} // end showUploadedFile()	


	
	var cloneObj = $(".uploadDiv").clone();

	// 업로드 파일 데이터 보내기(ajax)
	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData(); // FormData 객체 생성
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		console.log(files);	

		// 파일 데이터를 formData에 추가
		for(var i = 0; i < files.length; i++){

			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : 'uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){	
				//alert("Uploaded");
				console.log(result);

				showUploadedFile(result);
				
				// 첨부파일을 추가하고 다시 추가하기 위해 초기화 시키기
				$(".uploadDiv").html(cloneObj.html());
			}
			
		}); // end ajax
		
	}); // end 업로드 파일 데이터 보내기

	

	
});

</script>
</body>
</html>