var travelNo = $("input[name=travelNo]").val();
var dateLink = $(".page-link"); // 날짜 버튼
var accTbl = $(".accTbl"); // 내역 목록 테이블
var moneyRsDiv = $(".moneyResult"); // 비용 내역


var expModal = $("#expenseModalToggle");
var modalInputTitle = expModal.find("input[name='title']");
var modalInputMoney = expModal.find("input[name='money']");
var modalInputMethod = expModal.find("input[name='method']");
var modalInputCategory = expModal.find("input[name='category']");
var modalInputMemo = expModal.find("input[name='memo']");
var modalInputDate = expModal.find("input[name='date']");
var modalInputTime = expModal.find("input[name='time']");
var modalInputPrepMoney = expModal.find("input[name='prepMoney']");
// 사진(.uploadResult), 위도, 경도(#clickLatlng)

var modalAttachBtn = $("#modalAttachBtn");
var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalCloseBtn = $("#modalCloseBtn");

//지출 등록버튼 클릭
$("#regExpBtn").on("click", function(e){
	expModal.find("input").val("");
	expModal.find("button[id != 'modalAttachBtn']").hide();

	$("#expenseModalToggle").expModal("show");
});


//지출 상세조회 이벤트
$(".accTbl").on("click", "tr", function(e){

	var accountNo = $(this).data("accountno");
	console.log(accountNo);

	$.ajax({
		url: "getExpense",
		type: "get",
		data: {accountNo : accountNo},
		contentType: "application/json",
		dataType: "json",
		success: function (data){

			modalInputTitle.val(data.title);
			
			
			console.log(data.title);
			
			expModal.data("accountNo", data.accountNo);
			
			$("#expenseModalToggle").modal("show");
			
		}
	});// end ajax
}); // end 예산/지출 상세조회 이벤트

