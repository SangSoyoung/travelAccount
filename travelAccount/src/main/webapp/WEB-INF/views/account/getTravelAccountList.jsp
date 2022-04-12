<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/travel_sidebar.jsp" %>

			<!-- Blog preview section-->
            <section class="py-6">
                <div class="container px-5 my-5">
                
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">예산/지출 내역</h2>
                            </div>
                        </div>
                    </div>
                    
                    <input type="hidden" name="travelNo" value=${td.travelNo }>
                    
                    <%-- 시작일 : 
					<fmt:formatDate pattern="yyyy-MM-dd" value="${td.startDate }" />
					종료일 :
					<fmt:formatDate pattern="yyyy-MM-dd" value="${td.endDate }" /> --%>
					<br>
					
					<!-- pagination --> 
					<div class="panel-footer" style="overflow:scroll;">
						<ul class='pagination pull-right'>
							<c:forEach var="num" items="${dateInfo }" >
								<li class="paginate_button page-item date-li" style="float: left; list-style: none; margin:1rem; text-align: center;">
									<a class='page-link page-btn' href="<c:out value='${num.date }' />">
										${num.month }<br>
										${num.day }<br>
										${num.dow }<br>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end pagination -->

					<hr style="clear: both;">	
					
					<!-- 예산 등록 modal 버튼 -->
					<a class="btn btn-primary" data-bs-toggle="modal" href="#budgetModalToggle" role="button" style="float: right;">예산등록</a>
					
					<!-- 지출 등록 modal 버튼 -->
					<a class="btn btn-primary" id="regExpBtn" data-bs-toggle="modal" href="#expenseModalToggle" role="button" style="float: right; ">지출등록</a>
	
	
					<table class="accTbl" style="clear: both">
						<thead>
							<tr>
								<td id="accDate" colspan="4">날짜</td>
							</tr>
							
							<tr data-accountNo="12">
								<td id="accCtgr">
									카테고리
								</td>

								<td id="accCenter" colspan="2">
									
									<ul class="accMoneyList">
										<li id="accMny">
											￦ 금액&nbsp;
										</li>
										<li>
											 |&nbsp;
										 </li>
										<li>
											 지불방식&nbsp;
										</li>
										<li>
											 |&nbsp;
										 </li>
										<li>
											 준비비용
										</li>
									</ul>
									
									<div id="accTitle">
										항목명
									</div>
								</td>
	
								<td id="photoTime">
									<div>
										<img id="accPhoto" src="" alt=""/>
										<p id="accTime">시간</p>
									</div>
								</td>
								
							</tr>
						</thead>
					</table>
					
					
					<!-- <div class="moneyResult">
						<div>
							<div>쓴돈</div>
							<div>￦ 0000</div>
						</div>
						<div>
							<div>남은돈</div>
							<div>￦ 0000</div>
						</div>
					</div> -->
					

						<!-- 출력 안하는 내역 정보 -->
						<!-- <input type="text" name="accountNo" value="등록번호">
						<input type="text" name="travelNo" value="여행번호">
						<input type="text" name="type" value="유형(예산/지출)">
						<input type="text" name="plat" value="위도">		
						<input type="text" name="plng" value="경도">	
						<input type="text" name="regDate" value="등록일">		
						<input type="text" name="updateDate" value="수정일"> -->	

				</div>
			</section>
        </main>
        
<%@include file="../includes/footer.jsp" %>


<!-- 예산등록 Modal -->
<%@include file="../includes/budgetRegModal.jsp" %>

<!-- 지출등록 Modal -->
<%@include file="../includes/expenseRegModal.jsp" %>
					
<!-- 지도추가 js -->	
<%@include file="../includes/mapJS.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab1f73f59a543bb3dbc9b1a83071194d&libraries=services"></script>
<script type="text/javascript">
// 예산/지출 목록 ajax로 처리

var travelNo = $("input[name=travelNo]").val();
var dateLink = $(".page-link"); // 날짜 버튼
var accTbl = $(".accTbl"); // 내역 목록 테이블
var moneyRsDiv = $(".moneyResult"); // 비용 내역

// 내역 전체 목록
function getAccountList(dateTime, travelNo){

	console.log(dateTime, " 예산/지출 목록 가져오기............");

	$.ajax({
		url: "account",
		type: "get",
		data: {dateTime : dateTime, travelNo : travelNo},
		contentType: "application/json",
		dataType: "json",
		success: function (data){

			var str = '';

			if(data == null || data.length == 0){
				accTbl.empty();
				str += "아직 등록된 예산/지출 내역이 없습니다.";
				accTbl.html(str);
				return;
			}

			var strDate = data[0].dateTime;
			var date = strDate.substr(0, 11);
			str += '<thead><tr><td id="accDate" colspan="4">'+date+'</td></tr>';

			for(var i=0, len=data.length || 0; i < data.length; i++){
				
				
				// data-accNo="'+data[i].accountNo : 상세조회 이벤트처리(댓글 조회 참고)	
				str += '<tr data-accountNo="'+data[i].accountNo+'"><td id="accCtgr">'+data[i].category+'</td><td id="accCenter" data-accNo="'+data[i].accountNo+'" colspan="2">';
				str += '<ul class="accMoneyList">';

				if(data[i].type == 1){ // 지출(빨강색)
					str += '<li id="accMny" style="color: #ff0000;">￦ '+data[i].money+'&nbsp;</li>'
				} else { // 예산(초록색)
					str += '<li id="accMny" style="color: #00b38a;">￦ '+data[i].money+'&nbsp;</li>'
				}
					// 내역 번호
					str += '<li style="display:none;">'+data[i].accountNo+'</li>';
					
				if(data[i].method == 1){
					str += '<li> |&nbsp;</li><li>카드&nbsp;</li>';
				} else {
					str += '<li> |&nbsp;</li><li>현금&nbsp;</li>';
				}

				if(data[i].prepMoney == 1){
					str += '<li> |&nbsp;</li><li>준비</li></ul>';
				} else {
					str += '</ul>';
				}

				str += '<div id="accTitle">'+data[i].title+'</div></td>';
				str += '<td id="photoTime"><div>'
				str += '<img id="accPhoto" src="/resources/images/'+data[i].photo+'" alt="" />'

				var strTime = data[i].dateTime;
				var time = strTime.substr(-8, 5);
				console.log(time);
				str += '<p id="accTime">'+time+'</p></div></td>'
		
			}
			accTbl.html(str);
			
		} // end success
	});
} // end getAccountList();


//비용 내역 출력 함수 추가
//function getMoneyResult(dateTime){

	/* str += '<div class="moneyResult"><div><div>쓴돈</div><div>￦ '+'</div></div>';
	str += '<div><div>남은돈</div><div>￦ '+'</div></div></div>'; */
	//moneyRsDiv.html(str);
	
//} // end getMoneyResult();


// 날짜별 목록 출력 이벤트처리
dateLink.on("click", function(e){

	e.preventDefault();
	var dateTime = $(this).attr("href");
	console.log(dateTime);	
	console.log(travelNo);
		
	getAccountList(dateTime, travelNo);
	//getMoneyResult(dateTime);
});


	
</script>
