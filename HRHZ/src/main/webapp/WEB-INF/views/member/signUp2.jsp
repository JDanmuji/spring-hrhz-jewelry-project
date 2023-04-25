<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지_이용 약관 동의 </title>
	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/member/signUpStyle2.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
</head>

<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div class="backGround">
    
        <div class="wrapper">
        
            <form action="/signUp3" method="post">
                    
                    <div class="formHeader">
						<input type="hidden" name="phone" value="${phone}">
                    
                    	<div class="termsOfServiceTitle">
                    		<span>이용 약관 동의</span>
                    	</div>
                        <span class="signUpOrder">
                            <span class="signUpOrderInactive">본인인증하기</span>
                            <img src="./images/member/step-right-arrow-inactive.png" alt="inactiveImg">
                            <span class="signUpOrderActive">약관 동의</span>
                            <img src="./images/member/step-right-arrow.png" alt="activeImg">
                            <span class="signUpOrderInactive">이메일 가입</span>
                        </span>
                        <br>
                    </div>

                    <div class="signUpText">
	                    <span>회원가입을 위해서 개인정보 수집 및 이용(필수) 동의가 필요합니다.</span>
                    </div>

                    <!-- 이용 약관 동의 -->
                    <div class="agreeSection">
                        <label class="checkboxContainer">
                        <input type="checkbox" id="allAgree" class="allAgree">
                        <span class="checkmark"></span>
                        <strong> 모두 동의 (선택 정보 포함) </strong>
                        </label>
                    </div>
                    <br>
                    <div class="underline"></div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="ageAgree" class="inputCheck reqiredCheck">
                        	<span class="checkmark"></span> 
                        	<span class="letter">[필수] 만 14세 이상입니다.</span>
                        </label>
                    </div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="privacyAgree" class="inputCheck requiredCheck">
                            <span class="checkmark"></span> 
                            <span class="letter">[필수] 개인정보 수집 및 이용 동의</span>
                            <a href="https://amondz.notion.site/c07ca2d7092d4eb888c5808d2d813c3b" target="_blank" class="link1">보기</a>
                        </label>
                    </div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="serviceAgree" class="inputCheck requiredCheck">
                            <span class="checkmark"></span> 
                            <span class="letter">[필수] 서비스 이용약관 동의</span>
                            <a href="https://amondz.notion.site/2022-10-25-a13d276cf10744528cb5454715566a35" target="_blank" class="link2">보기</a>
                        </label>
                    </div>
                    <br>
                    <div class="underline"></div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="allAgreeOptional" class="inputCheck">
                         	<span class="checkmark"></span> 
							<span class="letter">[선택] 할인 쿠폰과 혜택 소식 수신 모두 동의</span>
                        </label>

                        <div class="iconContainer">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="icon down">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                            </svg>

                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="icon up hidden">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 15.75l7.5-7.5 7.5 7.5" />
                            </svg>
                            
                        </div>
                    </div>
                    
                    <br>
                    
                    <div class="content hidden">
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="emailAgree" name="emailAlarm" class="inputCheck">
                            <span class="checkmark"></span> 
                            <span class="letter">이메일 수신</span>
                        </label>
                        <label class="checkboxContainer"> 
                        	<input type="checkbox" id="smsAgree" name="smsAlarm" class="inputCheck">
                            <span class="checkmark"></span> 
                            <span class="letter">문자 수신</span>
                        </label>
                    </div>
                    <button class="nextButton" type="submit" disabled>다음</button>
				</form>
            </div>
    </div>
 	
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/signUp2.js"></script>
    
</body>
</html>