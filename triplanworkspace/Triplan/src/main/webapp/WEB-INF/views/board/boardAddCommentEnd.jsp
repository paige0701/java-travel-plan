<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글쓰기 완료</title>
</head>
<body>
	<script type="text/javascript">
	// #69. 댓글쓰기 결과 메시지 출력한 후 
	//      해당 게시물의 원글 페이지로 이동하기
		alert("댓글쓰기 완료");
		location.href="/triplan/boardView.tp?seq=${vo.parentSeq}";
	</script>
</body>
</html>





