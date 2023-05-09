
// --------------------------------------------------
//          close modal
// --------------------------------------------------
$(document).on("click", ".modalCloseBtn, .cancelModalBtn",function (){
    $('.modalBackGround').hide().remove();
})

// --------------------------------------------------
//          confirm modal btn modal
// --------------------------------------------------
$(document).on("click", ".confirmModalBtn",function (){
    location.assign("/signIn");
})
