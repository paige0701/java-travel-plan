<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/style.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">


<style type="text/css">

iframe{
border-radius: 2%; 
}

.modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
 }
  
.modal-footer {
      background-color: #f9f9f9;
  }
  
 #idfooter {
    padding: 15px; 
    border-top: 1px solid #e5e5e5;
    background-color: #f9f9f9;
}
  
  .form-control {
    display: block;
    /* width: 100%; */
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>

 
<script type="text/javascript">
$(document).ready(function(){
	
	realtime();
	startCalls();
	$("#searchList").hide();
	
	  $(".x").hover(function(){
	         
	         $(this).css("font-weight","bold");
	         
	      },function(){
	         
	         $(this).css("font-weight","normal");
	         
	      })
	      
      $(".x").click(function(){     // 팝업닫기 
    	  if($("#pop_ck").val() != 0 && $("#pop_ck").val() != 999)
          {
    		  close_popup();
          } 
      })
      
      
      $("#screen").click(function(){  // 팝업닫기
         
          if($("#pop_ck").val() != null && $("#pop_ck").val() != 0 && $("#pop_ck").val() != 999)
         {
        	  close_popup();
         } 
         
      })
      
      // 이거 ///////////////////////////////////////////
	/* 
		$("#word").mouseover(function(){
			
			$(this).css("width",'150px');
			$(this).css("height",'250px'); 
			$("#searchList").css("top",$("#word").offset().top);
			$("#searchList").css("left",$("#word").offset().left);
			realtime();
			startCalls();
			
			$("#searchList").show();
		});
	
		
		 $("#searchList").mouseout(function(){
			$("#searchList").hide();
		});
	 */
	
	   $("#word").hover(
				  
				  function(){
					  $("#realtime").hide();
					  $("#searchList").show();
				  }
				 ,function(){
					 $("#searchList").hide();
					 $("#realtime").show();
		  		  }		
				 
		  )
	  
	  function startCalls()	
	  {
		setTimeout(function(){
			realtime();
			startCalls();
		}, 10000 );		// l0초마다 갱신
		
	  }
	  
	  function realtime()
	  {
		  $.ajax({
				url:"/triplan/realtimeSearch.tp",
				type:"GET",
				dataType:"html", 
	        	success: function(data){
	        		
	        		$("#searchList").html(data);	           
	        	 }
			});
	  }
	// 이거 ///////////////////////////////////////////	
	
})
function open_pop(id,top)
{
   var strtop = top+"px";
   $("#"+id).css("top",strtop);
    if(top < scrolltop)
   {
      setTimeout(function(){
         open_pop(id,top+5)
      },10);   
   }
}

function close_pop(id,top,opacity)
{
   var strtop = top+"px";
   $("#"+id).css("top",strtop);
   $("#"+id).css("opacity",opacity);
    if(top > scrolltop-150)
   {
      setTimeout(function(){
         close_pop(id,top-5,opacity-0.05)
      },10);   
   }
}

function overlay(opacity)
{
   $("#screen").css("opacity", opacity);
   if(opacity > 0.1)
   {
      setTimeout(function(){
         overlay(opacity-0.05)
      },10);   
   }
}

function overlay2(opacity)
{
   $("#screen").css("opacity", opacity);
   if(opacity < 1.0)
   {
      setTimeout(function(){
         overlay2(opacity+0.05)
      },10);   
   }
}

function close_popup() {
	
	var id = "";
	if($("#pop_ck").val() == 1) id="newschedule";
	else if($("#pop_ck").val() == 2) id="signUp";
	else if($("#pop_ck").val() == 3) id="idFind";
	else if($("#pop_ck").val() == 4) id="pwFind";
	else if($("#pop_ck").val() == 5) id="edit";
    close_pop(id,scrolltop,1.0); 
    overlay2(0.1);
    $("#pop_ck").val("999");
    setTimeout(function(){
    	$("#pop_ck").val("0");
    	$("#"+id).css("top","-500%");
    },330);
	
}

///////////////////////////////////////////////////////////////////////////

////로그인///

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
			document.loginFrm.submit();

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

//	---------------  영주 수정--------------	\\





  function allchk()         //   
  {
     var boor = document.getElementById("ckbox1").checked;
     
     var ckbArr = document.getElementsByName("ckbox2");
     
     for(var i=0;i<ckbArr.length;i++)
     {
       ckbArr[i].checked = boor;
     }
       
  }
  
  
  $(document).ready(function(){
      
	  ///////////////////////////////////////////////////
	  
	  
	  var name = "<%= request.getParameter("name") %>"
	  var mobile = "<%= request.getParameter("mobile") %>"
	  
	  if(name != "null" && mobile != "null")
	  {
		$("#name").val(name);
		$("#mobile").val(mobile);
	  } 
      
      
	  /////////////////////////////////////////////////
	  
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
   {                              /// 여기 수정을 해야함!!!!!!!!!!!!! 비번.. 아디...
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

   
   //////////////////// 비밀번호 찾기1
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
   
   
   
    /////////////////// 비밀번호 찾기 2
  
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
	   	
   }
   /* 

    ////////////////////// 아이디1
       var scrolltop = 0;
   var scrollt = 0;

   $(document).ready(function(){
            

       $(".idFind").click(function(){  // 팝업열기
         
         if($("#pop_ck").val() == 0)
         {
        	scrolltop = $(".head").offset().top+$(".head").height()+50;
 			scrollt = $(window).scrollTop();
            overlay(1.0);
            $("#idFind").css("opacity",1.0);
            open_pop("idFind", scrolltop-150);
            $("#pop_ck").val("999");
            setTimeout(function(){
            	$("#pop_ck").val("3");
            },330);
         }
      })
       
   });
    */
   /////////////////////// 아이디2
   $(document).ready(function(){
           
 	  var name = "<%= request.getParameter("name") %>"
	  var mobile = "<%= request.getParameter("mobile") %>"
	  
	  if(name != "null" && mobile != "null")
	  {
		$("#name").val(name);
		$("#mobile").val(mobile);
	  } 
	   
      $("#yj_idbtnOK").click(function(){
    	  
    	  frm.action = "/triplan/idFind2.tp";
    	  frm.submit();
    	  
      })
      
      
   });
   

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
	

</head>
<body>


		<!-- ----------- 아이디 찾기1 -------------- -->

  <div class="modal fade" id="ididfnd1" role="dialog" style="padding-top: 5%;">
    <div align="center" class="modal-dialog">
    
    <!-- Modal content-->
      <div class="modal-content" style=" height: 500px; ">
        <div class="modal-header" style="padding:35px 50px; height: 13%;">
          <h4 style="margin-top: -3%">아이디 찾기</h4>
        </div>
        <div class="modal-body" style="height: 80%; width: 100%;">
          
<div id="idFind" >
  <iframe style="border:none" id="idfi" name="idfi" width="100%" height="100%" src="<%=request.getContextPath() %>/idFind2.tp">
  </iframe>
</div>

        </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
     
      </div>
      
    </div>



	<!-- --------------- 비번찾기 1 ------------------ -->


  <div class="modal fade" id="pwpwfnd1" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 찾기</h4>
        </div>
        <div class="modal-body" style="height: 60%; width: 100%;">

<div id="pwFind" >
<iframe style="border:none" id="pwfi" name="pwfi" width="100%" height="100%" src="<%=request.getContextPath() %>/pwFind2.tp">
</iframe>
</div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- signup -->
  
      <!-- Modal content-->
      <form name="joinFrm" action="/triplan/insertMember.tp" method="post">
      <div class="modal fade" id="mysignup" role="dialog">
    <div class="modal-dialog">
     <div class="modal-content">
               <h2 align="center" class="modal-title">회원가입</h2>
  <table class="table table-bordered" style="width: 598px;">
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
            <select name="birth3">
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
      </div>
  </div>
  </div>
  
  </form>
      
  
    <!-- login -->
<!--     
   <div class="modal modal-center fade" id="mylogin" role="dialog" tabindex="-1" aria-labelledby="myCenterModalLabel">
    <div align="center" class="modal-dialog modal-center" role="document"> -->
    
    <div class="modal modal-center fade" id="mylogin"  tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" style="padding-top: 5%;">
  <div class="modal-dialog modal-center" role="document" style="width: 25%;">
    
    <!-- Modal content-->
      <div class="modal-content" style="width: 100%; ">
        <div class="modal-header" style="padding:10px 0px; height: 0%;">
          <h4 style="font-size: 16pt"> 로그인</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px; height: auto;" align="left">
          <form name="loginFrm" method="post" action="/triplan/login.tp" >
            <div class="form-group" align="center">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> ID</label>
              <input type="text" class="form-control" name="id" id="id" placeholder="ID" style="width: 130px;" <% if(isSaveID){%>
																				value="<%=cookie_value %>"
																			<% }%> >
            </div>
            <div class="form-group" align="center">
              <label for="psw" ><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
              <input type="password" class="form-control" name="pw" id="inputPwd" placeholder="PW" style="width: 130px;">
            </div>
           <div align="center">
        <input class="id_save" type="checkbox" name="id_save" id="ck" 
	 <% if(isSaveID){ %> 
		checked
	 <% }%> 
	/>
	<label for="ck" >
	<span class="id_save2" >
	아이디 저장
	</span>
	</label>
	</div>
	
	<br>
	 		<!-- <p>회원이 아니신가요? <a style="float: right" data-dismiss="modal" data-toggle="modal" data-target="#mysignup">회원가입하기</a></p> -->
            <p align="center" style="font-size: 8pt;">
            	<a  data-toggle="modal" data-target="#ididfnd1" data-dismiss="modal" >아이디찾기</a> / <a  data-toggle="modal" data-target="#pwpwfnd1" data-dismiss="modal" >비밀번호찾기</a> / <a data-dismiss="modal" data-toggle="modal" data-target="#mysignup">회원가입하기</a>
            </p>
          </form>
        </div>
        <div align="center" id="idfooter">
          <button type="submit" id="loginSubmit" class="btn btn-success btn-block" style="width: 100px;"><span class="glyphicon glyphicon-off"></span> 로그인</button>
         <!--  <p>회원이 아니신가요? <a href="#">회원가입하기</a></p>
          <p><a href="/triplan/idFind2.tp">아이디찾기</a> / <a href="/triplan/pwFind2.tp">비밀번호찾기</a></p> -->
        </div>
      </div>
      
      </div>
      
    </div>
  

			<!-- -----------비밀번호 찾기-------------- -->

					

			<!-- ---------------------- -->


<% 
	MemberVO loginUser = (MemberVO)session.getAttribute("member");
%>



 	<header class="head">
		<nav class="navbar navbar-default">
			<div class="">
				<div class="navbar-header">
<!-- 					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button> -->
					<a class="navbar-brand logo" href="/triplan/main.tp">TRIPLAN</a>
				</div>
								
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right list-inline">
						<% if(loginUser == null) { %>
						<li><a class="glyphicon glyphicon-user" data-toggle="modal" data-target="#mysignup">회원가입</a></li>
						<li><a class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#mylogin"> 로그인</a>
						<!-- <li><a class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#pwpwfnd1"> 비밀번호 찾기</a> -->
						<!-- <li><a class="signUp glyphicon glyphicon-user" href="#"> 회원가입</a></li>
						<li><a class="login glyphicon glyphicon-log-in" href="#" > 로그인</a> -->
						</li>
						<%}else{ %>
						<li>
							<a style="color: #1abc9c ; font-weight: bold;">
									<%= loginUser.getName() %>님 환영합니다 
								<span class=" glyphicon glyphicon-heart" >
								</span>
							</a>
						</li>
						<!-- <li><a class="chat" href="/triplan/chat.tp">채팅</a></li> -->
						<li><a class="plan glyphicon glyphicon-calendar" href="cd_myplan.tp" data-toggle="tooltip" data-placement="right" title="스케줄관리"></a></li>
						<%-- <li><a href=""><%= loginUser.getName() %> 님&nbsp;[ 내 정보 ]</a></li> --%>
						<li><a href="/triplan/logout.tp" data-toggle="tooltip" data-placement="bottom" title="로그아웃" class=" glyphicon glyphicon-log-out"></a></li>
						<%}%>
						<li><a class="help glyphicon glyphicon-question-sign" href="/triplan/boardList.tp" data-toggle="tooltip" data-placement="right" title="묻고답하기"></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header> 