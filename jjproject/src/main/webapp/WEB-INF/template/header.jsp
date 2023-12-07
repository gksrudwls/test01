<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
	<!-- header 영역 -->
	<div class="row container" id="global-header" style="background-color:#93a5a8">
		<div class="col-4 mt-3">
			<p>
				<a href="boardList"><img src="resources/images/logo.png" class="w-25"></a>
			</p>
		</div>
		<div class="col-8">
			<div class="row fs-3">
				<div class="col">
					<ul class="nav justify-content-end">
					  <li class="nav-item">
					    <a class="nav-link text-white" href="boardList">Home</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-white" href="#">Product</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-white" href="#">About</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-white" href="joinForm">Join</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-white" id="isLoginBtn" ${ not sessionScope.isLogin ? "data-bs-toggle='modal' data-bs-target='#loginModal'" : ""}
							href='${ sessionScope.isLogin ? "logout" : "#" }'>
							${ sessionScope.isLogin ? "Logout" : "Login" }</a>
					  </li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row" style="background-color:#93a5a8">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="resources/images/first.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/images/second.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/images/third.png" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	</div>
	