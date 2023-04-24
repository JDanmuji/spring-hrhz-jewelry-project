<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico" />
        <title>HRHZ</title>
        <link rel="stylesheet" href="../../css/common/reset.css" />
        <link rel="stylesheet" href="../../css/common/header_footer.css" />
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
        <main>
            <%@ include file="/WEB-INF/views/category/categoryNav.jsp" %>
            <section class="rightSection">
                <div class="stickyMenu">
                    <div class="selectedCategory">
                        <img
                            src="../images/category/category_arrow.png"
                            alt="arrow icon"
                        />
                        <span>BEST</span>
                    </div>
                    <%@ include file="/WEB-INF/views/common/filter.jsp" %>
                </div>
                <div class="articleContents">
                    <div class="articleContent">
                        <a href="/purchase/productDetail">
                            <div class="articleImg">
                                <img src="../images/category/test.jpg" />
                            </div>
                            <div class="articleDesc">
                                <span><strong>브랜드명</strong></span>
                                <span>상품명</span>

                                <div class="articlePrice">
                                    <span class="percentage"
                                        ><span><strong>13</strong></span
                                        >%</span
                                    >
                                    <span class="price"
                                        ><span><strong>164,330</strong></span
                                        >원</span
                                    >
                                    <img
                                        class="deliveryIcon"
                                        src="../images/category/delivery_today.jpg"
                                        alt="delivery today icon"
                                    />
                                </div>
                            </div>
                            <div class="likeNumber">
                                좋아요 <span>4,400</span>
                            </div>
                        </a>
                        <img
                            class="heartIcon heartIconWhite"
                            src="../images/category/heart.jpg"
                        />
                        <img
                            class="heartIcon heartIconViolet"
                            src="../images/category/heart_violet.jpg"
                        />
                    </div>

                    <div class="articleContent">
                        <a href="/purchase/productDetail">
                            <div class="articleImg">
                                <img src="../images/category/test.jpg" />
                            </div>
                            <div class="articleDesc">
                                <span><strong>브랜드명</strong></span>
                                <span>상품명</span>

                                <div class="articlePrice">
                                    <span class="percentage"
                                        ><span><strong>13</strong></span
                                        >%</span
                                    >
                                    <span class="price"
                                        ><span><strong>164,330</strong></span
                                        >원</span
                                    >
                                    <img
                                        class="deliveryIcon"
                                        src="../images/category/delivery_today.jpg"
                                        alt="delivery today icon"
                                    />
                                </div>
                            </div>
                            <div class="likeNumber">
                                좋아요 <span>4,400</span>
                            </div>
                        </a>
                        <img
                            class="heartIcon heartIconWhite"
                            src="../images/category/heart.jpg"
                        />
                        <img
                            class="heartIcon heartIconViolet"
                            src="../images/category/heart_violet.jpg"
                        />
                    </div>

                    <div class="articleContent">
                        <a href="/purchase/productDetail">
                            <div class="articleImg">
                                <img src="../images/category/test.jpg" />
                            </div>
                            <div class="articleDesc">
                                <span><strong>브랜드명</strong></span>
                                <span>상품명</span>

                                <div class="articlePrice">
                                    <span class="percentage"
                                        ><span><strong>13</strong></span
                                        >%</span
                                    >
                                    <span class="price"
                                        ><span><strong>164,330</strong></span
                                        >원</span
                                    >
                                    <img
                                        class="deliveryIcon"
                                        src="../images/category/delivery_today.jpg"
                                        alt="delivery today icon"
                                    />
                                </div>
                            </div>
                            <div class="likeNumber">
                                좋아요 <span>4,400</span>
                            </div>
                        </a>
                        <img
                            class="heartIcon heartIconWhite"
                            src="../images/category/heart.jpg"
                        />
                        <img
                            class="heartIcon heartIconViolet"
                            src="../images/category/heart_violet.jpg"
                        />
                    </div>
                </div>
            </section>
        </main>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
        <script type="text/javascript" src="../../js/header_footer.js"></script>
        <script
            type="text/javascript"
            src="../../js/category_script.js"
        ></script>
    </body>
</html>
