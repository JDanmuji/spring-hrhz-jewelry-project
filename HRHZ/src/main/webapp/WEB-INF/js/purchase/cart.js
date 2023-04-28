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
                                "<img class='countDownBtn' src='../images/purchase/product_quantity_minus_btn.png' width='20' />" +
                                "<span>" +
                                    items.qty +
                                "</span>" +
                                "<img class='countUpBtn' src='../images/purchase/product_quantity_plus_btn.png' width='20' />" +
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
                            productSum.toLocaleString() +
                        "</span>" +
                        "<span>+</span>" +
                        "<span style='font-size: 14px'>배송비</span>" +
                        "<span class='amount'>0</span>" +
                        "<span>=</span>" +
                        "<span class='totalPriceAmount'>" +
                            productSum.toLocaleString() +
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

$('.cartListCheckBox').on('click', function() {
	
	if($(this).children("input").is(":checked")) {
		$('.tableBody td.tdCheck01 input').prop("checked", true);
		$('.deleteSectionBtn').css("display", "block");
	} else {
		$('.tableBody td.tdCheck01 input').prop("checked", false);
		$('.deleteSectionBtn').css("display", "none");
	}

});


$(document).on("click", ".productCheckBox", function () {

	if($(this).children("input").prop("checked")) {
		$(this).children("input").prop("checked", false);
	} else {
		$(this).children("input").prop("checked", true);
	}
				
 	allCheckYN();
		
});

$(document).on("click", ".countDownBtn", function () {
	let $amountCount = $(this).next();
	let $productAmount = $(this).parents('tr').children().prev().eq(3).children().find('span.amount');
	let $productPrice = $(this).parents('tr').children().prev().eq(1).children().find('span.amount');
    let $footerPrice = $(this).parents('table').children('tfoot').children().find('span.amount').first();
	let $footerPriceTotal = $(this).parents('table').children('tfoot').children().find('span.totalPriceAmount');
	
    let $productAmountNum =  parseInt($productAmount.text().replace(",", "")); 
	let $productPriceNum = parseInt($productPrice.text().replace(",", ""));
	
	let $footerPriceNum = parseInt($footerPrice.text().replace(",", "")); 
	let $footerPriceTotalNum = parseInt($footerPriceTotal.text().replace(",", ""));

	let countSub = parseInt($amountCount.text()) - 1;
	let productSub =  $productAmountNum -  $productPriceNum ;
	
	let footerPriceSub = $footerPriceNum -  $productPriceNum ;
	let footerPriceTotalSub = $footerPriceTotalNum -  $productPriceNum ;


	
    if( parseInt($amountCount.text()) < 0 ) {
        return;
    }
	
	$amountCount.text(countSub.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$productAmount.text(productSub.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
	$footerPrice.text(footerPriceSub.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$footerPriceTotal.text(footerPriceTotalSub.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
	
});

$(document).on("click", ".countUpBtn", function () {
	
	let $amountCount = $(this).prev();
	let $productAmount = $(this).parents('tr').children().prev().eq(3).children().find('span.amount');
	let $productPrice = $(this).parents('tr').children().prev().eq(1).children().find('span.amount');
	let $footerPrice = $(this).parents('table').children('tfoot').children().find('span.amount').first();
	let $footerPriceTotal = $(this).parents('table').children('tfoot').children().find('span.totalPriceAmount');
	
	let $productAmountNum =  parseInt($productAmount.text().replace(",", "")); 
	let $productPriceNum = parseInt($productPrice.text().replace(",", ""));
	
	let $footerPriceNum = parseInt($footerPrice.text().replace(",", "")); 
	let $footerPriceTotalNum = parseInt($footerPriceTotal.text().replace(",", ""));
	
	let countAdd = parseInt($amountCount.text()) + 1;
	let productAdd =  $productAmountNum +  $productPriceNum ;
	
	let footerPriceAdd = $footerPriceNum +  $productPriceNum ;
	let footerPriceTotalAdd = $footerPriceTotalNum +  $productPriceNum ;
	
	
	
	console.log($(this).parents('table').children('tfoot').children().find('span.totalPriceAmount').text());
	
	
	
	$amountCount.text(countAdd.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$productAmount.text(productAdd.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
	$footerPrice.text(footerPriceAdd.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$footerPriceTotal.text(footerPriceTotalAdd.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
		
});


function allCheckYN() {
	var total =  $('.tableBody td.tdCheck01 input').length;
	var checked = 	$('.tableBody td.tdCheck01 input:checked').length;
	
	if(total !== checked) {
		$('.cartListCheckBox').children("input").prop("checked", false);
	} else {
		$('.cartListCheckBox').children("input").prop("checked", true); 
	}
	
	if(checked > 0) {
		$('.deleteSectionBtn').css("display", "block");
	} else {
		$('.deleteSectionBtn').css("display", "none");
	}
}
