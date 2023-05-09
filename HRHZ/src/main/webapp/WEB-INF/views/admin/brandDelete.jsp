<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <section class="adminContentSection">
        <div class="formContainer">
            <div class="title">
                <div class="formTitle">브랜드 삭제</div>
                <span class="titleUnderline"></span>
                <div class="brandInfoTitle">브랜드 정보</div>
                <button class="brandSearch">브랜드 조회</button>
                <span class="subTitleUnderline"></span>
            </div>
            <form action="">
                <div class="brandDeleteForm">
                    <div class="inputContainer">
                        <label for="brandName">명칭</label>
                        <input type="text" class="brandName" required>
                        <span class="underline brandNameUnderline"></span>
                    </div>

                    <div class="inputContainer">
                        <label for="representativeNumber">대표전화</label>
                        <input type="tel" class="representativeNumber" required>
                        <span class="underline representativeNumberUnderline"></span>
                    </div>

                    <div class="inputContainer">
                        <label for="brandEmail">이메일</label>
                        <input type="text" class="brandEmail" required>
                        <span class="underline brandEmailUnderline"></span>
                    </div>
                </div>
                <div class="brandphoto">
                    <img src="../../images/member/black.jpg" alt="images">
                </div>
                
                <button type="button" class="adminBrandDelete">브랜드 정보 삭제</button>
            </form>
        </div>
    </section>        
    


	