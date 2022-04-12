<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/board_sidebar.jsp" %>

            <!-- Blog preview section-->
            <section class="py-6">
                <div class="container px-5 my-5">
                
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">여행후기&정보 게시판</h2>
                            </div>
                        </div>
                    </div>
                    
					<button id='regBtn' type="button" class="btn btn-lg btn-primary insertBtn">
						게시물 작성
					</button>
					
                    <div class="row gx-5 bdcp" style="clear: both;">
                        <!--게시물 시작----------------------------------------------------- -->
	                    <c:forEach items="${list}" var="board">
	                        <div class="col-lg-4 mb-5">
	                            <div class="card h-100 shadow border-0">
	                            	<!--썸네일--------------------------------------- -->					
	                                <img class="card-img-top" src="display?fileName=<c:out value='${board.photo }'/>" alt="이미지 없음" onerror="this.src='/resources/images/busan.jpg'"/>
	                                <%-- <img class="card-img-top" src="/resources/images/<c:out value='${board.photo }'/>" alt="이미지 없음" /> --%>
	                                <div class="card-body p-4">
	                                <!--태그----------------------------------------- -->
	                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">
	                                    	<c:out value='${board.category }'/>
	                                    </div>
	                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">
	                                    	<c:out value='${board.area }'/>
	                                    </div>
	                                    <a class="move text-decoration-none link-dark stretched-link" href="<c:out value='${board.boardNo }'/>">
	                                <!--제목----------------------------------------- -->
	                                    	<h5 class="card-title mb-3"><c:out value='${board.title }'/></h5>
	                                    </a>
	                                </div>
	                                
	                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                                    <div class="d-flex align-items-end justify-content-between">
	                                        <div class="d-flex align-items-center">
	                                            <div class="small">
	                                <!--작성자, 작성일, 댓글, 스크랩---------------------- -->
	                                                <div class="fw-bold"><c:out value='${board.writer }'/></div>
	                                                <div class="text-muted">
	                                                	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }" />
	                                                </div>
	                                                <div class="text-muted">
	                                                	댓글 <c:out value='${board.replyCnt }'/> 
	                                                	| 스크랩 <c:out value='${board.scrapCnt }'/>
	                                                </div>
	                                            </div><!-- ./small -->
	                                        </div>
	                                    </div>
	                                </div><!-- ./card-footer -->
	                            </div><!-- ./card -->
	                        </div>
	                   </c:forEach>
                        <!--./게시물----------------------------------------------------- -->
                   </div><!-- ./bdcp -->
                  
                  <!-- 모달창 -->
                  <!-- Button trigger modal -->
				<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  모달창 연습창
				</button> -->
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="myModalLabel">처리 상태</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        처리가 완료되었습니다.
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
                  
                  
                  
                   <!-- 검색바 -->		
                   <form id="searchForm" action="/board/reviewInfoBoard" method="get" class="input-schbar input-group mb-3">
	                  <select name="type">
						  	<option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
						  	<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }" />>제목</option>
						  	<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
						  	<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }" />>작성자</option>
						  	<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }" />>제목/내용</option>
						  	<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }" />>제목/작성자</option>
						  	<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }" />>제목/내용/작성자</option>
					  </select>
					  <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />' class="form-control schTxt">
					  <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
					  <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
					  <button type="button" class="btn btn-outline-secondary">
					  	검색
					  </button>
					</form>
                    <!-- /input-group -->
                    
               </div>
               
               <!-- pagination --> 
               <div class="panel-footer">
               		<ul class='pagination pull-right'>
               		
               			<c:if test="${pageMaker.prev }">
		               		<li class='paginate_button page-item previousBtn'>
			               		<a class='page-link' href='${pageMaker.startPage -1 }'>
			               			이전
			               		</a>
		               		</li>
	               		</c:if>
	               		
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
							<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num }" class='page-link' >
									${num }
								</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class='paginate_button page-item nextBtn'>
								<a class='page-link' href='${pageMaker.endPage +1 }'>
									다음
								</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- end pagination -->
				
				<form id='actionForm' action="/board/reviewInfoBoard" method="get">
                	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                	<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
                	<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
                </form>   
				
            </section>
        </main>
        
<%@include file="../includes/footer.jsp" %>


<script type="text/javascript">

//console.log("================");
//console.log("JS TEST");

$(document).ready(function(){


	var result = '<c:out value="${result}"/>';
	
	console.log("게시글번호 : ", result);
	
	checkModal(result);

	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result === '' || history.state){
			return;
		}

		if(parseInt(result) > 0){
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}


	// 게시물 작성 버튼
	$("#regBtn").on("click", function(){
		self.location = "/board/insertReviewInfo";
	});


	// 페이지 처리
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){

		e.preventDefault();

		console.log('click');

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	// 게시물 조회 이벤트 처리
	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='boardNo' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "/board/getReviewInfo");
		actionForm.submit();
		
	});


	// 게시물 검색 이벤트 처리
	var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색 옵션을 선택하세요");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();
	});	
	
});

</script> 

