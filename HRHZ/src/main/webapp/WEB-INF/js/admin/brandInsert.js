// ---------------------------------------------------
//               brandInsert
// ---------------------------------------------------

$('.adminBrandInsert').click(function(){
		$.ajax({
				type:'post',
				url :'/admin/brandMemberInsert',
				data :{
				'name' :$('.brandInsertWrap input[name=brandName]').val(),
				'phone' : $('.brandInsertWrap input[name=representativeNumber]').val(),
	       		'email' :$('.brandInsertWrap input[name=brandEmail]').val(),	       		
	       		'businessLocation1': $('.brandInsertWrap input[name=businessLocation1]').val(),
	       		'businessLocation2': $('.brandInsertWrap input[name=businessLocation2]').val(),
	       		'returnAddress1': $('.brandInsertWrap input[name=returnAddress1]').val(),
	       		'returnAddress2': $('.brandInsertWrap input[name=returnAddress2]').val(),
	       		'deliveryFee' : $('.brandInsertWrap input[name=deliveryCharge]').val(),
	       		'kakaoId' : $('.brandInsertWrap input[name=kakaotalk]').val(),
	       		'instagramId' : $('.brandInsertWrap input[name=instagram]').val(),
       },
       
				success : function(){
				alert("브랜드등록완료");
				location.href='/admin/brandInsert'
				},
				error:function(err){
					console.log(err);
					} 
				});
			});
			
// ---------------------------------------------------
//              Address찾기
// ---------------------------------------------------
 function post() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; 
                               
              
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                
                document.getElementById("businessLocation1").value = addr;
                
                document.getElementById("businessLocation2").focus();
            
            }
        }).open();
    }
    
     function returnpost() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; 
                               
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
              
                document.getElementById("returnAddress1").value = addr;
              
                document.getElementById("returnAddress2").focus();
            }
        }).open();
    }
