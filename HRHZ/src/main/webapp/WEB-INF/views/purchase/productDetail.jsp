<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>productDetail</title>
        <link rel="stylesheet" href="../../css/common/reset.css" />
        <link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link rel="stylesheet" href="../../css/purchase/product_details.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
            rel="stylesheet"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap"
            rel="stylesheet"
        />
    </head>

    <body>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="sessionData">
            <div class="productCode">${param.productCode}</div>
            <div class="memberId">${sessionId}</div>
        </div>

        <div class="background">
            <div class="outerWrapper">
                <div class="bothSizeSectionWrap">
                    <div class="productImagesSection">
                        <div class="productThumbnail">
                            <div class="swiperSlide">
                                <div class="mainThumbnailList">
                                    <!-- ajax -->
                                </div>

                                <div class="swiperButtonPrev">
                                    <img
                                        src="../../images/purchase/left_btn.png"
                                        alt="image"
                                    />
                                </div>
                                <div class="swiperButtonNext">
                                    <img
                                        src="../../images/purchase/right_btn.png"
                                        alt="image"
                                    />
                                </div>
                            </div>

                            <div class="productThumbnailImageList">
                                <!-- ajax -->
                            </div>
                        </div>
                        <!--productThumbnail-->

                        <div class="deliveryInfo">
                            <div class="deliveryTypeInfo">
                                <div class="deliveryType">
                                    <span>배송안내 :</span>
                                    <button
                                        class="deliveryTextBtn"
                                        type="button"
                                    >
                                        <span></span>
                                    </button>
                                    <img
                                        class="deliveryTypeInfoBtn"
                                        alt="image"
                                        src="../../images/purchase/noti_info.png"
                                    />
                                    <button
                                        class="inquiryStoreBtn"
                                        type="button"
                                    >
                                        브랜드에 문의하기
                                    </button>
                                </div>
                                <!--deliveryType-->
                                <div class="deliveryTypeDescription">
                                    <div class="deliveryTypeDescriptionLabel">
                                        오늘출발 옵션 :
                                    </div>
                                    <div>
                                        <b
                                            >오늘 3시까지 주문 시, 오늘 바로
                                            배송 시작!</b
                                        >
                                        <br />(주말/공휴일 주문건은 가장 빠른
                                        영업일에 출발)
                                    </div>
                                </div>
                                <div class="deliveryTypeDescription">
                                    <div class="deliveryTypeDescriptionLabel">
                                        그 외 옵션 :
                                    </div>
                                    <div>
                                        <b>평균 9일 내 배송</b> /주말, 공휴일
                                        제외
                                        <br />
                                        (상품 제작에 7일, 배송에 2일이
                                        소요됩니다.)
                                    </div>
                                </div>
                            </div>
                            <!--deliveryTypeInfo-->
                            <div class="storeNoticeSection">
                                <div class="storeNoticeTitle">
                                    브랜드에서 알려드려요
                                </div>
                                <div class="storeNoticeContents">
                                    <p></p>
                                </div>
                                <div class="storeNoticeOpenBtn">더 보기</div>
                                <div class="storeNoticeCloseBtn">접기</div>
                            </div>
                        </div>
                        <!--deliveryInfo-->
                        <div class="customerServiceBtn">
                            <div class="refundInfoBtn">
                                <img
                                    src="../../images/purchase/arrow_right_btn.png"
                                    alt="image"
                                />
                                <span>교환 및 반품 정보</span>
                            </div>
                            <div class="asInfoBtn">
                                <img
                                    src="../../images/purchase/arrow_right_btn.png"
                                    alt="image"
                                />
                                <span>A/S 정보</span>
                            </div>

                            <span class="underline"></span>
                        </div>

                        <!--customerServiceInfo-->
                        <div class="productDetailImages">
                            <img
                                src="../../images/purchase/PSI_524322.jpeg"
                                alt="image"
                            />
                        </div>
                        <!--productDetailImages-->
                    </div>
                    <!--productImagesSection-->
                    <div class="productInfoSection">
                        <div class="productInfo">
                            <div class="badge">
                                <a href="#">
                                    <div class="storeInfo">
                                        <img
                                            src=""
                                            alt="brand thumbnail"
                                            class="storeImage"
                                        />
                                        <span class="storeName">브랜드명</span>
                                    </div>
                                </a>
                                <div class="underline2"></div>
                                <div class="iconswrap">
                                    <div class="deliveryBadge">
                                        <span>오늘출발</span>
                                        <span>무료배송</span>
                                    </div>
                                    <img
                                        class="urlCopy"
                                        src="../../images/purchase/product_share_btn.png"
                                    />
                                    <div class="productLike">
                                        <img
                                            class="productLikeHeart"
                                            src="../../images/purchase/heart.jpg"
                                        />
                                        <img
                                            class="productLikeHeartViolet"
                                            src="../../images/purchase/heart_violet.jpg"
                                        />
                                        <span class="productLikeCnt"
                                            >좋아요 수</span
                                        >
                                    </div>
                                </div>
                            </div>
                            <p class="productName">상품명</p>
                            <div class="productReviewRate">
                                <div class="productReviewMore">
                                    <img
                                        src="../../images/purchase/product_review_star_on.png"
                                        alt="image"
                                        class="star"
                                    />
                                    <img
                                        src="../../images/purchase/product_review_star_on.png"
                                        alt="image"
                                        class="star"
                                    />
                                    <img
                                        src="../../images/purchase/product_review_star_on.png"
                                        alt="image"
                                        class="star"
                                    />
                                    <img
                                        src="../../images/purchase/product_review_star_on.png"
                                        alt="image"
                                        class="star"
                                    />
                                    <img
                                        src="../../images/purchase/product_review_star_on.png"
                                        alt="image"
                                        class="star"
                                    />
                                </div>
                                <div class="productReviewMoreText">
                                    <a href="#productReviewSection"
                                        ><span>0</span>개의 후기 보러가기</a
                                    >
                                    <img
                                        src="../../images/purchase/arrow_right_btn.png"
                                        alt="image"
                                        class="productReviewMoreBtn"
                                    />
                                </div>
                            </div>
                            <div class="productPrice">
                                <span
                                    class="productPriceDiscountPercentUnitAmount"
                                    >50%</span
                                >
                                <div class="productPriceSales">
                                    <span class="amount">price</span>
                                    <span class="unit">원</span>
                                </div>
                                <span class="productPriceOriginAmount">0</span>
                            </div>
                            <div class="availableBenefit">
                                <div class="greatestBenefitList"></div>
                            </div>
                            <div class="productOptionAndPrice">
                                <div class="dropdownCoverSelector">
                                    <div class="dropdownSelect">
                                        <p class="dropdownSelectLabel">
                                            옵션 선택
                                        </p>
                                        <img
                                            src="../../images/purchase/arrow_bottom_outline_black_btn.png"
                                            alt="image"
                                        />
                                    </div>
                                    <div class="dropdownBox">
                                        <p class="dropdownOpenLabel">
                                            옵션 선택
                                        </p>
                                    </div>
                                </div>
                                <ul class="selectedProductOptionList">
                                    <!--
                                    <li class="selectedOptionItem">
                                        <div class="optionBoxTop">
                                            <div class="optionName">A</div>
                                            <img
                                                class="deleteOptionBtn"
                                                src="./product_details_images/delete_btn.png"
                                                alt="X icon"
                                            />
                                        </div>
                                        <div class="productOptionQuantity">
                                            <div class="countWrap">
                                                <img
                                                    class="countDecrease"
                                                    src="./product_details_images/product_quantity_minus_round_btn.png"
                                                    alt="minus icon"
                                                />
                                                <div class="count">0</div>
                                                <img
                                                    class="countIncrease"
                                                    src="./product_details_images/product_quantity_plus_round_btn.png"
                                                    alt="plus icon"
                                                />
                                            </div>
                                            <span class="amountWrap">
                                                <span class="amount"
                                                    >49,640</span
                                                >
                                                <span class="unit">원</span>
                                            </span>
                                        </div>
                                    </li>
                                    -->
                                </ul>
                                <div class="productTotalPrice">
                                    <span class="label">총 상품 금액</span>
                                    <div class="amountWrap">
                                        <span class="amount">0</span>
                                        <span class="unit">원</span>
                                    </div>
                                </div>
                                <div class="productBuyBtnList">
                                    <button class="addCartBtn">장바구니</button>
                                    <button class="purchase">구매하기</button>
                                </div>
                                <form
                                    class="buyNowForm"
                                    method="post"
                                    action="/purchase/payment"
                                ></form>
                            </div>
                        </div>
                        <!--productInfo-->
                    </div>
                    <!--productInfoSection-->
                </div>
                <!--bothSizeSectionWrap-->

                <div class="bottomSection">
                    <div class="productDetailInfoSection">
                        <div class="infoSectionTitle">
                            <span class="productDetailSectionHead">
                                상품 상세 정보
                            </span>
                        </div>
                        <div class="productDetailSectionContents">
                            <div class="productDetailInfoItem">
                                <div class="productDetailInfoItemLabel">
                                    카테고리
                                </div>
                                <div class="productDetailInfoItemContents">
                                    목걸이, 이니셜목걸이, 하트목걸이,
                                    서브펜던트, 아몬즈 단독, 오늘 출발, 베스트
                                </div>
                            </div>
                            <div class="productDetailInfoItem">
                                <div class="productDetailInfoItemLabel">
                                    소재/베이스
                                </div>
                                <div class="productDetailInfoItemContents">
                                    실버925
                                </div>
                            </div>
                        </div>
                    </div>

                    <section
                        id="productReviewSection"
                        class="productReviewSection"
                    >
                        <div class="reviewSectionTitle">
                            <div class="productDetailSectionHead">
                                <span class="productDetailSectionTitle"
                                    >상품 구매후기</span
                                >
                                <span class="productReviewTotalCnt">(0)</span>
                            </div>
                            <div class="reviewBtnArea">
                                <div class="reviewBtnDescribe">
                                    상품 구매 후 후기를 작성하면
                                    <span>최대 1,000 포인트</span>를 드려요
                                </div>
                                <button class="reviewModalBtn">후기작성</button>
                            </div>
                        </div>
                        <div class="productReviewList">
                            <!-- <a href="#">
                                <div class="productReviewItem">
                                    <div class="reviewInfo">
                                        <div class="rate">
                                            <img
                                                src="../../images/purchase/product_review_star_on.png"
                                                alt="image"
                                            />
                                            <img
                                                src="../../images/purchase/product_review_star_on.png"
                                                alt="image"
                                            />
                                            <img
                                                src="../../images/purchase/product_review_star_on.png"
                                                alt="image"
                                            />
                                            <img
                                                src="../../images/purchase/product_review_star_on.png"
                                                alt="image"
                                            />
                                            <img
                                                src="../../images/purchase/product_review_star_on.png"
                                                alt="image"
                                            />
                                        </div>
                                        <div class="accountAndDate">
                                            <span class="account">ye96**</span>
                                            <span class="line">|</span>
                                            <span class="date">2023.04.16</span>
                                        </div>
                                    </div>
                                    <div class="reviewContent">
                                        reviewContent
                                    </div>
                                </div>
                            </a> -->
                        </div>
                    </section>
                    <div class="productQnaSection">
                        <div class="productDetailSectionContents">
                            <div class="productQnaList">
                                <!--여기서부터 listitemwrap 추가하면 됨.-->
                                <ul class="listPagination">
                                    <li class="previous disabled"></li>
                                    <li class="listPageNumber selected"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="break"></li>
                                    <li class="listPageNumber"></li>
                                    <li class="next"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="recommendProductSection">
                        <div class="recommendProductSectionTitle">
                            비슷한 상품
                        </div>
                        <div class="productListSlider">
                            <div class="swiperWrapper">
                                <!--여기서 slide 더 추가하기!-->
                                <article class="productListItem">
                                    <a href="#">
                                        <div class="productListItemImg">
                                            <img
                                                src="../../images/purchase/PSI_70381_50.jpeg"
                                                alt="image"
                                            />
                                            <div class="productName">
                                                Alice Heart Pearl Necklace
                                            </div>
                                            <div class="productPrice">
                                                <span class="price"
                                                    >78,000</span
                                                >
                                                <span class="won">원</span>
                                            </div>
                                        </div>
                                    </a>
                                </article>

                                <article class="productListItem">
                                    <a href="#">
                                        <div class="productListItemImg">
                                            <img
                                                src="../../images/purchase/PSI_86734_50.jpeg"
                                                alt="image"
                                            />
                                            <div class="productName">
                                                [아몬즈 단독] Ball Snake
                                                Necklace
                                            </div>
                                            <div class="productPrice">
                                                <span class="discount"
                                                    >15%</span
                                                >
                                                <span class="price"
                                                    >45,050</span
                                                >
                                                <span class="won">원</span>
                                            </div>
                                        </div>
                                    </a>
                                </article>

                                <article class="productListItem">
                                    <a href="#">
                                        <div class="productListItemImg">
                                            <img
                                                src="../../images/purchase/PSI_143891_50.jpeg"
                                                alt="image"
                                            />
                                            <div class="productName">
                                                luv bracelet
                                            </div>
                                            <div class="productPrice">
                                                <span class="discount"
                                                    >10%</span
                                                >
                                                <span class="price"
                                                    >50,400</span
                                                >
                                                <span class="won">원</span>
                                            </div>
                                        </div>
                                    </a>
                                </article>

                                <article class="productListItem">
                                    <a href="#">
                                        <div class="productListItemImg">
                                            <img
                                                src="../../images/purchase/PSI_169737_50.jpeg"
                                                alt="image"
                                            />
                                            <div class="productName">
                                                Love pendant necklace
                                            </div>
                                            <div class="productPrice">
                                                <span class="price"
                                                    >69,000</span
                                                >
                                                <span class="won">원</span>
                                            </div>
                                        </div>
                                    </a>
                                </article>

                                <article class="productListItem">
                                    <a href="#">
                                        <div class="productListItemImg">
                                            <img
                                                src="../../images/purchase/PSI_221436_50.jpeg"
                                                alt="image"
                                            />
                                            <div class="productName">
                                                [아이유, 성유리 착용] One clip
                                            </div>
                                            <div class="productPrice">
                                                <span class="discount">7%</span>
                                                <span class="price"
                                                    >39,060</span
                                                >
                                                <span class="won">원</span>
                                            </div>
                                        </div>
                                    </a>
                                </article>
                            </div>
                            <div class="swiperPagination">
                                <span class="swiperPaginationBullet"></span>
                                <span class="swiperPaginationBullet"></span>
                                <span class="swiperPaginationBullet"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--outerWrapper-->
        </div>
        <!--background-->

        <section class="modalWindow">
            <div class="modalBackground">
                <!-- info modals -->
                <div class="infoModal refundModal">
                    <div class="stickyTitle">
                        <h2>배송 관련 안내</h2>
                        <img
                            class="modalCloseBtn"
                            src="../../images/purchase/modal_close_btn.png"
                            alt="closing icon"
                        />
                    </div>
                    <div class="infoModalContent">
                        <h3>배송비</h3>
                        <p>아몬즈는 전상품 무료배송입니다</p>

                        <h3>추가 배송비</h3>
                        <p>
                            제주 및 도서산간 지역은 배송비가 별도로 부과됩니다.
                        </p>
                        <p class="paddingBottom">
                            - 제주도 : 3,000원 / 그 외 도서산간 지역 : 3,000원
                        </p>

                        <h2>반품 / 교환 안내</h2>
                        <h3>반품 / 교환 안내</h3>
                        <p>
                            어나더셀의 모든 제품은 주문제작으로 진행되어 주문 후
                            사이즈 변경 및 환불이 어려운 참고 부탁드립니다.
                        </p>
                        <p>
                            하단의 명시된 두 경우를 제외한 교환 및 환불이
                            어려운점 참고 부탁드립니다.
                        </p>
                        <p>
                            - 수령 받은 제품의 수작업 공정상 발생할 수 있는 미세
                            스크레치, 이음새 자국은 불량에 포함되지 않습니다.
                        </p>
                        <p>- 주문건과 다른 오배송</p>

                        <h3>반품 / 교환 불가사유</h3>
                        <p>상품상세 참조</p>

                        <h3>반품 사유에 따른 환불정보</h3>
                        <h3>- 단순 변심이나 구매자의 사유로 인한 반품 시 :</h3>
                        <p>왕복 배송비를 차감하여 환불해드립니다.</p>
                        <p>(도서산간 지역의 경우, 도서산간 추가배송비 부과)</p>

                        <h3>
                            - 제품의 하자나 기타 브랜드의 과실로 인한 반품 시 :
                        </h3>
                        <p>전액 환불해드립니다.</p>

                        <h3>- 반품/교환 시 택배 발송 방법 :</h3>
                        <p>
                            상품을 받으신 택배사/송장번호로 반품 접수 해주세요.
                            다른 택배사로 반품 접수하실 경우, 해당 반송 비용은
                            판매자가 책임지지 않습니다.
                        </p>
                    </div>
                </div>

                <div class="infoModal asModal">
                    <div class="stickyTitle">
                        <h2>A/S 정보</h2>
                        <img
                            class="modalCloseBtn"
                            src="../../images/purchase/modal_close_btn.png"
                            alt="closing icon"
                        />
                    </div>
                    <div class="infoModalContent">
                        <h3>A/S 안내</h3>
                        <p>
                            A/S 문의 게시판을 통해 글을 남겨주시면 A/S 가능 여부
                            확인 후 연락드리겠습니다.
                        </p>
                        <p>
                            -상품 부품 & A/S 종류에 따라 무상/유상 또는 A/S가
                            불가할 수 있습니다.(왕복 택배비 고객님 부담)
                        </p>
                        <p>-은세척, 도금관련 A/S는 추가요금이 발생합니다.</p>

                        <h3>착용시 주의 사항</h3>
                        <p>
                            은 자체가 무른 성질이 있으므로 착용시 주의하시기
                            바랍니다.
                        </p>

                        <h3>품질보증 기준</h3>
                        <p>
                            제품 구입 기간과 상관없이 A/S가 가능하나 상품 부품 &
                            A/S 종류에 따라 무상/유상 또는 A/S가 불가할 수
                            있습니다.
                        </p>
                    </div>
                </div>

                <!-- review modal -->
                <form class="reviewModal">
                    <div>
                        <h2>상품 후기 작성</h2>
                        <img
                            class="modalCloseBtn"
                            src="../../images/purchase/modal_close_btn.png"
                            alt="closing icon"
                        />
                    </div>

                    <div>
                        <p>평점을 입력해 주세요</p>
                        <div class="reviewStars">
                            <img
                                class="reviewStarIcon"
                                src="../../images/purchase/product_review_star_on.png"
                            />
                            <img
                                class="reviewStarIcon"
                                src="../../images/purchase/product_review_star_on.png"
                            />
                            <img
                                class="reviewStarIcon"
                                src="../../images/purchase/product_review_star_on.png"
                            />
                            <img
                                class="reviewStarIcon"
                                src="../../images/purchase/product_review_star_on.png"
                            />
                            <img
                                class="reviewStarIcon"
                                src="../../images/purchase/product_review_star_on.png"
                            />
                        </div>
                    </div>

                    <div class="reviewWriteDiv">
                        <p>상품은 어떠셨나요?</p>
                        <textarea
                            name="content"
                            placeholder="내용을 입력해 주세요. (최소 5자/최대 2000자)"
                        ></textarea>
                    </div>

                    <div class="reviewPhotoDiv">
                        <label for="file">
                            <div class="photoUploadBtn">사진 첨부</div>
                        </label>
                        <input
                            id="file"
                            class="photoUploadInput"
                            name="img[]"
                            type="file"
                            multiple
                            accept="image/*"
                        />
                        <div class="imgPreview"></div>
                        <!-- <span class="maximum3"
                            >최대 3장 업로드 가능합니다.</span
                        > -->
                    </div>

                    <span class="hiddenInputs">
                        <input name="productCode" />
                        <input name="brandCode" />
                        <input name="memberId" />
                        <input class="starCount" name="like" value="5" />
                    </span>

                    <button class="reviewWriteBtn" disabled>등록</button>
                </form>
            </div>
        </section>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
        <script type="text/javascript" src="../../js/header_footer.js"></script>
        <script
            type="text/javascript"
            src="../../js/purchase/product_details.js"
        ></script>
    </body>
</html>
