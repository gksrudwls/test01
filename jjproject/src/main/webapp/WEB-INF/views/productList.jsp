<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<!-- content 영역 -->


	<div class="container">
		<form>
		<input type="hidden" id="isLogin" value="${sessionScope.isLogin}">
			<div class="row text-center">
				<div class="col mt-5 mb-5">
					<input type="text" class="rounded-pill border border-2" placeholder="   Search your items">
					<img src="resources/images/search2.png">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col">
				<button type="button" class="btn border border-2" onclick="location.href='boardList'">Back</button>
			</div>
			<div class="col text-end">
				<button type="button" class="btn" style="background-color:#93a5a8" id="writeBtn">Write</button>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<c:forEach var="p" items="${pList }">
				<div class="col-3 border border-3 m-3 p-3" style="width: 300px;">
					<div class="row">
						<div class="col" style="height: 300px;">
						    <img src="resources/upload/${p.file1 }" id="preview" class="img-fluid" alt="${product.file1 }" 
						    	class="col d-flex justify-content-center align-items-center">

<!-- 						    	style="width:290px; height:180px; object-fit: fill;"/>
 -->						</div>
					</div>
					<div class="row">
						<div class="col mt-5">
							<h2>${p.title }</h2>
						</div>
					</div>
					<div class="row">
						<div class="col mt-3 text-black-50">
							${p.content }
						</div>
					</div>
					<div class="row">
						<div class="col mt-5 mb-5">
							<a href="productDetail?no=${p.no }">
								<input type="button" class="bg-black text-white" value="More">
							</a>
						</div>
						<div class="col mt-5 mb-5 fs-6">
							${p.regDate }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>



	</div>