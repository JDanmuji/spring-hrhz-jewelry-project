<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>HRHZ</title>
    <link rel="stylesheet" href="../../css/common/reset.css" />
    <link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/brand/brand_detail.css" />
    <link rel="stylesheet" href="../../css/category/category.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  </head>
  <body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
      <div class="brandDetailMain">
        <section class="brandDetailSection">
          <section class="brandDetailHeader">
            <article class="brandInfoCard">
              <div class="brandLogo">
                <span>
                  <img src="../images/brand/SAI_6521.png" />
                </span>
              </div>
              <div class="brandInfoContentSection">
                <span class="brandName">
                  a14
                </span>
                <div class="brandTagList">
                  <span>트렌드</span>
                  <span>클래식</span>
                </div>
              </div>
            </article>
            <article class="brandInfoLogo">
              <ul class="brandMenuList">
                <li class="brandLikeMenu">
                  <button class="productLikeBtn">
                    <img src="../images/brand/product_like_disable_btn.svg" alt="product like disable btn" />
                    <img src="../images/brand/product_like_btn.svg" alt="product like able btn" />
                  </button>
                  <span>좋아요 2,475</span>
                </li>
                <li class="brandInfoMenu">
                  <img alt src="../images/brand/noti_info_24.png" />
                  <span>브랜드 정보</span>
                </li>
                <li class="brandInstagramMenu">
                  <a target="_blank" href="https://www.instagram.com/a14_jewelry/">
                    <img alt="" src="../images/brand/social_insta_btn_24.png" />
                    <span>인스타그램</span>
                  </a>
                </li>
              </ul>
            </article>
          </section>
          <section class="boardGap"></section>
          <section class="brandDetailProduct">
            <div class="brnadDetailProductList">
              <div class="productListSection">
                <div class="productListSectionHeadWrap">
                  <%@ include file="/WEB-INF/views/common/filter.jsp" %>
                </div>
                <div class="productList">
                  <div class="articleContents">
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                  </div>
                  <div class="articleContents">
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                  </div>
                  <div class="articleContents">
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                    <a href="">
                      <div class="articleImg">
                        <img src="../images/brand/test.jpg" />
                      </div>
                      <div class="articleDesc">
                        <span><strong>브랜드명</strong></span>
                        <span>상품명</span>
                        <div class="articlePrice">
                          <span class="percentage">
                            <span><strong>13</strong></span>%
                          </span>
                          <span class="price">
                            <span><strong>164,330</strong></span>원
                          </span>
                          <img class="deliveryIcon" src="../images/brand/delivery_today.jpg" alt="delivery today icon" />
                        </div>
                        <svg class="heartIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                          />
                        </svg>
                      </div>
                      <div class="likeNumber">좋아요 <span>4,400</span></div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </section>
      </div>
    </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript" src="../js/header_footer.js"></script>
    <script type="text/javascript" src="../js/category_script.js"></script>
    <script>
      $(function () {
        $(".productLikeBtn").on("click", function (event) {
          var $likeBtn = $(this).children("img");

          if ($likeBtn.last().css("display") === "none") {
            $likeBtn.last().css("display", "block");
            $likeBtn.first().css("display", "none");
          } else {
            $likeBtn.last().css("display", "none");
            $likeBtn.first().css("display", "block");
          }
        });
      });
    </script>
  </body>
</html>
