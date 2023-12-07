<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<!-- content 영역 -->
	<div class="container">
		<form>
			<div class="row text-center">
				<div class="col mt-5 mb-5">
					<input type="text" class="rounded-pill border border-2" placeholder="   Search your items">
					<img src="resources/images/search2.png">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col">
				<input type="button" class="btn border border-2" value="Back" onclick="location.href='boardList'"></input>
			</div>
			<div class="col text-end">
			<a href="writeForm">
				<input type="button" value="Write" class="btn" onclick="location.href='wrtieForm'" style="background-color:#93a5a8; color:white"></input>
			</a>
			</div>
		</div>
		<div class="row justify-content-center">
			<c:forEach var="my" items="${myList}">
				<div class="col-3 border border-3 m-3 p-3">
					<div class="row">
						<div class="col">
							<img src="resources/upload/${my.file1 }" style="width:290px;">
						</div>
					</div>
					<div class="row">
						<div class="col mt-5">
							<h2>${my.title }</h2>
						</div>
					</div>
					<div class="row">
						<div class="col mt-3 text-black-50">
							${my.content }
						</div>
					</div>
					<div class="row">
						<div class="col mt-5 mb-5">
							<a href="productDetail?no=${my.no}">
								<input type="button" class="bg-black text-white" value="More">
							</a>
						</div>
						<div class="col mt-5 mb-5 fs-6">
							${my.regDate }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>