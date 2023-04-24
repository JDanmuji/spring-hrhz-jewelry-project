<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>URLcopy button</title>
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/URLCopyForm_modal.css" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
    </head>
    <body>
        <div class="orderListSection">
            <button class="copyBtn">url복사</button>
        </div>

        <section class="sectionBackground">
            <div class="modal-body">
                <div class="closingIcon">
                    <img class="modalCloseBnt" src="modal_images/modal_close_btn.png" alt="closing icon" />
                </div>
                <div class="copyText">
                    <span>URL이 복사되었습니다.</span>
                </div>

                <div class="modal-footer">
                    <button class="confirmBnt" color="black">확인</button>
                </div>
            </div>
        </section>

        <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".copyBtn").on("click", function (event) {
                    $("section.sectionBackground").css("display", "flex");

                    $(".modalCloseBnt, .confirmBnt").on("click", function (event) {
                        $("section.sectionBackground").css("display", "none");
                    });
                });
            });
        </script>
    </body>
</html>
