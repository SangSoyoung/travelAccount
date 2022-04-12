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
                            <h3 class="fw-bolder">여행 프로필 조회</h3>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                          
                                <div id="contactForm" >
									
									<div class="form-floating mb-3">
                                        <input type="hidden" value="<c:out value='${travel.travelNo }'/>" name="travelNo" class="form-control" readonly="readonly"/>
                                    	<label for="travelNo">여행 번호</label>
                                    </div>
									
									
                                    <div class="form-floating mb-3">
                                        <input type="text" value="<c:out value='${travel.title }'/>" name="title" class="form-control" readonly="readonly"/>
                                        <label for="title">여행 제목</label>
                                    </div>
                                    
                                     <!-- Message input-->
                                    <div class="form-floating mb-3" style="clear:both;">
                                        <textarea name="memo" class="form-control" style="height: 10rem" readonly="readonly"><c:out value='${travel.memo }'/></textarea>
                                        <label for="memo">여행에 대한 메모</label>
                                    </div>
                                    
                                    <!-- 여행 지역 -->
                                    <div class="form-floating mb-3 area">
	                                    <p style="float: left;">여행 지역&nbsp;</p>
	                                    <select name="area" disabled>
	                                    	<option value="<c:out value='${travel.area }'/>">
	                                    		<c:out value='${travel.area }'/>
	                                    	</option>
	                                    </select>
                                    </div>
                                                                        
                                    <!-- 여행 날짜 -->
									<div class="form-floating mb-3">
                                        시작일 <input type="date" name="startDate" value="<c:out value='${travel.startDate }' />"  readonly="readonly"><br>
                                        종료일 <input type="date" name="endDate" value="<c:out value='${travel.endDate }' />"  readonly="readonly">
                                    </div>
                                    
									
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
										}
										.bigPicture {
										  /* position: relative;
										display:flex;
										justify-content: center; */
										  align-items: center;
										}
										
										.bigPicture img {
										  width:600px;
										}
									</style>
									<!-- 첨부파일(크게보기) -->
									<div class='bigPictureWrapper'>
									  <div class='bigPicture'>
									  </div>
									</div>

									<!-- 첨부파일(사진) -->
									<div class="uploadResult">
										<ul>
										</ul>
									</div>
									
									
                                    <!-- 작성자(id) -->
                                    <input type="hidden" name="id" value="aaa" readonly>
                                    <br><br>
                                    
                                    <!-- 등록일 -->
                                    <div class="form-floating mb-3">
                                        <input type="hidden"  value='<fmt:formatDate pattern="yyyy/MM/dd" value="${travel.regDate }" />' name="regDate" class="form-control" readonly="readonly"/>
                                    	<label for="regDate">등록일</label>
                                    </div>
                                    
                                    <!-- 수정일 -->
                                    <div class="form-floating mb-3">
                                        <input type="hidden"  value='<fmt:formatDate pattern="yyyy/MM/dd" value="${travel.updateDate }" />' name="updateDate" class="form-control" readonly="readonly"/>
                                    	<label for="updateDate">수정일</label>
                                    </div>
                                  
                               	</div>
								<!-- 내용 끝 -->	
									
									
                                	<button data-oper="modify" class="btn btn-primary btn-lg" >수정하기</button>
                   					<button data-oper="list" class="btn btn-primary btn-lg" >목록가기</button>	
					
									<form id="operForm" action="/travel/updateTravelProfile" method="get">
										<input type="hidden" id="travelNo" name="travelNo" value="<c:out value='${travel.travelNo }'/>"> 
									</form>

                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
					

					
                </div>
            </section>
        </main>


<%@include file="../includes/footer.jsp" %>

<!-- 파일 첨부 -->
<script type="text/javascript">

	$(document).ready(function(){

		(function(){
			var travelNo = '<c:out value="${travel.travelNo}" />';
			
			$.ajax({
				url: "getAttachList/",
				type: "get",
				data: {travelNo : travelNo},
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
			


		// 수정/목록 버튼
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/travel/updateTravelProfile").submit();
		});

		$("button[data-oper='list']").on("click", function(e){
		operForm.find("#travelNo").remove();
		operForm.attr("action", "/travel/getTravelProfileList")
		operForm.submit();
		
		});

	});


</script>