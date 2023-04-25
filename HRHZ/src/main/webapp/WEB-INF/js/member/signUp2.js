$(document).ready(function () {
  	
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
	  
});


// "모두 동의" 체크박스를 클릭하면 모든 체크박스가 체크됨
$('#allAgree').click(function () {
    
    var checked = $(this).is(":checked");
    
    $('.inputCheck').prop('checked', checked);
    
    toggleSubmitButton();
});

// 모든 체크박스가 체크되었을 때 "모두 동의" 체크박스도 체크됨
$('.inputCheck').click(function () {
  
	if ($('.inputCheck:not(:checked)').length == 0) {
  
    	$('#allAgree').prop('checked', true);
  	}
  
 	toggleSubmitButton();
  
});
	
// [필수] 3개랑 [선택] 누를 경우 모두 동의 체크박스 체크됨.
$("#ageAgree, #privacyAgree, #serviceAgree").click(function() {
	
	allCheck();
	
});


// "[선택] 할인 쿠폰과 혜택 소식 수신 모두 동의" 체크박스를 클릭하면 하위 체크박스가 나타남
$('#allAgreeOptional').click(function () {
	
	$('.content').toggleClass('hidden');
	$('.iconContainer .icon').toggleClass('hidden');
	
	$('#emailAgree, #smsAgree').prop('checked', $(this).is(':checked')).toggleClass('inputCheck', $(this).is(':checked'));
	toggleSubmitButton();
	allCheck();
	
	
});
	  
// 이메일 수신 체크박스 또는 문자 수신 체크박스를 클릭하면 "할인 쿠폰과 혜택 소식 수신 모두 동의" 체크박스가 체크됨
$('#emailAgree, #smsAgree').click(function () {

	if ($('#emailAgree').is(":checked") && $('#smsAgree').is(":checked")) {
  
		$('#allAgreeOptional').prop('checked', true);
    
	} else {
		$('#allAgreeOptional').prop('checked', false);
	} 
  	
	toggleSubmitButton();
	allCheck();
});



// 필수 항목에 모두 동의해야 "다음" 버튼이 활성화됨
function toggleSubmitButton() {

  var requiredCheckboxes = $('.requiredCheck');
  var optionalCheckbox = $('#allAgreeOptional');
  var submitButton = $('.nextButton');
  
  if (requiredCheckboxes.length === requiredCheckboxes.filter(":checked").length) {
    
    submitButton.prop('disabled', false);
    submitButton.css('background-color', 'black');
    
  } else {
  
    submitButton.prop('disabled', true);
    submitButton.css('background-color', '');
    
  }
}

function allCheck() {
	var inputCheck = ($("#ageAgree").prop("checked") && 
						$("#privacyAgree").prop("checked") &&  
							$("#serviceAgree").prop("checked"));
							
	var alarmCheck = $("#emailAgree").prop("checked") &&
						$("#smsAgree").prop("checked") && 
						$("#allAgreeOptional").prop("checked");
	
							
	if ((inputCheck == true && alarmCheck == true)) {
		 
		$("#allAgree").prop("checked", true);
		
	} else {
		$("#allAgree").prop("checked", false);
	}

}


