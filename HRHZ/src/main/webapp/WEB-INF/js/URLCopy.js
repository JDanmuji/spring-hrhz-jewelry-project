$(function () {
     $(".productShareImg").on("click", function (event) {
         $("section.sectionBackGround").css("display", "flex");
         urlClip();

     });
      
     $(".modalCloseBtn, .confirmBtn").on("click", function (event) {
        $("section.sectionBackGround").css("display", "none");
     });
     
    function urlClip(){
	
        var url = '';    
        var textarea = document.createElement("textarea");  
        	                
        document.body.appendChild(textarea);
        url = window.document.location.href;
        textarea.value = url;
        textarea.select();
        document.execCommand("copy");
        document.body.removeChild(textarea); 
        
    }
 });
            