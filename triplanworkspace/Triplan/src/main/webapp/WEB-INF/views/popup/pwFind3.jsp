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
	width: 35%;
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
	width: 35%;
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

#pwChange {
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
}

	
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">

/* var scrolltop = parseInt($(window).scrollTop()/$(window).height()*100)*1.45; */

function pwchange(){
	
		var pcfrm = document.pcfrm;
		var newpw = document.getElementById("newpw").value;
		var newpw2 = document.getElementById("newpw2").value; 
		
		if(newpw!=newpw2)
		{ 
			alert("비밀번호가 일치하지 않습니다!");
			return;
		}
			
		if(validate_password(newpw))
		{

				alert("변경되었습니다.");
				parent.close_popup(); 
				window.location.reload(); 
				pcfrm.submit();
				
		}
		else{
			alert("비밀번호 형식에 적합하지 않습니다! ");
			return;
		}
		
		
	
	
}

function validate_password(passwd) {
	var regexp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g; 
	// 암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합이 된것만 허락해주는 정규표현식 객체생성

	return regexp.test(passwd);
}


</script>    
    
    
<form name="pcfrm" >

	<div id="yj_id" align="center">
		새로운 비밀번호: <br><input type="text" id="newpw" name="newpw" placeholder=" " required />
	</div>
	<div id="yj_email" align="center">
		새로운 비밀번호 확인: <br><input type="text" id="newpw2" name="newpw2" placeholder=" " required />
	</div>
	<input type="hidden" name="userid" value="${userid}" />
	<div id="yj_btn" align="center">
		<button class="btn btn-default" id="pwChange" type="button" tabindex="4" onClick="pwchange();"><span class="ir_wa">변경</span></button>
	</div>

</form> 