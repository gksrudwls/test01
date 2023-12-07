<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/member.js"></script>
<script src="resources/js/formcheck.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="template/header.jsp" %>
		<jsp:include page="${param.body}" />
		<%@ include file="template/footer.jsp" %>
	</div>
	<script src="resources/bootstarp/bootstrap.bundle.min.js"></script>
	<input type="hidden" id="isLogin" value="${sessionScope.isLogin}">
	<input type="hidden" id="loginId" value="${sessionScope.member.id}">
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true"
		data-bs-backdrop="static" data-bs-keyboard="false">
		<div class="modal-dialog">
		    <div class="modal-content">
		      	<div class="modal-header text-white" style="background-color:#93a5a8">
			        <h1 class="modal-title fs-5 fw-bold" id="modalLabel">Login</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      	</div>
				<form action="login" method="post">
					<div class="modal-body">	        
						<div class="mb-3">
		            		<label for="userId" class="col-form-label fw-bold">Id </label>
		            		<input type="text" class="form-control" id="userId" name="userId">
		          		</div>
			          	<div class="mb-3">
				            <label for="pass" class="col-form-label fw-bold">Password </label>
			            	<input type="password" class="form-control" id="pass" name="pass">
			          	</div>	        
		    		</div>
					<div class="modal-footer">
				        <button type="submit" class="btn" style="background-color:#93a5a8">Login</button>
						<button type="button" class="btn border border-2" data-bs-dismiss="modal">Cancle</button>
			      	</div>
		      	</form>
	    	</div>	    
		</div>
	</div>
	
</body>
</html>