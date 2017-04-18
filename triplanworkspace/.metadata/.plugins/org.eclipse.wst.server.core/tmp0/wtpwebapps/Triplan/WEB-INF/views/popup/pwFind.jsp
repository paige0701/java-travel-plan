<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<style>

#pwFind {
   width: 420px;
   height: 350px;
   top: -1000%;
   left: 37.5%;
   border: 1px solid gray;
   position: absolute;
   background-color: white;  
	}
	
#yj_title {
	width: 73%;
	height: 10%;
	margin: 6% 0 0 13%;
	position: absolute;
	text-align: center;
}

#ns_title>.x {
	float: right;
	font-size: 10.5pt;
	cursor: default;
}

#yj_name {
	width: 72.9%;
	height: 10%;
	margin: 15% 0 0 13%;
	position: absolute;
	border: 0 none;
}

#YJ_name>input {
	width: 50%;
	height: 100%;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 11pt;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    outline: none;
	border-radius: 4px !important;
	float: left;
}

#yj_mobile {
	width: 70%;
	height: 10%;
	margin: 30% 0 0 13%;
	color: #a6a6a6;
	position: absolute;
}

#YJ_mobile>input {
	width: 60%;
	height: 100%;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 11pt;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    outline: none;
	border-radius: 4px !important;
	float: left;
}

#yj_btn {
	width: 72.4%;
	height: 10%;
	margin: 65% 0 0 13%;
	position: absolute;	
}

#yj_btnOK {
	width: 100%;
	height: 40px;
	line-height: 47px;
    border-color: #ACBAC9;
    cursor: pointer;
    font-size: 12px;
    line-height: 1.5;
	position: absolute;
}


#pwfi {
	border: none;
}
	
}
</style>

<script type="text/javascript">

   var scrolltop = 0;
   var scrollt = 0;

   $(document).ready(function(){

      $(".pwFind").click(function(){  // 팝업열기
         
         if($("#pop_ck").val() == 0)
         {
        	scrolltop = $(".head").offset().top+$(".head").height()+50;
			scrollt = $(window).scrollTop();
            overlay(1.0);
            $("#pwFind").css("opacity",1.0);
            $("#pop_ck").val("999")
            open_pop("pwFind", scrolltop-150);
            setTimeout(function(){
            	$("#pop_ck").val("4");   
            },100);
         }
      })
      
   });
      
   
   
   
</script>

<body>
<div id="pwFind" >
<iframe id="pwfi" name="pwfi" width="100%" height="100%" src="<%=request.getContextPath() %>/pwFind2.tp">
</iframe>
</div> --%>