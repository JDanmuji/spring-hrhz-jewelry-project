<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="myPageContentSection">
  <section class="myPageSection">
    <section>
      <h3>회원정보수정</h3>
      <section class="myPageManage">
        <article class="manageLoginInfo">
          <h4 class="manageLoginHead">로그인 정보</h4>
<%--          일반 로그인 --%>
          <div class="normalLogin">
            <form class="" novalidate>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">아이디</label>
                </div>
                <div class="formRight">
                  <div class="formText">${memberDTO.email }</div>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">비밀번호</label>
                </div>
                <div class="formRight">
                  <article class="modifyPwdBtnWrap">
                    <input class="passwordForm" type="password" readonly value="0000000" />
                    <div class="btnWrap">
                      <button class="whiteBtn modifyPwdBtn" type="button">
                        비밀번호 수정
                      </button>
                    </div>
                  </article>

                  <article class="userNewPwdWrap" style="display: none">
                    <div class="inputPlaceholder formInput">
                      <input name="userPassword" type="password" maxlength="15" placeholder="현재 비밀번호를 입력해 주세요.">
                    </div>
                    <div class="inputPlaceholder formInput">
                      <input name="userNewPassword" type="password" maxlength="15" placeholder="새 비밀번호를 입력해 주세요.">
                    </div>
                    <div class="inputPlaceholder formInput">
                      <input name="userCheckPassword" type="password" maxlength="15" placeholder="새 비밀번호를 한번 더 입력해 주세요.">
                    </div>
                    <div class="btnWrap">
                      <button class="whiteBtn cancelBnt" type="button">취소</button>
                      <button class="goShopBtn submitBtn" type="button" disabled>수정</button>
                    </div>
                  </article>
                </div>
              </div>
            </form>
          </div>

<%--          snsLogin--%>
<%--          <c:if test="${memberDTO.joinPath eq 'hrhz'}">--%>
<%--            <div class="snsLogin">--%>
<%--                <p class="snsMainText">--%>
<%--                  <span class="snsType">${memberDTO.joinPath } </span>--%>
<%--                  로 로그인 하였습니다.--%>
<%--                </p>--%>
<%--                <p class="snsSubText">--%>
<%--                  SNS로 가입하신 분들은 SNS계정에서 비밀번호를 바꿔주세요.--%>
<%--                </p>--%>
<%--              </div>--%>
<%--          </c:if>--%>

        </article>
        <article class="manageUserInfo">
          <h4>회원 정보</h4>
          <div class="userInfoFormWrap">
            <form class="userInfoForm" novalidate>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel required">이름</label>
                </div>
                <div class="formRight">
                  <div class="inputPlaceholder formInput">
                    <input type="text" name="name" maxlength="20" placeholder="이름을 입력해 주세요." value="${memberDTO.name}" />
                    <label></label>
                  </div>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">휴대폰 번호</label>
                </div>
                <div class="formRight">
                  <input class="formText" name="phone" value="${memberDTO.phone}" readonly>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">이메일</label>
                </div>
                <div class="formRight">
                  <div class="inputPlaceholder formInput">
                    <input type="text" name="email" maxlength="80" placeholder="이메일을 입력해 주세요." value="${memberDTO.email}" />
                    <label></label>
                  </div>
                  <p class="infoFormMsg">
                    이메일 입력 시 할인, 쿠폰 등 할인 혜택을 알려드립니다.
                  </p>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">혜택정보 알림</label>
                </div>
                <div class="formRight">
                  <div class="formInput receiveWrap">
                    <div class="snsCheckbox">
                      <input class="smsCheck" value="${memberDTO.smsAlarm}" hidden>
                      <input type="checkbox" name="smsAlarm" id="smsReceive" />
                      <label for="smsReceive"><span>SMS 수신동의</span></label>
                    </div>
                    <div class="snsCheckbox">
                      <input class="emailCheck" value="${memberDTO.emailAlarm}" hidden>
                      <input type="checkbox" name="emailAlarm" id="emailReceive" />
                      <label for="emailReceive"><span>E-Mail 수신동의</span></label>
                    </div>
                  </div>
                  <p class="infoFormMsg">
                    아몬즈 회원을 위한 할인 소식, 쿠폰 등<br />
                    특별한 맞춤 혜택을 편하게 받아보실 수 있습니다.
                  </p>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">생일</label>
                </div>
                <div class="formRight">
                  <div class="datepickerWrap">
                    <div class="datepicker">
                      <div class="datepickerBtn" >
                        <input class="placeholder" name="date" placeholder="날짜를 선택해주세요." value="${memberDTO.date}" readonly/>
                        <img alt="Date" src="../../images/my/date_picker_icon.png" />
                      </div>
                    </div>
                  </div>
                  <p class="infoFormMsg">
                    아몬즈에서 생일 축하 쿠폰을 발급해드립니다. (계정당 연 1회)
                  </p>
                </div>
              </div>
              <div class="userInfoFormArea">
                <div class="formLeft">
                  <label class="formLabel">성별</label>
                </div>
                <div class="formRight">
                    <div class="formInput genderWrap">
                        <input class="memberGender" value="${memberDTO.gender}" hidden>
                        <input type="radio" name="gender" id="userGenderW" class="genderInput" value="F" checked/>
                        <label for="userGenderW">여자</label>
                        <input type="radio" name="gender" id="userGenderM" class="genderInput" value="M" />
                        <label for="userGenderM">남자</label>
                    </input>
                    <div class="btnWrap">
                      <button type="button" class="goShopBtn submitBtn" disabled>
                        수정
                      </button>
                    </div>
                  </div>
                </div>
                <div class="userInfoFormArea">
                  <div class="formRight">
                    <div class="userRemove">
                      <button type="button">회원탈퇴</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </article>
      </section>
    </section>
  </section>
</section>
