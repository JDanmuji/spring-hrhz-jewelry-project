<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<%-- flatpickr  --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" name="email" id="sessionEmail" value="${sessionEmail}" />

	<input type="hidden" name="phone" value="${phone}">
	<input type="hidden" name="smsAlarm" value="${smsAlarm}">
	<input type="hidden" name="emailAlarm" value="${emailAlarm}">
	<div class="backGround">
		<div class="outWrapper">
			<div class="inWrapper">
				<c:if test="${empty sessionEmail}">

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
					<form class="signUpFormSection" novalidate>
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
						<label for="passwordCheck">비밀번호 확인</label> <input type="password" class="passwordCheck" id="passwordCheck" name="passwordCheck">
						<img src="../images/member/valid-input-check-icon.png" alt="image" class="passwordValidIcon1">
						<span class="underline"></span>
					</div>
					<div class="passwordErrorCheck"></div>
				</c:if>

					<div class="extraInfoSection">
						<h4 class="extraInfoTitle">선택 정보 입력</h4>
						<p class="extraInfoSubTitle">생일에 20% 할인 혜택을 드립니다. (연 1회)</p>
						<div>
							<div class="extraFormSection">
								<div class="birthdayDatepicker">
									<div class="datepickerWrap">
										<div class="datepicker">
											<div class="datepickerBtn" >
												<input class="placeholder" name="date" placeholder="생일" value="" readonly/>
												<img alt="Date" src="../../images/my/date_picker_icon.png" />
											</div>
										</div>
									</div>
								</div>
								<div class="genderRadioGroup ">
									<div class="radioBox">
										<input id="gender_0" name="gender" type="radio" value="0" checked="">
										<label for="gender_0"><span>여자</span></label>
									</div>
									<div class="radioBox">
										<input id="gender_1" name="gender" type="radio" value="1">
										<label for="gender_1"><span>남자</span></label>
									</div>
								</div>

							</div>

							<button type="button" class="goShopBtn nextButton" disabled>시작하기</button>
						</div>
					</div>
					</form>
			</div>
		</div>
	</div>

	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<%-- flatpickr  --%>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/signUp3.js"></script>
		

</body>
</html>