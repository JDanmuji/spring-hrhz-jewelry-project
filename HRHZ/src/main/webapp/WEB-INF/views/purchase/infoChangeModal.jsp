<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modalBoxWrap">
    <div class="modalBackGround" role="presentation"></div>
    <div class="modalBox infoChangeModal">
        <div class="modalHeader">
            <span class="modalHeaderTitle">주문자 정보</span>
            <img class="modalCloseBtn" src="../../images/my/modal_close_btn.png">
        </div>
        <div class="modalBody">
            <form novalidate="">
                <div class="buyerName relPosition">
                    <label>이름</label>
                    <div>
                        <input name="name" type="text" maxlength="20" placeholder="이름을 입력해 주세요" value="${param.name}">
                    </div>
                </div>
                <div class="phoneSelectType">
                    <div class="phoneRadio vertical">
                        <label>연락처</label>
                        <div class="radioBox">
                            <input id="buyerCellPhoneSelectType_0" name="buyerCellPhoneSelectType" type="radio" checked="">
                            <label for="buyerCellPhoneSelectType_0">
                                <span>기존 연락처 사용
                                    <span class="oldCellPhone">(${param.phone})</span>
                                </span>
                            </label>
                        </div>
                        <div class="radioBox">
                            <input id="buyerCellPhoneSelectType_1" name="buyerCellPhoneSelectType" type="radio">
                            <label for="buyerCellPhoneSelectType_1">
                                <span>새로운 연락처 등록</span>
                            </label>
                        </div>
                    </div>
                    <div class="newBuyerPhone relPosition" style="display: none">
                        <div>
                            <input name="newBuyerCellPhone" type="tel" minlength="8" maxlength="11" placeholder="- 없이 입력해 주세요" value="">
                        </div>
                    </div>
                </div>
                <div class="buyerEmail relPosition">
                    <label>
                        <span class="buyerEmailLabel">
                            <span>이메일</span>
                            <span class="labelSubText">* 주문완료 시 확인 메일이 발송됩니다.</span>
                        </span>
                    </label>
                    <div>
                        <input name="email" type="text" minlength="6" maxlength="80" placeholder="이메일 주소를 입력해 주세요" value="${param.email}">
                    </div>
                </div>
            </form>
        </div>
        <div class="modalFooter">
            <button class="goShopBtn infoChangeBtn" disabled="">변경</button>
        </div>
    </div>
</div>
