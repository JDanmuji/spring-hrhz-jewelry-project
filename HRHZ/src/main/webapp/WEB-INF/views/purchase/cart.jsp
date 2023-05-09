<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="/images/favicon48.ico">
        <title>cart</title>
		<link rel="stylesheet" href="../../css/common/reset.css" />
		<link rel="stylesheet" href="../../css/common/header_footer.css" />
        <link href="../../css/purchase/cartstyle.css" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500&display=swap" rel="stylesheet" />
    </head>
    <body>
    
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="hiddenData">
             <input hidden="hidden" class="memberId" value="${sessionId}" />
        </div>
        <main>
            <section class="mainSection">
                <div class="outerWrapper">
                    <div class="cartTotalView">
                        <div class="toparea">
                            <div class="title">장바구니</div>
                            <div class="paymentStepList">
                                <span class="active">장바구니</span>
                                <img alt src="../images/member/step-right-arrow.png" />
                                <span class="inactiveMiddle">결제하기</span>
                                <img alt src="../images/member/step-right-arrow-inactive.png" />
                                <span class="inactive">주문완료</span>
                            </div>
                        </div>
	                    <jsp:include page="${display}" />
                        
                       
                    </div>
                </div>
            </section>
        </main>
        <%@ include file="cartProductInfo.jsp" %>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      
	    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script type="text/javascript" src="../../js/header_footer.js"></script>
        <script type="text/javascript" src="../../js/purchase/cart.js"></script>
    </body>
</html>
