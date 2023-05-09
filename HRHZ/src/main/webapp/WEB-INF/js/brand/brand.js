// getBrandList
var memberId = $(".memberId").val();
// console.log(memberId);


$(document).ready(function () {
    $.ajax({
        type: "post",
        url: "brand/getBrandList",
        data: { memberId: memberId },
        success: function (data) {
            $.each(data, function (index, items) {
                // random brand keywords
                let keywordList = [
                    "데일리",
                    "베이직",
                    "합리적",
                    "트렌드",
                    "클래식",
                    "어반",
                    "대중적인",
                    "스타일리쉬",
                    "모던",
                    "키치",
                    "레트로",
                    "유니크",
                    "심플",
                    "센슈얼",
                ];
                // Shuffle keywordList
                keywordList.sort(() => Math.random() - 0.5);
                let selectedKeywords =
                    keywordList[0] +
                    "·" +
                    keywordList[1] +
                    "·" +
                    keywordList[2];

                // <li> appending
                let brandLi =
                    "<li class='scBrand'>" +
                    "<div class='brandCode'>" +
                    items.code +
                    "</div>" +
                    "<a class='brandLink' href='/brand/brandDetail?brandCode=" +
                    items.code +
                    "&pg=1'>" +
                    "<span class='brandRankingNumber'>" +
                    (index + 1) +
                    "</span>" +
                    "<img class='brandRankingImage' src='" +
                    items.imgPath +
                    "/" +
                    items.imgName +
                    "' alt='brand logo' />" +
                    "<div class='scBrandTitleSection'>" +
                    "<p class='scBrandTitle'>" +
                    items.name +
                    "</p>" +
                    "<p class='scBrandTagList'>" +
                    selectedKeywords +
                    "</p></div></a>" +
                    "<div class='brandLikeBtn'>";

                // check likeYN & change heart color
                var heartHTML;

                if (items.brandLikeYN == "Y") {
                    heartHTML =
                        "<img class='likeBlank' src='../images/brand/heart.jpg' style='display:none' />" +
                        "<img class='likeFull' src='../images/brand/heart_violet.jpg' />" +
                        "</div></li>";
                } else {
                    heartHTML =
                        "<img class='likeBlank' src='../images/brand/heart.jpg' />" +
                        "<img class='likeFull' src='../images/brand/heart_violet.jpg' style='display:none' />" +
                        "</div></li>";
                }

                // append HTML to <ul> tag
                $("ul.scMenuArea").append(brandLi + heartHTML);
            });
        },
        error: function (err) {
            console.log(err);
        },
    });
});

// image hover effect
$(".adTitleImg01").mouseover(function () {
    $(this).find(".adBrandTextOnImg").css("display", "none");
    $(this).find(".brandHoverContent").css("display", "block");
});
$(".adTitleImg01").mouseout(function () {
    $(this).find(".adBrandTextOnImg").css("display", "block");
    $(this).find(".brandHoverContent").css("display", "none");
});

// ---------------------------------------------------
// 			           likeCount
// ---------------------------------------------------
$("ul.scMenuArea").on("click", ".likeBlank", function (event) {
    var brandCode = $(this).parents(".scBrand").find(".brandCode").text();
    console.log(brandCode);

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, brandCode, "I");

    $(this).siblings(".likeFull").css("display", "block");
    $(this).css("display", "none");
});

$("ul.scMenuArea").on("click", ".likeFull", function (event) {
    var brandCode = $(this).parents(".scBrand").find(".brandCode").text();
    console.log(brandCode);

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, brandCode, "D");

    $(this).siblings(".likeBlank").css("display", "block");
    $(this).css("display", "none");
});

function likeCount(id, code, division) {
    $.ajax({
        type: "post",
        url: "/likeCount",
        data: {
            id: id,
            code: code,
            codeType: code.charAt(0),
            division: division,
        },
        success: function (data) {
            console.log(data);
        },
        err: function (err) {
            console.log(err);
        },
    });
}

// login modal
$(".modalCloseBtn, .cancleModalBtn").click(function () {
    $("section.modalBackGround").css("display", "none");
});

$(".confirmModalBtn").click(function () {
    location.href = "/signIn";
});
