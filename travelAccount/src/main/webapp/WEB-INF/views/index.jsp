<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp" %>

            <!-- Header-->
            
            <header class="bg-dark py-5">
                <div class="container px-6">
                    <div class="slideShow align-items-center justify-content-center">
                   		<div class="mySlideDiv fade1 active">
                   			<img src="/resources/images/slideshow1.jpg" alt="준비중" >
                   		</div>
                   		<div class="mySlideDiv fade1">
                   			<img src="/resources/images/slideshow2.jpg" alt="준비중" >
                   		</div>
                   		<div class="mySlideDiv fade1">
                   			<img src="/resources/images/slideshow3.jpg" alt="준비중" >
                   		</div> 
                   		
                   		<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
						<div class="prev" onclick="prevSlide()">◀</div>
						<div class="next" onclick="nextSlide()">▶</div>	      
                    </div>		
                </div>
            </header>

            <!-- Blog preview section-->
            <section class="py-6">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">우리 여행 후기 함께 볼래요?</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                    
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/jeju.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행후기</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">제주</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">유채꽃 가득했던 제주</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                                <div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/img.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행후기</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">부산</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">부산 벽화마을 감천문화마을</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                                <div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/gapyung.png" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행후기</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">경기</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">가평 펜션 2박3일 후기</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                            	<div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   	<a class="more" href="http://localhost:9000/board/reviewInfoBoard">더보기 ></a>
                </div>
            </section>
            
            
            <section class="py-6">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">프로 여행자님들이 알려주는 여행 꿀팁!</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/yang.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행정보</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">양양</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">양양 서핑교실 낭만비치 서핑스쿨</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                                <div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/temple.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행정보</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">부산</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">용궁사 다녀왔어요~~~</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                                <div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="/resources/images/cherryBlossom.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행정보</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">경기</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">올해 경기권 벚꽃축제 정보 공유해요!</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">aaa</div>
                                                <div class="text-muted">2022-04-05</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   	<a class="more" href="http://localhost:9000/board/reviewInfoBoard">더보기 ></a>
                </div>
            </section>
            
            <section class="py-6">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">우리 가게 어떠세요? 가게 PR</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">여행후기</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">부산</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">제목제목제목.....</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">2022.00.00</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">Another blog post title</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">2022.00.00</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                    	<h5 class="card-title mb-3">Another blog post title</h5>
                                    </a>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">2022.00.00</div>
                                                <div class="text-muted">댓글 0 | 스크랩 0</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   	<a class="more" href="#">더보기 ></a>
                </div>
            </div>
           </section>
            
        </main>
 
<script type="text/javascript" src="/resources/js/slideshow.js">
</script> 
 

        
<%@include file="includes/footer.jsp" %>

