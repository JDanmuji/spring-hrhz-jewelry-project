<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title></title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../../css/common/reset.css" />
        <link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link rel="stylesheet" href="../../css/brand/brand_style.css" />
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
        <!-- brand main -->
        <main>
            <section class="adHeader">
                <article class="adFirstAticle">
                    <div class="adTitleText">세일 중인 브랜드</div>
                    <ul class="topSection">
                        <li class="adTitleImg01">
                            <a href="#">
                                <img
                                    alt="스쿠도"
                                    src="../images/brand/scoodo.jpeg"
                                    class="topImg"
                                />
                                <div class="adBrandTextOnImg">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="white"
                                        class="w-6 h-6 earthImg"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"
                                        />
                                    </svg>
                                    <span>스쿠도</span>
                                </div>
                                <div class="brandHoverContent">
                                    <div class="arrowImgSection">
                                        <img
                                            class="arrowImg"
                                            alt
                                            src="../images/brand/arrow.png"
                                        />
                                        <p class="directBrand">
                                            브랜드 바로가기
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="adTitleImg01">
                            <a href="#">
                                <img
                                    alt="레끌라"
                                    src="../images/brand/LECLAT.jpeg"
                                    class="topImg"
                                />
                                <div class="adBrandTextOnImg">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="white"
                                        class="w-6 h-6 earthImg"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"
                                        />
                                    </svg>
                                    <span>레끌라</span>
                                </div>
                                <div class="brandHoverContent">
                                    <div class="arrowImgSection">
                                        <img
                                            class="arrowImg"
                                            alt
                                            src="../images/brand/arrow.png"
                                        />
                                        <p>브랜드 바로가기</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="adTitleImg01">
                            <a href="#">
                                <img
                                    alt="타티아나"
                                    src="../images/brand/tatiana.jpeg"
                                    class="topImg"
                                />
                                <div class="adBrandTextOnImg">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="white"
                                        class="w-6 h-6 earthImg"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"
                                        />
                                    </svg>
                                    <span>타티아나</span>
                                </div>
                                <div class="brandHoverContent">
                                    <div class="arrowImgSection">
                                        <img
                                            class="arrowImg"
                                            alt
                                            src="../images/brand/arrow.png"
                                        />
                                        <p>브랜드 바로가기</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="adTitleImg01">
                            <a href="#">
                                <img
                                    alt="딥브로우"
                                    src="../images/brand/deepbrow.jpeg"
                                    class="topImg"
                                />
                                <div class="adBrandTextOnImg">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="white"
                                        class="w-6 h-6 earthImg"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 017.843 4.582M12 3a8.997 8.997 0 00-7.843 4.582m15.686 0A11.953 11.953 0 0112 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0121 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0112 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 013 12c0-1.605.42-3.113 1.157-4.418"
                                        />
                                    </svg>
                                    <span>딥브로우</span>
                                </div>
                                <div class="brandHoverContent">
                                    <div class="arrowImgSection">
                                        <img
                                            class="arrowImg"
                                            alt
                                            src="../images/brand/arrow.png"
                                        />
                                        <p>브랜드 바로가기</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </article>

                <!-- bottom part starts -->
                <article class="adSecondAticle">
                    <h2 class="scTitleText">위클리 브랜드 랭킹</h2>
                    <div class="scTotalArea">
                        <ul class="scMenuArea">
                            <!--
                            <li class="scBrand">
                                <a class="brandLink" href="/brand/brandDetail">
                                    <span class="brandRankingNumber">1</span>
                                    <img
                                        class="brandRankingImage"
                                        src="../images/brand/weam.jpeg"
                                        alt=""
                                    />
                                    <div class="scBrandTitleSection">
                                        <p class="scBrandTitle">위아몬드</p>
                                        <p class="scBrandTagList">
                                            데일리.베이직.합리적
                                        </p>
                                    </div>
                                </a>
                                <div class="brandLikeBtn">
                                    <img
                                        class="likeBlank"
                                        src="../images/brand/heart.jpg"
                                    />
                                    <img
                                        class="likeFull"
                                        src="../images/brand/heart_violet.jpg"
                                    />
                                </div>
                            </li>
                            -->
                        </ul>
                    </div>
                </article>
            </section>
        </main>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
        <script type="text/javascript" src="../../js/header_footer.js"></script>
        <script type="text/javascript" src="../../js/brand/brand.js"></script>
    </body>
</html>
