<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>HRHZ</title>
        <link rel="icon" href="/images/favicon48.ico" />
        <link rel="stylesheet" href="../../css/common/reset.css" />
        <link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link rel="stylesheet" href="../../css/common/loginModal.css" />
        <link rel="stylesheet" href="../../css/brand/brand_detail.css" />
        <link rel="stylesheet" href="../../css/category/category_style.css" />
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
        <div class="hiddenData">
            <div class="pg">${param.pg}</div>
            <div class="brandCode">${param.brandCode}</div>
            <div class="memberId">${sessionId}</div>
        </div>
        <main>
            <div class="brandDetailMain">
                <section class="brandDetailSection">
                    <section class="brandDetailHeader">
                        <article class="brandInfoCard">
                            <div class="brandLogo"></div>
                            <div class="brandInfoContentSection">
                                <span class="brandName">brandName</span>
                                <div class="brandTagList">
                                    <span></span>
                                </div>
                            </div>
                        </article>
                        <article class="brandInfoLogo">
                            <ul class="brandMenuList">
                                <li class="brandLikeMenu">
                                    <button class="brandLikeBtn">
                                        <img
                                            class="brandHeartIcon brandHeartIconWhite"
                                            src="../../images/category/heart.jpg"
                                        /><img
                                            class="brandHeartIcon brandHeartIconViolet"
                                            src="../../images/category/heart_violet.jpg"
                                        />
                                    </button>
                                    <span
                                        >좋아요 <span class="likeCount"></span
                                    ></span>
                                </li>
                                <li class="brandInfoMenu">
                                    <img
                                        src="../images/brand/noti_info_24.png"
                                    />
                                    <span>브랜드 정보</span>
                                </li>
                                <li class="brandInstagramMenu">
                                    <a
                                        target="_blank"
                                        href="https://www.instagram.com/a14_jewelry/"
                                    >
                                        <img
                                            alt=""
                                            src="../images/brand/social_insta_btn_24.png"
                                        />
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
                                    <%@ include
                                    file="/WEB-INF/views/common/filter.jsp" %>
                                </div>
                                <div class="productList">
                                    <a href="">
                                        <div class="articleImg">
                                            <img
                                                src="../images/brand/test.jpg"
                                            />
                                        </div>
                                        <div class="articleDesc">
                                            <span
                                                ><strong>브랜드명</strong></span
                                            >
                                            <span>상품명</span>
                                            <div class="articlePrice">
                                                <span class="percentage">
                                                    <span
                                                        ><strong
                                                            >13</strong
                                                        ></span
                                                    >%
                                                </span>
                                                <span class="price">
                                                    <span
                                                        ><strong
                                                            >164,330</strong
                                                        ></span
                                                    >원
                                                </span>
                                                <img
                                                    class="deliveryIcon"
                                                    src="../images/brand/delivery_today.jpg"
                                                    alt="delivery today icon"
                                                />
                                            </div>
                                            <svg
                                                class="heartIcon"
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke-width="1.5"
                                                stroke="currentColor"
                                                class="w-6 h-6"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                                                />
                                            </svg>
                                        </div>
                                        <div class="likeNumber">
                                            좋아요 <span>4,400</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>
                </section>
            </div>
            <!-- <%@ include file="/WEB-INF/views/common/loginModal.jsp" %> -->
        </main>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
        <script type="text/javascript" src="../js/header_footer.js"></script>
        <script type="text/javascript" src="../js/category_script.js"></script>
        <script
            type="text/javascript"
            src="../js/brand/brand_detail.js"
        ></script>
    </body>
</html>
