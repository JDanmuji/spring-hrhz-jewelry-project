var brandCode = $(".brandCode").text();
var memberId = $(".memberId").text();

$(document).ready(function () {
    articleContents();
});

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
    keywordList[0] + "·" + keywordList[1] + "·" + keywordList[2];
$(".brandTagList").append(selectedKeywords);

// price formatter
function addComma(num) {
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ",");
}

function articleContents() {
    var pg = parseInt($(".pg").text());
    var productHTML;
    var heartHTML;

    console.log(pg);
    console.log(brandCode);
    console.log(memberId);

    $.ajax({
        type: "post",
        url: "/brand/getBrandDetail",
        data: { brandCode: brandCode, pg: pg, memberId: memberId },
        success: function (data) {
            // ---------------------------------------------------
            //                     brand info
            // ---------------------------------------------------
            $(".brandLogo").append(
                "<img src='/storage/" +
                    data.list[0].brandCode +
                    "/" +
                    data.list[0].brandLogoName +
                    "' />"
            );
            $(".brandName").text(data.list[0].brandName);
            $(".likeCount").text(addComma(data.list[0].brandLikeCount));

            console.log("brandLikeYN" + data.list[0].brandLikeYN);

            if (data.list[0].brandLikeYN == "Y") {
                $(".brandHeartIconWhite").hide();
                $(".brandHeartIconViolet").show();
            } else {
                $(".brandHeartIconWhite").show();
                $(".brandHeartIconViolet").hide();
            }

            // ---------------------------------------------------
            //                   product list
            // ---------------------------------------------------
            $(".productList").remove();
            $(".pagingDiv").remove();
            $(".productListSection")
                .append("<div class='productList'></div>")
                .append("<div class='pagingDiv'></div>");

            $.each(data.list, function (index, items) {
                console.log(items);

                productHTML =
                    "<div class='articleContent'>" +
                    "<input type='hidden' name='code' value='" +
                    items.productCode +
                    "'/>" +
                    "<a href='/purchase/productDetail?productCode=" +
                    items.productCode +
                    "'>" +
                    "<div class='articleImg'>" +
                    "<img src='/storage/" +
                    items.imgPath +
                    "'/>" +
                    "</div>" +
                    "<div class='articleDesc'>" +
                    "<span><strong>" +
                    items.brandName +
                    "</strong></span>" +
                    "<span>" +
                    items.productName +
                    "</span>" +
                    "<div class='atriclePrice'>" +
                    "<span class='percentage'>" +
                    "<span>" +
                    "<strong>13</strong>" +
                    "<strong>%</strong>" +
                    "<span class='price'>" +
                    "<span><strong>" +
                    items.price +
                    "</strong>" +
                    "</span>원</span>" +
                    "</div>" +
                    "</div>" +
                    "<div class ='likeNumber'>" +
                    "좋아요" +
                    "<span>" +
                    addComma(items.productLikeCount) +
                    "</span>" +
                    "</div>" +
                    "</a>";

                // check likeYN & change heart color
                if (items.productLikeYN == "Y") {
                    heartHTML =
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg' style='display:none'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
                        "</div>";
                } else {
                    heartHTML =
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg' style='display:none'/>" +
                        "</div>";
                }
                $(".productList").append(productHTML + heartHTML);

                console.log(items.productLikeYN);
                console.log(heartHTML);
                console.log(memberId);
            }); // each

            //paging
            $(".pagingDiv").html(data.brandPaging.pagingHTML);
        },
        error: function (err) {
            console.log(err);
        },
    });
}

// ---------------------------------------------------
// 			           likeCount
// ---------------------------------------------------
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
        err: function (err) {
            console.log(err);
        },
    });
}

// insert brand like
$(document).on("click", ".brandHeartIconWhite", function () {
    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, brandCode, "I");
    $(this).hide();
    $(this).next().show();
});

// delete brand like
$(document).on("click", ".brandHeartIconViolet", function () {
    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, brandCode, "D");
    $(this).hide();
    $(this).prev().show();
});

// insert product like
$(document).on("click", ".heartIconWhite", function () {
    let code = $(this).siblings("input").val();
    console.log(memberId);

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, code, "I");
    $(this).hide();
    $(this).next().show();

    // console.log($(".likeCount").text());
    // let likeNumberUpdate = addComma(
    //     parseInt($(".likeCount").text().replace(",", "")) + 1
    // );
    // console.log(likeNumberUpdate);
    // $(".likeCount").text(likeNumberUpdate);
});

// delete product like
$(document).on("click", ".heartIconViolet", function () {
    let code = $(this).siblings("input").val();

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, code, "D");
    $(this).hide();
    $(this).prev().show();
});

// login modal
$(".modalCloseBtn, .cancleModalBtn").click(function () {
    $("section.modalBackGround").css("display", "none");
});

$(".confirmModalBtn").click(function () {
    location.href = "/signIn";
});
