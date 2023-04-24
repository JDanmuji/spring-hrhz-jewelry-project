<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지_이메일 가입</title>
	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/member/signupStyle_3.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="background">
		<div class="outerWrapper">
			<div class="formContainer">
				<form action="./signIn.do" method="POST">
				<div class="form1">
					<div class="signupTitle">이메일 가입</span>
					<!-- singupTitle -->
						<span class="signupOrder">
							<span class="signupOrderInactive">본인인증하기</span>
							<img src="./images/member/step-right-arrow-inactive.png" alt="inactiveImg">
							<span class="signupOrderInactive">약관 동의</span>
							<img src="./images/member/step-right-arrow.png" alt="activeImg">
							<span class="signupOrderActive">이메일 가입</span>
						</span>
						<br>
					</div>

					<div class="signupText">로그인에 사용할 이메일과 비밀번호를 입력해 주세요.</div>

					<!-- 이메일, 비밀번호, 비밀번호 확인-->
					<div class="inputContainer">
						<label for="email">이메일</label> <input type="email" class="email" id="email" required> 
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="emailValidIcon">
						<span class="underline"></span>
					</div>
					<div class="emailError"></div>

					<div class="inputContainer">
						<label for="password">비밀번호</label> <input type="password" class="password" id="password">
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon">
						<span class="underline"></span>
					</div>
					<div class="passwordError"></div>					

					<div class="inputContainer">
						<label for="password_check">비밀번호 확인</label> <input type="password" class="passwordCheck" id="passwordCheck">
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon1">
						<span class="underline"></span>
					</div>
					<div class="passwordErrorCheck"></div>

					<button type="submit" class="nextButton" disabled>시작하기</button>
				</div>
				</form>
			</div>
		</div>
	</div>

	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/member.js"></script>
    <script>
		$(document).ready(function () {
			$('.email').on('input', function () {
				var email = $(this).val().trim();
				var exptext = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

				if (email === "") {
					$('.emailError').text('이메일을 입력해 주세요.').show();
					$(this).addClass('error');
					$('.emailValidIcon').hide();
				} else if (!exptext.test(email)) {
					$('.emailError').text('이메일 형식이 올바르지 않습니다.').show();
					$(this).addClass('error');
					$('.emailValidIcon').hide();
				} else {
					$('.emailError').hide();
					$(this).removeClass('error');
					$('.emailValidIcon').show();
				}
			});
		});
	</script>
	
	<script>
	$(document).ready(function () {
    var newPassword = '';
    var passwordCheck = '';
    $('.password').on('input', function () {
        newPassword = $(this).val().trim();
        updatePasswordValidation();
    });
    
    $('.passwordCheck').on('input', function(){
        passwordCheck = $(this).val().trim();
        updatePasswordCheckValidation();
    });
    
    function updatePasswordValidation() {
        var pwdtest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-?])(?=.*[0-9]).{8,}$/;

        if (newPassword === "") {
            $('.passwordError').text('비밀번호를 입력해 주세요.').show();
            $('.password').addClass('error');
            $('.passwordValidIcon').hide();
        } else if (!pwdtest.test(newPassword)){
            $('.passwordError').text('영문, 숫자, 특수기호 포함 8자 이상 입력해 주세요.').show();
            $('.password').addClass('error');
            $('.passwordValidIcon').hide();
        } else {
            $('.passwordError').hide();
            $('.password').removeClass('error');
            $('.passwordValidIcon').show();
        }
    }
    
    function updatePasswordCheckValidation() {
        if(passwordCheck === ""){
            $('.passwordErrorCheck').text('확인을 위해 새 비밀번호를 다시 입력해 주세요.').show();
            $('.passwordCheck').addClass('error');
            $('.passwordValidIcon1').hide();
        } else if(passwordCheck === newPassword){
        	$('.passwordErrorCheck').hide();
            $('.passwordCheck').removeClass('error');
            $('.passwordValidIcon1').show();
        } else {
        	$('.passwordErrorCheck').text('새 비밀번호와 일치하지 않습니다.').show();
            $('.passwordCheck').addClass('error');
            $('.passwordValidIcon1').hide();
        }
    }
});
</script>
<script>
$(document).ready(function () {
    $('.email, .password, .passwordCheck').on('input', function () {
        var email = $('.email').val().trim();
        var password = $('.password').val().trim();
        var passwordCheck = $('.passwordCheck').val().trim();
        var exptext = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        var pwdtest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-?])(?=.*[0-9]).{8,}$/;

        if (email === "" || !exptext.test(email)) {
            $('.emailValidIcon').hide();
        } else {
            $('.emailValidIcon').show();
        }

        if (password === "" || !pwdtest.test(password)) {
            $('.passwordValidIcon').hide();
        } else {
            $('.passwordValidIcon').show();
        }

        if (passwordCheck === "" || passwordCheck !== password) {
            $('.passwordValidIcon2').hide();
        } else {
            $('.passwordValidIcon2').show();
        }

        if($('.emailValidIcon').is(':visible') && $('.passwordValidIcon').is(':visible') && $('.passwordValidIcon1').is(':visible')){
            $('.nextButton').prop('disabled', false);
            $('.nextButton').css('background-color', 'black');
            
        } else {
            $('.nextButton').prop('disabled', true);
            $('.nextButton').css('background-color', '');
        }
    });
});
</script>

</body>
</html>