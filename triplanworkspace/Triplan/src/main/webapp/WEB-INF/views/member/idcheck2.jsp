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
	
	function setID(uid) {
		// opener인 부모창(member.jsp 회원가입 페이지)의 
		// userid 텍스트박스에 uid 값을 넣어주면 된다.
		opener.document.joinFrm.userid.value = uid;
		opener.document.joinFrm.password.focus();
		
		// 팝업창 닫기(idcheck.jsp 페이지 닫기)
		self.close();
	}


</script>
</head>
<body>

	<%
		int chk = (Integer)request.getAttribute("check");
	
		if(chk==0){
	%>
		<br/><br/>
			 <div align="center">
			 ID로 [<span style="color: red; font-weight: bold;" >${userid}</span>]를 사용할 수 있습니다.
			 <br/><br/>
			 <input type="button" value="닫기" onClick="setID('${userid}');"/>
			 </div>
	<%
		}
		else{ 
	%>		
		<br><br>
			<div align="center">
			 <span style="color: red; font-weight: bold;" >${userid}는 이미 사용중입니다.</span>
			 <br/>
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
		 </div>
			
	<%		
		}
	%>

</body>
</html>