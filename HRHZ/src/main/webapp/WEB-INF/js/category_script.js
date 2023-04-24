$(document).ready(function () {
    var checkHTML = $("<img>")
        .addClass("checkIcon")
        .attr("src", "../images/category/check_icon.png")
        .attr("alt", "check icon")
        .hide();

    // add check img
    $(".filterDiv").append(checkHTML);
    $(".categoryToggle > p").append(checkHTML);
});

// ---------------------------------------------------
//                category nav
// ---------------------------------------------------
// Show the first category when the page loads
$(".categoryWrap:not(:first)")
    .find(".categoryToggle")
    .slideUp()
    .attr("src", "../images/category/expand_black_btn.png");

$(".expandBtn").on("click", function () {
    $(".checkIcon").hide();
    $(".categoryToggle > p").removeClass("checkedCategory");
    $(".categoryToggle").slideUp(); // close all toggles
    // open selected toggle
    $(this).parents(".categoryWrap").find(".categoryToggle").slideDown();

    // change icon
    $(".expandBtn").attr("src", "../images/category/expand_black_btn.png");
    $(this).attr("src", "../images/common/filter_reset_btn.png");
});

// show check
$(document).on("click", ".categoryToggle > p", function () {
    $(this).find(".checkIcon").show();
    $(this).addClass("checkedCategory");
});
// hide check
$(document).on("click", ".checkedCategory", function () {
    $(this).find(".checkIcon").hide();
    $(this).removeClass("checkedCategory");
});

// ---------------------------------------------------
//                sorting menu box
// ---------------------------------------------------
$(".sortToggle").toggle(0);
$(function () {
    $(".filterBox > span:first-child").on("click", function (event) {
        $(".sortToggle").toggle(0);
    });
});

// ---------------------------------------------------
//                filter menu box
// ---------------------------------------------------
$(".filterToggle").toggle(0);
$(function () {
    $(".filterBox > span:nth-child(3)").on("click", function (event) {
        $(".filterMenu > p:nth-child(1)").click();
        $(".filterToggle").toggle(0);

        // input value 초기화
        $(".brandFilter > div > input").val("브랜드명을 입력해 주세요");
        $(".priceFilterInput > input:first").val("2,000");
        $(".priceFilterInput > input:last").val("9,999,999");
    });
});

// filter menu buttons
$(".filterMenu > p").click(function (event) {
    $(".filterMenu > p").css("color", "#d9d9d9");
    $(this).css("color", "#000");
});
$(".filterMenu > p:nth-child(1)").click(function (event) {
    $(".filterPage").css("display", "none");
    $(".brandFilter").css("display", "block");
});
$(".filterMenu > p:nth-child(2)").click(function (event) {
    $(".filterPage").css("display", "none");
    $(".colorFilter").css("display", "grid");
});
$(".filterMenu > p:nth-child(3)").click(function (event) {
    $(".filterPage").css("display", "none");
    $(".priceFilter").css("display", "flex");
});

// 닫기
$(".filterMenu > p:nth-child(4)").click(function (event) {
    $(".filterToggle").toggle(0);
    $(".brandFilter > div > input").css("color", "#d9d9d9");
    $(".filterMenu > p:nth-child(1)").click();
});

// brand filter search input
function fontColor(thisClass) {
    if (thisClass.val() != "") {
        thisClass.css("color", "#000");
        thisClass.css("font-weight", "500");
    }
}
$(".brandFilter > div > input").on("focus", function (event) {
    $(".brandFilterSearchDiv").css("border-bottom", "1px solid #000");
    fontColor($(this));
    if ($(this).val() == "브랜드명을 입력해 주세요") {
        $(this).val("");
    }
});
$(".brandFilter > div > input").on("blur", function (event) {
    $(".brandFilterSearchDiv").css("border-bottom", "1px solid #d9d9d9");
    fontColor($(this));
    if ($(this).val() == "") {
        $(this).css("color", "#d9d9d9");
        $(this).val("브랜드명을 입력해 주세요");
    }
});

// ---------------------------------------------------
//                   filter select
// ---------------------------------------------------
function tagUpdate() {
    $(".tagSpan").remove();
    $(".checkedFilter").each(function () {
        let filterName = $(this).find("> p").text();
        $(".tagArea").append(
            "<span class='tagSpan'>" + filterName + " X</span>"
        );
    });
}

// check
$(".filterBox").on("click", ".filterDiv", function () {
    $(this).find(".checkIcon").show();
    $(this).css("font-weight", "700");
    $(this).addClass("checkedFilter");
    tagUpdate();
});
// uncheck
$(".filterBox").on("click", ".checkedFilter", function (event) {
    $(this).find(".checkIcon").hide();
    $(this).css("font-weight", "500");
    $(this).removeClass("checkedFilter");
    tagUpdate();
});

// reset btn
$(".filterBox").on("click", ".filterResetBtn", function (event) {
    $(".checkIcon").hide();
    $(".filterDiv").css("font-weight", "500");
    $(".tagSpan").remove();
});

// tag delete
$(document).on("click", ".tagSpan", function () {
    let tagName = $(this).text();
    console.log(tagName);

    $(".checkedFilter").each(function () {
        let filterName = $(this).find("> p").text() + " X";
        console.log(filterName);

        if (filterName === tagName) {
            $(this).find(".checkIcon").hide();
            $(this).css("font-weight", "500").removeClass("checkedFilter");
        }
    });
    $(this).remove();
});

// ---------------------------------------------------
//                  Like heart
// ---------------------------------------------------
$(".heartIconWhite").on("click", function (event) {
    $(this).css("display", "none");
    $(this).parent().find(".heartIconViolet").css("display", "block");
});
$(".heartIconViolet").on("click", function (event) {
    $(this).css("display", "none");
    $(this).parent().find(".heartIconWhite").css("display", "block");
});
