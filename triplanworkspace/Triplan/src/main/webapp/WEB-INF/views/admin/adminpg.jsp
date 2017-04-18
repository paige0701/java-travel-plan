<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#loginSubmit").click(function(event){

			var adminid = $("#adminid").val();
			var password = $("#password").val();
		
			if(adminid == null || adminid.trim()=="") {
				alert("아이디를 입력하세요!!");
				$("#adminid").val("");
				$("#adminid").focus();
				event.preventDefault();
				return;
			}
			
			if(password == null || password.trim()=="") {
				alert("암호를 입력하세요!!");
				$("#password").val("");
				$("#password").focus();
				event.preventDefault();
				return;
			}
			
			adminFrm.submit();
			
		});
});
		
</script>		


<title>관리자 드루와</title>
</head>
<body>
	<form id="adminFrm" action="adminlogin.tp" method="post">
		<h1 align="center" style="padding-top: 15%">Admin Page</h1>
		
		<p>
		
		<div align="center" >
		
			<div id="admin_id" >
				ID: <input id="adminid" name="adminid" type="text" required />
			</div>
	
			<div id="admin_pw" style="padding-top: 5px; padding-bottom: 5px;">
				PW: <input id="password" name="password" type="password" required />
			</div>
			
			<button type="button" id="loginSubmit" ><span class="ir_wa">로그인</span></button>
			
		</div>
		
	</form>
	
</body>
</html>