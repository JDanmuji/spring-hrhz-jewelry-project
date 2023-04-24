// ---------------------------------------------------
//                category nav
// ---------------------------------------------------
// Show the first category when the page loads
$(".categoryWrap:not(:first)")
    .find(".categoryToggle")
    .slideToggle(".categoryToggle");

$(function () {
    $(".categoryTitle img").on("click", function (event) {
        $(this)
            .parents(".categoryWrap")
            .find(".categoryToggle")
            .slideToggle(".categoryToggle");
    });
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
};
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

// ---------------------------------------------------
//                 Best List
// ---------------------------------------------------
function bestProductList() {
	var optionItem;
	
	$.ajax({
		type: 'post',
		url : '/bestCategoryPorductList',
		data : 'json',
		suceess : function(data){
		
			$.each(data, function(index, items){
			
			optionItem = $(
			
			"<div class='articleContent'>" +
             	"<a href='/purchase/productDetail'>" +
             		"<div class='articleImg'>"+
                        "<img src='storage/" + items.imgPath+"'/>" +
                    "</div>" +
                    "<div class='articleDesc'>" +
                    	"<span><strong>" + items.brandName+"</strong></span>"+
                    	"<span>" + items.porductName + "</span>" +
                    	
                    	"<div class='atriclePrice'>" +
                    		"<span class='percentage'>" +
                    			"<span>" +
                    				"<strong>13</strong>" + items.price + "</strong>" +
                    				"</span>원</span>" +
                    				
                    	"</div>" +
                    "</div>" +
                    "<div class ='likeNumber'>" +
                    	"종아요"+ 
                    	"<span>" + items.likeCount +"</span>" +
                    "</div>" +
                 "</a>" +
                 "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                 "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
               "</div>"			
        		
        	);
        	
        	$('.articleContents').append(optionItem);
                    
          });          				
                    	
	},
	error:function(err){
		console.log(err);
	}
		
	});
}




