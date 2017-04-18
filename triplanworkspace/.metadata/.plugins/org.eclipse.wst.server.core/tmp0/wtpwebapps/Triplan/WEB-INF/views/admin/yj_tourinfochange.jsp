<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.model.*" %>
<%@ page import="com.spring.triplan.*" %>
<%@ page import="java.util.*" %>

<title>상세정보보기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function yj_changetr()
	{
		document.cngtrFrm.submit();
	}

	function yj_canceltr()
	{
		self.close();
	}
</script>

<style type="text/css">

.changeInfoTable {border:1px solid red; 
			  width:80%;
			  display: relative; 
			  margin-top: 10%;
			  border-radius: 20px; 
			  
			   }
			   
.changeInfoTable tr {border:1px solid gray;  padding:2%; font-size: 10pt; border-radius: 20px; }
.changeInfoTable td {border:1px solid gray;  padding:2%; font-size: 10pt; border-radius: 20px; }

</style>

</head>

<body>
<div id="cd_content" style="width:100%; " align="center">
	
	<form name="cngtrFrm" action="/triplan/tourinfochangeEnd.tp" method="post" >
		<table class="changeInfoTable" >
		      <tr>
		        <td colspan="3" align="center" >
			        <span style="font-size:25pt; font-weight: bold; display:inline-table;" >
			        ${tvo.t_name}
			        </span>
		        </td>
		      </tr>
		      <tr>
		      	<td align="center" style="width :40%; ">분류</td>
		      	<td align="left">
		      		<select name="t_type" id="t_type">
		      			<c:forEach  var="typelist" items="${typelist}" varStatus="status">
		      				<option value="${typelist.type_idx}">${typelist.type_name}(${typelist.type_idx})</option>
		      			</c:forEach>
		      		</select>
				</td>
		      </tr>
		      <tr>
				<td align="center">시작날짜 ~ 종료날짜<br>(공연,전시,체험인 경우만)</td>
				<td>
					<input type="text" size="6" name="t_start_date"> ~ 
					<input type="text" size="6" name="t_end_date">
				</td>
			  </tr>
		      <tr>
		      	<td align="center">관광지명</td>
		      	<td align="left"><input type="text" name="t_name" value="${tvo.t_name}" /></td>
		      </tr>
		      <tr>
		      	<td align="center">소개</td>
		      	<td align="left"><input type="text" name="t_detail" value="${tvo.t_detail}" /></td>
		      </tr>
		      <tr>
				<td align="center">사진</td>
				<td align="left" style="padding-left: 10px;">
					<input type="file" name="attach">
				</td>
		      <tr>
		      	<td align="center">상세지역코드</td>
		      	<td align="left">
		      		<select name="de_area_code" id="de_area_code">
		      			<c:forEach  var="advo" items="${adlist}" varStatus="status">
		      				<option value="${advo.de_area_code}">${advo.de_area_name}(${advo.de_area_code})</option>
		      			</c:forEach>
		      		</select>
		      	</td>
		      </tr>
		      <tr>
		      	<td align="center">주소</td>
		      	<td align="left"><input type="text" name="t_addr" value="${tvo.t_addr}" style="width: 300px;" /></td>
		      </tr>
		      <tr>
		      	<td align="center">관광지 위치</td>
		      	<td align="left"> x : <input type="text" name="tx" value="${tvo.tx}" /><br/><br/>
		      						y : <input type="text" name="ty" value="${tvo.ty}" /></td>
		      </tr>
		</table>
			
			<br>
			<hr>
			<br>
				<input type="hidden" name="t_idx" value="${tvo.t_idx}" />
				<div align="center">
					<button type="button" class="btn btn-default" onclick="yj_changetr();" >수정완료</button>
					<button type="button" class="btn btn-default" onclick="yj_canceltr();">취소</button>
				</div>
	</form>
	
</div>
</body>
