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


#yj_name {
	width: 70%;
	height: 10%;
	margin: 5% 0 0 13%;
	position: absolute;
	
}



#YJ_name>input {
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



#yj_mobile {
	width: 70%;
	height: 10%;
	margin: 20% 0 0 13%;
	position: absolute;
}

#YJ_mobile>input {
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




   $(document).ready(function(){
           
 	  var name = "<%= request.getParameter("name") %>"
	  var mobile = "<%= request.getParameter("mobile") %>"
	  
	  if(name != "null" && mobile != "null")
	  {
		$("#name").val(name);
		$("#mobile").val(mobile);
	  } 
	  
	   
      $("#yj_btnOK").click(function(){
    	  
    	  frm.action = "/triplan/idFind2.tp";
    	  frm.submit();
    	  
      })
      
      

      
      
   });
      
</script>
<form name="frm" style="height: 90%; width: 100%;">
<div id="yj_name" align="center">
	<span>이름 </span> <br><input id="name" name="name" type="text" placeholder="Name" required />
</div>

<div id="yj_mobile" align="center">
	휴대전화 <br><input id="mobile" name="mobile" type="text" placeholder="tel" required />
</div>



<div id="yj_find">
	
	<c:if test="${userid != null && userid != 'null'}">
		<span>ID:<span style="color: blue;"> ${userid}</span><br></span>
	</c:if>
	
	<c:if test="${userid == 'null'}">
		<span>사용자 정보가 없습니다.</span>
	</c:if>
	



</div>



<div id="yj_btn" align="center">
	<button class="btn btn-default" id="yj_btnOK" type="button" tabindex="4"><span class="ir_wa">찾기</span></button>
</div>

</form>