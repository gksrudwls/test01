<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- content 영역 -->
	<div class="row my-5 container" id="global-content">
		<div class="offset-3 col-6 rounded-4" style="background-color:#93a5a8">
			<form action="joinResult" name="joinForm" id="joinForm" method="post">
			<div class="row m-3">
				<div class="col fs-1 text-center text-white">
					Join
				</div>
			</div>
				<input type="hidden" name="isIdCheck" id="isIdCheck" value="false">
				<div class="row">
					<div class="col bg-white m-3 rounded-4">	
						<div class="row mt-5 mb-3">
							<div class="col-8 offset-2">
								<label for="name" class="form-label">Name </label>
								<input type="text" class="form-control" name="name" id="name">
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="id" class="form-label">Id </label>
								<div class="row">
									<div class="col-6">
										<input type="text" class="form-control" name="id" id="id">
									</div>
									<div class="col-4">
										<input type="button" class="btn" id="btnOverlapId" value="Check" style="background-color:#93a5a8; color:white">
									</div>
								</div>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="pass" class="form-label">Password </label>
								<input type="password" class="form-control" name="pass" id="pass1">
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="pass2" class="form-label">Password Check </label>
								<input type="password" class="form-control" name="pass2" id="pass2">
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="zipcode" class="form-label">Zid Code </label>
								<div class="row">
									<div class="col-4">
										<input type="text" class="form-control" name="zipcode" id="zipcode" maxlength="5" readonly>
									</div>
									<div class="col-4">
										<input type="button" class="btn" id="btnZipcode" value="Find Zip Code" style="background-color:#93a5a8; color:white">
									</div>
								</div>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="address1" class="form-label">Address </label>
								<input type="text" class="form-control" name="address1" id="address1" readonly>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="address2" class="form-label">Detail Address </label>
								<input type="text" class="form-control" name="address2" id="address2">
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="email" class="form-label">Email </label>
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" name="email" id="email">
									</div>
								</div>
							</div>
						</div>
						<div class="row my-3">
							<div class="col-8 offset-2">
								<label for="phone" class="form-label">Phone </label> 
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" name="phone" id="phone" maxlength="20">
									</div>
								</div>
							</div>
						</div>
						<div class="row my-5">
							<div class="col-8 offset-2 text-center"> 
								<input type="submit" value="Submit" class="btn" style="background-color:#93a5a8; color:white">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>