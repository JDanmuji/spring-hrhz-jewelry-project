<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
<c:set var="id" value=""/>  
	<c:choose>
		<c:when test="${id == 'ADMIN'}">
			<div class="headerWrap">
		        <a href="/">
		            <img
		                class="amondzLogo"
		                src="../images/common/amonds_logo.jpg"
		                alt="amondz logo"/>
		        </a>
		        <div class="authMenu">
		            <a class="loginBtn" href="/signOut">로그아웃</a>
		            <a class="myBtn" href="/admin/memberList">관리자</a>
		        </div>
        	</div>
        </c:when>
        <c:otherwise>
			<div class="headerWrap">
        		<a href="/">
		            <img
		                class="amondzLogo"
		                src="../images/common/amonds_logo.jpg"
		                alt="amondz logo"
		        /></a>
		        <div class="mainMenu">
		            <a href="/category">카테고리</a>
		            <a href="/brand">브랜드</a>
		        </div>
		        <div class="search">
		            <div>궁금한 주얼리를 검색해보세요!</div>
		            <img src="../images/common/search_btn.png" alt="search icon" />
		        </div>
		        <div class="authMenu">
		            <a class="loginBtn" href="/signIn">로그인</a>
		            <a class="myBtn" href="/myPage">마이</a>
		            <a class="cartBtn" href="/purchase/cartForm">
		                <img src="../images/common/header_cart_btn.svg" alt="cart icon" />
		            </a>
		        </div>
		
		        <div class="searchModal">
		            <div class="searchForm">
		                <form>
		                    <input
		                        type="text"
		                        value="궁금한 주얼리를 검색해보세요!"
		                    />
		                    <button>
		                        <img
		                            src="../images/common/search_btn.png"
		                            alt="search icon"
		                        />
		                    </button>
		                </form>
		                <button class="closeBtn">닫기</button>
		            </div>
		            <p><strong>추천 상품</strong></p>
		            <div class="searchRecommend">
		                <div>
		                    <img src="../images/common/test.jpg" alt="" />
		                    <span><strong>추천브랜드</strong></span>
		                    <span>추천상품명</span>
		                </div>
		                <div>
		                    <img src="../images/common/test.jpg" alt="" />
		                    <span><strong>추천브랜드</strong></span>
		                    <span>추천상품명</span>
		                </div>
		                <div>
		                    <img src="../images/common/test.jpg" alt="" />
		                    <span><strong>추천브랜드</strong></span>
		                    <span>추천상품명</span>
		                </div>
		                <div>
		                    <img src="../images/common/test.jpg" alt="" />
		                    <span><strong>추천브랜드</strong></span>
		                    <span>추천상품명</span>
		                </div>
		                <div>
		                    <img src="../images/common/test.jpg" alt="" />
		                    <span><strong>추천브랜드</strong></span>
		                    <span>추천상품명</span>
		                </div>
		            </div>
		        </div>
		    </div>
        </c:otherwise>
	</c:choose>
    
</header>

