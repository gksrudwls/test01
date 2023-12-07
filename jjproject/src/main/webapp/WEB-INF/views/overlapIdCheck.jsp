<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/member.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="row my-5" id="global-content">
	
	<c:choose>
		<c:when test="${overlap}">
		
		<!-- 아이디가 사용할 수 없는 경우 -->
		<div class="col">
			<div class="row">
				<div class="col">
					<h2 class="fw-bold fs-3 text-center">사용할 수 없는 아이디</h2>
				</div>
			</div>
			<div class="row my-3 text-center">
				<div class="col">
					입력하신 ${id}는 이미 사용 중인 아이디입니다.
				</div>
			</div>
			<div class="row my-3 text-center">
				<div class="col">
					다른 아이디를 입력해주세요.
				</div>
			</div>
			<form action="overlapIdCheck" method="post" name="idCheckForm" id="idCheckForm" class="row mt-5">
				<div class="col-10 offset-1">
					<div class="input-group">
						<span class="input-group-text">Id </span>
						<input type="text" class="form-control" name="id" id="checkId">
						<input type="submit" class="btn" value="확인" style="background-color:#93a5a8; color:white">
					</div>
				</div> 
			</form>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 아이디를 사용할 수 있는 경우 -->
		<div class="col">
			<div class="row">
				<div class="col">
					<h2 class="fw-bold fs-3 text-center">사용할 수 있는 아이디</h2>
				</div>
			</div>
			<div class="row my-3 text-center">
				<div class="col text-center">
					입력하신 ${id}는 사용할 수 있는 아이디입니다.
				</div>
			</div>
			<div class="row my-3">
				<div class="col text-center">
					<input type="button" value="${id}를 아이디로 사용하기" id="btnIdCheckClose" data-id-value="${id}" class="btn" style="background-color:#93a5a8; color:white">
				</div>
			</div>
		</div>
		</c:otherwise>
		
	</c:choose>
	</div>
</body>
</html>