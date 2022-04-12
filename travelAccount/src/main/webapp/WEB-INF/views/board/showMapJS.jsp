<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab1f73f59a543bb3dbc9b1a83071194d"></script>    
<script>
/************* 지도 ******************************************************/
	
var plat = document.querySelector("input[name='plat']").value;	
var plng = document.querySelector("input[name='plng']").value;	

var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
mapOption2 = { 
	center: new kakao.maps.LatLng(plat, plng), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};

var map2 = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition2  = new kakao.maps.LatLng(plat, plng); 

// 마커를 생성합니다
var marker2 = new kakao.maps.Marker({
    position: markerPosition2
});

// 마커가 지도 위에 표시되도록 설정합니다
marker2.setMap(map2);

var iwContent2 = '', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition2 = new kakao.maps.LatLng(plat, plng); //인포윈도우 표시 위치입니다

    iwContent2 += '<div style="padding:5px;">여기에요!<br>';
    iwContent2 += '<a href="https://map.kakao.com/link/map/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">큰지도보기</a>&nbsp;';
    iwContent2 += '<a href="https://map.kakao.com/link/to/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">길찾기</a></div>';

        	
// 인포윈도우를 생성합니다
var infowindow2 = new kakao.maps.InfoWindow({
    position : iwPosition2, 
    content : iwContent2 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map2, marker2); 

</script>       