<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 첫번째 모달[지출등록폼] -->
   <div class="modal fade" id="expenseModalToggle" aria-hidden="true" aria-labelledby="expenseModalToggleLabel" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="expenseModalToggleLabel">지출등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                            
                                <form name="frm1" id="contactForm" role='form'>
                                
									<input type="hidden" name="travelNo" value="${travelNo }">
									
									<!-- 항목명 -->
                                    <div class="form-floating mb-3">
                                        <input type="text" name="title" class="form-control" />
                                        <label for="title">항목명 입력란</label>
                                    </div>
                                    <!-- 지출비용 -->
                                    <div class="inputMoney form-floating mb-3">
                                        <input type="text" name="money" class="form-control" />
                                        <label for="money">금액 입력란</label>
                                    </div>
                                    
                                    <!-- 유형(지출:1 / 예산:0) -->
                                    <input type="hidden" name="type" value="">
                                    
                                    <!-- 지불방식 -->
                                    <ul class="methodUl form-floating mb-3">
	                                    <li>
	                                    	<label><input type="radio" name="method" value="0" checked>현금</label>
										</li>
										<li>
											<label><input type="radio" name="method" value="1">카드</label>
                                    	</li>
                                    </ul>
                                    
                                    <!-- 카테고리 -->
                                    <ul class="categoryUl form-floating mb-3">
	                                    <li>
	                                    	<label><input type="radio" name="category" value="식비" id="food">식비</label>
	                                    </li>
	                                    <li>
	                                    	<label><input type="radio" name="category" value="쇼핑" id="shopping">쇼핑</label>
	                                    </li>
	                                    <li>
	                                    	<label><input type="radio" name="category" value="관광" id="tour">관광</label>
	                                    </li>
	                                    <li>
	                                    	<label><input type="radio" name="category" value="교통" id="transport">교통</label>
	                                    </li>
	                                    <li>
	                                    	<label><input type="radio" name="category" value="숙박" id="accomodation">숙박</label>
	                                    </li>
	                                    <li>
	                                    	<label><input type="radio" name="category" value="기타" id="etc">기타</label>
	                                    </li>

                                    </ul>
                                    
                                    <!-- Message input-->
                                    <div class="form-floating mb-3">
                                        <textarea type="text" name="memo" class="form-control" style="height: 10rem"></textarea>
                                        <label for="memo">지출에 관한 메모란</label>
                                    </div>
                                    
                                    <!-- 날짜 -->
									<div class="form-floating mb-3">
                                        날짜 <input type="date" name="date" min="<fmt:formatDate pattern='yyyy-MM-dd' value='${td.startDate }' />" max="<fmt:formatDate pattern='yyyy-MM-dd' value='${td.endDate }' />">
                                        시간 <input type="time" name="time">
                                    </div>
                                    
									
									<!-- 준비비용 -->
									<div class="form-floating mb-3">
										<input type="checkbox" id="prepMoney" name="prepMoney" value="1" style="float: left; margin-top: 0.3rem;">
                                    	<p id="prepMoneyText">&nbsp;준비비용</p>	
                                    </div>
                                    
                                    
                                    <!-- 사진추가 버튼 -->
                                    <div>
									   <div id='uploadTitle'>
									     사진추가
									   </div>

								      	<div id='uploadDiv'>
											<input type='file' name='uploadFile' multiple>
										</div>

	                                    <!-- 업로드 파일명 출력부분 -->
										<div class='uploadResult'>
											<ul>
											
											</ul>
										</div>
									</div>
									<!-- ./사진추가 버튼 -->
                                     <style>
										.uploadResult {
										  width:100%;
										}
										.uploadResult ul{
										  display:flex;
										  flex-flow: row;
										  justify-content: center;
										  align-items: center;
										}
										.uploadResult ul li {
										  list-style: none;
										  padding: 10px;
										  align-content: center;
										  text-align: center;
										}
										.uploadResult ul li img{
										  width: 100px;
										}
										.uploadResult ul li span {
										  color:white;
										}
										.bigPictureWrapper {
										  /* position: absolute; */
										  display: none;
										  justify-content: center;
										  align-items: center;
										  top:0%;
										  width:100%;
										  height:100%;
										  background-color: gray; 
										  z-index: 100;
										  background:rgba(255,255,255,0.5);
										  margin-bottom: 2rem;
										}
										.bigPicture {
										  /* position: relative;
										display:flex;
										justify-content: center; */
										  align-items: center;
										}
										
										.bigPicture img {
										  width:450px;
										}
									</style>
									<!-- 첨부파일(크게보기) -->
									<div class='bigPictureWrapper'>
									  <div class='bigPicture'>
									  </div>
									</div>

									
									<!-- 사진 정보 넣기 -->
									<div class='uploadInput' style="clear:both">
									</div>
									
									
									<!-- 지도 정보 -->
									<div id="mapBox">
										<div id="clickLatlng">
											<input type="hidden" value="" name="plat"/>
	                                    	<input type="hidden" value="" name="plng"/>
										</div>
									</div>
									
									<div id="map2" style="width:100%;height:350px;margin-bottom:2rem"></div>

                                </form>


                            </div>
                        </div>
                    </div>
	      	</div>
	      <div class="modal-footer">
	        <button id="modalAttachBtn" type="button" class="btn btn-primary" data-bs-target="#expenseModalToggle2" data-bs-toggle="modal">지도첨부</button>
	      	
	      	<button id="modalModBtn" type="button" class="btn btn-primary">수정</button>
	      	<button id="modalRemoveBtn" type="button" class="btn btn-primary">삭제</button>
	      	<button id="modalCloseBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
	      	
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 두번째 모달[지도첨부] -->
	<div class="modal fade" id="expenseModalToggle2" aria-hidden="true" aria-labelledby="expenseModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="expenseModalToggleLabel2">지도첨부</h5>
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
	        <button class="btn btn-primary" data-bs-target="#expenseModalToggle" data-bs-toggle="modal">뒤로가기</button>
	      	<input type="button" id="modalRegBtn1" value="등록" class="btn btn-primary" data-bs-dismiss="modal">
	      </div>
	    </div>
	  </div>
	</div>

	
<%@include file="../includes/mapJS.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab1f73f59a543bb3dbc9b1a83071194d"></script>
<script type="text/javascript">
$(document).ready(function(){
	

	$("#modalRegBtn1").on("click", function(){
		
		var formdata = $("form[name=frm1]").serialize();

		console.log(formdata);

		$.ajax({
			url: "regExpense",
			type: "post",
			data: formdata, 
			dataType: "json",
			success: function(data){	
				console.log(data);
			}
		});
	});

	
	var travelNo = $("input[name=travelNo]").val();
	var dateLink = $(".page-link"); // 날짜 버튼
	var accTbl = $(".accTbl"); // 내역 목록 테이블
	var moneyRsDiv = $(".moneyResult"); // 비용 내역
	
	//지출 등록 모달
	var expModal = $("#expenseModalToggle");
	var modalInputTitle = expModal.find("input[name='title']");
	var modalInputMoney = expModal.find("input[name='money']");
	var modalInputType = expModal.find("input[name='type']");
	var modalInputMethod = expModal.find("input[name='method']");
	var modalInputCategory = expModal.find("input[name='category']");
	var modalInputMemo = expModal.find("textArea[name='memo']");
	var modalInputDate = expModal.find("input[name='date']");
	var modalInputTime = expModal.find("input[name='time']");
	var modalInputPrepMoney = expModal.find("input[name='prepMoney']");
	
	//위도, 경도
	var modalInputPlat = expModal.find("input[name='plat']");
	var modalInputPlng = expModal.find("input[name='plng']");

	var modalRegBtn = $("#modalRegBtn");
	var modalAttachBtn = $("#modalAttachBtn");

	var modalCloseBtn = $("#modalCloseBtn");
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");

	
	//지출 등록버튼 클릭 ********************************/
	$("#regExpBtn").on("click", function(e){
		//alert("지출버튼 클릭");
	
		//expModal.find("input").val("");
		expModal.find("button[id = 'modalAttachBtn']").show();

		expModal.find("button[id = 'modalModBtn']").hide();
		expModal.find("button[id = 'modalRemoveBtn']").hide();
		$("#bigPictureWrapper").remove();
		$("#map2").remove();
		modalInputType.val(1);


		$("#expenseModalToggle").modal("show");
		
	});

	//파일 첨부*************************************************/
		var formObj = $("form[role='form']");

		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			//submit();
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

	
	


	
	//예산/지출 상세조회 이벤트 ********************************/
	$(".accTbl").on("click", "tr", function(e){
			
		//alert("상세조회 클릭");
		var accountNo = $(this).data("accountno");
		console.log(accountNo);

		$.ajax({
			url: "getExpense",
			type: "get",
			data: {accountNo : accountNo},
			contentType: "application/json",
			dataType: "json",
			success: function (data){
				
					var type= data.type;
					console.log(type);
					
					if(type == 1){

						$(".modal-header").html('<h5 class="modal-title" id="expenseModalToggleLabel">지출 조회</h5>');
						// 항목명
						modalInputTitle.val(data.title).attr("readonly", "readonly");
						// 금액
						modalInputMoney.val(data.money).attr("readonly", "readonly");
						
						// 유형(현금/카드)
						var method = data.method;
						console.log(method);
						if(method === 1){
							modalInputMethod.val(1).attr("checked", true);
							modalInputMethod.attr("disabled", true);
						} else {
							modalInputMethod.val(0).attr("checked", true);
							modalInputMethod.attr("disabled", true);
						}
						
						// 카테고리
						var category = data.category;
						console.log(category);
						$("input:radio[name ='category']:input[value='"+category+"']").attr("checked", true);
						modalInputCategory.attr("disabled", true);

						// 메모
						modalInputMemo.val(data.memo).attr("readonly", "readonly");

						// 날짜/시간
						var date = data.dateTime.substr(0,10);
						var time = data.dateTime.substr(-8, 5);;
						modalInputDate.val(date).attr("disabled", true);;
						modalInputTime.val(time).attr("disabled", true);;

						console.log("준비비용: ", data.prepMoney);
						if(data.prepMoney == 1){
							modalInputPrepMoney.attr("checked", true);
						} else {
							modalInputPrepMoney.attr("checked", false);
						}
						modalInputPrepMoney.val(data.prepMoney).attr("disabled", true);
						
						$("#uploadTitle").hide();
						$("#uploadDiv").hide();
						
						// 사진(.uploadResult)
						(function(){
							console.log(accountNo);
							$.ajax({
								url: "getAttachList/",
								type: "get",
								data: {accountNo : accountNo},
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
											str += "<div><img src='display?fileName="+fileCallPath+"'>";
											str += "</div></li>";
						
											console.log(fileCallPath);
										}
						
									});
										
									$(".uploadResult ul").html(str);
								} // end success
							}); // end ajax
						})(); // end function
							
						
						$(".uploadResult").on("click", "li", function(e){
							
							console.log("view image");
							var liObj = $(this);
							var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
						
							showImage(path.replace(new RegExp(/||/g),""));
						});
						
						// 사진 크게 보여주기
						function showImage(fileCallPath){
							
							//alert(fileCallPath);
						
							$(".bigPictureWrapper").css("display", "flex").show();
							$(".bigPicture")
							.html("<img src='display?fileName="+fileCallPath+"'>")
							.animate({height:'100%'}, 1000); // width:'100%', 
						}
						// 큰 사진 끄기
						$(".bigPictureWrapper").on("click", function(e){
						
							$(".bigPicture").animate({height:'0%'}, 1000);
							setTimeout(function(){
								$('.bigPictureWrapper').hide();
							}, 1000);
						});
						
						
						/************* 지도 ******************************************************/
						modalInputPlat.val(data.plat)
						modalInputPlng.val(data.plng)
						
						var plat = document.querySelector("input[name='plat']").value;	
						var plng = document.querySelector("input[name='plng']").value;	

						var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
					    mapOption2 = { 
					        center: new kakao.maps.LatLng(plat, plng), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
						    };
	
						var map2 = new kakao.maps.Map(mapContainer2, mapOption2);

						$("#expenseModalToggle").on('shown.bs.modal', function(e){
							setTimeout(function () { // 비동기 호출
						        map2.relayout();
						        map2.setCenter(new kakao.maps.LatLng(plat, plng));
						        map2.setLevel(5); //필요하면 레벨조정
						     }, 100);
						    
						});
						
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
						
						    //iwContent2 += '<div style="padding:5px;">여기에요!<br>';
						    iwContent2 += '<a href="https://map.kakao.com/link/map/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">&nbsp;큰지도보기</a>';
						    iwContent2 += '<a href="https://map.kakao.com/link/to/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">&nbsp;길찾기</a></div>';

							
						// 인포윈도우를 생성합니다
						var infowindow2 = new kakao.maps.InfoWindow({
						    position : iwPosition2, 
						    content : iwContent2 
						});
						  
						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow2.open(map2, marker2);

						// 모달창 버튼 정리
						expModal.data("accountNo", data.accountNo);
						expModal.find("button[id = 'modalAttachBtn']").hide();
						expModal.find("button[id = 'modalModBtn']").show();
						expModal.find("button[id = 'modalRemoveBtn']").show();

						
						$("#expenseModalToggle").modal("show");	
					} 
					
					// 예산 상세 조회
					else if(type == 0){ 

							bmodalInputType.val(0);
							
							$(".modal-header").html('<h5 class="modal-title" id="expenseModalToggleLabel">예산 조회</h5>');

							bmodalInputTitle.val(data.title);
							bmodalInputMoney.val(data.money);
							
							console.log("money : " + data.money);
				
							var date = data.dateTime.substr(0,10);
							console.log(date);
							var time = data.dateTime.substr(-8, 5);;
							console.log(time);
							bmodalInputDate.val(date);
							bmodalInputTime.val(time);

				
							bdgModal.data("accountNo", data.accountNo);

							bdgModal.find("button[id = 'modalModBtn']").show();
							bdgModal.find("button[id = 'modalRemoveBtn']").show();
							$("#modalRegBtn").hide();

							$("#budgetModalToggle").modal("show");

							}

					}

			});// end ajax
		});// end 예산/지출 상세조회 이벤트
});
		
</script>
