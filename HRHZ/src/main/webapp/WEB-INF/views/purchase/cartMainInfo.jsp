<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <div class="text"></div>
      </div>
  </div>
</div>
<form
    class="buyNowForm"
    method="post"
    style="display:none;"
></form>
<div class="cartBntWrap">
  <button class="cancelBtn" color="white">쇼핑 계속하기</button>
  <button class="submitBtn" color="black">구매하기</button>
</div>