<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, viewport-fit=cover" />
    <link rel="icon" href="/images/favicon48.ico">
    <title>관리자 페이지</title>

	<link rel="stylesheet" href="../../css/common/reset.css" />
	<link rel="stylesheet" href="../../css/common/header_footer.css" />
    <link rel="stylesheet" href="../../css/admin/admin.css" />
    <link rel="stylesheet" href="../../css/my/navForm.css" />
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
  </head>
  <body>
    <div id="">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>

      <main>
        <div class="adminHome">
          <div class="adminOuterWrap">
            <div class="adminInnerWrap">
              <h2 id="admin"><a href="#">관리자페이지</a></h2>
              <!--TopNav-->
              <div class="adminOuterTopNav">
                <div class="adminInnerTopNav">
                  <div class="leftTopNav">
                    <h4 class="client">
                      <div>관리자</div>
                      님, 안녕하세요!
                    </h4>
                  </div>
                </div>
              </div>
              <!--//TopNav -->
              <!-- Tap & Content -->
              <div class="adminContent">
                <%@ include file="/WEB-INF/views/admin/adminNav.jsp" %>
                <!-- Content -->
                <!-- 동적할당 -->
                <c:choose>
                  <c:when test="${ empty display}">
                    <jsp:include page="memberList.jsp" />
                  </c:when>
                  <c:otherwise>
                    <jsp:include page="${display}" />
                  </c:otherwise>
                </c:choose>
              </div>
              <!-- //Tap & Content -->
            </div>
            <!--//adminInnerWrapper -->
          </div>
          <!--//adminOuterWrapper-->
        </div>
      </main>
	
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <%@ include file="/WEB-INF/views/common/loginForm.jsp" %>
    </div>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/header_footer.js"></script>
    <script type="text/javascript" src="../../js/admin/admin.js"></script>
  </body>
</html>
