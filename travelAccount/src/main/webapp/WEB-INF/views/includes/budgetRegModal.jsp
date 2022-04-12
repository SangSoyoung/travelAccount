<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 첫번째 모달[예산등록폼] -->
   <div class="modal fade" id="budgetModalToggle" aria-hidden="true" aria-labelledby="budgetModalToggleLabel" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="budgetModalToggleLabel">예산등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                            
                                <form name="frm2" id="contactForm2" role='form'>
                                
                                	<input type="hidden" name="travelNo" value="${travelNo }">
									<!-- 항목명 -->
                                    <div class="form-floating mb-3">
                                        <input type="text" name="title" class="form-control" />
                                        <label for="title">항목명 입력란</label>
                                    </div>
                                    <!-- 예산금액 -->
                                    <div class="form-floating mb-3">
                                        <input type="text" name="money" class="form-control" />
                                        <label for="money">예산금액 입력란</label>
                                    </div>
                                    
                                    <!-- 유형(예산:0) -->
                                    <input type="hidden" name="type" value="0">

                                    <!-- 날짜 -->
									<div class="form-floating mb-3">
                                        날짜 <input type="date" name="date" min="<fmt:formatDate pattern='yyyy-MM-dd' value='${td.startDate }' />" max="<fmt:formatDate pattern='yyyy-MM-dd' value='${td.endDate }'/>" >
                                        시간 <input type="time" name="time">
                                    </div>
									
                                </form>
                                
                            </div>
                        </div>
                    </div>
	      		</div>

	      <div class="modal-footer">
	        <input type="button" id="modalRegBtn2" onclick="sendFormData2()" value="등록" class="btn btn-primary" data-bs-dismiss="modal">
	        
	      	<!-- <button id="modalModBtn2" type="button" class="btn btn-primary">수정</button>
	      	<button id="modalRemoveBtn2" type="button" class="btn btn-primary">삭제</button> -->
	      	<button id="modalCloseBtn2" type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
	      </div>
	      
	      
	      
	    </div>
	  </div>
	</div>
	

<script type="text/javascript">
//예산 등록 모달

	function sendFormData2(){

		var formdata = $("form[name=frm2]").serialize();

		console.log(formdata);

		$.ajax({
			url: "regBudget",
			type: "post",
			data: formdata, 
			dataType: "json",
			success: function(data){	
				console.log(data);
			}
		});
	}
	
var travelNo = $("input[name=travelNo]").val();
var dateLink = $(".page-link"); // 날짜 버튼
var accTbl = $(".accTbl"); // 내역 목록 테이블
var moneyRsDiv = $(".moneyResult"); // 비용 내역

var bdgModal = $("#budgetModalToggle");

var bmodalInputTitle = bdgModal.find("input[name='title']");
var bmodalInputMoney = bdgModal.find("input[name='money']");
var bmodalInputType = bdgModal.find("input[name='type']");
var bmodalInputCategory = bdgModal.find("input[name='category']");
var bmodalInputDate = bdgModal.find("input[name='date']");
var bmodalInputTime = bdgModal.find("input[name='time']");

var bmodalRegBtn = $("#modalCloseBtn2");
var bmodalCloseBtn = $("#modalCloseBtn2");
var bmodalModBtn = $("#modalModBtn2");
var bmodalRemoveBtn = $("#modalRemoveBtn2");

// 예산 등록버튼 클릭 ********************************/
$("#regBdgBtn").on("click", function(e){
	
	//alert("예산버튼 클릭");
	//expModal.find("input").val("");
	bdgModal.find("button[id = 'modalModBtn2']").hide();
	bdgModal.find("button[id = 'modalRemoveBtn2']").hide();

	bdgModal.find("button[id = 'modalRegBtn2']").show();
	bdgModal.find("button[id = 'modalCloseBtn2']").show();
	
	modalInputType.val(0);
	
	$("#budgetModalToggle").modal("show");
	
});


</script>