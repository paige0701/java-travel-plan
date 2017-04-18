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
	
		
		 $.ajax({
			
			url: "inviteSchedule.tp?sc_idx="+"${sc_idx}",
			success: function(data){
			
				alert("스케줄에 초대했습니다.");	
				$("#here").html(data);
			
			}
			
		})
	
	
	</script>
	
	

</body>
</html>