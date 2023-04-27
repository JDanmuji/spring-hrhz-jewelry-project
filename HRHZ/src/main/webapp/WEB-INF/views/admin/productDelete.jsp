<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <section class="adminContentSection">
        <div class="formContainer">
            <div class="title">
                <div class="productFormTitle">상품 삭제 </div>
                <span class="titleUnderline"></span>
                <div class="brandInfoTitle">상품 브랜드</div>
                <button class="brandSearch">브랜드 조회</button>
                <span class="subTitleUnderline"></span>
                <div class="brandInfo">
                <img src="../../images/member/black.jpg" alt="images">
                <span class="brandName">앙스모멍</span>
                </div>
                <span class="brandUnderline"></span>
            </div>

            <form action="">
            <div class="producttitle">
                <span class="titleUnderline"></span>
                <div class="brandInfoTitle">상품 정보</div>
                <button class="productSearch">상품 조회</button>
                <span class="subTitleUnderline"></span>
            </div>
            
                <div class="inputContainer">
                    <label for="productName">상품 이름</label>
                    <input type="text" class="productName" required>
                    <span class="underline productNameUnderline"></span>
                </div>

                <div class="categoryAndType">
                <div class="inputContainer">
                    <label for="productCategory">상품 카테고리</label>
                    <div class="dropdownCoverSelector">
                        <div class="dropdownSelect">
                            <p class="optionName">옵션 선택</p>
                            <img src="../../images/purchase/arrow_bottom_outline_black_btn.png" alt="image">
                        </div>
                        <div class="dropdownBox" style="display:none;">
                            <p class="dropdownOpenLabel">옵션 선택</p>
                            <p class="dropdownOption">귀걸이</p>
                            <p class="dropdownOption">목걸이</p>
                            <p class="dropdownOption">반지</p>
                            <p class="dropdownOption">팔찌</p>
                            <p class="dropdownOption">헤어</p>
                        </div>
                    </div>
                </div>
                <div class="inputContainer">
                    <label for="productType">상품 종류</label>
                    <div class="dropdownCoverSelector1">
                        <div class="dropdownSelect1">
                            <p class="optionName1">옵션 선택</p>
                            <img src="../../images/purchase/arrow_bottom_outline_black_btn.png" alt="image">
                        </div>
                        <div class="dropdownBox1" style="display:none;">
                            <p class="dropdownOpenLabel1">옵션 선택</p>
                            <p class="dropdownOption1">원석</p>
                            <p class="dropdownOption1">비즈</p>
                            <p class="dropdownOption1">각인</p>
                            <p class="dropdownOption1">실</p>
                            <p class="dropdownOption1">커플링</p>
                        </div>
                    </div>
                </div>
            </div>

                <div class="inputContainer">
                    <label for="productDetailsClassification">상품 상세분류</label>
                    <div class="dropdownCoverSelector2">
                        <div class="dropdownSelect2">
                            <p class="optionName2">옵션 선택</p>
                            <img src="../../images/purchase/arrow_bottom_outline_black_btn.png" alt="image">
                        </div>
                        <div class="dropdownBox2" style="display:none;">
                            <p class="dropdownOpenLabel2">옵션 선택</p>
                            <p class="dropdownOption2">색상/호수</p>
                        </div>
                    </div>
                </div>

                <div class="stockAndPrice">
                <div class="inputContainer">
                    <label for="productStock">상품 재고</label>
                    <input type="text" class="productStock" required>
                    <span class="underline productStockLine"></span>
                </div>

                <div class="inputContainer">
                    <label for="productPrice">상품 가격</label>
                    <input type="text" class="productPrice" required>
                    <span class="underline productPriceLine"></span>
                </div>
                </div>

                <div class="inputContainer">
                    <label for="productdetail">상품 설명</label>
                    <input type="text" class="productdetail1" required>
                    <span class="underline productDetailLine1"></span>
                </div>

                <button type="submit" class="productDelete">상품 정보 삭제</button>
                <section class="sectionBackGround">
                    <div class="modalBody">
                        <img class="modalCloseBtn" src="../../images/main/modal_close_btn.png" alt="closing icon" />
                        <div class="confirmText">
                            <div class="msg">정말로 삭제하시겠습니까?</div>
                        </div>
                        <div class="modalFooter">
                            <button class="yesModalBtn" color="white">예</button>
                            <button class="noModalBtn" color="black">아니요</button>
                        </div>
                    </div>
                </section>
            </form>
        </div>
    </section>

    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    // ---------------------------------------------------
    //                      option0
    // ---------------------------------------------------
    // option dropdown box
    $(".dropdownCoverSelector").on(
        "click",
        ".dropdownSelect",
        function (event) {
            $(".dropdownBox").css("display", "flex");
        }
    );
    $(".dropdownCoverSelector").on("click", ".dropdownBox p", function (event) {
        $(".dropdownBox").css("display", "none");
    });
    
    //display selected option box
    $(".dropdownCoverSelector").on("click", ".dropdownOption", function (event) {
    // get selected option name
    var select_name = $(this).text();

    // display selected option name
    $(this).parents(".dropdownCoverSelector").find(".optionName").text(select_name);

    // hide dropdown box
    $(this).parents(".dropdownBox").css("display", "none");

    // hide "옵션 선택" option name
    $(this).parents(".dropdownCoverSelector").find(".dropdownOpenLabel").hide();
});
    // ---------------------------------------------------
    //                      option1
    // ---------------------------------------------------
    // option dropdown box
    $(".dropdownCoverSelector1").on(
        "click",
        ".dropdownSelect1",
        function (event) {
            $(".dropdownBox1").css("display", "flex");
        }
    );
    $(".dropdownCoverSelector1").on("click", ".dropdownBox1 p", function (event) {
        $(".dropdownBox1").css("display", "none");
    });
    
    //display selected option box
    $(".dropdownCoverSelector1").on("click", ".dropdownOption1", function (event) {
    // get selected option name
    var select_name = $(this).text();

    // display selected option name
    $(this).parents(".dropdownCoverSelector1").find(".optionName1").text(select_name);

    // hide dropdown box
    $(this).parents(".dropdownBox1").css("display", "none");

    // hide "옵션 선택" option name
    $(this).parents(".dropdownCoverSelector1").find(".dropdownOpenLabel1").hide();
});

    // ---------------------------------------------------
    //                      option2
    // ---------------------------------------------------
    // option dropdown box
    $(".dropdownCoverSelector2").on(
        "click",
        ".dropdownSelect2",
        function (event) {
            $(".dropdownBox2").css("display", "flex");
        }
    );
    $(".dropdownCoverSelector2").on("click", ".dropdownBox2 p", function (event) {
        $(".dropdownBox2").css("display", "none");
    });
    
    //display selected option box
    $(".dropdownCoverSelector2").on("click", ".dropdownOption2", function (event) {
    // get selected option name
    var select_name = $(this).text();

    // display selected option name
    $(this).parents(".dropdownCoverSelector2").find(".optionName2").text(select_name);

    // hide dropdown box
    $(this).parents(".dropdownBox2").css("display", "none");

    // hide "옵션 선택" option name
    $(this).parents(".dropdownCoverSelector2").find(".dropdownOpenLabel2").hide();
});
    </script>
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
