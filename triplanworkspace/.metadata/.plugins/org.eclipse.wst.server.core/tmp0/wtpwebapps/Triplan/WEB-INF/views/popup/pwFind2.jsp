<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/style.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    
    <style type="text/css">
    
#idFind {
   width: 500px;
   height: 350px;
   top: -100%;
   left: 37.5%;
   border: 1px solid gray;
   position: absolute;
   background-color: white;    
	}

#yj_id {
	width: 70%;
	height: 10%;
	margin: 5% 0 0 13%;
	position: absolute;
	
}

#yj_id>input {
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
}

#yj_email {
	width: 70%;
	height: 10%;
	margin: 20% 0 0 13%;
	position: absolute;
	
}

#yj_email>input {
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
}

#yj_btn {
	width: 70%;
	height: 10%;
	margin: 55% 0 0 13%;
	position: absolute;	
}

#yj_btnOK {
	width: 35%;
	height: 40px;
	line-height: 47px;
    border-color: #ACBAC9;
    cursor: pointer;
    font-size: 12px;
    line-height: 1.5;
}



#idfi {
	border: none;
}
	
#yj_find {
	width: 70%;
	height: 10%;
	margin: 40% 0 0 13%;
	position: absolute;
	text-align: center;
}
	

.btn-default:hover {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad;
}

#pwchdiv>input {
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
}


}

	
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">


   $(document).ready(function(){
           
	   
	   $("#abc").hide();
 	  var userid = "<%= request.getParameter("userid") %>"
	  var email = "<%= request.getParameter("email") %>"
	  
	  if(userid != "null" && email != "null")
	  {
		$("#userid").val(userid);
		$("#email").val(email);
	  } 
	   
	$("#yj_btnOK").click(function(){
    	  
    	  pffrm.action = "/triplan/pwFind2.tp";
    	  pffrm.submit();
    	  
      })
      
   });
      
   function identify(){
	   
	   	if( $("#input_identify").val() == $("#imsi").val())
		{
			alert("인증되었습니다.");
			location.href = "pwFind3.tp?userid="+"<%= request.getParameter("userid") %>";
			
		}
	   	else {
	   		alert("인증번호를 다시 입력해주세요.");
	   	}
	   	
   }
</script>    
    
    
<form id="pffrm" name="pffrm" style="height: 50%; width: 50%;">

	<div id="yj_id" align="center">
		아이디: <br><input type="text" id="userid" name="userid" placeholder="ID" required />
	</div>
	<div id="yj_email" align="center">
		이메일: <br><input type="text" id="email" name="email" placeholder="Email" required />
	</div>
	
	<c:set var="userid" value="${userid.param }" />
	<c:set var="userid"  value="${email.param }" />
	
	<div id="yj_find">
	
	<c:if test="${ n == '1'}">
		<div style="padding-bottom: 10%;" id="pwchdiv">
			인증코드가 발송되었습니다 ! <br>
			입력해주세요<br><br>
			<c:if test="${ n == '1'}">
				<input type="text" id="input_identify" name="input_identify" placeholder=" "  required />
				<button class="btn btn-default" type="button" id="yj_identify" onClick="identify();"><span class="ir_wa">인증하기</span></button>
				<input type="hidden" name="imsi" id="imsi" type="text" value="${imsipw}" />
			</c:if>
		</div>
	</c:if>
	
	<c:if test="${n == '2'}">
		<span>사용자 정보가 없습니다.</span>
	</c:if>
	

</div>
	<c:if test=	"${n != 1 }">
		<div id="yj_btn"  align="center">
			<button class="btn btn-default" id="yj_btnOK" type="button" tabindex="4" onClick="pwFind();"><span class="ir_wa">찾기</span></button>
		</div>
	</c:if>	
	
</form> 