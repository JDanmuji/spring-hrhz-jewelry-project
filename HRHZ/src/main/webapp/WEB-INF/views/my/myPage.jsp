<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, viewport-fit=cover" />
    <link rel="icon" href="/images/favicon48.ico">
    <title>마이페이지</title>

	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/my/mypage.css" />
    <link rel="stylesheet" href="../../css/my/navForm.css" />
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  </head>
  <body>
    <div id="">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>

      <main>
        <div class="mypageHome">
          <div class="mypageOuterWrap">
            <div class="mypageInnerWrap">
              <h2 id="mypage"><a href="#">마이페이지</a></h2>
              <!--TopNav-->
              <div class="mypageOuterTopNav">
                <div class="mypageInnerTopNav">
                  <div class="leftTopNav">
                    <h4 class="client">
                      <div>고객</div>
                      님, 안녕하세요!
                    </h4>
                  </div>
                  <ul class="topNavIcons">
                    <li>
                      <a class="" href="/myPage/reviewForm">
                        <div class="topNavIconWrap">
                          <div width="18" class="topNavIcon reveiwIcon">
                            <img src="../images/my/mypage_review_icon.png" alt="후기 아이콘 이미지" style="width: 18;" />
                          </div>
                          <span>후기</span>
                        </div>
                      </a>
                    </li>
                    <li>
                      <a href="/myPage/couponForm">
                        <div class="topNavIconWrap">
                          <div class="topNavIcon couponIcon">
                            <img src="../images/my/mypage_coupon_icon.png" alt="쿠폰 아이콘 이미지" style="width: 31;" />
                          </div>
                          <span>쿠폰</span>
                        </div>
                      </a>
                    </li>
                    <li>
                      <a href="/myPage/pointForm">
                        <div class="topNavIconWrap">
                          <div class="topNavIcon pointIcon">
                            <img src="../images/my/mypage_point_icon.png" alt="포인트 아이콘 이미지" style="width: 18;" />
                          </div>
                          <span>포인트</span>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <!--//TopNav -->
              <!-- Tap & Content -->
              <div class="myPageContent">
                <%@ include file="/WEB-INF/views/my/myPageNav.jsp" %>
                <!-- Content -->
                <!-- 동적할당 -->
                <c:choose>
                  <c:when test="${ empty display}">
                    <jsp:include page="myPageContent.jsp" />
                  </c:when>
                  <c:otherwise>
                    <jsp:include page="${display}" />
                  </c:otherwise>
                </c:choose>
              </div>
              <!-- //Tap & Content -->
            </div>
            <!--//mypageInnerWrapper -->
          </div>
          <!--//mypageOuterWrapper-->
        </div>
      </main>
	
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <%@ include file="/WEB-INF/views/common/loginForm.jsp" %>
    </div>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/my/myPage.js"></script>
  </body>
</html>
