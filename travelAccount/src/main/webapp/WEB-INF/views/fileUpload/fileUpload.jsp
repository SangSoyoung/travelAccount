<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일 업로드 페이지</h3>
	<form action="fileOutput" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple>
		<button>등록</button>
	</form>

</body>
</html>