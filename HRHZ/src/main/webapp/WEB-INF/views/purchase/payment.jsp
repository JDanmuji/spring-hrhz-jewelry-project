<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico">
        <title>HRHZ</title>
		<link rel="stylesheet" href="../../css/common/reset.css" />
		<link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link rel="stylesheet" href="../../css/purchase/payment.css" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
    </head>
    </head>
    <body>
    
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <main>
            <section class="mainSection">
                <div class="paymentMain1">
                    <div class="paymentMain2">
                        <div class="title">
                            <span>결제하기</span>
                        </div>
                        <form>
                            <div class='payProductInfo'>


<%--                                table dynamic allocation --%>


                            </div>

                            <div class="bothSideInfoWrap">
                                <div class="payOrderInfoSection">
                                    <div class="payOrderInfo">
                                        <div class="payOrderHead">
                                            <div class="payOrderTitle">
                                                주문자 정보
                                            </div>
                                            <div class="payOrderEditBtn">
                                                <span>변경하기</span>
                                                <img alt src="../images/purchase/arrow_right_btn.png" />
                                            </div>
                                        </div>
                                        <div class="buyerInfo">
                                            <div class="buyerName">교촌 허니콤보</div>
                                            <div class="buyerCellPhone">010-1234-1234</div>
                                        </div>
                                        <div class="buyerEmail">honey@naver.com</div>
                                    </div>

                                    <div class="payOrderInfo">
                                        <div class="payOrderHead">
                                            <div class="payOrderTitle">
                                                배송지 정보
                                            </div>
                                            <div class="payOrderEditBtn">
                                                <span>변경하기</span>
                                                <img alt src="../images/purchase/arrow_right_btn.png" />
                                            </div>
                                        </div>
                                        <div class="deliveryInfo">
                                            <div class="deliveryMain">
                                                <div class="recipient">마라탕</div>
                                                <div class="cellPhone">010-1234-1234</div>
                                                <div class="address">(11111) 서울 강남구 강남대로94길 20, 삼오빌딩 6층</div>
                                            </div>
                                            <div class="registerAddress">
                                                <div class="registerAddressCheck">
                                                    <input id="registerAddress" type="checkbox" name="baseDeliveryAddressCheck" checked />
                                                    <label for="registerAddress">
                                                        <span>기본배송지로 등록하기</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="messageDropDown">
                                                <div class="dropDownCover">
                                                    <div class="dropDownCoverSelector">
                                                        <div class="dropDownSelect">
                                                            <span class="dropDownSelectLabel">
                                                                택배 기사님 요청사항 선택
                                                            </span>
                                                            <img alt src="../images/purchase/arrow_bottom_outline_black_btn.png" />
                                                        </div>
                                                    </div>
                                                    <div class="dropDownOverBox">
                                                        <div class="dropDownList">
                                                            <div class="dropDownSelectTitle">
                                                                <span class="dropDownSelectLabel">
                                                                    택배 기사님 요청사항 선택
                                                                </span>
                                                            </div>
                                                            <ul class="dropDownListPlain">
                                                                <li class>
                                                                    배송 전에 미리 연락 바랍니다.
                                                                </li>
                                                                <li class>
                                                                    부재 시 경비실에 맡겨주세요.
                                                                </li>
                                                                <li class>
                                                                    부재 시 전화주시거나 문자 남겨주세요.
                                                                </li>
                                                                <li class>
                                                                    직접입력
                                                                </li>
                                                                <li class>
                                                                    요청사항 취소
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="payOrderInfo">
                                        <div class="payOrderHead">
                                            <div class="payOrderTitle">
                                                포인트 적용
                                            </div>
                                        </div>
                                        <div class="applyPointBox">
                                            <div class="applyPointInfo">
                                                <label>Point</label>
                                                <div class="applyPoint">
                                                    <input name="applyPoint" type="number" min="0" max="999999" value="0" readonly value />
                                                    <span class="add-on">P</span>
                                                </div>
                                            </div>
                                            <div class="totalHoldingPoint">
                                                <span class="text">총 보유포인트</span>
                                                <span class="amount">0P</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="payOrderInfo">
                                        <div class="payOrderHead">
                                            <div class="payOrderTitle">
                                                결제 방법 선택
                                            </div>
                                        </div>
                                        <div class="payMethodSelect">
                                            <section class="payMethodGrid">
                                                <div class="buttonBox">
                                                    <label for="payCard">
                                                        <div style="width: 24px;">
                                                            <img src="../images/purchase/pay_method_credit.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>신용/체크카드</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payCard" type="button" value="신용카드" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payTossPay">
                                                        <div style="width: 76px;">
                                                            <img src="../images/purchase/pay_method_toss.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>토스페이</span>
                                                            <span class="benefit">첫 결제 3천원 캐시백</span>
                                                        </div>
                                                    </label>
                                                    <input id="payTossPay" type="button" value="토스페이" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payKakaoPay">
                                                        <div style="width: 45px;">
                                                            <img src="../images/purchase/pay_method_kakao.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>카카오페이</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payKakaoPay" type="button" value="카카오페이" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payNaverPay">
                                                        <div style="width: 45px;">
                                                            <img src="../images/purchase/pay_method_naver.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>네이버페이</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payNaverPay" type="button" value="네이버페이" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payPayco">
                                                        <div style="width: 55px;">
                                                            <img src="../images/purchase/pay_method_payco.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>페이코</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payPayco" type="button" value="페이코" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payVbank">
                                                        <div style="width: 20px;">
                                                            <img src="../images/purchase/pay_method_vbank.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>가상계좌</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payVbank" type="button" value="가상계좌" />
                                                </div>

                                                <div class="buttonBox">
                                                    <label for="payTrans">
                                                        <div style="width: 32px;">
                                                            <img src="../images/purchase/pay_method_trans.png" />
                                                        </div>
                                                        <div class="payMethodDesciption">
                                                            <span>실시간 계좌이체</span>
                                                            <span class="benefit"></span>
                                                        </div>
                                                    </label>
                                                    <input id="payTrans" type="button" value="실시간계좌이체" />
                                                </div>
                                            </section>

                                            <section class="payComment">
                                                <div class="infoText">
                                                    무이자 할부의 경우 카드사마다 조건이 상이합니다.
                                                </div>
                                            </section>
                                        </div>
                                    </div>

                                    <div class="paySummaryInfo">
                                        <div class="paySummaryTitle">
                                            최종결제금액
                                        </div>
                                        <div class="paySummaryContents">
                                            <div class="paySummaryDetail">
                                                <div>
                                                    <span class="label">주문상품 금액</span>
                                                    <span class="amount">9,900</span>
                                                </div>
                                                <div>
                                                    <span class="label">배송비</span>
                                                    <span class="amount">0</span>
                                                </div>
                                                <div>
                                                    <span class="label">제주/도서산간배송비</span>
                                                    <span class="amount">0</span>
                                                </div>
                                                <div>
                                                    <span class="label">쿠폰 사용</span>
                                                    <span class="amount">0</span>
                                                </div>
                                                <div>
                                                    <span class="label">포인트 사용</span>
                                                    <span class="amount">0</span>
                                                </div>
                                            </div>
                                            <div class="paySummaryPrice">
                                                <span class="label">총 결제금액</span>
                                                <span class="amount">9,900</span>
                                            </div>
                                            <div class="paySavingPoint">
                                                <span class="label">적립 예정 포인트</span>
                                                <span class="amount">+99</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="borderLine"></div>
                                <div class="agreeTerm">
                                    <div class="agreeTermCheck">
                                        <input id="agreeTerm" type="checkbox" name="agreeTermCheck" />
                                        <label for="agreeTerm">
                                            <span><span>본인은 만 14세 이상이며, 주문 및 결제 정보를 확인하였고 이에 동의합니다.(필수)</span></span>
                                        </label>
                                    </div>
                                    <div class="agreeTermError"></div>
                                    <div class="subTextWrapper">
                                        <p class="agreeTermSubText">
                                            아몬즈는 통신판매중개자이며 통신판매의 각 당사자가 아닙니다. 따라서, 각 판매자가 등록한 상품 정보 및 거래 등에<br />
                                            대해 책임지지 않습니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="paymentBtn">
                                    <button class="payment" color="black" type="button">결제하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </main>
        
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
			
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript" src="../../js/purchase/payment.js"></script>
    </body>
</html>
    