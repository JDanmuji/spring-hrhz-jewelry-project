$(".email").on("input", function () {
    var email = $(this).val().trim();
    var exptext = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    if (email === "") {
        $(".emailError").text("이메일을 입력해 주세요.").show();
        $(this).addClass("error");
        $(".emailValidIcon").hide();
        $(".signinButton").css("background-color", "#dddddd");
    } else if (!exptext.test(email)) {
        $(".emailError").text("이메일 형식이 올바르지 않습니다.").show();
        $(this).addClass("error");
        $(".emailValidIcon").hide();
        $(".signinButton").css("background-color", "#dddddd");
    } else {
        $(".emailError").hide();
        $(this).removeClass("error");
        $(".emailValidIcon").show();
    }

    buttonCheck();
});

$(".password").on("input", function () {
    var password = $(this).val().trim();

    if (password === "") {
        $(".passwordError").text("비밀번호를 입력해 주세요.").show();
        $(this).addClass("error");
        $(".passwordValidIcon").hide();
        $(".signinButton").css("background-color", "#dddddd");
    } else {
        $(".passwordError").hide();
        $(this).removeClass("error");
        $(".passwordValidIcon").show();
    }

    buttonCheck();
});

$(".signInButton").click(function () {
    $.ajax({
        type: "post",
        url: "/signIn",
        data: {
            email: $(".email").val(),
            password: $(".password").val(),
        },
        success: function (data) {
            if (data === "error") {
                alert("로그인 정보가 없습니다.");
                return;
            }


           	if (data === "ADMIN") {
            	location.assign("/admin/memberList");
                return;
           	}


            location.assign("/");
        },
        error: function (xhr, status, error) {
            console.log(error);
        },
    });
});

$(".signUpButton").on("click", function () {
    location.assign("/signUp1");
});

function buttonCheck() {
    var email = $(".email").val().trim();
    var password = $(".password").val().trim();

    if (
        $(".emailValidIcon").is(":visible") &&
        $(".passwordValidIcon").is(":visible")
    ) {
        $(".signInButton").removeAttr("disabled");
    } else {
        $(".signInButton").attr("disabled", true);
    }
}
//-----------------------------------------------------------------------
//					Naver Login
//-----------------------------------------------------------------------

/*
$('#naverIdLogin_loginButton').on('click', function () {
	  // location.assign('/signIn/naver');
	  showLoginPopup();
});

  function showLoginPopup(){
        let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
            'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
            '&client_id=LXj0E58atyUZpVf3hQtj' +     // 발급받은 client_id 를 입력
            '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
            '&redirect_uri=http://localhost:8080/signIn/naver';   // 어플케이션에서 등록했던 CallBack URL를 입력

        // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
        window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
    }
   */

var naverLogin = new naver.LoginWithNaverId({
    clientId: "LXj0E58atyUZpVf3hQtj", //cliendId를 입력해줍니다.
    callbackUrl: "http://localhost:8080/callBack", //주소 설정
    isPopup: false,
    callbackHandle: true,
});
naverLogin.init();

/*
	window.addEventListener('load', function(){
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				var naverEmail = naverLogin.user.getEmail();
	
				console.log(naverLogin.user);
			if (naverEmail == undefined || naverEmail == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
				}
				
			}else {
				console.log("callback 처리에 실패하였습니다.");
		}
	});
});
*/

/* var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	}
	
	*/

$("#findIdLink").click(function() {
	event.preventDefault();
	location.assign("/findId1");
});

$("#findPwdLink").click(function() {
	event.preventDefault();
	location.assign("/findPwd1");
});

