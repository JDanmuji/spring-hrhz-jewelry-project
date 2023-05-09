var newPassword = '';
var passwordCheck = '';

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
	

$('.password').on('input', function () {
    newPassword = $(this).val().trim();
    updatePasswordValidation();
});

$('.passwordCheck').on('input', function(){
    passwordCheck = $(this).val().trim();
    updatePasswordCheckValidation();
});
 	

$('.nextButton').on('click', function() {
	let smsAlarm =( $('input[name=smsAlarm]').val() ) === 'on' ? 'Y' : 'N';
	let emailAlarm = ($('input[name=emailAlarm]').val()) === 'on' ? 'Y' : 'N';
    let email = "";
    let password = "";
    let joinPath = "";

    let $sessionEmail = $('#sessionEmail').val();
    if($sessionEmail) {
        email = $sessionEmail;
        joinPath = $sessionEmail.indexOf("gmail") !== -1 ? "G" :
                        $sessionEmail.indexOf("naver") !== -1 ? "N" : "K";
    } else {
        email = $('#email').val();
        password = $('#password').val();
        joinPath = "A";
    }
    console.log(email);
    console.log(joinPath);
    console.log($('#gender_0').is(':checked'));

    let memberDate = $('input[name="date"]').val();
    console.log(memberDate);
    let gender = $('#gender_0').is(':checked') ? "F" : "M";
    console.log(gender);

   $.ajax({
       type: 'post',
       url: '/memberInsert',
       data: {
       		'email' : email,
       		'password' : password,
       		'phone' : $('input[name=phone]').val(),
       		'smsAlarm' : smsAlarm,
       		'emailAlarm' : emailAlarm,
       		'joinPath' : joinPath,
            'memberDate' : memberDate,
            'gender' : gender,
       },
       success: function (data){
          alert("회원가입을 축하합니다.");
          location.href='/signIn';
          $('.bestContents').append(optionItem);
       },
       error: function (err){
       	console.log(err);
       }
   });
   
});
    
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
        $('.passwordValidIcon1').hide();
    } else {
        $('.passwordValidIcon1').show();
    }

    if($('.emailValidIcon').is(':visible') && $('.passwordValidIcon').is(':visible') && $('.passwordValidIcon1').is(':visible')){
        $('.nextButton').prop('disabled', false);
    } else {
        $('.nextButton').prop('disabled', true);
    }
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

    if (passwordCheck === "") {
    
        $('.passwordErrorCheck').text('확인을 위해 새 비밀번호를 다시 입력해 주세요.').show();
        $('.passwordCheck').addClass('error');
        $('.passwordValidIcon1').hide();
        
    } else if(passwordCheck === newPassword) {
    
    	$('.passwordErrorCheck').hide();
        $('.passwordCheck').removeClass('error');
        $('.passwordValidIcon1').show();
        
    } else {
    
    	$('.passwordErrorCheck').text('새 비밀번호와 일치하지 않습니다.').show();
        $('.passwordCheck').addClass('error');
        $('.passwordValidIcon1').hide();
        
    }
}

/* ----------------------- */
$(function () {
    // if email session value is exit, next Button didn't disabled
    if($('input[name="email"]').val() !== "") $('.nextButton').prop('disabled', false);

    // date picker
    $('.datepicker .datepickerBtn').flatpickr({
        dateFormat: "Y.m.d",
        locale: "ko",
        defaultDate: "1990-01-01",
        onChange: function (selectedDates, dateStr, instance) {
            $(".datepickerBtn .placeholder").val(dateStr);
        }
    });
});


 
   
    