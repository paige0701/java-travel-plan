<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 완료</title>
</head>
<body>
	<script type="text/javascript">
	// #44. 글수정 결과(성공/실패)에 따른 메시지 출력하기
		<c:if test="${result == true}">
			alert("글수정 완료");
		//	location.href="triplan/boardView.tp?seq=${seq}";
			location.href="boardView.tp?seq=${seq}";
			// 수정된 자신의 글을 보여주는 페이지로 이동
		</c:if>
		
		<c:if test="${result == false}">
			alert("글수정 실패");
			history.back();
		</c:if>
	</script>
</body>
</html>





