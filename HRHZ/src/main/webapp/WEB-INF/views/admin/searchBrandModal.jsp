<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/common/reset.css">
    <link rel="stylesheet" href="searchBrandModal.css">
</head>

<body>
    <section class="sectionBackGround">
        <div class="modalBody">
            <div class="brandFilter">
                <div class="brandFilterSearchDiv">
                    <img class="searchIcon" src="./images/common/search_btn.png" alt="search icon" />
                    <input type="text" placeholder="브랜드명을 입력해 주세요" id="brandInput" />
                    <img class="modalCloseBtn" src="./images/main/modal_close_btn.png" alt="closing icon" />
                </div>
                <ul class="brandSearch">
                    <li class="brandContainer">
                        <div class="checkboxs">
                            <input class="checkbox" type="checkbox">
                            <img class="uncheck" src="./images/uncheck_round_icon.png" alt="image">
                            <img class="check" src="./images/check_round_purple_icon.png" alt="image">
                        </div>
                        <img class="brandImg" src="../../images/member/black.jpg" alt="images">
                        <span>브랜드명</span>
                    </li>
                    <li class="brandContainer">
                        <div class="checkboxs">
                            <input class="checkbox" type="checkbox">
                            <img class="uncheck" src="./images/uncheck_round_icon.png" alt="image">
                            <img class="check" src="./images/check_round_purple_icon.png" alt="image">
                        </div>
                        <img class="brandImg" src="../../images/member/black.jpg" alt="images">
                        <span>브랜드명</span>
                    </li>
                </ul>
                <button class="brandSelect">브랜드 선택</button>
            </div>
        </div>
    </section>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $('.checkbox').on('click', function () {
            var $container = $(this).closest('.checkboxs');
            var $checkbox = $container.find('.checkbox');
            var $uncheck = $container.find('.uncheck');
            var $check = $container.find('.check');

            if ($checkbox.prop('checked')) {
                $uncheck.hide();
                $check.show();
            } else {
                $uncheck.show();
                $check.hide();
            }
        });

        $(document).ready(function () {
            $("#brandInput").focus(function () {
                $(this).attr("placeholder", "");
            }).blur(function () {
                $(this).attr("placeholder", "브랜드명을 입력해주세요");
            });
        });
    </script>
    <script>
        $(document).ready(function() {
  $('#brandInput').click(function() {
    $('.brandFilterSearchDiv').css('border-bottom', '1px solid #000000');
  }).blur(function() {
    $('.brandFilterSearchDiv').css('border-bottom', '1px solid #ededed');
  });
});
</script>
<script>
$(".modalCloseBtn").click(function(){
            $(".sectionBackGround").css("display", "none");
         });

         $(".noModalBtn").click(function(){
            $(".sectionBackGround").css("display", "none");
         }); 
</script>
</body>

</html>