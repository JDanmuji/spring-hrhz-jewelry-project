<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>cart</title>
        <link rel="stylesheet" href="../../css/common/reset.css" />
        <link rel="stylesheet"  href="../../css/common/style.css" />
        <link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link rel="stylesheet" href="../../css/main/magazine.css" />
        <link rel="stylesheet" href="../../css/main/URLCopyForm_modal.css" />
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet" />
    </head>
    <body>
         <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <main>
            <section class="magazineTotalPage">
                <div class="magazineOuterWrapper">
                        <div class="topTitleText">
                            <h3>까롯 뉴 컬렉션</h3>
                            <img class="productShareImg" src="../../images/main/product_share_btn.png"/>
                        </div>
                        <div>
                            <p class="topTitleSecondText">까롯 스프링 컬렉션</p>
                        </div>
                        <div class="magazineSection">
                            <img class="magazineImg" src="../../images/main/Carotcollection.jpeg">
                            <img class="magazineImg" src="../../images/main/Carotcollection1.jpeg">
                        </div>
                    
                </div>

            </section>
		</main>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		<%@ include file="/WEB-INF/views/common/URLCopyForm.jsp" %>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript" src="../../js/URLCopy.js"></script>
    </body>
</html>
