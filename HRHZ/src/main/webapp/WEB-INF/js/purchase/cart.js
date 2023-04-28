// product dynamic allocation in cart
$(function (){

    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/purchase/getCart",
        traditional: true,
        success: function (data) {
            let headName = [];
            let qtySum = 0;
            let totalPrice = 0;
            $.each(data, function (index, items) {
                let thead = "";
                let tbody = "";
                let tfoot = "";
                let productSum = 0;


                let brandName = items.brandName;
                console.log(headName);

                // brand remove duplicate
                if (headName.indexOf(brandName) === -1) {
                    thead = "<table class='cartTable'>" +
                        "<thead>" +
                            "<tr>" +
                                "<th class='storeName' colspan='2'>" +
                                    brandName +
                                "</th>" +
                                "<th class='qty'>수량</th>" +
                                "<th class='price'>주문금액</th>" +
                            "</tr>" +
                        "</thead>"+
                    "<tobody>"
                    $.each(data, function (index, items) {
                        if (brandName === items.brandName) {
                            console.log(items.productName);
                            let sum = items.price * items.qty;
                            tbody +=
                                "<tr class='tableBody'>" +
                                "<td class='tdCheck01'>" +
                                "<div class='productCheckBox'>" +
                                "<input id='checkedAll2' type='checkbox' checked />" +
                                "<label for='checkedAll2'> </label>" +
                                "</div>" +
                                "</td>" +
                                "<td class='td01'>" +
                                "<div class='productInfoBox'>" +
                                "<div class='productInfoImg'>" +
                                "<a href=''>" +
                                "<span class='productImg'>" +
                                "<img src='/storage/" + items.imgPath + "' />" +
                                "</span>" +
                                "</a>" +
                                "</div>" +
                                "<div class='productInfoText'>" +
                                "<a href=''>" +
                                "<div class='productName'>" +
                                    items.productName +
                                "</div>" +
                                "</a>" +
                                "<div class='productOption'>" +
                                    items.detailType +" : "+ items.detailName +
                                "</div>" +
                                "<div class='productPrice'>" +
                                "<span class='amount'>" +
                                    items.price.toLocaleString() +
                                "</span>" +
                                "<span class='unit'>원</span>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</td>" +
                                "<td class='productCountWrap'>" +
                                "<div class='productCount'>" +
                                "<img class='countDownBnt' src='../images/purchase/product_quantity_minus_btn.png' width='20' />" +
                                "<span>" +
                                    items.qty +
                                "</span>" +
                                "<img class='countUpBnt' src='../images/purchase/product_quantity_plus_btn.png' width='20' />" +
                                "</div>" +
                                "</td>" +
                                "<td>" +
                                "<div class='productSumPrice'>" +
                                "<span class='amount'>" +
                                    sum.toLocaleString() +
                                "</span>" +
                                "<span class='unit'>원</span>" +
                                "</div>" +
                                "</td>" +
                                "<td>" +
                                "<div>" +
                                "<img class='productDeleteBnt' src='../images/purchase/modal_close_btn.png' />" +
                                "</div>" +
                                "</td>" +
                                "</tr>" ;

                            productSum += sum;
                            qtySum += items.qty
                        }
                    });
                };
                if(headName.indexOf(items.brandName) === -1 ) {
                    tfoot = "</tobody>" + "<tfoot>" +
                        "<tr>" +
                        "<td class='productBundleTotalPrice' colspan='5'>" +
                        "<span class='productPrice'>" +
                        "<span style='font-size: 14px'>상품</span>" +
                        "<span class='amount'>" +
                            productSum +
                        "</span>" +
                        "<span>+</span>" +
                        "<span style='font-size: 14px'>배송비</span>" +
                        "<span class='amount'>0</span>" +
                        "<span>=</span>" +
                        "<span class='totalPriceAmount'>" +
                            productSum +
                        "</span>" +
                        "</span>" +
                        "</td>" +
                        "</tr>" +
                        "</tfoot>" +
                        "</table>";
                    totalPrice += productSum;
                    headName.push(brandName);
                }
                thead += tbody + tfoot;
                $('.cartListTotal').append(thead);
                console.log(qtySum);
                console.log(totalPrice);
            });
        },
        err: function (err) {console.log(err)}

    });
});