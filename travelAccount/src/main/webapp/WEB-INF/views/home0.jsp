<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home0</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<h3>서버로부터 JSON 데이터 받기</h3>
<hr>
<div id="j1">getSample JSON data(클릭)</div>
<input type="text" name="j1_txt" size="10"><br>
<hr>
<br>
<div id="j2">getSample JSON List data(클릭)</div>
<input type="text" name="j2_txt1" size="10"><br>
<input type="text" name="j2_txt2" size="10"><br>
<input type="text" name="j2_txt3" size="10"><br>
<hr>
<br>
<div id="j3">getSample JSON Map data(클릭)</div>
<input type="text" name="j3_txt1" size="10"><br>
<input type="text" name="j3_txt2" size="10"><br>
<hr>
<br>
<h3>서버로 JSON 데이터 보내고 다시 받기</h3>
<hr>
<input type="button" onclick="sendSingleData()" value="sendData"><br>
<input type="button" onclick="sendListData()" value="sendListData"><br>
<input type="button" onclick="sendMapData()" value="sendMapData"><br>
<hr>
<br>
<h3>서버로 Form 데이터 보내기(쿼리스트링)</h3>
<hr>
<form name="frm1">
	<input type="text" name="mno" placeholder="Input mno..."><br>
	<input type="text" name="firstName" placeholder="Input firstName..."><br>
	<input type="text" name="lastName" placeholder="Input lastName..."><br>
</form>
<input type="button" onclick="sendFormData()" value="sendFormData"><br><br>
<input type="text" name="f1_txt" placeholder="result...."><br>
<br>


<script>
$("#j1").on("click", getJson);
function getJson(){
	$.ajax({
		url : "sample/getSample",
		type: "get",
		dataType: "json", // 서버가 클라이언트한테 보내주는 타입지정(객체상태로 오기때문에 생략가능)
		success: function(data){ // data : 서버가 보내준 데이터를 받는 인수(이름은 뭐든 상관없음 ex: result)
			/* var str = JSON.stringify(data); // 문자열로 출력하고 싶은 경우
			alert(str);
			$("input[name=j1_txt]").val(str); */
			alert(data.firstName);
			$("input[name=j1_txt]").val(data.firstName);
			}
		});	
}

// List
$("#j2").on("click", getJsonList);
function getJsonList(){
	$.ajax({
		url: "sample/getSampleList",
		type: "get",
		dataType: "json",
		success: function(data){
			alert(data[0].firstName);
			$("input[name=j2_txt1]").val(data[0].firstName);
			$("input[name=j2_txt2]").val(data[1].firstName);
			$("input[name=j2_txt3]").val(data[2].firstName);
		}
	});
}

// Map
$("#j3").on("click", getJsonMap);
function getJsonMap(){
	$.ajax({
		url: "sample/getSampleMap",
		type: "get",
		dataType: "json",
		success: function(data){
			alert(data.First);
			$("input[name=j3_txt1]").val(data.First.firstName);
			$("input[name=j3_txt2]").val(data.First.lastName);
		}
	});
}


<!-- 서버로 데이터 보내고 받기 -->
function sendSingleData(){
	console.log("sendSingleData.........");
	var obj = {mno : 1000, firstName : "Will", lastName: "Smith"};
	$.ajax({
		url: "sample/sendSingle",
		type: "post",
		data: JSON.stringify(obj), // 파라미터
		contentType: "application/json", // 서버로 보내는 데이터 타입
		dataType: "json", // 서버에서 받는 데이터 타입
		success: function(data){
			alert(data.firstName);
			$("input[name=j1_txt]").val(data.firstName);
		}
	});
}

<!-- 서버로 리스트 보내고 받기 -->
function sendListData(){
	var objList = [{mno : 1000, firstName : "Will", lastName: "Smith"}, {mno : 1001, firstName : "Bill", lastName: "Chris"}, {mno : 1001, firstName : "Poter", lastName: "Harry"}]
	console.log("sendListData...........")
	$.ajax({
		url: "sample/sendList",
		type: "post",
		data: JSON.stringify(objList),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			alert(data[0].firstName);
			$("input[name=j2_txt1]").val(data[0].firstName);
			$("input[name=j2_txt2]").val(data[1].firstName);
			$("input[name=j2_txt3]").val(data[2].firstName);
		}
	});
}

<!-- 서버로 맵 보내고 받기 -->
function sendMapData(){
	var objMap = {"member":{"mno" : 111, "firstName":"오공", "lastName":"손"}};
	console.log("sendMapData...........")
	$.ajax({
		url: "sample/sendMap",
		type: "post",
		data: JSON.stringify(objMap),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			alert(data.member.firstName);
			$("input[name=j3_txt1]").val(data.member.firstName);
			$("input[name=j3_txt2]").val(data.member.lastName);
		}
	});
	
}

<!-- 서버로 form 데이터 보내기 -->
function sendFormData(){
	var formdata = $("form[name=frm1]").serialize();
	console.log(formdata);
	$.ajax({
		url: "sample/sendFrom",
		type: "post",
		data: formdata, 
		dataType: "json",
		success: function(data){
			alert(JSON.stringify(data));
			$("input[name=f1_txt]").val(data.firstName);
		}
	});
}

</script>



</body>
</html>