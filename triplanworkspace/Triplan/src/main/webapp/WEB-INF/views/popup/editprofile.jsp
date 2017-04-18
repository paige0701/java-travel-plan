<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.MemberVO" %>

<style>

#edit {
	width: 420px;
	height: 350px;
	top: -1000%;
	left: 37.5%;
	border: 1px solid gray;
	position: absolute;
	background-color: white;
	
}

#infocg { font-size: 20pt;}
</style>
<script type="text/javascript">

	var scrolltop = 0;
	var scrollt = 0;
	var scrollb = 0;

	$(document).ready(function(){
	
		var area_count = 0;
		
		
		$("#memberedit").click(function(){  // 팝업열기
			
			if($("#pop_ck").val() == 0)
			{
				scrolltop = $(".head").offset().top+$(".head").height()+50;
				scrollt = $(window).scrollTop();
				scrollb = $(window).scrollTop()+20;
				overlay(1.0);
				$("#edit").css("opacity",1.0);
				open_pop("edit",scrolltop-150);
				$("#pop_ck").val("999");
				setTimeout(function(){
					$("#pop_ck").val("5");
				},330);
			}
		})
		
		
	<!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->
		$(".in").css("border","1px solid #d9d9d9");
		
		
		$("#name_k").mouseover(function(){
			$("#name_k").css("border", "2px solid #66a3ff");
		});
		
		$("#name_k").mouseout(function(){   
		   $("#name_k").css("border", "1px solid #d9d9d9");
		});
		
		
		$("#passwd_k").mouseover(function(){
			$("#passwd_k").css("border", "2px solid #66a3ff");
		});
		
		$("#passwd_k").mouseout(function(){   
		   $("#passwd_k").css("border", "1px solid #d9d9d9");
		});
		
		
		$("#email_k ").mouseover(function(){
			$("#email_k").css("border", "2px solid #66a3ff");
		});
		
		$("#email_k ").mouseout(function(){   
		   $("#email_k").css("border", "1px solid #d9d9d9");
		});
		
		
		$("#pnum_k").mouseover(function(){
			$("#pnum_k").css("border", "2px solid #66a3ff");
		});
		
		
		$("#pnum_k").mouseout(function(){
		   
		   $("#pnum_k").css("border", "1px solid #d9d9d9");
		});
		
		 	 	 	
		
		<!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->	
		
	});
	
	 
	
	function editinfo()
	{
		var name = document.getElementById("name_k");
		var passwd = document.getElementById("passwd_k");
		var email = document.getElementById("email_k");
		var pnum = document.getElementById("pnum_k");
		
		if(name.value.trim()=="" || !name.value) {
			alert("이름을 입력하세요!");
			name.focus();
			return;
		}
		
		if(passwd.value.trim()=="" || !passwd.value) {
			alert("비밀번호를 입력하세요!");
			passwd.focus();
			return;
		}
		
		if(!validate_password( passwd.value.trim() ))
		{
			alert("암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.");
			passwd.focus();
			return;
		}
		
		if(email.value.trim()=="" || !email.value) {
			alert("이메일을 입력하세요!");
			email.focus();
			return;
		}
		
		if(!validate_email( email.value.trim() ))
		{
			alert("이메일을 제대로 입력하세요!");
			email.focus();
			return;
		}
			
		if(pnum.value.trim()=="" || !pnum.value) {
			alert("폰번호를 입력하세요!");
			pnum.focus();
			return;
		}
		
		if(!validate_onlyNumber( pnum.value.trim() ))
		{
			alert("(-)을 제외한 번호만 입력해주세요!");
			pnum.focus();
			return;
		}
		
		if( !(pnum.value.trim().length==11 || pnum.value.trim().length==10) )
		{
			alert("번호를 제대로 입력해주세요!");
		}
		
		infoform.submit();
	}	// end of editinfo()

	 function validate_onlyNumber(val)
	  {
		  var regExp = /^[0-9]+$/;
		  return regExp.test(val);
	  }
	  
	  
	  function validate_password(passwd) {
			var regexp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g; 
			// 암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합이 된것만 허락해주는 정규표현식 객체생성
		
			return regexp.test(passwd);
		}
		
		
		function validate_email(email) {
			var regexp = /^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g; 
			// e메일 정규표현식 객체생성
		
			return regexp.test(email);
		}
	   
	
</script>
<body>

<%
////////////////////////////////0702 동규 //////////////////////////////////
		MemberVO member = (MemberVO)session.getAttribute("member");

		String mobile = member.getMobile();
		String m1=null, m2=null, m3=null;
												
		if(mobile.length()==13)	// 폰번호가 11자 일때		010-0000- 0  0  0  0
		{
			m1 = mobile.substring(0,3);
			m2 = mobile.substring(4,8);
			m3 = mobile.substring(9);
		}													
		else if(mobile.length()==12){	// 폰번호가 10자 일때		010-000-00 0   0
			m1 = mobile.substring(0,3);
			m2 = mobile.substring(4,7);
			m3 = mobile.substring(8);												
		}
		
		mobile=m1+m2+m3;
		
////////////////////////////////0702 동규 //////////////////////////////////
%> 

 <!-- 회원정보 수정 -->
<div id="edit" align="center" style="background-color:white; height: 50%; border-radius: 15px;">

	<!-- <div align="center" style="background-color: green;"> -->
	<form name="infoform" action="/triplan/editinfo.tp" method="POST">
	<table border="0"  style="width: 100%; height: 100%;">
		
		<tr height="25%">
			<td colspan="2" align="center"><span id="infocg" style="color:gray;"><%= member.getName() %>님 회원정보 </span></td>
		</tr>
		<tr height="10%">
			<td colspan="2" align="center" style="vertical-align: top;"><b>ID : <%= member.getUserid() %></b></td>
		</tr>																													
		<tr height="12%">																					
			<td width="31%" align="left" style="padding-left: 30px;"><b>이름</b></td><td align="left" style="padding-left: 10px;"><input type="text" name="name" class="in" id="name_k" value="<%= member.getName()%>"></td>
		</tr>
		<tr height="12%">			
			<td width="31%" align="left" style="padding-left: 30px;"><b>비밀번호</b></td><td align="left" style="padding-left: 10px;"><input type="text" name="password" class="in" id="passwd_k" placeholder="PW를 입력하세요"></td>
		</tr>
		<tr height="12%">
			<td width="31%" align="left" style="padding-left: 30px;"><b>email</b></td><td align="left" style="padding-left: 10px;"><input type="text" name="email" class="in" id="email_k" value="<%= member.getEmail()%>"></td>
		</tr>
		<tr height="12%">
			<td width="31%" align="left" style="padding-left: 30px;"><b>핸드폰 번호</b></td><td align="left" style="padding-left: 10px;"><input type="text" name="mobile" class="in" id="pnum_k" value="<%= mobile%>">&nbsp;&nbsp; ( - 제외)</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button type="button" class="btn btn-default" onclick="editinfo()" >회원정보 수정</button></td>
		</tr>
	</table>
	</form>
	<!-- </div> -->
</div>

 --%>