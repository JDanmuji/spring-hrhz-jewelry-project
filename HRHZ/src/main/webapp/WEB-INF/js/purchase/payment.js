$(function () {
    summaryInfoAnimation();
});

//selectBox function
$(".dropDownCoverSelector").on("click", function (event) {
    $(".dropDownList").css("display", "block");
});

$(".dropDownList").on("click", function (event) {
    $(".dropDownList").css("display", "none");
});

$(".dropDownListPlain li").on("click", function (event) {
    $(".dropDownSelect span").text($(this).text());
    $(".dropDownList").css("display", "none");
});

function summaryInfoAnimation() {
    var lnb = $(".paySummaryInfo").offset().top;

    $(window).scroll(function () {
        var window = $(this).scrollTop();

        if (lnb <= window) {
            $(".paySummaryInfo").addClass("fixed");
        } else {
            $(".paySummaryInfo").removeClass("fixed");
        }
    });
};


//-----------------------------------
// product
$(function (){
    console.log("11");

    const $optionCountList = JSON.stringify($('.optionCountList').val());
    console.log($optionCountList);
    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/purchase/getProductInfo",
        data:  $optionCountList,
        success: function (data) {
            alert("성공?");
        },
        err: function (err) {console.log(err)}
    });
});