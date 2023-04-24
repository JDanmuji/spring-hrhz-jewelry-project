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
}