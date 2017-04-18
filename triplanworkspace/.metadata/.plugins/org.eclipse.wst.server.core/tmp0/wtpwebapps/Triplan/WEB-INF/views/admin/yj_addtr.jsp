<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">



$(document).ready(function(){
	
	$("#yj_area_code").val(1);
	$("#t_type	").val(1);
	
	$(".type").change(function(){
		if($(this).val() == 1) {
			$(".selinfo").text("Start Day ~ End Day");
		}
		
		if($(this).val() == 2) {
			$(".selinfo").text("Open ~ Close");
		}
		
		if($(this).val() == 3) {
			$(".selinfo").text("입실 ~ 퇴실");
		}
	});
	
	
	//			변경했을때
	$("#yj_area_code").change(function(){
		
		if(parseInt($(this).val()) >= 5)
		{
			$("#yj_code").find("#yj_de_area_code").remove();
			yj_getDeAreaCode($(this).val());
		}
		else {
			$("#yj_code").find("#yj_de_area_code").remove();
		}
		
	});
	
});

 
 function addtr(){

	 addtrfrm.submit();
	 
 }
 
 
 //				area 지역 코드 가져오기
 function yj_getDeAreaCode(p_area_code)
 {
	 $.ajax({
		 url: "tdacode.tp",
		 type: "post",
		 data : {area_code : p_area_code},
		 dataType: "html",
		 success: function(data){

			$("#yj_code").append(data); 
		 }
		 
	 })
 }
 
</script>

<style type="text/css">

.addInfoTable {border:1px solid gray; 
			  width:80%;
			  display: relative; 
			  margin-top: 10%;
			   }
			   
.addInfoTable tr {border:1px solid gray; font-size: 10pt; padding:2% }
.addInfoTable td {border:1px solid gray; font-size: 10pt; padding:2% }

 
</style>

<title>관광지 추가</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div id="cd_content" style="width:100%; " align="center">
<form id="addtrfrm" action="admintrinst.tp" method = "post"  enctype="multipart/form-data" >
	<table class="addInfoTable">
		      <tr>
		        <td colspan="3" align="center" >
			        <span style="font-size:25pt; font-weight: bold; display:inline-table;" >
			        관광지 추가
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
		      	<td align="left"><input type="text" name="t_name" /></td>
		      </tr>
		      <tr>
		      	<td align="center">소개</td>
		      	<td align="left"><input type="text" name="t_detail" /></td>
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
		      	<td align="left"><input type="text" name="t_addr" style="width: 300px;" /></td>
		      </tr>
		      <tr>
		      	<td align="center">관광지 위치</td>
		      	<td align="left"> x : <input type="text" name="tx" /><br/><br/>
		      						y : <input type="text" name="ty" /></td>
		      </tr>
		</table>
		<br>
		<hr>
		<br>
			<div align="center">
				<button type="button" class="btn btn-default" onclick="addtr();" >관광지 추가</button>
				<button type="reset" class="btn btn-default" >초기화</button>
			</div>
</form>
</div>
</body>
</html>
