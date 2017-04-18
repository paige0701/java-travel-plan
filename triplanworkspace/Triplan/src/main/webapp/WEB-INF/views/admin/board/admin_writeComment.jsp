<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("댓글등록 성공");
		
			
				 var form_data = { 
						 seq : "${parentSeq}"
				       };
				 
				 	 $.ajax({url: "/triplan/admin_showone.tp",
				    	 
				 	  type: "GET",
				      data: form_data, 
				      dataType: "html", 
				      success: function(data){
				   	  var result = data;
				   	   
				   	  	$("#content").empty;
						$("#content").html(result);  			
						           
				      }// end of success----------------------
				  });// end of $.ajax();----------------------	
				 
	
		</c:if>
		<c:if test="${n == 0}">
		alert("댓글등록 실패");
		</c:if>
	
	</script>



</body>
</html>