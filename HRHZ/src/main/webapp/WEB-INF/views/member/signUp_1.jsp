<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입 페이지_회원가입</title>
	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/member/signupStyle_1.css" />
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  </head>

  <body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div class="background">
      <div class="outerWrapper">
        <div class="innerWrapper">
          <div class="signUpContainer">
            <div class="signUpForm">
              <!-- singupTitle -->
              <div class="signUpHeader">
                <div class="signupTitle">회원가입</div>
                <span class="signupOrder">
                  <span class="signupOrderActive">본인인증하기</span>
                  <img src="../images/member/step-right-arrow.png" alt="activeImg" />
                  <span class="signupOrderInactive">약관 동의</span>
                  <img src="../images/member/step-right-arrow-inactive.png" alt="inactiveImg" />
                  <span class="signupOrderInactive">이메일 가입</span>
                </span>
                <br />
              </div>

              <div class="signupText">본인 확인을 위해 휴대폰 번호를 인증해주세요.</div>

              <div class="signUpContent">
                <!-- 휴대폰 번호, 인증번호 -->
                <div class="inputContainer">
                  <label for="phone">휴대폰 번호</label>
                  <input type="tel" class="phone" id="phone" name="phone" maxlength="11" />
                  <span class="addOn">
                    <button class="authenticationBtn certification" type="button" disabled>인증번호 전송</button>
                  </span>
                  <span class="underline"></span>
                </div>
                <div class="phoneError"></div>

                <div class="numStr inputContainer ">
                  <label for="authenticationNumber">인증번호</label>
                  <input type="text" class="authentication" id="authenticationNumber" maxlength="6" disabled/>
                  <input type="text" class="checkNumber" hidden="hidden"/>
                  <img src="./images/member/valid-input-check-icon.png" alt="image" class="authenticationValidIcon">
                  <span class="underline"></span>
                </div>
                <div class="authenticationError"></div>

                <button class="nextButton" type="button" disabled>다음</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/member.js"></script>
    
    <script
		type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.4.min.js"
	></script>
	<script>
		$(document).ready(function () {
			$('.phone').on('input', function () {
				var phone = $(this).val().trim();
				var phonerule =  /^\d{3}\d{3,4}\d{4}$/;

				if (phone === "") {
					$('.phoneError').text('휴대폰 번호를 입력해 주세요.').show();
					$(this).addClass('error');
					$('.certification').css('background-color', '#dddddd');
				} else if (!phonerule.test(phone)) {
					$('.phoneError').text('휴대폰 번호가 올바르지 않습니다.').show();
					$(this).addClass('error');
					$('.certification').css('background-color', '#dddddd');
				} else {
					$('.phoneError').hide();
					$(this).removeClass('error');
					$('.certification').css('background-color', '#000000');
				}
			});
		});
	</script>

	<script>
		$(document).ready(function () {
			$('.authentication').on('input', function () {
				var authentication = $(this).val().trim();

				if (authentication.length !==6) {
					$('.authenticationError').text('인증번호 6자리를 입력해 주세요.').show();
					$(this).addClass('error');
					$('.authenticationValidIcon').hide();
				} else {
					$('.authenticationError').hide();
					$(this).removeClass('error');
					$('.authenticationValidIcon').css("display", "block");
					$('.authenticationValidIcon').css("visibility", "visible");
				}
			});
		});
	</script>
  </body>
</html>

