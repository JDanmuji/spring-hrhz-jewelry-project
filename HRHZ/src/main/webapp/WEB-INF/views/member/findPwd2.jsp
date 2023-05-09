<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/common/reset.css" />
<link rel="stylesheet" href="../../css/common/header_footer.css" />
<link rel="stylesheet" href="../../css/member/findPwd2.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="background">
		<div class="outerWrapper">
			<div class="formContainer">
				<form class="form1">
				
					<div class="signupTitle">비밀번호 재설정</div>
						<span class="signupOrder">
							<span class="signupOrderActive">비밀번호 찾기</span>
							<img src="../../images/member/step-right-arrow.png" alt="activeImg">
							<span class="signupOrderActive">비밀번호 재설정</span>
						</span>
						<br>
					<div class="signupText">
						<div>정보가 확인되었습니다.</div>
						<div>새로운 비밀번호를 입력해 주세요.</div>
					</div>

					<div class="inputContainer">
						<label for="password">새 비밀번호</label>
						<input type="password" class="password">
						<img src="../../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon">
						<span class="underline"></span>
					</div>
					<div class="passwordError"></div>

					<div class="inputContainer">
						<label for="passwordCheck">새 비밀번호 확인</label>
						<input type="password" class="passwordCheck">
						<img src="../../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon1">
						<span class="underline"></span>
					</div>
					<div class="passwordErrorCheck"></div>

					<button class="nextButton">확인</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/findPwd2.js"></script>
</body>
</html>