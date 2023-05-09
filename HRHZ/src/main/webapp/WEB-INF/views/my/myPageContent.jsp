<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="myPageContentSection">
  <div class="myPageSectionWrap">
    <section class="myPageSection">
      <h3 class="myPageSectionTitle">최근 주문</h3>
      <article class="lastOrder">
        <table class="myPageTable">
          <caption class="lastOrderCaption"></caption>
          <thead class="lastOrderTableHead">
            <tr>
              <th>주문일</th>
              <th>주문내역</th>
              <th>주문번호</th>
              <th>결제금액</th>
            </tr>
          </thead>
          <tbody class="lastOrderTableBody">
            <!-- 동적할당 -->
            <tr class="isEmpty">
              <td colspan="4">
                주문하신 상품 내역이 없습니다.
              </td>
            </tr>
          </tbody>
        </table>
      </article>
    </section>
    <section class="myPageSection">
      <h3 class="myPageSectionTitle">내 활동</h3>
      <div class="myPageCntnt">
        <hr />
        <article class="contentCategory">
          <div class="contentCategorySubTitleWrap">
            <span class="contentCategorySubTitle">좋아요한 상품</span>
          </div>
          <div class="contentCategoryCntntWrap">
            <div class="contentCategoryCntnt">
              좋아요한 상품이 없습니다.
            </div>
          </div>
        </article>
        <article class="contentCategory">
          <div class="contentCategorySubTitleWrap">
            <span class="contentCategorySubTitle">좋아요한 브랜드</span>
          </div>
          <div class="contentCategoryCntntWrap">
            <div class="contentCategoryCntnt">
              좋아요한 브랜드가 없습니다.
            </div>
          </div>
        </article>
      </div>
    </section>
  </div>
</section>
