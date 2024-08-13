<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div style="display: flex; justify-content: center;">
	<div class="login-box">
		<div class="login-logo">
			<a href="/login">Login</a>
		</div>

		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>
				<!-- 스프링 시큐리티 로그인 폼 규칙
				
				1. 아이디 : name 속성값이 username이어야 함
				2. 비밀번호 : name 속성값이 password
				3. form태그의 action속성 값이 /login, method는 post
				4. csrf 처리
				5. submit 버튼
				 -->
				<form action="/login" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="ID" name="username">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
								<i class=></i>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password" name="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
							<!-- name값은 remember-me -->
								<input type="checkbox" id="remember-me" name="remember-me"> <label
									for="remember-me"> 자동 로그인 </label>
							</div>
						</div>

						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Sign
								In</button>
						</div>
					</div>
					<!-- csrf : Cross Site(크로스 사이트) Request(요청) Forgery(위조) -->
					<sec:csrfInput/>
				</form>
			</div>


		</div>
	</div>
</div>