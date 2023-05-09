<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="adminContentSection">
        <div class="formContainer">
            <form action="">
            <div class="title">
                <div class="formTitle">브랜드 사진 등록 </div>
                <span class="titleUnderline"></span>
                <div class="brandInfoTitle">브랜드 정보</div>
                <button class="brandSearch">브랜드 조회</button>
                <span class="subTitleUnderline"></span>
            </div>
            <div class="inputContainer">
                <label for="productName">코드</label>
                <input type="text" class="productName" required>
                <span class="underline productNameUnderline"></span>
            </div>
            <div class="inputContainer">
                <label for="productName">명칭</label>
                <input type="text" class="productName" required>
                <span class="underline productNameUnderline"></span>
            </div>

            <div class="title">
                <span class="titleUnderline"></span>
                <div class="brandPhotoInfoTitle">브랜드 사진</div>
                <button class="productSearch">사진 첨부</button>
                <span class="subTitleUnderline"></span>
            </div>


            <div class="brandInfo">
                <img src="../../images/member/black.jpg" alt="images">
                <span class="brandPhotoName">abc.jpg</span>
            </div>
            <span class="subTitleUnderline"></span>

            <button type="submit" class="productPhotoInsert">브랜드 사진 등록</button>
            </form>
        </div>
    </section>

	<%@ include file="/WEB-INF/views/admin/searchBrandModal.jsp" %>
	
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../../js/admin/admin.js"></script>
