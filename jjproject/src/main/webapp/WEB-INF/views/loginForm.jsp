<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<form class="my-5" id="loginForm" action="login" method="post">
			<h2 class="fw-bold">Member Login</h2>
			<fieldset>	
				<legend>Member Loin</legend>
				<div id="login">
					<p>
						<label for="userId" class="labelStyle">아이디</label>
						<input type="text" id="userId" name="userId" />
					</p>
					<p>
						<label for="userPass" class="labelStyle">비밀번호</label>
						<input type="password" id="userPass" name="userpass"/>
					</p>
				</div>
					<input type="submit" value="로그인" id="btnLogin" />
			</fieldset>
		</form>
	</div>
</div>