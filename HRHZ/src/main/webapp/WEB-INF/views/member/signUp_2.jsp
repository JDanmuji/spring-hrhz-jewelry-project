<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지_이용 약관 동의 </title>
	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/member/signupStyle_2.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
</head>

<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div class="background">
        <div class="outerWrapper">
            <div class="formContainer">
                <div class="form1">
                    <!-- 이용 약관 동의 -->
                    <div class="termsOfService">이용 약관 동의</span>
                        <span class="signupOrder">
                            <span class="signupOrderInactive">본인인증하기</span>
                            <img src="./images/member/step-right-arrow-inactive.png" alt="inactiveImg">
                            <span class="signupOrderActive">약관 동의</span>
                            <img src="./images/member/step-right-arrow.png" alt="activeImg">
                            <span class="signupOrderInactive">이메일 가입</span>
                        </span>
                        <br>
                    </div>

                    <div class="signupText">회원가입을 위해서 개인정보 수집 및 이용(필수) 동의가 필요합니다.</div>

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
                        <label class="checkboxContainer"> <input type="checkbox" id="ageAgree" class="inputCheck reqiredCheck">
                            <span class="checkmark"></span> <span class="letter">[필수] 만 14세 이상입니다.</span>
                        </label>
                    </div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> <input type="checkbox" id="privacyAgree" class="inputCheck requiredCheck">
                            <span class="checkmark"></span> <span class="letter">[필수] 개인정보 수집 및 이용 동의</span>
                            <a href="https://amondz.notion.site/c07ca2d7092d4eb888c5808d2d813c3b" target="_blank" class="link1">보기</a>
                        </label>
                    </div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> <input type="checkbox" id="serviceAgree" class="inputCheck requiredCheck">
                            <span class="checkmark"></span> <span class="letter">[필수] 서비스 이용약관 동의</span>
                            <a href="https://amondz.notion.site/2022-10-25-a13d276cf10744528cb5454715566a35" target="_blank" class="link2">보기</a>
                        </label>
                    </div>
                    <br>
                    <div class="underline"></div>
                    <br>
                    <div class="agreeSection">
                        <label class="checkboxContainer"> <input type="checkbox" id="allAgreeOptional" class="inputCheck">
                            <span class="checkmark"></span> <span class="letter">[선택] 할인 쿠폰과 혜택 소식 수신 모두 동의</span>
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
                        <label class="checkboxContainer"> <input type="checkbox" id="emailAgree" class="inputCheck">
                            <span class="checkmark"></span> <span class="letter">이메일 수신</span>
                        </label>
                        <label class="checkboxContainer"> <input type="checkbox" id="smsAgree" class="inputCheck">
                            <span class="checkmark"></span> <span class="letter">문자 수신</span>
                        </label>
                    </div>

                    <button class="nextButton" disabled>다음</button>
                </div>
            </div>
        </div>
    </div>
 	
 	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script>
        /* 보기 아이콘 */

        const downIcon = document.querySelector('.down');
        const upIcon = document.querySelector('.up');
        const content = document.querySelector('.content');

        downIcon.addEventListener('click', function () {
            downIcon.classList.add('hidden');
            upIcon.classList.remove('hidden');
            content.classList.remove('hidden');
        });

        upIcon.addEventListener('click', function () {
            upIcon.classList.add('hidden');
            downIcon.classList.remove('hidden');
            content.classList.add('hidden');
        });
    </script>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/member/member.js"></script>
    
<script>
$(document).ready(function () {

	  // "모두 동의" 체크박스를 클릭하면 모든 체크박스가 체크됨
	  $('#allAgree').click(function () {
	    var checked = $(this).is(":checked");
	    $('.inputCheck').prop('checked', checked);
	    toggleSubmitButton();
	  });

	// 모든 체크박스가 체크되었을 때 "모두 동의" 체크박스도 체크됨
	  $('.inputCheck').click(function () {
	    if ($(this).is(":not(:checked)")) {
	      $('#allAgree').prop('checked', false);
	    } else {
	      if ($('.inputCheck:not(:checked)').length == 0) {
	        $('#allAgree').prop('checked', true);
	      }
	    }
	    toggleSubmitButton();
	  });
	
	// [필수] 3개랑 [선택] 누를 경우 모두 동의 체크박스 체크됨.
	  	$("#ageAgree, #privacyAgree, #serviceAgree, #allAgreeOptional").click(function() {
		    if ($("#ageAgree").prop("checked") && $("#privacyAgree").prop("checked") && $("#serviceAgree").prop("checked") && $("#allAgreeOptional").prop("checked")) {
		      $("#allAgree").prop("checked", true);
		    }
		  });
	
	  // "[선택] 할인 쿠폰과 혜택 소식 수신 모두 동의" 체크박스를 클릭하면 하위 체크박스가 나타남
		$('#allAgreeOptional').click(function () {
  		$('.content').toggleClass('hidden');
  		$('.iconContainer .icon').toggleClass('hidden');
  		$('#emailAgree, #smsAgree').prop('checked', $(this).is(':checked')).toggleClass('inputCheck', $(this).is(':checked'));
  		toggleSubmitButton();
		});
	  
		// 이메일 수신 체크박스 또는 문자 수신 체크박스를 클릭하면 "할인 쿠폰과 혜택 소식 수신 모두 동의" 체크박스가 체크됨
		$('#emailAgree, #smsAgree').click(function () {
		  if ($('#emailAgree').is(":checked") && $('#smsAgree').is(":checked")) {
		    $('#allAgreeOptional').prop('checked', true);
		    $('#allAgree').prop('checked', true);
		  } else {
		    $('#allAgreeOptional').prop('checked', false);
		    if($('.inputCheck:not(#allAgree)').filter(":not(:checked)").length == 0){
		      $('#allAgree').prop('checked', true);
		    }else{
		      $('#allAgree').prop('checked', false);
		    }
		  }
		  toggleSubmitButton();
		});
		
	  // 필수 항목에 모두 동의해야 "다음" 버튼이 활성화됨
	  function toggleSubmitButton() {
	    var requiredCheckboxes = $('.requiredCheck');
	    var optionalCheckbox = $('#allAgreeOptional');
	    var submitButton = $('.nextButton');
	    if (requiredCheckboxes.length == requiredCheckboxes.filter(":checked").length && ($('#allAgreeOptional').is(":checked") || $('.content').hasClass('hidden'))) {
	      submitButton.prop('disabled', false);
	      submitButton.css('background-color', 'black');
	    } else {
	      submitButton.prop('disabled', true);
	      submitButton.css('background-color', '');
	    }
	  }
	  
	});

</script>	
</body>
</html>