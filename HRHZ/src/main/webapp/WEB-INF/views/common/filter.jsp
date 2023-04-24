<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="filterBox">
    <span>인기순</span>
    <div class="sortToggle">
        <div><a href="">인기순</a></div>
        <div><a href="">신상품순</a></div>
        <div><a href="">낮은가격순</a></div>
        <div><a href="">높은가격순</a></div>
    </div>
    <span>필터</span>
    <div class="filterToggle">
        <div class="filterMenu">
            <p>브랜드</p>
            <p>컬러</p>
            <p>가격</p>
            <p>닫기</p>
        </div>

        <div class="brandFilter filterPage">
            <div class="brandFilterSearchDiv">
                <img class="searchIcon" src="../../images/common/search_btn.png" alt="search icon" />
                <input type="text" value="브랜드명을 입력해 주세요" />
            </div>

            <div class="recommendBrand">
                <h3>추천 브랜드</h3>
                <a href="">
                    <img class="brandImg" src="../../images/common/test.jpg" alt="brand image" />
                    <p>브랜드명</p>
                </a>
                <a href="">
                    <img class="brandImg" src="../../images/common/test.jpg" alt="brand image" />
                    <p>브랜드명</p>
                </a>
                <a href="">
                    <img class="brandImg" src="../../images/common/test.jpg" alt="brand image" />
                    <p>브랜드명</p>
                </a>
            </div>
        </div>

        <div class="colorFilter filterPage">
            <p>실버</p>
            <p>골드</p>
            <p>화이트</p>
            <p>블랙</p>
            <p>멀티</p>
            <p></p>
        </div>

        <div class="priceFilter filterPage">
            <div class="priceFilterChoice">
                <p>1만원~3만원</p>
                <p>3만원~5만원</p>
                <p>5만원~10만원</p>
                <p>10만원 이상</p>
            </div>

            <div class="priceFilterInput">
                <input type="text" value="2,000" /><span>원 - </span> <input type="text" value="9,999,999" /><span>원</span>

                <button>적용</button>
            </div>
        </div>

        <div class="filterBtn">
            <button class="filterResetBtn">
                <img src="../../images/common/filter_reset_btn.png" />
            </button>
            <button class="filterResultBtn">
                검색결과 보기
            </button>
        </div>
    </div>
</div>
