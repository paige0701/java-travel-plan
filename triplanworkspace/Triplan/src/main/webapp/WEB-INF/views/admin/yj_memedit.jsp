<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">

function previousTen(start,end){
//alert("does this ");	
	if(start != 1 ){
	start = parseInt(start) - 10 ;
	end = parseInt(end) - 10;
	
	//alert(start);
	//alert(end);
	
	var form_data = { 
			 start : start,
			 end : end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/adminmepaging.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here10").empty;
			$("#here10").html(result);  			
			           
	      }// end of success----------------------
	     
	  });// end of $.ajax();----------------------	
	} else if(start == 1){
		 
	    	  alert("전 페이지가 없습니다.");
	    	  return;
	   
		
	}
}

function nextTen(start,end){
	
	//alert("돼냐...");
	//alert(start);
	//alert(end);
	
	//alert("${totalCount}");
	var total = "${totalCount}";
	//alert(end);
	
	
	if((end > total) || (end == total)){
	
		alert("다음페이지가 없습니다");
		return;
	}
	var start = parseInt(start) + 10;
	var end = parseInt(end) + 10;
	
	//alert("=========");
	//alert(start);
	//alert(end);
	
	
	var form_data = { 
			start:start,
			end:end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/adminmepaging.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here10").empty;
			$("#here10").html(result);  			
			           
	      }// end of success----------------------
	      
	  });// end of $.ajax();----------------------	
	}
	
	
//회원 상태 변경
/* function goOnOff(userid,active) {
	
	$.ajax({
		
		url: "updatemember.tp",
		data: { 
				userid : userid,
				active : active    
		},
		success: function(){
		
			member();
		}
		
	})
	alert("변경되었습니다!");
} */
function goOnOff(userid,active){
	

	$.ajax({
		
		url: "updatemember.tp",
		 	  type: "GET",
		 	 data: { 
					userid : userid,
					active : active    
			},
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
 	
		   		member();
		      }// end of success----------------------
		     
		  });// end of $.ajax();----------------------	
	alert("변경되었습니다!");
	}
</script>

	<div align="center" style="margin-top: 50px;" >
	
		<h2>회원 전체 명단</h2>		
 	  				
 	  				  			
	<p>
	<select name="colName" id="colName">
		<option value="name">이름</option>
		<option value="userid">아이디</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="searchWord" id="searchWord" size="20">
	
	<button type="button" onClick="goSearch();">검색</button>
	
	<p>	 
	 <!-- $5 -->
		<div id="here10">
		<table>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>상태</th>
				<th>활성화 / 비활성화</th>
			</tr>
			
			<hr>

		<c:if test="${mlst == null || empty mlst }">
			<tr>
				<td colspan="z">데이터가 존재하지 않습니다</td>
			</tr>
		</c:if>
		
		<c:if test="${mlst != null || not empty mlst }">
			<c:set var="count" value="0" />
			<c:forEach var="mlst" items="${mlst}" varStatus="status">
				<tr>
					<td>${mlst.name}</td>
					<td>${mlst.userid}</td>
					<td>${mlst.birth1}-${mlst.birth2}-${mlst.birth3}</td>
					<td>${mlst.gender}</td>
					<td>${mlst.email}</td>
					<td>${mlst.mobile}</td>
					<td>
						<c:if test="${mlst.active == 1}">!살아있아!</c:if>
			      		<c:if test="${mlst.active == 0}">!죽었띠!</c:if>
		      		</td>
					<td><a href="#" onclick="goOnOff('${mlst.userid}',1);">활성화</a> / <a href="#" onclick="goOnOff('${mlst.userid}',0);">비활성화</a></td>
					</tr>
					<c:set var="count" value="${status.count }" />			
			</c:forEach>		
		</c:if>
		</table>
	
			
			<%-- <span class="mem_count" >${count}명</span>  --%>
			
<ul class="pager" style="width:50%">
    <li class="previous"><a href="#previous" onClick="previousTen('${start}','${end}')">Previous</a></li>
    <li class="next"><a href="#next" onClick="nextTen('${start}','${end}')">Next</a></li>
</ul>
	</div>
	    <button type="button" onClick="member();" class="btn btn-success">목록보기</button>
	
	<hr>
</div>