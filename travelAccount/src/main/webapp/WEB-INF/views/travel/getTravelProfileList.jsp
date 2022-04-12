<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


			<!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h2 class="fw-bolder">내 여행 목록</h2>
                    </div>
                    <div class="row gx-5">
                    	<c:forEach var="trv" items="${travel }">
	                        <div class="col-lg-6 profiles">
	                            <div class="position-relative mb-5">
	                                <a class="profile-link h3 fw-bolder text-decoration-none link-dark stretched-link" href="/account/getTravelAccountList?travelNo=<c:out value='${trv.travelNo }'/>">
	                                	<!-- 썸네일 -->
	                                	<%-- <img class="profile-img img-fluid rounded-3 mb-3" src="/resources/images/<c:out value='${trv.photo }'/>" alt="프로필사진" onerror="this.src='/resources/images/busan.jpg'" /> --%>
	                                	<img class="profile-img img-fluid rounded-3 mb-3" src="display?fileName=<c:out value='${trv.photo }'/>" alt="프로필사진" onerror="this.src='/resources/images/busan.jpg'"/>
	                                </a>	
	                               	<ul class="travelProfile">
	                               		<li id="pTitle"><c:out value='${trv.title }'/></li>
	                               		<li id="pDate">
	                               			<c:out value="${trv.startDate }" />
	                               			 ~ 
	                               			 <c:out value="${trv.endDate }" />
	                               		</li>
	                               		<li id="pArea"><c:out value='${trv.area }' /></li>
	                               		<!-- <li id="pBudget">￦ </li> -->
	                               	</ul>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                    </div>
                    
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
                    
                </div>
            </section>

        
<%@include file="../includes/footer.jsp" %>
<script>

$(document).ready(function(){


	var result = '<c:out value="${result}"/>';
	
	console.log("여행번호 : ", result);
	
	checkModal(result);

	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result === '' || history.state){
			return;
		}

		if(parseInt(result) > 0){
			$(".modal-body").html("여행 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}

</script>