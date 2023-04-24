<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="mypageContentSection">
  <section class="mypageSection">
    <h3 class="userCheckHead">회원정보 수정</h3>
    <section class="userCheckSection">
      <div class="userCheckInfo">
        <p>회원님의 소중한 정보 보호를 위해</p>
        <p>비밀번호를 재확인합니다.</p>
      </div>
      <article class="userCheckContent">
        <form class="userCheckForm" novalidate>
          <div class="userEmail">
            <label>아이디</label>
            <div>${memberDTO.email }</div>
          </div>
          <div class="userPwdWrap">
            <input type="password" name="userPwd" maxlength="15" />
            <label>비밀번호</label>
          </div>
          <button class="goShopBtn userCheckBtn" type="button" disabled>
            확인
          </button>
        </form>
      </article>
    </section>
  </section>
</section>