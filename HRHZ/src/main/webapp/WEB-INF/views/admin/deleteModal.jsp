<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/common/reset.css">
    <link rel="stylesheet" href="deleteModal.css">
    <title>Document</title>
</head>
<body>
    <section class="sectionBackGround">
        <div class="modalBody">
            <img class="modalCloseBtn" src="./images/main/modal_close_btn.png" alt="closing icon" />
            <div class="confirmText">
                <div class="msg">정말로 삭제하시겠습니까?</div>
            </div>
            <div class="modalFooter">
                <button class="yesModalBtn" color="white">예</button>
                <button class="noModalBtn" color="black">아니요</button>
            </div>
        </div>
    </section>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
         $(".productDelete").click(function() {
        $(".sectionBackGround").css("display", "block");
         });
        
         $(".modalCloseBtn").click(function(){
            $(".sectionBackGround").css("display", "none");
         });

         $(".noModalBtn").click(function(){
            $(".sectionBackGround").css("display", "none");
         });
        }); 
    </script>
</body>
