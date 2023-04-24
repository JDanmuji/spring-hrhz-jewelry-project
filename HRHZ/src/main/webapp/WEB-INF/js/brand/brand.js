// getBrandList
$(document).ready(function () {
    $.ajax({
        type: "post",
        url: "brand/getBrandList",

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

                console.log(items.imgPath);
                // <li> appending
                let brandLi = $(
                    "<li class='scBrand'>" +
                        "<a class='brandLink' href='/brand/brandDetail'>" +
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
                        "<div class='brandLikeBtn'>" +
                        "<img class='likeBlank' src='../images/brand/heart.jpg' />" +
                        "<img class='likeFull' src='../images/brand/heart_violet.jpg' />" +
                        "</div></li>"
                );

                // append HTML to <ul> tag
                $("ul.scMenuArea").append(brandLi);
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

// like heart buttons
$("ul.scMenuArea").on("click", ".likeBlank", function (event) {
    $(this).siblings(".likeFull").css("display", "block");
    $(this).css("display", "none");
});
$("ul.scMenuArea").on("click", ".likeFull", function (event) {
    $(this).siblings(".likeBlank").css("display", "block");
    $(this).css("display", "none");
});
