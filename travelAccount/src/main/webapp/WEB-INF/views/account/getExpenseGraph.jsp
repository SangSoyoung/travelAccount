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
                                <h2 class="fw-bolder">지출 그래프</h2>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 파이차트 -->
					<div class="container"> 

						<div id="donutChart">
							<canvas id="chDonut3"></canvas>
						</div>
						
						<h4 id="totalExp">총지출 : ￦ ${total }</h4>
						
						<table class="expTbl">
							<c:forEach var="ae" items="${ae }" varStatus="index">
								<tr>
									<td>${ae.category }</td>
									<td id="rate">${ae.money_rate }</td>
									<td>￦ ${ae.totalCtgr }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
                    <!-- 파이차트 끝 -->

				</div>
			</section>
        </main>



<%@include file="../includes/footer.jsp" %>

<!-- 부트스트랩 --> 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- 차트 -->
<script> 
$(document).ready(function(){


	var size = ${ae.size()};
	console.log(size);
	//console.log(${ae[0].money_rate });
	//console.log(${ae[0].category });
	
	for(var i = 0; i < size; i++){ // 문제야 문제!
		console.log(${ae[i].money_rate });
		console.log(${ae[i].category });
	};

	
	// chart colors 
	var colors = ['red','#ffbc21','#b0e342','skyblue','#6e4be3','#d14be3']; /* 3 donut charts */ 

	var donutOptions = { 
		cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐 
		legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}} 
	}; 


	// donut 3
	var chDonutData3 = { 
		labels: [
			"<c:out value='${ae[0].category }'/>", 
			"<c:out value='${ae[1].category }'/>", 
			"<c:out value='${ae[2].category }'/>", 
			"<c:out value='${ae[3].category }'/>", 
			"<c:out value='${ae[4].category }'/>", 
			"<c:out value='${ae[5].category }'/>"], 
		datasets: [ 
			{ 
				backgroundColor: colors.slice(0,6), 
				borderWidth: 0, data: [
					"<c:out value='${ae[0].money_rate }'/>".replace('%',''), 
					"<c:out value='${ae[1].money_rate }'/>".replace('%',''), 
					"<c:out value='${ae[2].money_rate }'/>".replace('%',''), 
					"<c:out value='${ae[3].money_rate }'/>".replace('%',''), 
					"<c:out value='${ae[4].money_rate }'/>".replace('%',''), 
					"<c:out value='${ae[5].money_rate }'/>".replace('%','')]
			} 
		] 
	}; 

	var chDonut3 = document.getElementById("chDonut3"); 

	if (chDonut3) { 
		new Chart(chDonut3, { 
			type: 'pie', 
			data: chDonutData3, 
			options: donutOptions 
		}); 
	}
	
});

</script>
