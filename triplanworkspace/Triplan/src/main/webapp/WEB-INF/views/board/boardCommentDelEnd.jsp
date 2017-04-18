<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글삭제 완료</title>
</head>
<body>
	<script type="text/javascript">
	// #52. 글삭제 결과(성공/실패)에 따른 메시지 출력하기
		<c:if test="${result == true}">
			alert("댓글 삭제 완료");
			location.href="/triplan/boardView.tp?seq=${parentSeq}";
		</c:if>
		
		<c:if test="${result == false}">
			alert("댓글 삭제 실패");
			history.back();
		</c:if>
	</script>
</body>
</html>





