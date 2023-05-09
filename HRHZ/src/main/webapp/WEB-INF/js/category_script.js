$(document).ready(function () {
    var checkHTML = $("<img>")
        .addClass("checkIcon")
        .attr("src", "../images/category/check_icon.png")
        .attr("alt", "check icon")
        .hide();

    // add check img
    $(".filterDiv").append(checkHTML);
    $(".categoryToggle > p").append(checkHTML);

	
	var pgData = $('#pg').val().length > 0 ? $('#pg').val()  : 1;
    var dataList = {
        pg: pgData,
    };
    articleContents(dataList);
});

// ---------------------------------------------------
//                   category nav
// ---------------------------------------------------
// Show the first category when the page loads
$(".categoryWrap:not(:first)")
    .find(".categoryToggle")
    .slideUp()
    .attr("src", "../images/category/expand_black_btn.png");

$(".expandBtn").on("click", function () {
    $(this).parents(".leftSection").find(".checkIcon").hide();
    $(".categoryToggle > p").removeClass("checkedCategory");
    $(".categoryToggle").slideUp(); // close all toggles
    // open selected toggle
    $(this).parents(".categoryWrap").find(".categoryToggle").slideDown();

    // change expand icon
    $(".expandBtn").attr("src", "../images/category/expand_black_btn.png");
    $(this).attr("src", "../images/common/filter_reset_btn.png");

    // change title to selected category
    $(".currentCategory").text($(this).siblings("span").text());

    // load contents
    var parentCode = $(this).siblings("span").text();
    console.log(parentCode);

    var dataList = {
        parentCode: parentCode,
        pg: 1,
        sortValue: $("span.selectedSort").text(),
    };
    articleContents(dataList);
});

// function navFunction(categoryClass) {
//     var parentCode = categoryClass
//         .siblings(".categoryTitle")
//         .find("span")
//         .text();

//     var checkData = categoryClass.find("p.checkedCategory").get();
//     var checkList = new Array();
//     $.each(checkData, function (index, item) {
//         checkList.push(checkData[index].innerText);
//     });

//     var dataList = {
//         parentCode: parentCode,
//         checkList: checkList,
//         pg: 1,
//         sortValue: $("span.selectedSort").text(),
//     };
//     articleContents(dataList);
// }

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
    $(".selectedSort").on("click", function (event) {
        $(".sortToggle").toggle(0);
    });

    $(document).on("click", ".sortToggle > div", function () {
        $(".selectedSort").text($(this).text());
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
        $(".priceFilterInput > input:first").val("");
        $(".priceFilterInput > input:last").val("");
    });
});

// filter menu buttons
$(".filterMenu > p").click(function (event) {
    $(".filterMenu > p").css("color", "#d9d9d9");
    $(this).css("color", "#000");
});
// $(".filterMenu > p:nth-child(1)").click(function (event) {
//     $(".filterPage").css("display", "none");
//     $(".brandFilter").css("display", "block");
// });
$(".filterMenu > p:nth-child(1)").click(function (event) {
    $(".filterPage").css("display", "none");
    $(".colorFilter").css("display", "grid");
});
$(".filterMenu > p:nth-child(2)").click(function (event) {
    $(".filterPage").css("display", "none");
    $(".priceFilter").css("display", "flex");
});

// 닫기
$(".filterMenu > p:nth-child(3)").click(function (event) {
    $(".filterToggle").toggle(0);
    $(".brandFilter > div > input").css("color", "#d9d9d9");
    $(".filterMenu > p:nth-child(1)").click();
});

// // brand filter search input
// function fontColor(thisClass) {
//     if (thisClass.val() != "") {
//         thisClass.css("color", "#000");
//         thisClass.css("font-weight", "500");
//     }
// }
// $(".brandFilter > div > input").on("focus", function (event) {
//     $(".brandFilterSearchDiv").css("border-bottom", "1px solid #000");
//     fontColor($(this));
//     if ($(this).val() == "브랜드명을 입력해 주세요") {
//         $(this).val("");
//     }
// });
// $(".brandFilter > div > input").on("blur", function (event) {
//     $(".brandFilterSearchDiv").css("border-bottom", "1px solid #d9d9d9");
//     fontColor($(this));
//     if ($(this).val() == "") {
//         $(this).css("color", "#d9d9d9");
//         $(this).val("브랜드명을 입력해 주세요");
//     }
// });

// ---------------------------------------------------
//                   filter select
// ---------------------------------------------------
function tagUpdate() {
    $(".tagSpan").remove();
    $(".checkedFilter").each(function () {
        let filterName = $(this).find("> p").text();
        let filterCode = $(this).find("> span").val();

        $(".tagArea").append(
            "<span class='tagSpan'><span>" +
                filterCode +
                "</span>" +
                filterName +
                " X</span>"
        );
    });
}
function priceUncheck() {
    $(".priceFilter .filterDiv").find(".checkIcon").hide();
    $(".priceFilter .filterDiv").css("font-weight", "400");
    $(".priceFilter .filterDiv").removeClass("checkedFilter");
}

// check
$(".filterBox").on("click", ".colorFilter .filterDiv", function () {
    $(this).find(".checkIcon").show();
    $(this).css("font-weight", "700");
    $(this).addClass("checkedFilter");
    tagUpdate();
});
$(".filterBox").on("click", ".priceFilter .filterDiv", function () {
    priceUncheck();
    $(this).find(".checkIcon").show();
    $(this).css("font-weight", "700");
    $(this).addClass("checkedFilter");
    tagUpdate();
});
// price input
$(document).on("click", ".addBtn", function () {
    // $(".priceFilterInput").addClass("checkedFilter");
    // inputUpdate();
    priceUncheck();
    tagUpdate();
});
// uncheck
$(".filterBox").on("click", ".checkedFilter", function (event) {
    $(this).find(".checkIcon").hide();
    $(this).css("font-weight", "400");
    $(this).removeClass("checkedFilter");
    tagUpdate();
});
// reset btn
$(".filterBox").on("click", ".filterResetBtn", function (event) {
    $(".checkIcon").hide();
    $(".filterDiv").css("font-weight", "400");
    $(".tagSpan").remove();
    $(".checkedFilter").removeClass("checkedFilter");
});

// tag delete
$(document).on("click", ".tagSpan", function () {
    let tagName = $(this).text();
    //console.log(tagName);

    $(".checkedFilter").each(function () {
        let filterName = $(this).find("> p").text() + " X";
        //console.log(filterName);

        if (filterName === tagName) {
            $(this).find(".checkIcon").hide();
            $(this).css("font-weight", "400").removeClass("checkedFilter");
        }
    });
    $(this).remove();
});

// ---------------------------------------------------
//                숫자 3자리 콤마 찍기
// ---------------------------------------------------
String.prototype.formatNumber = function () {
    if (this == 0) return 0;
    let regex = /(^[+-]?\d+)(\d)/;
    let nstr = this + "";
    while (regex.test(nstr)) nstr = nstr.replace(regex, "$1" + "," + "$2");
    return nstr;
};

// ---------------------------------------------------
//                 Best List
// ---------------------------------------------------
function articleContents(dataList) {
    var optionItem;

    $.ajax({
        type: "post",
        url: "/bestCategoryPorductList",
        data: dataList,
        dataType: "json",

        success: function (data) {
            //console.log(data);
            $(".articleContent").remove();
            $.each(data.list, function (index, items) {
                contentHTML =
                    "<div class='articleContent'>" +
                    "<input type='hidden' name='code' value='" +
                    items.productCode +
                    "'/>" +
                    "<a href='/purchase/productDetail?productCode=" +
                    items.productCode +
                    "'>" +
                    "<div class='articleImg'>" +
                    "<img src='storage/" +
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
                    items.likeCount.toLocaleString() +
                    "</span>" +
                    "</div>" +
                    "</a>";

                if (items.likeYN == "Y") {
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

                $(".articleContents").append(contentHTML + heartHTML);
                console.log(items.likeYN);
            });

            //pagging
            $(".pagingDiv").html(data.categoryPaging.pagingHTML);
        },
        error: function (err) {
            console.log(err);
        },
    });
}

// ---------------------------------------------------
//                  Like heart
// ---------------------------------------------------
$(document).on("click", ".heartIconWhite", function () {
    var memberId = $("#memberId").val();
    var code = $(this).parents().eq(0).children("input").val();
    var division = "I";

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, code, division);
    $(this).css("display", "none");
    $(this).parent().find(".heartIconViolet").css("display", "block");
});

$(document).on("click", ".heartIconViolet", function () {
    var division = "D";
    var memberId = $("#memberId").val();
    var code = $(this).parents().eq(0).children("input").val();

    if (!memberId) {
        $("section.modalBackGround").css("display", "flex");
        return;
    }
    likeCount(memberId, code, division);
    $(this).css("display", "none");
    $(this).parent().find(".heartIconWhite").css("display", "block");
});

$(".modalCloseBtn, .cancleModalBtn").click(function () {
    $("section.modalBackGround").css("display", "none");
});
$(".confirmModalBtn").click(function () {
    location.href = "/signIn";
});

function likeCount(id, code, division) {
    $.ajax({
        type: "post",
        url: "/categorylikeCount",
        data: {
            id: id,
            code: code,
            codeType: code.charAt(0),
            division: division,
        },
        success: function (data) {
            console.log(data);
        },
        error: function (err) {
            console.log(err);
        },
    });
}

// ---------------------------------------------------
//              color&price SelectProductList
// ---------------------------------------------------
$(document).on("click", ".filterResultBtn", function () {
    var color = $(".checkedFilter span").text();
    var colorArr = color.split("");
    var price = $(".checkedFilter h4").text();
    var inputPrice1 = $(".priceFilterInput").children("input").eq(0).val();
    var inputPrice2 = $(".priceFilterInput").children("input").eq(1).val();

    console.log($("span.selectedSort").text());

    var dataList = {
        colorArr: colorArr,
        price: price,
        inputPrice1: inputPrice1,
        inputPrice2: inputPrice2,
        pg: 1,
        // "sortValue" :$(".sortToggle span").text()

        sortValue: $("span.selectedSort").text(),
    };

    articleContents(dataList);
    $(".filterToggle").css("display", "none");
});

// ---------------------------------------------------
//             sortProductList
// ---------------------------------------------------
/*
$(document).on("click", ".sortToggle div", function() {
    	var sortValue = $(this).find("> span").text();
    	console.log(sortValue);
    
    var dataSort = 
    { "sortValue" : sortValue,
       
   }
        articleContents(dataSort);
        
   	});

*/

// ---------------------------------------------------
//              categoryNavSelectList
// ---------------------------------------------------
$(document).on("click", ".categoryToggle", function () {
    var parentCode = $(this).prev().get(0).innerText;
    var checkData = $(".categoryToggle p.checkedCategory").get();
    var checkList = new Array();

    $.each(checkData, function (index, item) {
        checkList.push(checkData[index].innerText);
    });
    
    console.log(checkList);

    var dataList = {
        parentCode: parentCode,
        checkList: checkList,
        pg: 1,
        sortValue: $("span.selectedSort").text()
    };

    articleContents(dataList);
});

// ---------------------------------------------------
//              sortToggleList
// ---------------------------------------------------


$('span.selectedSort').on('DOMSubtreeModified', function (e) {
    
    var sortValue = $('span.selectedSort').text();

    if (sortValue.length > 0 ) {

        var dataList = {
            pg: 1,
            sortValue: sortValue,
        };

        articleContents(dataList);
    }      
});

// ---------------------------------------------------
//              paging
// ---------------------------------------------------
function categoryPaging(pg) {
    location.href = "/category?pg=" + pg;
}

