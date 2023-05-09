var deleteCheck;
var memberId = $(".memberId").val();

// product dynamic allocation in cart
$(function (){
    cartSearch();
});

// ---------------------------------------------------
//          continue shopping button
// ---------------------------------------------------
$('.cancelBtn').on('click', function() {
	
	location.href="/";

});

// ---------------------------------------------------
//           payment button
// ---------------------------------------------------
$('.submitBtn').on('click', function() {
	$(".buyNowForm").empty();
	let optionList = [];
	let option = "";
	let optionCountSum = 0;

	// listing quantity of all options
	$('.tableBody').each(function () {
		if($(this).find('.productCheckBox input').is(':checked')){
			let detailCode = $(this).find('.productInfoBox .detailOption').text();
			let optionCount = parseInt($(this).find(".productCount span").text());
			option = {optionCode: detailCode , productCount:optionCount};

			optionList.push(option);
			optionCountSum += optionCount;
		}
	});
	let jsonList = JSON.stringify(optionList);

	console.log(jsonList);
	// put data into addCartForm
	const jsonInput = $("<input>")
		.attr("name", "jsonList")
		.val(jsonList)
		.attr("hidden",true);
	$(".buyNowForm").attr("action", "/purchase/payment").append(jsonInput);



	if (optionCountSum == 0) {
		alert("선택된 옵션이 없습니다.");
	} else {
		// send productCode & quantity list
		$(".buyNowForm").submit();
	}
});



// ---------------------------------------------------
//           allCheck  button
// ---------------------------------------------------
$('.cartListCheckBox').on('click', function() {

	if ($(this).children("input").is(":checked")) {
		$('.tableBody td.tdCheck01 input').prop("checked", true);
		$('.deleteSectionBtn').css("display", "block");
		$('.cartBntWrap .submitBtn').prop("disabled", false);
	} else {
		$('.tableBody td.tdCheck01 input').prop("checked", false);
		$('.deleteSectionBtn').css("display", "none");
		$('.cartBntWrap .submitBtn').prop("disabled", true);
	}

	 tableFooterCalculate();
	 orderCalculate();

});

// ---------------------------------------------------
//           product List CheckBox Color change
// ---------------------------------------------------
$(document).on("click", ".productCheckBox", function () {


	if ($(this).children("input").prop("checked")) {
		$(this).children("input").prop("checked", false);
	} else {
		$(this).children("input").prop("checked", true);
	}

});

// ------------------------------------------------------
//    product List CheckBox Color change after Calculate
// ------------------------------------------------------
$(document).on("change", "#checkedAll2", function (e) {
 
	 tableFooterCalculate();
	 allCheckYN();
	 orderCalculate();
	
});


// ------------------------------------------------------
//    			product count down button
// ------------------------------------------------------
$(document).on("click", ".countDownBtn", function () {
 
	const $thisTrData =  $(this).parents('tr > td');
	
	let $amountCount = $(this).siblings('span');
	
	if ($amountCount.text() < 2) return;
    
	let $productAmount = $thisTrData.siblings('td.productSumWrap').find('span.amount');
	let $productPrice = $thisTrData.siblings('td.td01').find('span.amount');
	
	let num_productAmount =  parseInt($productAmount.text().replace(",", "")); 
	let num_productPrice = parseInt($productPrice.text().replace(",", ""));
	
	let sub_count = parseInt($amountCount.text()) - 1;
	let sub_product =  num_productAmount - num_productPrice ;
	
	$amountCount.text(sub_count);
	$productAmount.text(sub_product.toLocaleString());
	
	tableFooterCalculate();
	orderCalculate();
	
	
});

// ------------------------------------------------------
//    			product count up button
// ------------------------------------------------------
$(document).on("click", ".countUpBtn", function () {

	const $thisTrData =  $(this).parents('tr > td');
	
	let $amountCount = $(this).siblings('span');
	let $productAmount = $thisTrData.siblings('td.productSumWrap').find('span.amount');
	let $productPrice = $thisTrData.siblings('td.td01').find('span.amount');
	
	let num_productAmount =  parseInt($productAmount.text().replace(",", "")); 
	let num_productPrice = parseInt($productPrice.text().replace(",", ""));
	
	
	let add_count = parseInt($amountCount.text()) + 1;
	let add_product =  num_productAmount + num_productPrice ;
	
	
	$amountCount.text(add_count);
	$productAmount.text(add_product.toLocaleString('en'));
	
	tableFooterCalculate();
	orderCalculate();
		
});


// ------------------------------------------------------
//    			product select Delete button
// ------------------------------------------------------
$(document).on("click", ".deleteSectionBtn", function () {

	deleteCheck = { "check" : "MULTI"};

 	$("section.modalBackGround").css("display", "flex");
		
});

// ------------------------------------------------------
//    			product one Select Delete button
// ------------------------------------------------------
$(document).on("click", ".deleteBtn", function () {

	deleteCheck = { "check" :"ONE", "thisData" : $(this) };
	
	$("section.modalBackGround").css("display", "flex");
	
});


// ------------------------------------------------------
//    			delete Modal cancle button
// ------------------------------------------------------
$('.cancleModalBtn, .modalCloseBtn').on('click', function() {

	$("section.modalBackGround").css("display", "none");	

});

// ------------------------------------------------------
//    			delete Modal confirm button
// ------------------------------------------------------
$('.confirmModalBtn').on('click', function() {
	modalDelete(deleteCheck);
	$("section.modalBackGround").css("display", "none");

});

$('.modalCloseBtn').on('click', function() {
	modalDelete(deleteCheck);
	$("section.modalBackGround").css("display", "none");

});

$('.cartEmptysubmitBnt').on('click', function() {
	location.href="/";

});


function cartSearch() {

  $.ajax({
        type: "post",
        url: "/purchase/getCart",
        data : {
        	'id' : memberId
        },
        traditional: true,
        success: function (data) {
            let headName = [];
            let qtySum = 0;
            let totalPrice = 0;
            let point = 0;
            
            $.each(data, function (index, items) {
                let thead = "";
                let tbody = "";
                let tfoot = "";
                let productSum = 0;


                let brandName = items.brandName;
                

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
                                        "<div class='detailOption'style='display:none'>" + items.detailCode + "</div>" + 
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
                                "<td class='productSumWrap'>" +
									"<div class='productSumPrice'>" +
										"<span class='amount'>" +
											sum.toLocaleString() +
										"</span>" +
										"<span class='unit'>원</span>" +
									"</div>" +
								"</td>" +
								"<td class='prodcutDelete'>" +
									"<div class= 'productDeleteBtn'>" +
										"<img class='deleteBtn' src='../images/purchase/modal_close_btn.png' />" +
									"</div>" +
                                "</td>" +
                                "<div class='prodcutDelete'>" +
                                "</div>" +
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
            });
            
            point = parseInt(totalPrice)/10;
            
            $('.orderPrePrice div.text').text(totalPrice.toLocaleString());
            $('.orderQty div.text').text(qtySum);
            $('.prePoint div.text').text(point.toLocaleString());
            $('.deliveryFee div.text').text(0);
            
        },
        err: function (err) {
        console.log(err)
        }

    });


}

// ------------------------------------------------------
//    			Modal confirm Calculate
// ------------------------------------------------------
function modalDelete(deleteCheck) {
	let thisTableRow = 0;	
	let $inputCount = 0;
	let cartTableRow = 0;
	let deleteDetailCode;
	
	if (deleteCheck.check === "MULTI") {
	
		$.each($('.cartList').find('.cartTable'), function (index, items) {
	  		$inputCount = $(items).find('tr.tableBody input');
	  		
	  		if ($inputCount.length > 1) {
	  			
	  			$.each($inputCount, function (index, items) {
	  			 	
	  			 	if ($(items).prop("checked") ) {
						deleteDetailCode = $(items).parents('tr.tableBody').find('div.detailOption').text();
						cartDeleteTable(deleteDetailCode);
						$(items).parents('tr.tableBody').remove();
	        		}
	        
	  			});
	  			
	  		} else {

	  		
				if ($(items).find('tr.tableBody input').prop("checked") ) {
					deleteDetailCode = $(items).find('div.detailOption').text();
					cartDeleteTable(deleteDetailCode);
					$(items).find('tbody tr.tableBody').remove();
	        	}  		
	  		}
	  		   
	        
	    });
	
	} else {


		deleteDetailCode = deleteCheck.thisData.parents('tr.tableBody').find('div.detailOption').text();
		cartDeleteTable(deleteDetailCode);
		deleteCheck.thisData.parents('tr.tableBody').remove();
	
	} 

	 deleteInfo();
	 deleteTable();
	 tableFooterCalculate();
	 allCheckYN();
	 orderCalculate();
}


// ------------------------------------------------------
//    	delete button click >  deteteTable function
// ------------------------------------------------------
function deleteTable() {

	$.each($('.cartList').find('.cartTable'), function (index, items) {
       	cartTableRow = $(items).find('tbody tr.tableBody').length; 
  		
        if (cartTableRow < 1) {
			$(items).remove();      
        }
        
    });

}

// ------------------------------------------------------
//    	checkbox click >  allcheckbox YN
// ------------------------------------------------------
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


// ------------------------------------------------------
//    		table footer calculate
// ------------------------------------------------------
function tableFooterCalculate() {
	let productSumPrice = 0;
	let productPriceTotal = 0;
	let orderQtySum = 0;
	let pointSum = 0;
	
	
	if($('.cartList').find('.cartTable').length > 0) {
	 
		$.each($('.cartList').find('.cartTable'), function (index, items) {
	  		$tableRow = $(items).find('tr.tableBody');
	  		
	  		
	  		if ($tableRow.length > 1) {
	  			
	  			$.each($tableRow, function (index, items) {
	  			
	  				if($(items).find('input').prop("checked")) {
						productSumPrice = parseInt($(items).find('.productSumPrice span.amount').text().replace(",", ""));
						productPriceTotal += productSumPrice;
					}     
	  			});
	  			
	  		} else {
	  		
	  			if($tableRow.find('input').prop("checked")) {
	  				productPriceTotal = parseInt($tableRow.find('.productSumPrice span.amount').text().replace(",", ""));
	  			}
	  		}
	  		
	  		
	  		$(items).find('tfoot .amount').first().text(productPriceTotal.toLocaleString());
	  		$(items).find('tfoot .totalPriceAmount').text(productPriceTotal.toLocaleString());
	  		
	  		productPriceTotal = 0;
	        
	        
	    });
    
    
    }
}


// ------------------------------------------------------
//    			order box Calculate
// ------------------------------------------------------
function orderCalculate() {
	let orderPrePriceSum = 0;
	let orderQtySum = 0;
	let pointSum = 0;
	
	$.each($('.cartList').find('.cartTable tr.tableBody'), function (index, items) {
        
           if ($(items).find('input').prop("checked") ) {
				orderPrePriceSum +=  parseInt($(items).find('.productSumPrice .amount').text().replace(",", ""));
				orderQtySum += parseInt($(items).find('.productCount span').text());     		
           }
           
    });
    
    
   pointSum = parseInt(orderPrePriceSum)*0.01;
            
   $('.orderPrePrice div.text').text(orderPrePriceSum.toLocaleString());
   $('.orderQty div.text').text(orderQtySum);
   $('.prePoint div.text').text(pointSum.toLocaleString());
   $('.deliveryFee div.text').text(0);

}

// ------------------------------------------------------
//    		product table all delete active
// ------------------------------------------------------
function deleteInfo() {

   if ($('.cartList tr.tableBody').length === 0 ) {
   		location.href="/purchase/cartForm?display=cartDeleteInfo";
   }
}

function cartDeleteTable(deleteCode) {

	$.ajax({
        type: "post",
        url: "/purchase/cartDelete",
        data: {
            deleteCode : deleteCode,
			memberId : memberId

        },
        success: function (data) {
            console.log(data);
        },
        err: function (err) {
            console.log(err);
        },
    });
}

