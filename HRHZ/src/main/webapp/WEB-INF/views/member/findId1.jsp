<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/common/reset.css" />
<link rel="stylesheet" href="../../css/common/header_footer.css" />
<link rel="stylesheet" href="../../css/member/findId.css" /> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="background">
		<div class="outerWrapper">
			<div class="formContainer">
				<form class="form1">
					<!-- singupTitle -->
					<div class="signupTitle">휴대폰 번호 인증</div>
						<span class="signupOrder">
							<span class="signupOrderActive">아이디 찾기</span>
							<img src="../../images/member/step-right-arrow.png" alt="activeImg">
							<span class="signupOrderInactive">아이디 확인</span>
						</span>
							<br>

					<div class="signupText">
						<div>가입하신 휴대폰 번호로</div>
						<div>인증번호를 보내드립니다.</div>
					</div>

					<!-- 휴대폰 번호, 인증번호 -->
					<div class="inputContainer">
						<label for="phone">휴대폰 번호</label>
						<input type="tel" class="phone" maxlength="11" required>
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
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/findId.js"></script>
</body>
</html>