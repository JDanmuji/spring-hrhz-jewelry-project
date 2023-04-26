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
    var list = [];
    var listData1 = {"code":"D00000179", "count":1};
    var listData2 = {"code":"D00000180", "count":0};
    var listData3 = {"code":"D00000181", "count":1};
    var listData4 = {"code":"D00000182", "count":0};
    var listData5 = {"code":"D00000183", "count":0};
    var listData6 = {"code":"D00000184", "count":0};
    list.push(listData1);
    list.push(listData2);
    list.push(listData3);
    list.push(listData4);
    list.push(listData5);
    list.push(listData6);

    var jsonList = JSON.stringify({"P000072": list, "P000020":list});



    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/purchase/getProductInfo",
        traditional: true,
        data: jsonList,
        success: function (data) {
            alert("성공?");
        },
        err: function (err) {console.log(err)}
    });
});