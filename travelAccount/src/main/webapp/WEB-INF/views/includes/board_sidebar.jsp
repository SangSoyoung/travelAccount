<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#sidebar-nav {
    margin-top: 10%;
    left: 5%;
    position: fixed;
    z-index: 1;
    overflow: auto;
}

#sidebar-nav li {
	list-style: none;
	text-align: center;
	line-height: 40px;
	margin-bottom: 3rem;
/* 	background-color: #0d6efd;
	border-radius: 0.3rem;
	boarder-color: #0d6efd; */
}

.sidebar-a:hover, .sidebar-a:focus {
	color: rgba(255, 255, 255, 0.75);
}

.sidebar-a {
	width: 180px;
	height: 45px;
	text-decoration: none;
	/* color: black; */
}

</style>

<nav id="sidebar-nav">
	<ul>
		<li>
			<a class="sidebar-a btn btn-lg btn-primary" href="#">
				추천 여행 테마
			</a>
		</li>
		<li>
			<a class="sidebar-a btn btn-lg btn-primary" href="http://localhost:9000/board/reviewInfoBoard">
				여행 후기 정보
			</a>
		</li>
		<li>
			<a class="sidebar-a btn btn-lg btn-primary" href="#">
				가게 홍보 게시판
			</a>
		</li>
	</ul>
</nav>           