const checkIconImg = "<img class='inputCheckIcon' src='../../images/my/valid-input-check-icon.png' />";
$('.reviewBtn').on("click",function (){
    var $index = $(this).parent().index()+1;
    $(this).parent().removeClass('reviewTopListTitle1').addClass('reviewTopListTitle0');
    $(this).parent().siblings().removeClass('reviewTopListTitle0').addClass('reviewTopListTitle1');
    $('.reviewContent > article:nth-child('+$index+')').css('display','block');
    $('.reviewContent > article:nth-child('+$index+')').siblings().css('display','none');

})

//my page manage 0
// err message
$('.userPwdWrap input[name="userPwd"]').on({
    "keyup" : function() {
        const errMsg = "<p class='infoErrorMsg'>비밀번호를 입력해 주세요.</p>";
        const $parent = $(this).parent();
        if ($(this).val().length > 0) {
            if (!$parent.find('.inputCheckIcon').length) {
                $parent.append(checkIconImg);
            }
            $parent.find('.infoErrorMsg').remove();
            $parent.siblings().removeAttr("disabled");

        } else {
            $('.userCheckBtn').attr('disabled', true);
            $parent.find('.inputCheckIcon').remove();
            if (!$parent.find('.infoErrorMsg').length) {
                $parent.append(errMsg);
            }
        }
    },
    "focus" : function (){
        $(this).css("border-bottom-color", "#000");
        $(this).parent().addClass("userPwdWrapForLabel");
    },
    "blur": function (){
        $(this).css("border-bottom-color", "rgb(225, 225, 225)");
    }

});

// member validity check
$('.userCheckContent .userCheckBtn').on(
    {
        'click': function() {
            const $password = $('.userPwdWrap input[name="userPwd"]').val();
            const errMsg = "<p class='infoErrorMsg'>입력하신 비밀번호가 일치하지 않습니다.</p>";
            $.ajax({
                type: 'post',
                url: '/myPage/getMember',
                data: {password: $password},
                success: function (data) {
                    if (data === "") { // memberDTO not exist
                        $('.userCheckBtn').attr('disabled', true);

                        const $parent = $('.userPwdWrap input[name="userPwd"]').parent();
                        $parent.find('.inputCheckIcon').remove();
                        if (!$parent.find('.infoErrorMsg').length) {
                            $parent.append(errMsg);
                        }
                    } else { // memberDTO exist
                        location.assign('/myPage/myPageManage1');
                    }
                },
                error: function (err) {
                    console.log(err)
                },
            });
        }
    }
);

//-------------------------------------------------------------------
// my page manage modify password
//-------------------------------------------------------------------
$('.formRight .btnWrap .modifyPwdBtn').on('click',function () {
    $('.formRight .modifyPwdBtnWrap').css('display', 'none');
    $('.formRight .userNewPwdWrap').css('display', 'block');
});

$('.userNewPwdWrap .formInput input').on(
    {
        "keyup": function () {
            const $index = $(this).parent().index();
            const regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/;

            let errMsg;
            const errSubMsg1 = "<p class='infoErrorMsg'>영문, 숫자, 특수기호 포함 8자 이상 입력해 주세요.</p>";
            const errSubMsg2 = "<p class='infoErrorMsg'>새 비밀번호와 일치하지 않습니다.</p>";


            switch ($index){
                case 0: errMsg = "<p class='infoErrorMsg'>현재 비밀번호를 입력해 주세요.</p>"; break;
                case 1: errMsg = "<p class='infoErrorMsg'>새 비밀번호를 입력해 주세요.</p>"; break;
                case 2: errMsg = "<p class='infoErrorMsg'>확인을 위해 새 비밀번호를 다시 입력해 주세요.</p>"; break;
            }

            const $parent = $(this).parent();
            const newPwd = $('.formInput input[name="userNewPassword"]');
            const checkPwd = $('.formInput input[name="userCheckPassword"]');
            if ($(this).val().length > 0) {
                $parent.find('.inputCheckIcon').remove();
                $parent.find('.infoErrorMsg').remove();

                if ($index===0 && !$parent.find('.inputCheckIcon').length) $parent.append(checkIconImg);
                if ($index===1){
                    if ((regExp.test($(this).val())) && ($(this).val().length >= 8)) $parent.append(checkIconImg);
                    if (checkPwd.val().length > 0) {
                        if (newPwd.val() === checkPwd.val()) {
                            checkPwd.parent().find('.infoErrorMsg').remove();
                            if(!checkPwd.parent().find('.inputCheckIcon').length)
                                checkPwd.parent().append(checkIconImg);
                        } else {
                            checkPwd.parent().find('.inputCheckIcon').remove();
                            if (!checkPwd.parent().find('.infoErrorMsg').length) checkPwd.parent().append(errSubMsg2);
                        }
                    }
                }
                if ($index===2){
                    if((regExp.test($(this).val())) && ($(this).val().length >= 8)){
                        if(newPwd.val() === checkPwd.val() && !$parent.find('.inputCheckIcon').length) {
                            $parent.append(checkIconImg);
                        }
                        else {
                            $parent.find('.inputCheckIcon').remove();
                            $parent.append(errSubMsg2);
                        }
                    }
                }

                if (($index !== 0) && !regExp.test($(this).val())){
                    if (!$parent.find('.infoErrorMsg').length) {
                        $parent.append(errSubMsg1);
                    }
                }
                if($('.userNewPwdWrap').find('.inputCheckIcon').length === 3)
                    $('.userNewPwdWrap button.submitBtn').removeAttr("disabled");
                else $('.userNewPwdWrap button.submitBtn').attr("disabled", true);

            } else {
                $parent.find('.inputCheckIcon').remove();
                $parent.find('.infoErrorMsg').remove();
                if (!$parent.find('.infoErrorMsg').length) {
                    $parent.append(errMsg);
                }
            }
        },
        "focus" : function (){
            $(this).css("border-bottom-color", "#000");
        },
        "blur": function (){
            $(this).css("border-bottom-color", "rgb(225, 225, 225)");
        }
});

// member new password submit button
$('.userNewPwdWrap .btnWrap .submitBtn').on('click',function (){
    const $password = $('.userNewPwdWrap input[name="userPassword"]').val();
    const errMsg = "<p class='infoErrorMsg'>현재 비밀번호와 일치하지 않습니다.</p>";
    $.ajax({
        type: 'post',
        url: '/myPage/getMember',
        data: {password : $password},
        success: function (data) {
            if(data === ""){ // memberDTO not exist
                $('.userNewPwdWrap button.submitBtn').attr("disabled", true);

                const $parent = $('.userNewPwdWrap input[name="userPassword"]').parent();
                $parent.find('.inputCheckIcon').remove();
                if (!$parent.find('.infoErrorMsg').length) {
                    $parent.append(errMsg);
                }
            } else { // memberDTO exist
                const $checkPassword = $('.userNewPwdWrap input[name="userCheckPassword"]').val();
                $.ajax({
                    type: 'post',
                    url: '/myPage/updateNewPwd',
                    data: { checkPassword : $checkPassword},
                    success: function (data) {
                        // Open modal in AJAX callback
                        $.get("/myPage/updatePwdModal", function (html) {
                            $(html).appendTo('body')
                        });
                    },
                    err: function (err) { console.log(err) }
                });
            }
        },
        err: function(err) { console.log(err)}
    });
});

//-------------------------------------------------------------------
//manage user info
//update input text "name"
const $updateSubmitBtn = $('.manageUserInfo .btnWrap .submitBtn');
const $initName = $('.manageUserInfo input[name="name"]').val();
$('.manageUserInfo input[name="name"]').on(
    {
        "keyup" : function () {
            const errMsg = "<p class='infoErrorMsg'>1~20자의 이름을 입력해 주세요.</p>";
            if ($(this).val().length > 0) {
                $(this).parent().find('.infoErrorMsg').remove(); // error msg init
                $updateSubmitBtn.removeAttr("disabled");
                if (!$(this).parent().find('.inputCheckIcon').length)
                    $(this).parent().append(checkIconImg);
            } else {
                $(this).parent().find('.inputCheckIcon').remove(); // img init
                $updateSubmitBtn.attr("disabled", true);
                if (!$(this).parent().find('.infoErrorMsg').length)
                    $(this).parent().append(errMsg);
            }

            if ($(this).val() === $initName) {
                $updateSubmitBtn.attr("disabled", true);
                $(this).parent().find('.inputCheckIcon').remove();
            }
        },
        "focus" : function (){
            $(this).css("border-bottom-color", "#000");
        },
        "blur": function (){
            $(this).css("border-bottom-color", "rgb(225, 225, 225)");
        }
    }
);

// email check
const $initEmail = $('.manageUserInfo input[name="email"]').val();
$('.manageUserInfo input[name="email"]').on(
    {
        "keyup": function () {
            const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            const errMsg = "<p class='infoErrorMsg'>유효한 이메일을 입력해 주세요.</p>";
            if ($(this).val().length > 0){
                if (!regExp.test($(this).val())) {
                    $(this).parent().find('.inputCheckIcon').remove();
                    $updateSubmitBtn.attr("disabled", true);
                    if (!$(this).parent().find('.infoErrorMsg').length)
                        $(this).parent().append(errMsg);
                } else {
                    $(this).parent().find('.infoErrorMsg').remove();
                    $updateSubmitBtn.removeAttr("disabled");
                    if(!$(this).parent().find('.inputCheckIcon').length)
                        $(this).parent().append(checkIconImg);
                }
            } else {
                $(this).parent().find('.infoErrorMsg').remove();
                $(this).parent().find('.inputCheckIcon').remove();
                $updateSubmitBtn.attr("disabled", true);
            }
            if ($(this).val() === $initEmail) {
                $updateSubmitBtn.attr("disabled", true);
                $(this).parent().find('.inputCheckIcon').remove();
            }

        },
        "focus": function (){
            $(this).css("border-bottom-color", "#000");
        },
        "blur": function (){
            $(this).css("border-bottom-color", "rgb(225, 225, 225)");
        },
    }
);

//-------------
$(function (){
    // date picker
    let $initDate = $('.datepicker .placeholder').val();
    if ($initDate === "") $initDate = "1990-01-01";
    $('.datepicker .datepickerBtn').flatpickr({
        dateFormat: "Y.m.d",
        locale: "ko",
        defaultDate: $initDate,
        onChange: function (selectedDates, dateStr, instance) {
            $(".datepickerBtn .placeholder").val(dateStr);
            if (dateStr === $initDate) $updateSubmitBtn.attr("disabled", true);
            else $updateSubmitBtn.removeAttr("disabled");
        }
    });


    // sms email alarm check/
    let smsCheck = false; // initial value
    let emailCheck = false; // initial value
    if($('.smsCheck').val() === "Y") {
        $('#smsReceive').attr("checked", true);
        smsCheck = true;
    }
    if($('.emailCheck').val() === "Y") {
        $('#emailReceive').attr("checked", true);
        emailCheck = true;
    }
    $('input[type="checkbox"]').change(function() {
        if(smsCheck === $("#smsReceive").is(":checked") && emailCheck === $("#emailReceive").is(":checked"))
            $updateSubmitBtn.attr("disabled", true);
        else $updateSubmitBtn.removeAttr("disabled");
    });

    //-------------
    // gender check
    let manCheck =  false;
    if($('.memberGender').val() === "M") {
        $('#userGenderM').attr("checked", true);
        manCheck = true;
    }
    $('input[type="radio"]').change(function (){
        if($('#userGenderM').is(":checked") === manCheck) $updateSubmitBtn.attr("disabled", true);
        else $updateSubmitBtn.removeAttr("disabled");
    });

});

//------------------------------
// member info update
$('.userInfoForm .btnWrap .submitBtn').on("click", function () {
    let json = {};
    $('.userInfoForm').serializeArray().map(function(x){json[x.name] = x.value;});

    $.ajax({
        type: 'post',
        url: "/myPage/updateMember",
        data: json,
        success: function () {
            $.get("/myPage/updateMemberModal", function (html) {
                $(html).appendTo('body')
            });
        },
        error: function () {}
    });
});

// --------------------------------------------------
//          close modal
// --------------------------------------------------
$(document).on("click", ".modalCloseBtn, .cancelModalBtn",function (){
    $('.modalBoxWrap').hide().remove();
})



//------------------------------
// delete member
$('.userRemove button').on("click", function (e){
    e.preventDefault();
    this.blur();
    $.get("/myPage/deleteMemberModal", function (html) {
        $(html).appendTo('body')
    });
});

//------------------------------
// delete modal
// remove modal tag when close the modal
$(document).on('click', '.deleteModal .whiteBtn, .modalCloseBtn', function() {
    $(this).closest('.modal').remove();
});
// delete member
$(document).on('click', '.deleteModal button.goShopBtn', function() {
    $.post('/myPage/deleteMember', function (){
        location.href = "/signIn";
    });
});




