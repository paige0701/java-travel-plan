<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

#signUp {
   width: 550px;
   height: auto;
   top: -1000%;
   left: 35%;
   border: 1px solid gray;
   position: absolute;
   background-color: white;
   
  
}
.error { font-size: 10pt;} 
</style>    
    
<script type="text/javascript">

   var scrolltop = 0;
   var scrollt = 0;

   $(document).ready(function(){
            

      $(".signUp").click(function(){  // 팝업열기
         
         if($("#pop_ck").val() == 0)
         {
        	scrolltop = $(".head").offset().top+$(".head").height()+50;
  			scrollt = $(window).scrollTop();
            overlay(1.0);
            $("#signUp").css("opacity",1.0);
            open_pop("signUp", scrolltop-150);
            $("#pop_ck").val("999");
            setTimeout(function(){
            	$("#pop_ck").val("2");
            },330);
         }
      })

   });
      

 
  function allchk()			//   
  {
     var boor = document.getElementById("ckbox1").checked;
     
     var ckbArr = document.getElementsByName("ckbox2");
     
     for(var i=0;i<ckbArr.length;i++)
     {
    	ckbArr[i].checked = boor;
     }
       
  }
  
  
  $(document).ready(function(){
      
	  $(".error").hide();
	  $("#all").hide();
	  $("#all2").hide();
	  
	  // 아이디
	  $("#usrid").blur(function(){
			
			var userid = $("#usrid").val().trim();
			
			if(userid=="") { 
				$("#usrid").val("");
				$("#usrid").parent().find(".error").show();
			}
			else { 
				$("usrid").parent().find(".error").hide();
			}
			
		});
	  
	  $("#td1").click(function(){
		 $("#usrid").parent().find(".error").hide();
		 $("#idcheck").click();
	  });
	  
	  
	  $("#usrid").click(function(){
		  $("#usrid").parent().find(".error").hide();
		  $("#idcheck").click();
		});
	  
	  $("#idcheck").click(function(){
			var url="/triplan/idcheck.tp";
			
			// 팝업창 띄우기
			window.open(url,"idcheck",
					    "width=300px, height=200px, left=500px, top=250px, resizable=no, status=no, scrollbars=no, menubar=no");        
		});
	  
	  
	  // 패스워드
	  $("#passwd").blur(function(){
			var passwd = $("#passwd").val().trim();
			
			if( validate_password(passwd) ) {
				// 정규식 패턴에 맞으면
				$("#passwd").parent().find(".error").hide();
			}
			else { // 정규식 패턴에 맞지 않으면
				$("#passwd").val("");
				$("#passwd").parent().find(".error").show();
			}
			
		});
	  
	  $("#td2").click(function(){
			 $("#passwd").focus();
		  });
	  
	  $("#passwd").focus(function(){
			$("#passwd").parent().find(".error").hide();
		});
	  
	  // 비밀번호 재확인
	  $("#passwd2").blur(function(){
			var passwd = $("#passwd").val();
			var passwd2 = $("#passwd2").val();			
			
			if( passwd != passwd2) {  // 암호와 암호확인의 값이 같지 않으면 
				$("#passwd2").val("");
				$("#passwd2").parent().find(".error").show();
			} else { // 암호와 암호확인의 값이 일치하면
				$("#passwd2").parent().find(".error").hide();
			}
		});
		
	  	$("#td3").click(function(){
	  		$("#passwd2").focus();
	  	});
	  
		$("#passwd2").focus(function(){
			$("#passwd2").parent().find(".error").hide();
		});
	  
		
		// 이름 or 성별
		$("#td4").click(function(){
			$("#name").focus();
		});	
		
		$(".gen").click(function(){
			$(".gen").parent().find(".error").hide();
		});
		
		$("#name").focus(function(){
			$("#name").parent().find(".error").hide();
		});
		
		$("#name").blur(function(){
			
			var genderArr = document.getElementsByName("gender");
			var ck = genderArr[0].checked;
			var ck2 = genderArr[1].checked;
			
			var name = $("#name").val().trim();
			
			if(name==""  ||  (ck==false && ck2==false) )
			{
				$("#name").parent().find(".error").show();
			}
			else{
				
				$("#name").parent().find(".error").hide();
			}
		});
		
		$(".gen").click(function(){
			
			var genderArr = document.getElementsByName("gender");
			var ck = genderArr[0].checked;
			var ck2 = genderArr[1].checked;
			
			var name = $("#name").val().trim();
			
			if(name==""  ||  (ck==false && ck2==false) )
			{
				$("#name").val("");
				$("#name").parent().find(".error").show();
			}
			else{
				
				$("#name").parent().find(".error").hide();
			}
		});
		
		$("#birth1").click(function(){
			$("#birth1").parent().find(".error").hide();
		});
		
		
		// 생일
		$("#birth1").blur(function(){
			var val = $("#birth1").val().trim();
		
			if(validate_onlyNumber(val))
			{
				$("#birth1").parent().find(".error").hide();
			}
			else{
				$("#birth1").parent().find(".error").show();
				$("#birth1").val("");
			}
		});
		
		// 이메일
		$("#td6").click(function(){
			$("#email").focus();
		});
		
		$("#email").focus(function(){
			$("#email").parent().find(".error").hide();
		});
		
		$("#email").blur(function(){
			var eval = $("#email").val().trim();
			
			if(validate_email(eval))
			{
				$("#email").parent().find(".error").hide();
			}
			else{
				$("#email").parent().find(".error").show();
				$("#email").val("");
			}
		});
		
		
		// 폰번호 		
		$("#td7").click(function(){
			$("#pnumber").focus();
		});
		
		$("#pnumber").focus(function(){
			$("#pnumber").parent().find(".error").hide();
		});
		
		$("#pnumber").blur(function(){
			
			var pval = $("#pnumber").val().trim();
			
			if(validate_onlyNumber(pval))
			{
				$("#pnumber").parent().find(".error").hide();
			}
			else{
				$("#pnumber").parent().find(".error").show();
				$("#pnumber").val("");
			}
		});
		
		
		// 약관
		$("#btn1").click(function(){
			$("#all").toggle();
			//$("#all").toggleClass("son1");
		});
		
		$("#btn2").click(function(){
			$("#all2").toggle();
			//$("#all2").toggleClass("son2");
		});
		
		
   });
  
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
   
   
   function delspace(str)
   {
      while(true)
      {
         var index = str.indexOf(" ");
         
         if(index==-1)
            break;
         
         str = str.substring(0,index)+str.substring(index+1,str.length);
      }
      return str;
   }
   
   function insertm()
   {										/// 여기 수정을 해야함!!!!!!!!!!!!! 비번.. 아디...
	   var joinFrm = document.joinFrm;
   
   		// 아이디
	   	var userid = document.getElementById("usrid");
		
		if(userid.value.trim()=="" || !userid.value) {
			alert("ID를 입력하세요");
			userid.focus();
			return;
		}
   
		// 암호
		if(joinFrm.password.value.trim()=="" || !joinFrm.password.value) {
			alert("암호를 입력하세요");
			joinFrm.password.focus();
			return;
		}
		
		// 암호 확인
		if(joinFrm.passwdck.value.trim()=="" || !joinFrm.passwdck.value) {
			alert("암호확인을 입력하세요");
			joinFrm.passwdck.focus();
			return;
		}
   		
		
		// 이름
	   if(joinFrm.name.value.trim()=="" || !joinFrm.name.value) {
			alert("이름을 입력하세요");
			joinFrm.name.focus();
			return;
		}
		
		// 성별
	   var genderArr = document.getElementsByName("gender");
	   var bool1 = genderArr[0].checked;
	   var bool2 = genderArr[1].checked;
	   
		if(bool1==false && bool2==false)
		{
			alert("성별 체크를 해주세요!");
			return;
		}
		
		// 생일
		var birthval = document.getElementById("birth1").value;
		
		if(birthval=="" || (birthval.length <4))
		{
			alert("생년월일을 정확히 입력해주세요!");
			return;
		}
		
		
		// 이메일
		if(joinFrm.email.value.trim()=="" || !joinFrm.email.value) {
			alert("이메일을 입력하세요");
			joinFrm.email.focus();
			return;
		}
		
		// 폰번호
		if(joinFrm.mobile.value.trim()=="" || !joinFrm.mobile.value ) {
			alert("휴대폰 번호를 입력하세요");
			joinFrm.mobile.focus();
			return;
		}
		
		// 이용약관에 체크를 안한 경우		
		var ckbArr = document.getElementsByName("ckbox2");
		var bool1 = ckbArr[0].checked;
		var bool2 = ckbArr[1].checked;
		
		if( !(bool1==true && bool2==true) )
		{
			alert("약관을 모두 체크해주세요");
			return;
		}
		
		
   		
	   joinFrm.submit();
   }
   
   
</script>
  
<body>

<div id="signUp" align="center">
  <h3> 회원가입 </h3>           
  <form name="joinFrm" action="/triplan/insertMember.tp" method="post">
  <table class="table table-bordered" style="width: 550px;">
    <thead>
      <tr>
        <td id="td1" height="30px;">
           <label for="usr">아이디(ID)  :  </label>&nbsp;&nbsp;
            <input type="text" name="userid" id="usrid" placeholder="ID를 입력하세요" size="30" maxlength="30" style="border: 0px">&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-default" id="idcheck">ID중복 체크</button>
            <br>
            <span style="color: red; font-weight: bold;" id="er1" class="error">ID는 필수입력 정보입니다.</span>
         </td>
    
      </tr>
    </thead>
    <tbody>
      <tr>
        <td id="td2" height="30px;">
         <label for="passwd">비밀번호(PW)  :  </label>&nbsp;&nbsp;
            <input type="password" name="password" id="passwd" placeholder="비밀번호를 입력하세요" size="30" maxlength="30" style="border: 0px"><br>
            <span style="color: red; font-weight: bold;" id="er2" class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
      </td>
       
      </tr>
      <tr>
        <td id="td3" height="30px;">
           <label for="passwd2">비밀번호 재확인  :  </label>&nbsp;&nbsp;
            <input type="password" name="passwdck" id="passwd2" placeholder="비밀번호를 다시 한번 입력하세요" size="30" maxlength="30" style="border: 0px"><br>
            <span style="color: red; font-weight: bold;" id="er3" class="error">암호가 일치하지 않습니다.</span>
        </td>
      
      </tr>
      <tr>
         <td align="center">
            <span style="font-weight: bold;"> - 본인 상세 정보 - </span>
         </td>
      </tr>
      <tr>
        <td id="td4" height="30px;">
         <label for="name">이름(Name) :  </label>&nbsp;&nbsp;
            <input type="text" name="name" id="name" placeholder="이름을 입력하세요" size="30" maxlength="30" style="border: 0px">&nbsp;&nbsp;&nbsp;&nbsp;
            <b>남자</b> <input type="radio" name="gender" value="남" class="gen"/>&nbsp;&nbsp;<b>여자</b> <input type="radio" name="gender" value="여" class="gen"/>
            <br>
            <span style="color: red; font-weight: bold;" id="er4" class="error" >이름과 성별은 필수입력 정보입니다.</span>
      	</td>
       
      </tr>
      <tr>
        <td id="td5" height="30px;">
         <label for="birth">생년(Birth)  :  </label>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="birth1" id="birth1" placeholder="4자리" size="4" maxlength="4" style="border: 0px">년&nbsp;&nbsp;&nbsp;&nbsp;
            월 : 
            <select name="birth2">
               <option value="01">1월</option>
               <option value="02">2월</option>
               <option value="03">3월</option>
               <option value="04">4월</option>
               <option value="05">5월</option>
               <option value="06">6월</option>
               <option value="07">7월</option>
               <option value="08">8월</option>
               <option value="09">9월</option>
               <option value="10">10월</option>
               <option value="11">11월</option>
               <option value="12">12월</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;
            일 : 
            <select name="birth3" >
               <option value="01">1일</option><option value="02">2일</option><option value="03">3일</option><option value="04">4일</option><option value="05">5일</option>
               <option value="06">6일</option><option value="07">7일</option><option value="08">8일</option><option value="09">9일</option><option value="10">10일</option>
               <option value="11">11일</option><option value="12">12일</option><option value="13">13일</option><option value="14">14일</option><option value="15">15일</option>
               <option value="16">16일</option><option value="17">17일</option><option value="18">18일</option><option value="19">19일</option><option value="20">20일</option>
               <option value="21">21일</option><option value="22">22일</option><option value="23">23일</option><option value="24">24일</option><option value="25">25일</option>
               <option value="26">26일</option><option value="27">27일</option><option value="28">28일</option><option value="29">29일</option><option value="30">30일</option>
               <option value="31">31일</option>
            </select>
            <br>
            <span style="color: red; font-weight: bold;" id="er5" class="error">태어난 년도 4자리를 정확하게 입력하세요</span>
      </td>
       
      </tr>
      <tr>
        <td id="td6" height="30px;">
         <label for="email">이메일(email)  :  </label>&nbsp;&nbsp;
            <input type="text" name="email" id="email" placeholder="이메일 입력하세요" size="30" maxlength="30" style="border: 0px"><br>
            <span style="color: red; font-weight: bold;" id="er6" class="error">이메일을 입력해주세요</span>
      </td>
       
      </tr>
      <tr>								
        <td id="td7" height="30px;">
         <label for="pnumber">휴대폰 번호  :  </label>&nbsp;&nbsp;
            <input type="text" name="mobile" id="pnumber" placeholder="휴대폰번호를 입력하세요( - 제외)" size="30" maxlength="30" style="border: 0px"><br>
            <span style="color: red; font-weight: bold;" id="er7" class="error">휴대폰 번호를 입력해주세요</span>
      </td>
      </tr>
      <tr align="center">
        <td style="padding-top :10px;">이용약관, 개인정보 수집 및 이용에 동의합니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <label for="ck"><input type="checkbox" id="ckbox1" onclick="allchk();"/></label> 
        </td>
      </tr>					
      <tr>					
        <td>
           <b>이용약관 동의<span style="color: green;">(필수)</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="checkbox" name="ckbox2">
           <button type="button" id="btn1" class="btn btn-default" style="float: right; padding-right: 20px;">전문보기</button><br><br>
           <iframe id="all" src="<%= request.getContextPath()%>/agree.tp" width="95%" height="150px" class="box"></iframe>
        </td>
      </tr>
      <tr>
        <td>
           <b>개인정보 수집 및 이용 동의<span style="color: green;">(필수)</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="checkbox" name="ckbox2">
           <button type="button" id="btn2" class="btn btn-default" style="float: right; padding-right: 20px;">전문보기</button><br><br>
           <iframe id="all2" src="<%= request.getContextPath()%>/agree.tp" width="95%" height="150px" class="box"></iframe>
        </td>
      </tr>
      <tr align="center" style="border-bottom-color: white; border-left-color: white; border-right-color: white;">
         <td style="border-bottom-color: white; border-left-color: white; border-right-color: white;">
            <button type="button" class="btn btn-default" onclick="insertm()" >회원가입</button>
         </td>
      </tr>
    </tbody>
  </table>
  </form>
</div> --%>