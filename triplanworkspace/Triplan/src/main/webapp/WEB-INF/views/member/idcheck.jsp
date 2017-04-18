<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function goCheck() {
		var userid = document.getElementById("userid"); 
		
		if(!userid.value || userid.value.trim()=="" ) {
		    alert("아이디를 입력하세요!!");
		    userid.focus();
		    return;
		}
		
		frmIdDupliChk.submit(); 
	}

</script>

</head>
<body bgcolor="#e6e6ff">
	
	<form name="frmIdDupliChk" action="/triplan/idcheck2.tp" method="post">
	<table width="95%" height="90%">
		<tr>
			<td>
				아이디:&nbsp;<input type="text" name="userid" id="userid" size="15" class="box" />   
				           <input type="button" value="확인" class="box" onClick="goCheck();" />
			</td>
		</tr>
	</table>
	</form>


</body>
</html>