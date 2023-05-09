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

$('#phone').on('input', function () {
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

$('.authentication').on('input', function () {
				var authentication = $(this).val().trim();
				if (authentication.length !==6) {
					$('.authenticationError').text('인증번호 6자리를 입력해 주세요.').show();
					$(this).addClass('error');
					$('.authenticationValidIcon').hide();
				} else {
					$('.authenticationError').hide();
					$(this).removeClass('error');
					$('.authenticationValidIcon').show();
				}
			});
$('.nextButton').on('click', function(){
	location.assign("/findPwd2");
});
$('.forgetEmail').on('click', function(){
	location.assign("/findId1");
});		
});