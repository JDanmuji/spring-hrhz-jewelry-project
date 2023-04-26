
$('.email').on('input', function () {
	var email = $(this).val().trim();
	var exptext = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

	if (email === "") {
		$('.emailError').text('이메일을 입력해 주세요.').show();
		$(this).addClass('error');
		$('.emailValidIcon').hide();
		$('.signinButton').css('background-color', '#dddddd');
	} else if (!exptext.test(email)) {
		$('.emailError').text('이메일 형식이 올바르지 않습니다.').show();
		$(this).addClass('error');
		$('.emailValidIcon').hide();
		$('.signinButton').css('background-color', '#dddddd');
	} else {
		$('.emailError').hide();
		$(this).removeClass('error');
		$('.emailValidIcon').show();
	}
	
	buttonCheck();
});

$('.password').on('input', function () {
	var password = $(this).val().trim();

	if (password === "") {
		$('.passwordError').text('비밀번호를 입력해 주세요.').show();
		$(this).addClass('error');
		$('.passwordValidIcon').hide();
		$('.signinButton').css('background-color', '#dddddd');
	} else {
		$('.passwordError').hide();
		$(this).removeClass('error');
		$('.passwordValidIcon').show();
	}
	
	buttonCheck();
});



$('.signInButton').click(function (){
     	
   $.ajax({
       type: 'post',
       url: '/signIn',
       data: {
       		'email' : $('.email').val(),
       		'password' : $('.password').val(),
       },
       success: function (data){
	       
	       	if (data === "error") {
	       		alert("로그인 정보가 없습니다.");
	       		return;
	       	}
       	
       	    location.assign('/');
       	
       },
       error: function (xhr, status, error){
       	console.log(error); 
       }
   });
});


$('.signUpButton').on('click', function () {
	   location.assign('/signUp');
});



function buttonCheck() {
	var email = $('.email').val().trim();
	var password = $('.password').val().trim();

	if ($('.emailValidIcon').is(':visible') && 
			$('.passwordValidIcon').is(':visible')) {
	  	$('.signInButton').removeAttr('disabled');
	} else {
        $('.signInButton').attr('disabled', true);
	}
}





