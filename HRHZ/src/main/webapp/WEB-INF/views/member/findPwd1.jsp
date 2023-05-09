<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/common/reset.css" />
<link rel="stylesheet" href="../../css/common/header_footer.css" />
<link rel="stylesheet" href="../../css/member/findPwd1.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="background">
		<div class="outerWrapper">
			<div class="formContainer">
				<form class="form1">
					
					<div class="signupTitle">가입정보 인증</div>
						<span class="signupOrder">
							<span class="signupOrderActive">비밀번호 찾기</span>
							<img src="../../images/member/step-right-arrow.png" alt="activeImg">
							<span class="signupOrderInactive">비밀번호 재설정</span>
						</span>
						<br>
					<div class="signupText">
						<div>가입 시 입력한 휴대폰 번호와 이메일이 일치해야</div>
						<div>인증번호를 받을 수 있습니다.</div>
					</div>

					<div class="inputContainer">
						<label for="email">이메일</label> <input type="email" class="email">
						<img src="../../images/member/valid-input-check-icon.png" alt="image" class="emailValidIcon">
						<span class="underline"></span>
					</div>
					<div class="emailError"></div>

					<div class="inputContainer">
						<label for="phone">휴대폰 번호</label>
						<input type="tel" class="phone" id="phone" maxlength="11" required>
						<button class="certification">인증번호 전송</button>
						<span class="underline"></span>
					</div>
					<div class="phoneError"></div>

					<div class="inputContainer">
						<label for="authentication">인증번호</label>
						<input type="text" class="authentication" maxlength="6" required>
						<img src="../../images/member/valid-input-check-icon.png" alt="image" class="authenticationValidIcon">
						<span class="underline"></span>
					</div>
					<div class="authenticationError"></div>

					<button class="nextButton">다음</button>
					<div class="findPasswordSection">
						<span class="forgetEmail">가입하신 이메일 주소를 잊으셨나요?</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/findPwd1.js"></script>
</body>
</html>