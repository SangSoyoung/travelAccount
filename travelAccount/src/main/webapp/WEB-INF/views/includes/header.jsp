<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>Gago-Gago By Sang Soyoung</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        
        <!-- 부트스트랩 링크 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- 차트 링크 -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/slideshow.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
		<link href="/resources/css/map.css" rel="stylesheet" />
		<link href="/resources/css/account.css" rel="stylesheet" />
		<link href="/resources/css/profile.css" rel="stylesheet" />
    	<link href="/resources/css/attachFile.css" rel="stylesheet" />
    	
    	<script src="https://kit.fontawesome.com/45ba35c05c.js" crossorigin="anonymous"></script>
    
    
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->

	            <div id="navbarSupportedContent">
	                <ul class="top-nav">
	                	<li class="nav-item1">aaa님 반갑습니다!</a>
	                	<li class="nav-item1"><a class="nav-link1" href="#">로그아웃</a></li>
	                    <!-- <li class="nav-item1"><a class="nav-link1" href="#">로그인</a></li> -->
	                    <!-- <li class="nav-item1"><a class="nav-link1" href="#">회원가입</a></li> -->
	                    <li class="nav-item1"><a class="nav-link1" href="#">마이페이지</a></li>
	                    <li class="nav-item1"><a class="nav-link1" href="#">고객지원</a></li>
	                </ul>
	            </div>
            
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="border-bottom: 1px solid #d3d3d3;"> 
                <div class="container px-5">
                    <a class="navbar-brand" href="http://localhost:9000/">Gago-Gago</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">        
                            <li class="nav-item" style="display:none">
                            	<!-- style="display:none" -->	
                            	<a class="nav-link btn btn-outline-light btn-lg px-4 me-sm-3" href="#">회원 관리</a>
                            </li>
                            <li class="nav-item">
                            	<a class="nav-link btn btn-primary btn-lg px-4 me-sm-3" href="http://localhost:9000/travel/insertTravelProfile">새 여행 만들기</a>
                            </li>
                            <li class="nav-item">
                            	<a class="nav-link btn btn-primary btn-lg px-4 me-sm-3" href="http://localhost:9000/travel/getTravelProfileList">내 여행 목록</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle btn btn-primary btn-lg px-4 me-sm-3" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="#">추천 여행 테마</a></li>
                                    <li><a class="dropdown-item" href="http://localhost:9000/board/reviewInfoBoard">여행 후기&정보</a></li>
                                    <li><a class="dropdown-item" href="#">가게 홍보 게시판</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

			<!-- 날씨 위젯 -->
            <!-- <aside id="widget">
            	<div id="schBar">
            		<input type="text" name="cityName" value="도시명">
            		<input type="button" name="schBtn" value="검색">
            	</div>
            	<div id="weather">
            		<ul>
            			<li>1</li>
            			<li>2</li>
            			<li>3</li>
            			<li>4</li>
            		</ul>
            	</div>
            </aside> -->
            
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>            