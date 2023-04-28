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

//-----------------------------------
// product
$(function (){
    var list = [];
    var list2 =  [];
    var listData1 = {"optionCode":"D00000179", "productCount":1};
    var listData2 = {"optionCode":"D00000180", "productCount":0};
    var listData3 = {"optionCode":"D00000181", "productCount":1};
    var listData4 = {"optionCode":"D00000182", "productCount":0};
    var listData5 = {"optionCode":"D00000183", "productCount":0};
    var listData6 = {"optionCode":"D00000184", "productCount":0};
    list.push(listData1);
    list.push(listData2);
    list.push(listData3);
    list.push(listData4);
    list.push(listData5);
    list.push(listData6);

    var listData21 = {"optionCode":"D00000023", "productCount":2};
    var listData22 = {"optionCode":"D00000024", "productCount":0};
    var listData23 = {"optionCode":"D00000025", "productCount":0};
    var listData24 = {"optionCode":"D00000026", "productCount":0};
    var listData25 = {"optionCode":"D00000027", "productCount":0};
    var listData26 = {"optionCode":"D00000028", "productCount":0};
    list2.push(listData21);
    list2.push(listData22);
    list2.push(listData23);
    list2.push(listData24);
    list2.push(listData25);
    list2.push(listData26);
    var jsonList = JSON.stringify({"P00000072": list, "P00000020": list2});


    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/purchase/getPaymentInfo",
        traditional: true,
        data: jsonList,
        success: function (data) {
            let headName = [];

            $.each(data, function (index, items){
                let thead="";
                let tbody="";
                let tfoot="";
                let productSum = 0;

                let brandName = items.brandName;
                console.log(headName);

                // brand remove duplicate
                if(headName.indexOf(brandName) === -1 ) {
                    thead = "<table class='payProductTable'>"+
                            "<thead>" +
                                "<tr>" +
                                    "<th class='storeName'>" + brandName + "</th>" +
                                    "<th class='count'>수량</th>" +
                                    "<th class='benefit'>할인혜택</th>" +
                                    "<th class='price'>주문금액</th>" +
                                "</tr>" +
                            "</thead>"+
                        "<tbody>";
                    $.each(data, function (index,items){
                        if(brandName === items.brandName) {
                            tbody += "<tr>" +
                                "<td class='productInfoBox'>" +
                                "<div class='productInfoImgBox'>" +
                                "<span class='productImg'>" +
                                "<img src='/storage/" + items.imgPath + "' />" +
                                "</span>" +
                                "</div>" +
                                "<div class='productInfo'>" +
                                "<div class='productName'>" +
                                items.productName +
                                "</div>" +
                                "<div class='productOption'>" +
                                items.detailType +" : " + items.optionName +
                                "</div>" +
                                "<div class='productCountAndPrice'>" +
                                "<span class='productPrice'>" +
                                "<span class='amount'>" +
                                items.productPrice.toLocaleString() +
                                "</span>" +
                                "<span class='unit'>" +
                                "원" +
                                "</span>" +
                                "</span>" +
                                "</div>" +
                                "</div>" +
                                "</td>" +
                                "<td class='productCount'>" +
                                "<span class='amount'>" +
                                items.productCnt +
                                "</span>" +
                                "<span class='unit'>" +
                                "개" +
                                "</span>" +
                                "</td>" +
                                "<td class='discountBenefit'>" +
                                "<div class='applyCoupon'>" +
                                "<span class='applyCouponInfo'>" +
                                "<span>쿠폰적용</span>" +
                                "</span>" +
                                "</div>" +
                                "</td>" +
                                "<td class='orderPrice'>" +
                                "<span class='amount productTotalPay'>" +
                                   items.sum.toLocaleString() + "</span>" +
                                "<span class='unit'>원</span>" +
                                "</td>" +
                                "</tr>"
                            ;
                            productSum += items.sum;
                        };
                    });
                };

                if(headName.indexOf(items.brandName) === -1 ) {
                    tfoot = "</tbody>" +
                        "<tfoot>" +
                        "<tr>" +
                        "<td class='productTotal' colspan='4'>" +
                        "<span class='productPrice'>" +
                        "<span>상품</span>" +
                        "<span class='amount'>" +
                            productSum.toLocaleString() +
                        "</span>" +
                        "<span>+</span>" +
                        "<span>배송비</span>" +
                        "<span class='amount'>0</span>" +
                        "<span>=</span>" +
                        "</span>" +
                        "<span class='totalPriceAmount'>"+ productSum.toLocaleString() +
                        "</span>" +
                        "</td>" +
                        "</tr>" +
                        "</tfoot>" +
                        "</table>";
                    headName.push(brandName);
                }
                thead += tbody + tfoot;
                $('.payProductInfo').append(thead);
            });
        },
        err: function (err) {console.log(err)}
    });
});

$(function (){
    $(window).on("scroll", function () {
        var topOffset = $('.bothSideInfoWrap').offset().top - 95;

        if ($(this).scrollTop() >= topOffset) {
            $(".paySummaryInfo").addClass("fixed");
        } else {
            $(".paySummaryInfo").removeClass("fixed");
        }
    });
});