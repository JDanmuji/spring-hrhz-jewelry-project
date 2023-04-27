// product dynamic allocation in cart
$(function (){

    $.ajax({
        contentType: "application/json",
        type: "post",
        url: "/purchase/getCart",
        traditional: true,
        success: function (data) {
            console.log(data);
            let headName = [];

            $.each(data, function (index, items) {
                let thead = "";
                let tbody = "";
                let tfoot = "";
                let productSum = 0;

                let brandName = items.brandName;

                // brand remove duplicate
                if (headName.indexOf(items.brandName) === -1) {

                    html = "<table class='cartTable'>" +
                        "<thead>" +
                        "    <tr>" +
                        "        <th class='storeName' colspan='2'>러브오낫</th>" +
                        "        <th class='qty'>수량</th>" +
                        "        <th class='price'>주문금액</th>" +
                        "    </tr>" +
                        "</thead>" +
                        "<tobody>" +
                        "    <tr class='tableBody'>" +
                        "        <td class='tdCheck01'>" +
                        "            <div class='productCheckBnt'>" +
                        "                <input id='checkedAll2' type='checkbox' checked />" +
                        "                <label for='checkedAll2'> </label>" +
                        "            </div>" +
                        "        </td>" +
                        "        <td class='td01'>" +
                        "            <div class='productInfoBox'>" +
                        "                <div class='productImag'>" +
                        "                    <a href=''>" +
                        "  <img class='sampleImg' alt='' src='../images/purchase/loveonot.jpeg' />" +
                        "                    </a>" +
                        "                </div>" +
                        "                <div class='productinfoText'>" +
                        "                    <a href=''>" +
                        "  <div class='productName'>Deep Orange Fine Color Beads Ring</div>" +
                        "                    </a>" +
                        "                    <div class='productOption'>옵션 : 없음</div>" +
                        "                    <div class='productPrice'>" +
                        "  <span class='amount'>9,900</span>" +
                        "  <span class='unit'>원</span>" +
                        "                    </div>" +
                        "                </div>" +
                        "            </div>" +
                        "        </td>" +
                        "        <td class='productCountWrap'>" +
                        "            <div class='productCount'>" +
                        "                <img class='countDownBnt' src='../images/purchase/product_quantity_minus_btn.png' width='20' />" +
                        "                <span>1</span>" +
                        "                <img class='countUpBnt' src='../images/purchase/product_quantity_plus_btn.png' width='20' />" +
                        "            </div>" +
                        "        </td>" +
                        "        <td>" +
                        "            <div class='productSumPrice'>" +
                        "                <span class='amount'>9,900</span>" +
                        "                <span class='unit'>원</span>" +
                        "            </div>" +
                        "        </td>" +
                        "        <td>" +
                        "            <div>" +
                        "                <img class='productDeleteBnt' src='../images/purchase/modal_close_btn.png' />" +
                        "            </div>" +
                        "        </td>" +
                        "    </tr>" +
                        "</tobody>" +
                        "<tfoot>" +
                        "    <tr>" +
                        "        <td class='productBundleTotalPrice' colspan='5'>" +
                        "            <span class='productPrice'>" +
                        "                <span style='font-size: 14px'>상품</span>" +
                        "                <span class='amount'>9,900</span>" +
                        "                <span>+</span>" +
                        "                <span style='font-size: 14px'>배송비</span>" +
                        "                <span class='amount'>0</span>" +
                        "                <span>=</span>" +
                        "                <span class='totalPriceAmount'>9,900</span>" +
                        "            </span>" +
                        "        </td>" +
                        "    </tr>" +
                        "</tfoot>" +
                        "                  </table>"
                }

            });
        },
        err: function (err) {console.log(err)}

    });
});