$(function () {
	
	bestContents();
	articleContents();
	
	var imgs = $('.articleList');
	var img_position = 1; //default position
	var img_count = 3;
	
	
	$(".swiperButtonPrev").click(function () {
        --img_position;
        imgChange();
    });
	
	$(".swiperButtonNext").click(function () {
        ++img_position;
        imgChange();
    });
	
	function imgChange() {
    	var img_left = (1 - img_position) * 1004 + "px";

	        imgs.animate({
	            left: img_left,
	        });
	
	        // btns remove & appear
	        $(".swiperButtonNext, .swiperButtonPrev").css("display", "block");
	        
	        if (img_position === 1) {
	            $(".swiperButtonPrev").css("display", "none");
	        }
	        if (img_position === img_count) {
	            $(".swiperButtonNext").css("display", "none");
	        }
	
	}

	
});


//like button
$(document).on("click", ".heartIconWhite", function() {
	var memberId = $('#memberId').val();
	var code = $(this).parents().eq(0).children('input').val();
	var division = "I";
	
	if (!memberId) {
	    $("section.sectionBackGround").css("display", "flex");
	    return;
	}
	
	likeCount(memberId, code, division);
	
    $(this).css("display", "none");
    $(this).parent().find(".heartIconViolet").css("display", "block");
    
});

$(document).on("click", ".heartIconViolet", function() {
	var division = "D";
	var memberId = $('#memberId').val();
	var code = $(this).parents().eq(0).children('input').val();
	
	if (!memberId) {
	    $("section.sectionBackGround").css("display", "flex");
	    return;
	}

	likeCount(memberId, code, division);	
	

    $(this).css("display", "none");
    $(this).parent().find(".heartIconWhite").css("display", "block");
});



$(document).on("click", ".heartIcon", function(event) {
	var heartIconColor = event.target.classList.item(1);
	var code = $(this).parents().eq(0).children('input').val();
	
	if (!$('#memberId').val()) {
	    $("section.sectionBackGround").css("display", "flex");
	    return;
	}
	$(this).css("display", "none");
	$(this).prev().css("display", "block");

});

$('.modalCloseBtn, .cancleModalBtn').click(function (){
     $("section.sectionBackGround").css("display", "none");
});

$('.confirmModalBtn').click(function (){
     location.href="/signIn";
});


// ---------------------------------------------------
// 			Best product selectList
// ---------------------------------------------------
function bestContents() {
	var optionItem;
	
 	$.ajax({
        type: 'post',
        url: '/bestProduct',
        data: 'json',
        success: function (data){
                    
	        $.each(data, function(index, items){
	        
	        	optionItem = $(
	        	"<div class='bestContent'>" + 
        				"<input type='hidden' name='code' value='" + items.productCode + "'/>" +
                        "<a href='/purchase/productDetail'>" + 
                            "<div class='bestImg'>" +
                                "<img src='/storage/" + items.imgPath +"' />" +
                            "</div>"+
                            "<div class='bestDesc'>" +
                                "<span><strong>" + items.brandName +"</strong></span>" +
                                "<span>" + items.productName +"</span>" +

                                "<div class='bestPrice'>" + 
                                    "<span class='percentage'>" +
                                    	"<span>" +
                                    		"<strong>20</strong>" +
                                    	"</span>%</span>"+
                                    "<span class='price'>" +
                                    	"<span><strong>"+ items.price + "</strong>" +
                                    	"</span>원</span>" +
                                    
                                "</div>"+
                            "</div>" + 
                            "<div class='likeNumber'>" +
                                "좋아요" + 
                               "<span>"+ items.likeCount +"</span>" +
                            "</div>" +
                        "</a>" +
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
                    "</div>"			
        		
        		
        		);
	        	
	        	
	        	
	        	$('.bestContents').append(optionItem);
	        	
			});
        
        },
        err: function (err){ 
        	console.log(err); 
        }
    });


}

// ---------------------------------------------------
// 			top 100 product selectList
// ---------------------------------------------------
function articleContents() {
	var optionItem;
	
 	$.ajax({
        type: 'post',
        url: '/top100Product',
        data: 'json',
        success: function (data){
                    
	        $.each(data, function(index, items){
	        
	        	optionItem = $(
	        	
	        	"<div class='articleContent'>" + 
	        		"<input type='hidden' name='code' value='" + items.productCode + "'/>" +
                        "<a href='/purchase/productDetail'>" + 
                            "<div class='articleImg'>" +
                                "<img src='/storage/" + items.imgPath +"' />" +
                            "</div>"+
                            "<div class='articleDesc'>" +
                                "<span><strong>" + items.brandName +"</strong></span>" +
                                "<span>" + items.productName +"</span>" +

                                "<div class='articlePrice'>" + 
                                    "<span class='percentage'>" +
                                    	"<span>" +
                                    		"<strong>20</strong>" +
                                    	"</span>%</span>"+
                                    "<span class='price'>" +
                                    	"<span><strong>"+ items.price + "</strong>" +
                                    	"</span>원</span>" +
                                    
                                "</div>"+
                            "</div>" + 
                            "<div class='likeNumber'>" +
                                "좋아요" + 
                               "<span>"+ items.likeCount +"</span>" +
                            "</div>" +
                        "</a>" +
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
                    "</div>"			
        		
        		
        		);
	        	
	        	$('.top100Article .articleList').append(optionItem);
	        	
			});
        
        },
        err: function (err){ 
        	console.log(err); 
        }
    });

}


// ---------------------------------------------------
// 			likeCount
// ---------------------------------------------------
function likeCount(id, code, division) {
	var optionItem;
	
 	$.ajax({
        type: 'post',
        url: '/likeCount',
        data : {
        	'id' : id,
        	'code' : code,
        	'codeType' : code.charAt(0),
        	'division' : division
        },
        success: function (data){
                    
	        $.each(data, function(index, items){
	        
	        	optionItem = $(
	        	
	        	"<div class='articleContent'>" + 
                        "<a href='/purchase/productDetail'>" + 
                            "<div class='articleImg'>" +
                                "<img src='/storage/" + items.imgPath +"' />" +
                            "</div>"+
                            "<div class='articleDesc'>" +
                                "<span><strong>" + items.brandName +"</strong></span>" +
                                "<span>" + items.productName +"</span>" +

                                "<div class='articlePrice'>" + 
                                    "<span class='percentage'>" +
                                    	"<span>" +
                                    		"<strong>20</strong>" +
                                    	"</span>%</span>"+
                                    "<span class='price'>" +
                                    	"<span><strong>"+ items.price + "</strong>" +
                                    	"</span>원</span>" +
                                    
                                "</div>"+
                            "</div>" + 
                            "<div class='likeNumber'>" +
                                "좋아요" + 
                               "<span>"+ items.likeCount +"</span>" +
                            "</div>" +
                        "</a>" +
                        "<img class='heartIcon heartIconWhite' src='../images/category/heart.jpg'/>" +
                        "<img class='heartIcon heartIconViolet' src='../images/category/heart_violet.jpg'/>" +
                    "</div>"			
        		
        		
        		);
	        	
	        	$('.top100Article .articleList').append(optionItem);
	        	
			});
        
        },
        err: function (err){ 
        	console.log(err); 
        }
    });

}