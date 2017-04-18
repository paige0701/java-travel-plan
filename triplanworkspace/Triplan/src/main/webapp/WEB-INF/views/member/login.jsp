<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.*" %>   
    
<script type="text/javascript">

	var login_ck=0;

	$(document).ready(function(){
		
		$(".login_form").hide();
		
		$(".plan").click(function(){
			
			if(login_ck == 1)
			{
 				login_form_close();
			} 
			
		})
		
		$(".login").click(function(){
			if(login_ck==0)
			{
				login_form_open();
			}
			else 
			{
				login_form_close();
			}
		})
		
		$(".register").click(function(){
			
			if(login_ck == 1)
			{
 				login_form_close();
			} 
			
		})
		
		$(".help").click(function(){
			
			if(login_ck == 1)
			{
 				login_form_close();
			} 
			
		})
		
		$("#main").click(function(){
			
 			if(login_ck == 1)
			{
 				login_form_close();
			} 
			
		})
		
		/* $("#myNavbar").click(function(event){
			
			event.preventDefault();
			
		}) */
		
		///////////////////////////////////////////
		$("#loginSubmit").click(function(event){
			var id = $("#id").val();
			var inputPwd = $("#inputPwd").val();
		
			if(id == null || id.trim()=="") {
				alert("아이디를 입력하세요!!");
				$("#id").val("");
				$("#id").focus();
				event.preventDefault();
				return;
			}
			
			if(inputPwd == null || inputPwd.trim()=="") {
				alert("암호를 입력하세요!!");
				$("#inputPwd").val("");
				$("#inputPwd").focus();
				event.preventDefault();
				return;
			}
			
			loginFrm.submit();
			
		});
	////////////////////////////////////////////////////	
	});
	
	function login_form_open(){
		$(".login_form").css("opacity",1);
		$(".login_form").show();
		login_ck=1;	
	}
	
	function login_form_close(){
		$(".login_form").css("opacity",0);
		$(".login_form").hide();
		login_ck=0;	
	}

</script>

<%
	
		// 로그인이 성공하지 못한 경우(로그인 하기전이나 로그인 실패인 경우)
		Cookie cookieArr[] = request.getCookies();	// 웹 클라이언트가 보내준 쿠키들의 정보를 받는것이다.(여러개의 쿠키정보가 보내어진다!)
		
		String cookie_key ="";
		String cookie_value ="";
		boolean isSaveID = false;
		
		if(cookieArr != null)
		{
			for( Cookie cobj :cookieArr )
			{
				cookie_key = cobj.getName();	// 쿠키의 키값을 알아오는 것!(쿠키의 이름)
				
				if(cookie_key.equals("saveid"))		// 쿠키가 여러개 있을수 있으니 그중 saveid 값을 찾자!
				{
					cookie_value = cobj.getValue();	// 쿠키의 키값에 해당하는 값을 가져오는 것
					isSaveID = true;		// 키값을 찾으면 바로 종료!!!
					break;
				}
								
			}	// end of for loop
		}
%>
	
<form name="loginFrm" method="post" action="/triplan/login.tp" >
<div class="login_form">
<div class="box_user">
<fieldset class="login_fieldset">
 
<div class="login_input">
<input type="text" id="id" name="id" class="tf_login" maxlength="50" tabindex="2" 
																			<% if(isSaveID){%>
																				value="<%=cookie_value %>"
																			<% }%>>	
<input type="password" id="inputPwd" name="pw" class="tf_login tf_pw" value="" maxlength="32" tabindex="3">
</div>
<button type="button" id="loginSubmit" class="btn btn-default" tabindex="4"><span class="ir_wa">로그인</span></button>
<div class="login_option">
	
	<input class="id_save" type="checkbox" name="id_save" id="ck" 
	 <% if(isSaveID){ %> 
		checked
	 <% }%> 
	/>
	<label for="ck">
	<span class="id_save2">
	아이디 저장
	</span>
	</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span><a class="idFind" href="#">아이디 찾기</a></span>
	<span>/</span>
	<span><a class="pwFind" href="#">비밀번호 찾기</a></span>
</div>

</fieldset>
</div>
</div>
</form>


