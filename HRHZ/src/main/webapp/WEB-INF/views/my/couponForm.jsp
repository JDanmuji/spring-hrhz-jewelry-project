<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="mypageContentSection">
  <section class="mypageSection">
    <h3>쿠폰</h3>
    <div class="couponSection">
      <form novalidate>
        <div class="couponAddForm">
          <label for="couponCode">쿠폰 등록</label>
          <div>
            <input type="text" name="couponCode" maxlength="20" placeholder="쿠폰 코드를 입력해 주세요" value="" />
            <span class="addOn">
              <button class="couponBtn submitBtn" color="black" type="submit" disabled>
                등록
              </button>
            </span>
          </div>
        </div>
      </form>
    </div>
    <table class="mypageTable couponTable">
      <caption>
        나의 쿠폰
        <span class="couponCount">0개</span>
      </caption>
      <thead>
        <tr>
          <th>할인</th>
          <th>쿠폰 정보</th>
          <th>적용가능 기간</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <td colspan="4" class="empty">
          <div class="couponContent">
            <div class="text">적용가능한 쿠폰이 없습니다.</div>
            <a href="#"> <button class="goShopBtn">쇼핑하러 가기</button></a>
          </div>
        </td>
      </tbody>
    </table>
  </section>
</section>

