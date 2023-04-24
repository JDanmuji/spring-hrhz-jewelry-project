$(".reviewBtn").click(function (){
    var index = $(this).parent().index()+1;
    $(this).parent().removeClass('reviewTopListTitle1').addClass('reviewTopListTitle0');
    $(this).parent().siblings().removeClass('reviewTopListTitle0').addClass('reviewTopListTitle1');
    $('.reviewContent > article:nth-child('+index+')').css('display','block');
    $('.reviewContent > article:nth-child('+index+')').siblings().css('display','none');

})

