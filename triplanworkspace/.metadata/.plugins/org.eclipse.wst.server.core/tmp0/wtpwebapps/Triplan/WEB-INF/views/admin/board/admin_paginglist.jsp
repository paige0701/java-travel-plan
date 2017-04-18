<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" >

$(document).ready(function(){
	
	// alert("이억.ㄱ..ㄱ.ㄱ");
	
});

</script>



<c:if test="${not empty list }">
    <table id="table" style="width:70%">
			<tr>
				<th style="width:50px;">번호</th>
			<th style="width:320px;">제목</th>
			<th style="width:70px;">USERID</th>
			<th style="width:180px;">날짜</th>
			<th style="width:70px;">조회수</th>
			<!-- #123. 파일과 크기를 보여주도록 수정한다. -->
			<th style="width:70px;">파일</th>
			<th style="width:100px;">크기(bytes)</th>
		</tr>
		
		<!-- #21. BoardController 에서 보내온 결과물의 키값인 list 를 
		          JSTL을 사용하여 출력한다. -->
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.seq}</td>
				
				<c:if test="${vo.depthno > 0}">		
				<td>
				<span style="color: red; padding-left: ${vo.depthno * 20}px;">
				re:
				</span>
				<a href="javascript:showOne('${vo.seq }')">${vo.subject}</a>
				</td></c:if>	
				<c:if test="${vo.depthno == 0}">
				<td><a href="javascript:showOne('${vo.seq }')">${vo.subject}</a></td>
				</c:if>
				<td>${vo.userid}</td>
				<td>${vo.regDate}</td>
				<td align="center">${vo.readCount}</td>
				
				<!-- 
				#126. 첨부파일 여부 표시하기 그리고 첨부파일을 다운로드 할 수 있도록 URL 링크 걸어주기
				먼저 /webapp/resources/images 라는 폴더를 생성한다.
				images 폴더 아래에 disk.gif 라는 이미지파일을 저장한후 아래와 같이 한다. -->
				<td align="center">
				<c:if test="${not empty vo.fileName}">
					
						<img src="/triplan/resources/images/disk.gif" border="0">
				</c:if>	 
				</td>
				
				<td align="center"> 
				<c:if test="${not empty vo.fileName}">
					${vo.fileSize} <!-- 파일크기 -->
				</c:if>	
				</td>
				
			</tr>
		</c:forEach>
		
	</table>
	</c:if>
	<ul class="pager" style="width:70%">
    <li class="previous"><a href="#previous" onClick="previousTen('${start}','${end}')">Previous</a></li>
    <li class="next"><a href="#next" onClick="nextTen('${start}','${end}')">Next</a></li>
  </ul>