<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="uploadFormAction" method="post" enctype="multipart/form-data">
		<!-- <input type="text" name="title" placeholder="제목"><br>
		<input type="text" name="info" placeholder="내용"><br> -->
		<input type="file" name="uploadFile" multiple> <!-- multiple 여러개 선택 가능 -->
		<button>등록</button>
	</form>
	<hr>
	<img src="resources/upload/image1.jpg"><br>
</body>
</html>