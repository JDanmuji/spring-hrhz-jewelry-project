<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지_이메일 가입</title>
	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/member/signUpStyle3.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" name="phone" value="${phone}">
	<input type="hidden" name="smsAlarm" value="${smsAlarm}">
	<input type="hidden" name="emailAlarm" value="${emailAlarm}">
	<div class="backGround">
		<div class="wrapper">
				<div class="formContainer">
				
						<div class="formHeader">
							<div class="signUpTitle">
								<span>이메일 가입</span>
							</div>
						
							<span class="signUpOrder">
								<span class="signUpOrderInactive">본인인증하기</span>
								<img src="./images/member/step-right-arrow-inactive.png" alt="inactiveImg">
								<span class="signUpOrderInactive">약관 동의</span>
								<img src="./images/member/step-right-arrow.png" alt="activeImg">
								<span class="signUpOrderActive">이메일 가입</span>
							</span>
							<br>
						</div>
				
					

					<div class="signUpText">
						<span>로그인에 사용할 이메일과 비밀번호를 입력해 주세요.</span>
					</div>

					<!-- 이메일, 비밀번호, 비밀번호 확인-->
					<div class="inputContainer">
						<label for="email">이메일</label> <input type="email" class="email" id="email" name="email" required> 
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="emailValidIcon">
						<span class="underline"></span>
					</div>
					<div class="emailError"></div>

					<div class="inputContainer">
						<label for="password">비밀번호</label> <input type="password" class="password" id="password" name="password">
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon">
						<span class="underline"></span>
					</div>
					<div class="passwordError"></div>					

					<div class="inputContainer">
						<label for="password_check">비밀번호 확인</label> <input type="password" class="passwordCheck" id="passwordCheck" name="passwordCheck">
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon1">
						<span class="underline"></span>
					</div>
					<div class="passwordErrorCheck"></div>

					<button class="nextButton" disabled>시작하기</button>
					</div>
		</div>
	</div>

	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/signUp3.js"></script>
		

</body>
</html>