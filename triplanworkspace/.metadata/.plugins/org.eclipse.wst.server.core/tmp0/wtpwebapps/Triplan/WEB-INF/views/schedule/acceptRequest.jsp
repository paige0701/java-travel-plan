<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<script type="text/javascript">
	
	alert("스케줄에 참여되었습니다.");
	$.ajax({url: "/triplan/getRequestedInvite.tp",
	 	  type: "GET",
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here").empty();
			$("#here").html(result);  			
			           
	      }// end of success----------------------
	      ,error: function(data){
	    	
	    	 alert("확인하삼..");
	      }
	  });// end of $.ajax();----------------------		
		 
	
	</script>
	
	

</body>
</html>