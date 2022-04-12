<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>업로드한 파일 출력 페이지</h3>
<hr>
<c:forEach var="imagefile" items="${uploadFiles }">
	<img src="resources/upload/${imagefile }">
</c:forEach>
</body>
</html>