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
        <link rel="stylesheet" href="../../css/common/loginModal.css" />
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

<%--        <input type="hidden" id="memberId" value="test" />--%>
        <input type="hidden" class="memberId" value="${sessionId}">

        <input type="hidden" id="pg" value="${pg}" />

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
                        <span class="currentCategory">BEST</span>
                    </div>
                    <%@ include file="/WEB-INF/views/common/filter.jsp" %>
                </div>
                <div class="articleContents"></div>
                <div class="pagingDiv"></div>
            </section>
        </main>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
        <script type="text/javascript" src="../../js/header_footer.js"></script>
        <script type="text/javascript" src="../../js/loginModal.js"></script>
        <script
            type="text/javascript"
            src="../../js/category_script.js"
        ></script>
    </body>
</html>
