
		$(document).ready(function(){

			var password = ""
			$('.password').on('input', function () {
				password = $(this).val().trim();
				console.log("password: ", password);
				var pwdtest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

				if (password === "") {
					$('.passwordError').text('비밀번호를 입력해 주세요.').show();
					$(this).addClass('error');
					$('.passwordValidIcon').hide();
					$('.signinButton').css('background-color', '#dddddd');
				} else if (!pwdtest.test(password)){
					$('.passwordError').text('영문, 숫자, 특수기호 포함 8자 이상 입력해 주세요.');
					$(this).addClass('error');
					$('.passwordValidIcon').hide();
				} else {
					$('.passwordError').hide();
					$(this).removeClass('error');
					$('.passwordValidIcon').show();
				}
			});

			$('.passwordCheck').on('input', function(){
        var passwordCheck = $(this).val().trim();
		console.log("passwordCheck: ", passwordCheck);
        if(passwordCheck === ""){
            $('.passwordErrorCheck').text('확인을 위해 새 비밀번호를 다시 입력해 주세요.');
            $(this).addClass('error');
            $('.passwordValidIcon1').hide();
        } else if(password === passwordCheck){
            $('.passwordErrorCheck').hide();
            $(this).removeClass('error');
            $('.passwordValidIcon1').show();
        } else {
			$('.passwordErrorCheck').text('새 비밀번호와 일치하지 않습니다.');
            $(this).addClass('error');
            $('.passwordValidIcon1').hide();
        }
    });
$('.nextButton').on('click', function(){
	location.assign("/signIn");
});

});