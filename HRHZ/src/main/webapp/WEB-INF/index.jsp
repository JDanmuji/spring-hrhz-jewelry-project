<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico" />
        <title>HRHZ</title>

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
            rel="stylesheet"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="css/common/reset.css" />
        <link rel="stylesheet" href="css/common/header_footer.css" />
        <link rel="stylesheet" href="css/common/style.css" />
        <!-- <link rel="stylesheet" href="css/main/URLCopyForm_modal.css" /> -->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
        ></script>
        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
    </head>
    <body>
        <input type="hidden" id="memberId" value="${sessionId}" />
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <main>
            <div
                id="carouselExampleSlidesOnly"
                class="carousel slide"
                data-bs-ride="carousel"
            >
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                            src="images/main/WIEAI_3090_50.jpeg"
                            class="d-block w-100"
                            alt="..."
                        />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="images/main/WIEAI_3132_50.jpeg"
                            class="d-block w-100"
                            alt="..."
                        />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="images/main/WIEAI_3134_50.jpeg"
                            class="d-block w-100"
                            alt="..."
                        />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="images/main/WIEAI_3136_50.jpeg"
                            class="d-block w-100"
                            alt="..."
                        />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="images/main/WIEAI_3153_50.jpeg"
                            class="d-block w-100"
                            alt="..."
                        />
                    </div>
                </div>
            </div>

            <div class="miniMenu">
                <!-- 동적처리 -->
                <a href="/magazineAmonzTakeALook">
                    <img src="images/main/HMAI_250_50.jpeg" alt="" />
                    <span>아몬즈 단독</span>
                </a>
                <a href="/magazineCarotcollection">
                    <img src="images/main/HMAI_249_50.jpeg" alt="" />
                    <span>새로운 발견</span>
                </a>
                <a href="/magazineInstargram">
                    <img src="images/main/HMAI_207_50.jpeg" alt="" />
                    <span>14/18K</span>
                </a>
                <a href="/magazineBicycle">
                    <img src="images/main/HMAI_218_50.jpeg" alt="" />
                    <span>맨/젠더리스</span>
                </a>
                <a href="magazineEmptycart">
                    <img src="images/main/HMAI_176_50.jpeg" alt="" />
                    <span>지금 이가격!</span>
                </a>
                <a href="/magazineMyStarryDeal">
                    <img src="images/main/HMAI_251_50.jpeg" alt="" />
                    <span>볼드링</span>
                </a>
                <a href="/magazineRomanticMode">
                    <img src="images/main/HMAI_247_50.jpeg" alt="" />
                    <span>하트 쥬얼리</span>
                </a>
                <a href="/magazineABC">
                    <img src="images/main/HMAI_246_50.jpeg" alt="" />
                    <span>첫구매시50%</span>
                </a>
            </div>

            <article class="mainArticle">
                <span class="articleTitle"
                    ><strong>주말에는 더 큰 혜택으로</strong></span
                >
                <a href=""><img src="images/common/main_promotion.jpeg" /></a>
            </article>

            <article class="timeSaleArticle">
                <span class="articleTitle"
                    ><strong>곧 혜택이 사라져요!</strong></span
                >
                <div class="timeSaleContents">
                    <a href="/magazineMidnightMoment">
                        <div class="timeSaleImg">
                            <!-- <div class="saleTag">~54%</div> -->
                            <img src="images/main/WIBAI_9737_50.jpeg" />
                        </div>
                        <!--  <div class="articleDesc">
                            <span><strong>3개월간 가장 사랑받은</strong></span>
                            <span>14K 주얼리</span>
                        </div> -->
                    </a>
                    <a href="/magazineSpringWind">
                        <div class="timeSaleImg">
                            <!-- <div class="saleTag">~15%</div> -->
                            <img src="images/main/WIBAI_9739_50.jpeg" />
                        </div>
                        <!--  <div class="articleDesc">
                            <span><strong>편안한 데일리 아이템</strong></span>
                            <span>실버 주얼리</span>
                        </div> -->
                    </a>
                </div>
            </article>

            <article class="bestArticle">
                <span class="bestTitle"><strong>BEST</strong></span>
                <div class="bestContents"></div>
            </article>

            <article class="top100Article">
                <span class="articleTitle"
                    ><strong>이번 주 TOP 100</strong></span
                >
                <div class="articleContents">
                    <div class="articleList"></div>
                    <div class="swiperButtonPrev">
                        <img
                            src="../images/purchase/left_btn.png"
                            alt="image"
                        />
                    </div>
                    <div class="swiperButtonNext">
                        <img
                            src="../images/purchase/right_btn.png"
                            alt="image"
                        />
                    </div>
                </div>
                <a href="/category?pg=1" class="viewMore"><p>VIEWMORE</p></a>
            </article>

            <article class="reviewArticle">
                <span class="articleTitle"
                    ><strong>찐후기로 만나는 주얼리</strong></span
                >
                <div class="reviewContents">
                    <!-- <a href="">
                        <div class="reviewImg">
                            <img src="images/common/test.jpg" />
                        </div>
                        <div class="articleDesc">
                            <img />별점 이미지
                            <span>후기상세</span>
                            <span class="reviewProduct">제품명</span>
                        </div>
                    </a> -->
                </div>
            </article>
            <%@ include file="/WEB-INF/views/common/loginForm.jsp" %>
        </main>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/header_footer.js"></script>
    </body>
</html>
