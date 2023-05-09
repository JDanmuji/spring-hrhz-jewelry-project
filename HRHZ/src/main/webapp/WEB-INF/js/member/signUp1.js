// ---------------------------------------------------
//			send authentication number
// ---------------------------------------------------
$('button.certification').on('click', function (){
    $.ajax({
        type: 'post',
        url: '/signUp/sendSMS',
        data: 'phone='+$('#phone').val(),
        success: function (data){
            if (data === 'exist'){
				$('.authenticationBtn').attr("disabled",true);
                alert("이미 가입된 번호입니다.");
            } else {
				$('.authenticationBtn').attr("disabled",true);
                $('#authenticationNumber').removeAttr('disabled').focus(); //authentication number input text remove disabled
                $('.checkNumber').val(data); //random number save
            }
        },
        err: function (err){ 
        	console.log(err); 
        }
    });
});


// ---------------------------------------------------
//			nextButton remove disabled
// ---------------------------------------------------
$('#authenticationNumber').on('keyup', function () {
    
    if ($(this).val().length === 6) {
        $('.nextButton').removeAttr('disabled');
    } else {
        $('.nextButton').attr('disabled', true);
    }
    
});

// ---------------------------------------------------
// 			authenticationBtn remove disabled
// ---------------------------------------------------
$('#phone').on('keyup', function () {
	
	if ($(this).val().length === 11) {
		if(!$('.phoneError').text().length)
    		$('.certification').removeAttr('disabled');
	} else {
		$('.certification').attr('disabled', true);
	}

});

// ---------------------------------------------------
// 			phone input check
// ---------------------------------------------------
$('#phone').on('input', function () {
	var phone = $(this).val().trim();
	var phonerule =  /^\d{3}\d{3,4}\d{4}$/;

	if (phone === "") {
		$('.phoneError').text('휴대폰 번호를 입력해 주세요.').show();
		$(this).addClass('error');
		$('.certification').attr('disabled', true);
	} else if (!phonerule.test(phone)) {
		$('.phoneError').text('휴대폰 번호가 올바르지 않습니다.').show();
		$(this).addClass('error');
		$('.certification').attr('disabled', true);
	} else {
		$('.phoneError').hide();
		$(this).removeClass('error');
		$('.certification').removeAttr('disabled');
	}
	
});

// ---------------------------------------------------
// 			phone input check
// ---------------------------------------------------
$('.authentication').on('input', function () {
	var $authentication = $(this).val().trim();

	if ($authentication.length !==6) {
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

// ---------------------------------------------------
// 			nextButton input check
// ---------------------------------------------------
$('.nextButton').on('click', function(){
	var $authenticationNumber =  $('#authenticationNumber').val();
	var $checkNumber =  $('.checkNumber').val();

	if ($authenticationNumber !== $checkNumber) {
		$('.authenticationError').text('유효하지 않은 인증번호입니다.').show();
		$(this).addClass('error');
		$('.authenticationValidIcon').hide();
		return;
	}	
	
	
	goPost();

});

function goPost(){
	var obj = document.createElement('input');
    var form = document.createElement('form');

    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'phone');
    obj.setAttribute('value', $('#phone').val());

    form.setAttribute('method', 'post');
    form.setAttribute('action', '/signUp2');

	form.appendChild(obj);
    document.body.appendChild(form);
    
    form.submit();
}
