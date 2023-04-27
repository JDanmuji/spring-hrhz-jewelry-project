<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
                <img
                    class="searchIcon"
                    src="../../images/common/search_btn.png"
                    alt="search icon"
                />
                <input type="text" value="브랜드명을 입력해 주세요" />
            </div>

            <div class="recommendBrand">
                <h3>추천 브랜드</h3>
                <div class="filterDiv">
                    <img
                        class="brandImg"
                        src="../../images/common/test.jpg"
                        alt="brand image"
                    />
                    <p>브랜드명</p>
                </div>
                <div class="filterDiv">
                    <img
                        class="brandImg"
                        src="../../images/common/test.jpg"
                        alt="brand image"
                    />
                    <p>브랜드명</p>
                </div>
                <div class="filterDiv">
                    <img
                        class="brandImg"
                        src="../../images/common/test.jpg"
                        alt="brand image"
                    />
                    <p>브랜드명</p>
                </div>
            </div>
        </div>

        <div class="colorFilter filterPage">
            <div class="filterDiv"><span>S</span><p>실버</p></div>
            <div class="filterDiv"><span>G</span><p>골드</p></div>
            <div class="filterDiv"><span>W</span><p>화이트</p></div>
            <div class="filterDiv"><span>B</span><p>블랙</p></div>
            <div class="filterDiv"><span>M</span><p>멀티</p></div>
        </div>

        <div class="priceFilter filterPage">
            <div class="priceFilterChoice">
                <div class="filterDiv"><span>1</span><p>1만원~3만원</p></div>
                <div class="filterDiv"><span>2</span><p>3만원~5만원</p></div>
                <div class="filterDiv"><span>3</span><p>5만원~10만원</p></div>
                <div class="filterDiv"><span>4</span><p>10만원 이상</p></div>
            </div>

            <div class="priceFilterInput">
                <input type="text" value="2,000" /><span>원 - </span>
                <input type="text" value="9,999,999" /><span>원</span>

                <button>적용</button>
            </div>
        </div>

        <div class="tagArea"></div>

        <div class="filterBtn">
            <button class="filterResetBtn">
                <img src="../../images/common/filter_reset_btn.png" />
            </button>
            <button class="filterResultBtn">검색결과 보기</button>
        </div>
    </div>
</div>
