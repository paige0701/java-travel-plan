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
	alert("등록되었습니다 !");	

		$.ajax({
			
			url: "admin_list.tp",
			success: function(data){
			
				$("#yj_show").html(data);
			
			}
			
		})

	
	</script>
	
</body>
</html>