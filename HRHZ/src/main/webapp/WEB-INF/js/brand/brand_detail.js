$(document).ready(function () {
    articleContents();
});

// ---------------------------------------------------
//                   product list
// ---------------------------------------------------
function articleContents(colorArr) {
    var pg = parseInt($(".pg").text());
    var brandCode = $(".brandCode").text();
    var memberId = $(".sessionId").text();
    var productItem;

    console.log(pg);
    console.log(brandCode);
    console.log(memberId);

    $.ajax({
        type: "post",
        url: "/brand/getBrandDetail",
        data: { brandCode: brandCode, colorArr: colorArr, pg: pg },
        success: function (data) {
            //console.log(data);
            $(".productList").remove();
            $.each(data.list, function (index, items) {
                productItem = $(
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
                        "</a>" +
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
                        "</div>"
                );
                $(".productList").append(productItem);
            });

            //pagging
            $(".pagingDiv").html(data.categoryPaging.pagingHTML);
        },
        error: function (err) {
            console.log(err);
        },
    });
}
