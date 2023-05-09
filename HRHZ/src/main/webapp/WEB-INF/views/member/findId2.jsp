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
					<div class="signupTitle">
						<div>입력하신 정보와</div>
						<div>일치하는 아이디입니다.</div>
					</div>
						<span class="signupOrder2">
							<span class="signupOrderActive">아이디 찾기</span>
							<img src="../../images/member/step-right-arrow.png" alt="activeImg">
							<span class="signupOrderActive">아이디 확인</span>
						</span>
						<br>
					<div class="signupText">
						<div>아이디 확인 후, 로그인 또는 비밀번호 찾기 버튼을 눌러주세요.</div>
					</div>
					<div> 찾은 아이디값 입력 </div>
					<button class="nextButton2">로그인</button>
					<div class="findPasswordSection">
						<span class="forgetPwd">비밀번호를 잊으셨나요?</span>
					</div>
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