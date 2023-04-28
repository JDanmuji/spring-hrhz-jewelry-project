<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico">
        <title>cart</title>
		<link rel="stylesheet" href="../../css/common/reset.css" />
		<link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link href="../../css/purchase/cartstyle.css" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
    </head>
    <body>
    
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        
        <main>
            <section class="mainSection">
                <div class="outerWrapper">
                    <div class="cartTotalView">
                        <div class="toparea">
                            <div class="title">장바구니</div>
                            <div class="paymentStepList">
                                <span class="active">장바구니</span>
                                <img alt src="../images/member/step-right-arrow.png" />
                                <span class="inactiveMiddle">결제하기</span>
                                <img alt src="../images/member/step-right-arrow-inactive.png" />
                                <span class="inactive">주문완료</span>
                            </div>
                        </div>
                        <div class="middlearea">
                            <div class="cartListWrap">
                                <div class="cartListCheckBtn">
                                    <div class="cartListCheckBox">
                                        <input id="checkedAll1" type="checkbox" checked />
                                        <label for="checkedAll1">
                                            <span style="font-size: 14px">전체선택</span>
                                        </label>
                                    </div>
                                    <button class="deleteSectionBtn" type="button">선택삭제</button>
                                </div>
                                <div class="cartList">
                                    <article class="cartListTotal">



<%--                                        <table class="cartTable">--%>
<%--                                            <thead>--%>
<%--                                                <tr>--%>
<%--                                                    <th class="storeName" colspan="2">러브오낫</th>--%>
<%--                                                    <th class="qty">수량</th>--%>
<%--                                                    <th class="price">주문금액</th>--%>
<%--                                                </tr>--%>
<%--                                            </thead>--%>
<%--                                            <tobody>--%>
<%--                                                <tr class="tableBody">--%>
<%--                                                    <td class="tdCheck01">--%>
<%--                                                        <div class="productCheckBox">--%>
<%--                                                            <input id="checkedAll2" type="checkbox" checked />--%>
<%--                                                            <label for="checkedAll2"> </label>--%>
<%--                                                            <!-- <img class="uncheckRound" src="../images/cart/uncheck_round_icon.png" />--%>
<%--                                                            <img class="checkRound" src="../images/cart/check_round_purple_icon.png" /> -->--%>
<%--                                                        </div>--%>
<%--                                                    </td>--%>
<%--                                                    <td class="td01">--%>
<%--                                                        <div class="productInfoBox">--%>
<%--                                                            <div class="productInfoImg">--%>
<%--                                                                <a href="">--%>
<%--                                                                    <img class="sampleImg" alt="" src="../images/purchase/loveonot.jpeg" />--%>
<%--                                                                </a>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="productInfoText">--%>
<%--                                                                <a href="">--%>
<%--                                                                    <div class="productName">Deep Orange Fine Color Beads Ring</div>--%>
<%--                                                                </a>--%>
<%--                                                                <div class="productOption">옵션 : 없음</div>--%>
<%--                                                                <div class="productPrice">--%>
<%--                                                                    <span class="amount">9,900</span>--%>
<%--                                                                    <span class="unit">원</span>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </td>--%>
<%--                                                    <td class="productCountWrap">--%>
<%--                                                        <div class="productCount">--%>
<%--                                                            <img class="countDownBnt" src="../images/purchase/product_quantity_minus_btn.png" width="20" />--%>
<%--                                                            <span>1</span>--%>
<%--                                                            <img class="countUpBnt" src="../images/purchase/product_quantity_plus_btn.png" width="20" />--%>
<%--                                                        </div>--%>
<%--                                                    </td>--%>
<%--                                                    <td>--%>
<%--                                                        <div class="productSumPrice">--%>
<%--                                                            <span class="amount">9,900</span>--%>
<%--                                                            <span class="unit">원</span>--%>
<%--                                                        </div>--%>
<%--                                                    </td>--%>
<%--                                                    <td>--%>
<%--                                                        <div>--%>
<%--                                                            <img class="productDeleteBnt" src="../images/purchase/modal_close_btn.png" />--%>
<%--                                                        </div>--%>
<%--                                                    </td>--%>
<%--                                                </tr>--%>
<%--                                            </tobody>--%>
<%--                                            <tfoot>--%>
<%--                                                <tr>--%>
<%--                                                    <td class="productBundleTotalPrice" colspan="5">--%>
<%--                                                        <span class="productPrice">--%>
<%--                                                            <span style="font-size: 14px">상품</span>--%>
<%--                                                            <span class="amount">9,900</span>--%>
<%--                                                            <span>+</span>--%>
<%--                                                            <span style="font-size: 14px">배송비</span>--%>
<%--                                                            <span class="amount">0</span>--%>
<%--                                                            <span>=</span>--%>
<%--                                                            <span class="totalPriceAmount">9,900</span>--%>
<%--                                                        </span>--%>
<%--                                                    </td>--%>
<%--                                                </tr>--%>
<%--                                            </tfoot>--%>
<%--                                        </table>--%>



                                    </article>
                                </div>
                            </div>
                        </div>
                        <div class="orderPreWrap">
                            <div class="totalPricetop">
                                <strong>주문 예정 금액</strong>
                                <span>*아몬즈는 언제나 무료배송</span>
                            </div>
                            <div class="totalPriceMainBox">
                                <div class="orderPrePrice">
                                    <div class="title">주문 예정 금액</div>
                                    <div class="text"></div>
                                </div>
                                <div class="orderQty">
                                    <div class="title">상품 수량</div>
                                    <div class="text"></div>
                                </div>
                                <div class="prePoint">
                                    <div class="title">적립 예정 포인트</div>
                                    <div class="text"></div>
                                </div>
                                <div class="deliveryFee">
                                    <div class="title">배송비</div>
                                    <div class="text">0</div>
                                </div>
                            </div>
                        </div>
                        <div class="cartBntWrap">
                            <button class="cancelBtn" color="white">쇼핑 계속하기</button>
                            <button class="submitBnt" color="black">구매하기</button>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      
	    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script type="text/javascript" src="../../js/header_footer.js"></script>
        <script type="text/javascript" src="../../js/purchase/cart.js"></script>
    </body>
</html>
