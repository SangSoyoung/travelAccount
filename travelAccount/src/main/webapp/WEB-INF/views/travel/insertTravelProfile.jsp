<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/travel_sidebar.jsp" %>

			<!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h3 class="fw-bolder">새 여행 만들기</h3>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                          
                                <form role='form' action="/travel/insertTravelProfile" method="post" id="contactForm" >

                                    <div class="form-floating mb-3">
                                        <input type="text" name="title" class="form-control" />
                                        <label for="title">여행 제목을 입력해주세요</label>
                                    </div>
                                    
                                     <!-- Message input-->
                                    <div class="form-floating mb-3" style="clear:both;">
                                        <textarea name="memo" class="form-control" style="height: 10rem"></textarea>
                                        <label for="memo">여행에 대해 간단히 메모해 보세요</label>
                                    </div>
                                    
                                    <!-- 여행 지역 -->
                                    <div class="form-floating mb-3 area">
	                                    <p style="float: left;">여행 지역&nbsp;</p>
	                                    <select name="area">
	                                    	<option value="">--</option>
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
	                                    	<option value="전주">전주</option>
	                                    	<option value="전북">전북</option>
	                                    	<option value="전남">전남</option>
	                                    	<option value="경북">경북</option>
	                                    	<option value="경남">경남</option>
	                                    	<option value="충북">충북</option>
	                                    	<option value="충남">충남</option>
	                                    	<option value="대전">대전</option>
	                                    	<option value="세종">세종</option>
	                                    	<option value="경기">경기</option>
	                                    </select>
                                    </div>
                                                                        
                                    <!-- 여행 날짜 -->
									<div class="form-floating mb-3">
										<!-- 시작일 <input type="text" value="2022-05-02" name="startDate"><br>
                                        종료일 <input type="text" value="2022-05-04" name="endDate"> -->
                                        시작일 <input type="date" name="startDate"><br>
                                        종료일 <input type="date" name="endDate">
                                    </div>
                                   

                                    <!-- 사진추가 버튼 -->
                                    <div>
									   <div>
									     커버사진
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
									<div class='uploadInput' style="clear:both">
									</div>
									
                                    <!-- 작성자(id) -->
                                    <input type="text" name="id" value="aaa" readonly>
                                    <br><br>
                                    <input type="submit" class="submitBtn btn btn-primary btn-lg" value="입력완료">
                                	<input type="reset" class="resetBtn btn btn-primary btn-lg" value="내용삭제">
                               
                               	</form>
									
                                	<button class="btn btn-primary btn-lg" id="cancelBtn">목록가기</button>

                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
					

					
                </div>
            </section>
        </main>


<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

	$(document).ready(function(e){


		var formObj = $("form[role='form']");

		$("button[type='submit']").on("click", function(e){
			//e.preventDefault();
			console.log("submit clicked");
			submit();
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


		

		// 목록가기 이벤트 처리
		$("#cancelBtn").on("click", function(){
			self.location = "/travel/getTravelProfileList";
		});

	});

</script>