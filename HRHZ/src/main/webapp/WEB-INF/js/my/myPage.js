$('.reviewBtn').on("click",function (){
    var index = $(this).parent().index()+1;
    $(this).parent().removeClass('reviewTopListTitle1').addClass('reviewTopListTitle0');
    $(this).parent().siblings().removeClass('reviewTopListTitle0').addClass('reviewTopListTitle1');
    $('.reviewContent > article:nth-child('+index+')').css('display','block');
    $('.reviewContent > article:nth-child('+index+')').siblings().css('display','none');

})

//my page manage 0
// err message
$('.userPwdWrap input[name="userPwd"]').on({
    "keyup" : function() {
        const errMsg = "<p class='infoErrorMsg'>비밀번호를 입력해 주세요.</p>";
        const checkIconImg = "<img class='inputCheckIcon' src='../../images/my/valid-input-check-icon.png' />";
        const parent = $(this).parent();
        if ($(this).val().length > 0) {
            if (!parent.find('.inputCheckIcon').length) {
                parent.append(checkIconImg);
            }
            parent.find('.infoErrorMsg').remove();
            parent.siblings().removeAttr("disabled");

        } else {
            $('.userCheckBtn').attr('disabled', true);
            parent.find('.inputCheckIcon').remove();
            if (!parent.find('.infoErrorMsg').length) {
                parent.append(errMsg);
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
            const password = $('.userPwdWrap input[name="userPwd"]').val();
            const errMsg = "<p class='infoErrorMsg'>입력하신 비밀번호가 일치하지 않습니다.</p>";
            $.ajax({
                type: 'post',
                url: '/myPage/getMember',
                data: {password: password},
                success: function (data) {
                    if (data === "") { // memberDTO not exist
                        $('.userCheckBtn').attr('disabled', true);

                        const parent = $('.userPwdWrap input[name="userPwd"]').parent();
                        parent.find('.inputCheckIcon').remove();
                        if (!parent.find('.infoErrorMsg').length) {
                            parent.append(errMsg);
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

// my page manage modify password
$('.formRight .btnWrap .modifyPwdBtn').on('click',function () {
    $('.formRight .modifyPwdBtnWrap').css('display', 'none');
    $('.formRight .userNewPwdWrap').css('display', 'block');
});

$('.userNewPwdWrap .formInput input').on({
    "focus" : function (){
        $(this).css("border-bottom-color", "#000");
    },
    "blur": function (){
        $(this).css("border-bottom-color", "rgb(225, 225, 225)");
    }
});

$('.userNewPwdWrap .formInput input').on({
    "keyup": function () {
        const index = $(this).parent().index();
        const regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/;

        let errMsg;
        const errSubMsg1 = "<p class='infoErrorMsg'>영문, 숫자, 특수기호 포함 8자 이상 입력해 주세요.</p>";
        const errSubMsg2 = "<p class='infoErrorMsg'>새 비밀번호와 일치하지 않습니다.</p>";
        const checkIconImg = "<img class='inputCheckIcon' src='../../images/my/valid-input-check-icon.png' />";

        switch (index){
            case 0: errMsg = "<p class='infoErrorMsg'>현재 비밀번호를 입력해 주세요.</p>"; break;
            case 1: errMsg = "<p class='infoErrorMsg'>새 비밀번호를 입력해 주세요.</p>"; break;
            case 2: errMsg = "<p class='infoErrorMsg'>확인을 위해 새 비밀번호를 다시 입력해 주세요.</p>"; break;
        }

        const parent = $(this).parent();
        const newPwd = $('.formInput input[name="userNewPassword"]');
        const checkPwd = $('.formInput input[name="userCheckPassword"]');
        if ($(this).val().length > 0) {
            parent.find('.inputCheckIcon').remove();
            parent.find('.infoErrorMsg').remove();

            if (index===0 && !parent.find('.inputCheckIcon').length) parent.append(checkIconImg);
            if (index===1){
                if ((regExp.test($(this).val())) && ($(this).val().length >= 8)) parent.append(checkIconImg);
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
            if (index===2){
                if((regExp.test($(this).val())) && ($(this).val().length >= 8)){
                    if(newPwd.val() === checkPwd.val() && !parent.find('.inputCheckIcon').length) {
                        parent.append(checkIconImg);
                    }
                    else {
                        parent.find('.inputCheckIcon').remove();
                        parent.append(errSubMsg2);
                    }
                }
            }

            if ((index !== 0) && !regExp.test($(this).val())){
                if (!parent.find('.infoErrorMsg').length) {
                    parent.append(errSubMsg1);
                }
            }
            console.log($('.userNewPwdWrap').find('.inputCheckIcon').length);
            if($('.userNewPwdWrap').find('.inputCheckIcon').length === 3)
                $('.userNewPwdWrap button.submitBtn').removeAttr("disabled");
            else $('.userNewPwdWrap button.submitBtn').attr("disabled", true);

        } else {
            parent.find('.inputCheckIcon').remove();
            parent.find('.infoErrorMsg').remove();
            if (!parent.find('.infoErrorMsg').length) {
                parent.append(errMsg);
            }
        }
    },
});

// member new password submit button
$('.userNewPwdWrap .btnWrap .submitBtn').on('click',function (){
    const password = $('.userNewPwdWrap input[name="userPassword"]').val();
    const errMsg = "<p class='infoErrorMsg'>현재 비밀번호와 일치하지 않습니다.</p>";
    $.ajax({
        type: 'post',
        url: '/myPage/getMember',
        data: {password : password},
        success: function (data) {
            if(data === ""){ // memberDTO not exist
                $('.userNewPwdWrap button.submitBtn').attr("disabled", true);

                const parent = $('.userNewPwdWrap input[name="userPassword"]').parent();
                parent.find('.inputCheckIcon').remove();
                if (!parent.find('.infoErrorMsg').length) {
                    parent.append(errMsg);
                }
            } else { // memberDTO exist
                const checkPassword = $('.userNewPwdWrap input[name="userCheckPassword"]').val();
                $.ajax({
                    type: 'post',
                    url: '/myPage/updateNewPwd',
                    data: { checkPassword : checkPassword},
                    success: function (data) {
                        alert("비밀번호가 수정되었습니다.");
                        location.reload();
                    },
                    err: function (err) { console.log(err) }
                });

            }
        },
        err: function(err) { console.log(err)}
    });
});

//manage user info
//update input text "name"
$('.manageUserInfo input[name="userName"]').on("keyup", function (){
    if ($(this).val().length > 0)
        $('.manageUserInfo .btnWrap .submitBtn').removeAttr("disabled");
    else
        $('.manageUserInfo .btnWrap .submitBtn').attr("disabled",true);
});

// email check
$('.manageUserInfo input[name="userEmail"]').on("keyup", function () {
    const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    const errMsg = "<p class='infoErrorMsg'>유효한 이메일을 입력해 주세요.</p>";
    if ($(this).val().length > 0){
        if (!regExp.test($(this).val())) {
            if (!$(this).parent().find('.infoErrorMsg').length) $(this).parent().append(errMsg);
        } else $(this).parent().find('.infoErrorMsg').remove();
    } else $(this).parent().find('.infoErrorMsg').remove();
});


// delete member
$('.userRemove button').on("click", function (){

});

