<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="myPageContentSection">
  <section class="myPageSection">
    <div class="pointStatus">
      <h3>포인트</h3>
      <div class="statusBoard">
        <div class="statusBoardItem">
          <span class="point">0</span>
          <p>현재포인트</p>
        </div>
        <div class="statusBoardItem">
          <span class="usedPoint">0</span>
          <p>사용한포인트</p>
        </div>
      </div>
    </div>
    <div class="pointTable">
      <h3 class="tableTitle">포인트 내역</h3>
      <div class="">
        <table class="myPageTable">
          <thead>
            <tr>
              <th>포인트</th>
              <th>내용</th>
              <th>적용일자</th>
            </tr>
          </thead>
          <tbody>
            <td colspan="3" class="empty">
              <div class="text">사용가능 쿠폰이 없습니다.</div>
              <a href="#"> <button class="goShopBtn">쇼핑하러 가기</button></a>
            </td>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</section>
