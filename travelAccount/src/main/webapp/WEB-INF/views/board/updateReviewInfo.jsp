<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/board_sidebar.jsp" %>

			<!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h3 class="fw-bolder">게시물 수정 페이지</h3>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form role="form" action="/board/updateReviewInfo" method="post" id="contactForm" >
									
									<!-- 페이지 정보 -->
									<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
									<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
									<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
                					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
									
                                    <div class="form-floating mb-3">
                                        <input type="hidden" name="boardNo" value="<c:out value='${board.boardNo }'/>" class="form-control" readonly="readonly"/>
                                    	<label for="boardNo">글 번호</label>
                                    </div>
                                    
                                    <!-- 제목 input-->
                                    <div class="form-floating mb-3">
                                        <input type="text"  name="title" value="<c:out value='${board.title }'/>" class="form-control" />
                                   		<label for="title">제목</label>
                                    </div>
                                    
                                    <!-- 카테고리 -->
                                    <div class="form-floating mb-3 category">
	                                    <p style="float: left;">카테고리&nbsp;</p>
	                                    <select name="category">
	                                    	<option value="<c:out value='${board.category }'/>">
	                                    		${board.category }
	                                    	</option>
	                                    	<option value="여행후기">여행 후기</option>
	                                    	<option value="여행정보">여행 정보</option>
	                                    </select>
                                    </div>
                                    
                                    <!-- 지역 -->
                                    <div class="form-floating mb-3 area">
	                                    <p style="float: left;">지역&nbsp;</p>
	                                    <select name="area">
	                                    	<option value="<c:out value='${board.area }'/>">
	                                    		${board.area }
	                                    	</option>
	                                    	<option value="서울">서울</option>
	                                    	<option value="부산">부산</option>
	                                    	<option value="제주">제주</option>
	                                    	<option value="인천">인천</option>
	                                    	<option value="춘천">춘천</option>
	                                    	<option value="속초">속초</option>
	                                    	<option value="양양">양양</option>
	                                    	<option value="강릉">강릉</option>
	                                    	<option value="동해">동해</option>
	                                    	<option value="강원">강원</option>
	                                    	<option value="대구">대구</option>
	                                    	<option value="울산">울산</option>
	                                    	<option value="광주">광주</option>
	                                    	<option value="여수">여수</option>
	                                    	<option value="목포">목포</option>
	                                    	<option value="전북">전북</option>
	                                    	<option value="전남">전남</option>
	                                    	<option value="경북">경북</option>
	                                    	<option value="경남">경남</option>
	                                    	<option value="충북">충북</option>
	                                    	<option value="충남">충남</option>
	                                    	<option value="대전">대전</option>
	                                    	<option value="세종">세종</option>
	                                    	<option value="경기">경기</option>
	                                    	<option value="그외">그외</option>
	                                    </select>
                                    </div>
                                    
                                   
                                    
                                    <!-- 사진추가 버튼 -->
                                    <div>
									   <div>
									     사진추가
									   </div>

								      	<div class='uploadDiv'>
											<input type='file' name='uploadFile' multiple>
										</div>

	                                    <!-- 업로드 파일명 출력부분 -->
										<div class='uploadResult'>
											<ul>
											
											</ul>
										</div>
									</div>
									<!-- ./사진추가 버튼 -->
									
									<!-- 사진 정보 넣기 -->
									<div class='uploadInput'>
										
									</div>

                                    
                                    
                                    
                                    <!-- 내용 input-->
                                    <div class="form-floating mb-3" style="clear:both">
                                        <textarea type="text" name="content" class="form-control" style="height: 10rem" ><c:out value='${board.content }'/></textarea>
                                    	<label for="content">내용</label>
                                    </div>
                                    
                                    <!-- 지도 -->
                                    <div class="form-floating mb-3" style="clear:both; margin-top:1rem;">
                                    	<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
										  위치변경
										</button>
										<div id="clickLatlng">
											<input type="hidden" value="<c:out value='${board.plat }'/>" name="plat" readonly="readonly"/>
                                    		<input type="hidden" value="<c:out value='${board.plng }'/>" name="plng" readonly="readonly"/>
										</div>
                                    </div>
                                    
                                    <!-- 작성자 -->
                                    <div class="form-floating mb-3 area">
	                                    <input type="text" name="writer" value="<c:out value='${board.writer }'/>" class="form-control" readonly="readonly">
	                                    <label for="regDate">작성자</label>
                                    </div>
                                    
                                    <!-- 등록일 -->
                                    <div class="form-floating mb-3">
                                        <input type="hidden"  name="regDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }" />' class="form-control" readonly="readonly"/>
                                    	<label for="regDate">등록일</label>
                                    </div>
                                    
                                    <!-- 수정일 -->
                                    <div class="form-floating mb-3">								  <!-- yyyy/MM/dd로 해서 오류나서 고침 -->
                                        <input type="hidden" name="updateDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" />' class="form-control" readonly="readonly"/>
                                    	<label for="updateDate">수정일</label>							
                                    </div>

                               	<button type="submit" data-oper="modify" class="oprBtn btn btn-primary btn-lg">수정완료</button>
                               	<button type="submit" data-oper="remove" class="oprBtn btn btn-primary btn-lg">삭제하기</button>
                               	<button type="submit" data-oper="list" class="oprBtn btn btn-primary btn-lg">목록가기</button>
                               	
							</form>
						</div>
                    </div>
                    <!-- Contact cards-->
					
					
					<!-- 지도 Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">위치변경</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							            <div>
							                <form onsubmit="searchPlaces(); return false;">
							                    키워드 : <input type="text" value="서면역" id="keyword" size="15"> 
							                    <button type="submit">검색하기</button> 
							                </form>
							            </div>
							        </div>
							        <hr>
							        <!-- 검색 결과 목록 -->
							        <ul id="placesList"></ul>
							        <div id="pagination"></div>
							    </div>
							    <h3>지도에서 원하는 클릭해주세요!</h3>
								
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="cancelMap" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">선택</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- end 지도 Modal -->
					
                </div>
            </section>
        </main>


<%@include file="../includes/footer.jsp" %>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab1f73f59a543bb3dbc9b1a83071194d&libraries=services"></script>

<script type="text/javascript">

$(document).ready(function(){


	// 수정/삭제/목록 버튼 클릭 이벤트
	var formObj = $('form');
	
	$('.oprBtn').on("click", function(e){
		e.preventDefault();

		var operation = $(this).data("oper");
		console.log(operation);
		
			
		if(operation === 'remove'){ // 삭제하기
			formObj.attr("action", "/board/deleteReviewInfo");
			
			
		} else if(operation === 'list'){ // 목록가기
			formObj.attr("action", "/board/reviewInfoBoard").attr("method", "get");

			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
			
		} else if (operation === 'modify'){
			console.log("submit clicked");

			formObj.submit();
		} // end modify opr
		
		formObj.submit();
	});

	
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


	// 업로드 파일 데이터 보내기(ajax)
	$("input[type='file']").change(function(e){
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
				
				console.log(result);
				showUploadedFile(result);
			}
		}); // end ajax
	}); // end 업로드 파일 데이터 보내기

	// 업로드 파일 이름 출력
	var uploadResult = $(".uploadResult ul");
	var formObj = $("form[role='form']");
	var uploadInpt = $(".uploadInput");
	
	function showUploadedFile(uploadResultArr){

		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){

			// 공백/한글 -> 적합한 문자열로 인코딩 처리
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			//str += "<li><img src='display?fileName="+fileCallPath+"'></li>";

			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'";
			str += " ><div>";

			str += "<span>"+obj.fileName+"</span>"; 
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='circle-Btn'>X</button><br>";
			str += "<img src='display?fileName="+fileCallPath+"'>";
			str += "</div></li>";
			
		});		
		uploadResult.append(str);

		
 		var msg = "";

		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			// 내용지우기
			uploadInpt.empty();
			// 다시추가
			msg += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";

		});
		
		uploadInpt.append(msg);
		
	} // end showUploadedFile()	


	
	// 첨부파일 보이기
	(function(){
		var boardNo = '<c:out value="${board.boardNo}" />';
		
		$.ajax({
			url: "getAttachList/",
			type: "get",
			data: {boardNo : boardNo},
			contentType: "application/json",
			dataType: "json",
			success: function (arr){
				
				console.log(arr);

				var str = "";

				$(arr).each(function(i, attach){
					//image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);

						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
						str += "<div>";
						str += "<span>"+attach.fileName+"</span>"; 
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='circle-Btn'>X</button><br>";
						str += "<img src='display?fileName="+fileCallPath+"'>";
						str += "</div></li>";
					}

				});
					
				$(".uploadResult ul").html(str);

				var msg = "";

				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					// 내용지우기
					uploadInpt.empty();
					// 다시추가
					msg += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					msg += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					msg += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					msg += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";

				});
				
				uploadInpt.append(msg);
				
			} // end success
		}); // end ajax
	})(); // end function

	// 첨부파일 삭제
	$(".uploadResult").on("click", "button", function(e){

		console.log("delete file");

		if(confirm("사진을 삭제하시겠습니까? ")){
			
			var targetLi = $(this).closest("li");
			targetLi.remove();
			
		}

		var msg = "";

		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			// 내용 지우기
			uploadInpt.empty();
			// 다시 추가
			msg += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			msg += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";

		});
		
		uploadInpt.append(msg);
		
	}); // end 첨부파일 삭제



});


/******** 지도 저장 ***********************/
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {					// 37.566826, 126.9786567 (서울시청)
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

var plat = "<c:out value='${board.plat }'/>";
var plng = "<c:out value='${board.plng }'/>";

$("#exampleModal").on('shown.bs.modal', function(e){
	setTimeout(function () { // 비동기 호출
        map.relayout();
        map.setCenter(new kakao.maps.LatLng(plat, plng));
        map.setLevel(3); //필요하면 레벨조정
     }, 100);
    
});

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});


// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}


//지도를 클릭한 위치에 표출할 마커입니다 /////////////////////////////////////////////////////////
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    var plat = latlng.getLat();
    var plng = latlng.getLng();

    console.log(plat);
    console.log(plng);
    
    var message = ''
    message += '<input type="hidden" name="plat" value="'+plat+'" >';
    message += '<input type="hidden" name="plng" value="'+plng+'" >';

    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});



// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


</script>