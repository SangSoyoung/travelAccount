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
                            <h3 class="fw-bolder">게시물 조회 페이지</h3>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                            
                                <div id="contactForm" >
						
                                    <div class="form-floating mb-3">
                                        <input type="hidden" value="<c:out value='${board.boardNo }'/>" name="boardNo" class="form-control" readonly="readonly"/>
                                    	<label for="boardNo">글 번호</label>
                                    </div>
                                    
                                    <!-- 제목 input-->
                                    <div class="form-floating mb-3">
                                        <input type="text"  value="<c:out value='${board.title }'/>" name="title" class="form-control" readonly="readonly"/>
                                   		<label for="title">제목</label>
                                    </div>
                                    
                                    <!-- 카테고리 -->
                                    <div class="form-floating mb-3 category">
	                                    <p style="float: left;">카테고리&nbsp;</p>
	                                    <select name="category" disabled>
	                                    	<option value="<c:out value='${board.category }'/>">
	                                    		<c:out value='${board.category }'/>
	                                    	</option>
	                                    </select>
	                                    
                                    </div>
                                    
                                    <!-- 지역 -->
                                    <div class="form-floating mb-3 area">
	                                    <p style="float: left;">지역&nbsp;</p>
	                                    <select name="area" disabled>
	                                    	<option value="<c:out value='${board.area }'/>">
	                                    		<c:out value='${board.area }'/>
	                                    	</option>
	                                    </select>
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
                                    
                                    <!-- 내용 input-->
                                    <div class="form-floating mb-3">
                                        <textarea type="text" name="content" class="form-control" style="height: 10rem" readonly="readonly"><c:out value='${board.content }'/></textarea>
                                    	<label for="content">내용</label>
                                    </div>

									<!-- 지도 -->
                                    <div class="form-floating mb-3">
                                    	<input type="hidden" value="<c:out value='${board.plat }'/>" name="plat" readonly="readonly"/>
                                    	<input type="hidden" value="<c:out value='${board.plng }'/>" name="plng" readonly="readonly"/>
                                    </div>
                                    <div id="map" style="width:100%;height:350px;margin-bottom:2rem"></div>

                                    <!-- 작성자 -->
                                    <div class="form-floating mb-3 area">
	                                    <p style="float: left;">작성자 &nbsp;</p>
	                                    <p><c:out value='${board.writer }'/></p>
                                    </div>
                                    
                                    <!-- 등록일 -->
                                    <div class="form-floating mb-3">
                                        <input type="hidden"  value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate }" />' name="regDate" class="form-control" readonly="readonly"/>
                                    	<label for="regDate">등록일</label>
                                    </div>
                                    
                                    <!-- 수정일 -->
                                    <div class="form-floating mb-3">
                                        <input type="hidden"  value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate }" />' name="updateDate" class="form-control" readonly="readonly"/>
                                    	<label for="updateDate">수정일</label>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->

                    <button data-oper="modify" class="btn btn-primary btn-lg" >수정하기</button>
                    <button data-oper="list" class="btn btn-primary btn-lg" >목록가기</button>	
					
					<!-- 댓글 쓰기 버튼 -->	
					<a class="btn btn-primary" data-bs-toggle="modal" href="#replyModalToggle" role="button" style="float:right">댓글작성</a>
	
					<form id="operForm" action="/board/updateReviewInfo" method="get">
						<input type="hidden" id="boardNo" name="boardNo" value="<c:out value='${board.boardNo }'/>"> 
						<!-- 페이지 정보 -->
						<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
						<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
						<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
             			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
					</form>


					<!-- 댓글 부분 ----------------------------------------------------->
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment with nested comments-->
                            <ul class="d-flex mb-4 chat">
                                <li class="left clearfix" data-rno='12' style="list-style: none;">
	                                <!-- comment-->
	                                <!-- <div class="ms-3">
	                                    <div class="fw-bold header" style="float:left">
	                                    	<strong>IloveTravel0406 &nbsp;</strong>
	                                    	<small class="pull-right text-muted">2022.04.05</small>
	                                    </div>
	                                    <p>저도 한번 가보고 싶네요~</p>
	                                </div>
                           	 	</li>
                         	</ul>
                            댓글 한 블럭 끝
                            <hr>
                            <ul class="d-flex mb-4 chat">
                                <li class="left clearfix" data-rno='12' style="list-style: none;">
	                                comment
	                                <div class="ms-3">
	                                    <div class="fw-bold header" style="float:left">
	                                    	<strong>traveler &nbsp;</strong>
	                                    	<small class="pull-right text-muted">2022.04.01</small>
	                                    </div>
	                                    <p>잘 보고 가요^^</p>
	                                </div> -->
                           	 	</li>
                         	</ul>
                            <!-- 댓글 한 블럭 끝 -->
                        </div>
                    </div> 
                    
                    <div class="panel-footer">
					</div>
                    <!-- 댓글 창 끝 -->
                    
                    <!-- 댓글 작성 모달  -->
				   <div class="modal fade" id="replyModalToggle" aria-hidden="true" aria-labelledby="replyModalToggleLabel" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="replyModalToggleLabel">예산등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <!-- Contact form-->
				                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
				                        <div class="row gx-5 justify-content-center">
				                            <div class="col-lg-8 col-xl-6">
				                            
				                                <form action="/board/insertReviewInfo" method="post" id="contactForm" >
													<!-- 댓글 -->
				                                    <div class="form-floating mb-3">
				                                        <input type="text" name="reply" class="form-control" />
				                                        <label for="title">댓글 입력란</label>
				                                    </div>
				                                    <!-- 작성자 -->
				                                    <div class="form-floating mb-3">
				                                        <input type="text" name="replyer" class="form-control" value="aaa"/>
				                                        <label for="replyer">작성자</label>
				                                    </div>
				                                </form>
				                                
				                            </div>
				                        </div>
				                    </div>
					      		</div>
					      <div class="modal-footer">
							<button type="button" class="modalBtn btn btn-primary" data-bs-dismiss="modal">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
                    

                </div>

            </section>

        </main>


<%@include file="../includes/footer.jsp" %>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab1f73f59a543bb3dbc9b1a83071194d"></script>

<!-- 댓글 js 함수 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>

	$(document).ready(function(){

		var bnoValue = '<c:out value="${board.boardNo}"/>';
		console.log(bnoValue)
		var replyUL = $(".chat");
		// 댓글 목록 출력

		

		

		// 댓글 등록 모달창 이벤트 처리
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");

		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		


</script>


<!-- 파일 첨부 -->
<script type="text/javascript">

	$(document).ready(function(){

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
			operForm.attr("action", "/board/updateReviewInfo").submit();
		});

		$("button[data-oper='list']").on("click", function(e){
		operForm.find("#boardNo").remove();
		operForm.attr("action", "/board/reviewInfoBoard")
		operForm.submit();
		
		});

	});

	

	
/************* 지도 ******************************************************/
	
var plat = document.querySelector("input[name='plat']").value;	
var plng = document.querySelector("input[name='plng']").value;	

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
	center: new kakao.maps.LatLng(plat, plng), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(plat, plng); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(plat, plng); //인포윈도우 표시 위치입니다

    iwContent += '<div style="padding:5px;">여기에요!<br>';
    iwContent += '<a href="https://map.kakao.com/link/map/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">큰지도보기</a>&nbsp;';
    iwContent += '<a href="https://map.kakao.com/link/to/도착지,'+plat+', '+plng+'" style="color:blue" target="_blank">길찾기</a></div>';

        	
// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

</script>