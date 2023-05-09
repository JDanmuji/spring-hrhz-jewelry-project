<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="brandInsertWrap">
	<form id="brandInsertForm" >
	<section class="adminContentSection">
	        <div class="formContainer">
	            <div class="title">
	                <div class="formTitle">브랜드 등록</div>
	                <span class="titleUnderline"></span>
	                <div class="brandInfoTitle">브랜드 정보</div>
	                <span class="subTitleUnderline"></span>
	            </div>
	           
	                <div class="inputContainer">
	                    <label for="brandName">명칭</label>
	                    <input type="text" class="brandName" name="brandName" required>
	                    <span class="underline brandNameUnderline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="representativeNumber">대표전화</label>
	                    <input type="tel" class="representativeNumber" name="representativeNumber" required>
	                    <span class="underline representativeNumberUnderline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="brandEmail">이메일</label>
	                    <input type="text" class="brandEmail" name="brandEmail" required>
	                    <span class="underline brandEmailUnderline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="businessLocation">영업소재지</label>
	
	                    <input type="text" id="businessLocation1" class="businessLocation1" name="businessLocation1"required>
	
	                    <span class="underline businessLocation1Underline"></span>
	                    <button type="button"  onclick="post()" class="searchBusinessLocation">검색</button>
	                </div>
	                <div class="inputContainer">
	                    <label for="businessLocation"></label>
	                    <input type="text" id="businessLocation2" class="businessLocation2" name="businessLocation2" required>
	                    <span class="underline businessLocation2Underline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="returnAddress">반송지주소</label>
	                    <input type="text" id="returnAddress1" class="returnAddress1" name ="returnAddress1" required>
	                    <span class="underline returnAddress1line"></span>
	                    <button type="button" onclick="returnpost()" class="searchReturnAddress">검색</button>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="returnAddress"></label>
	                    <input type="text" id= "returnAddress2" class="returnAddress2" name ="returnAddress2" required>
	                    <span class="underline returnAddress2line"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="deliveryCharge">배송비</label>
	                    <input type="text" class="deliveryCharge" name="deliveryCharge" required>
	                    <span class="underline deliveryChargeUnderline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="kakaotalk">카카오톡</label>
	                    <input type="text" class="kakaotalk" name="kakaotalk" required>
	                    <span class="underline kakaotalkUnderline"></span>
	                </div>
	
	                <div class="inputContainer">
	                    <label for="instagram">인스타그램</label>
	                    <input type="text" class="instagram" name= "instagram" required>
	                    <span class="underline instagramUnderline"></span>
	                </div>
	
	                <button type="button" class="adminBrandInsert">브랜드 정보 등록</button>
	            
	        </div>
	    </section>
	</form>

</div>
  <script
            type="text/javascript"
            src="http://code.jquery.com/jquery-3.6.4.min.js"
        ></script>
  <script type="text/javascript" src="../../js/admin/brandInsert.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
