<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	table, th, td, input, textarea { border: 1px solid gray; } 
	#table {border-collapse: collapse; width: 600px;}
	#table th, #table td {padding: 5px;}
	#table th {width: 120px; background-color: #DDDDDD;} 
	#table td {width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;}
	
</style>

<script type="text/javascript">
	function goWrite() {
		var subj = $("#sy_subject").val().trim();
		var cont = $("#sy_content").val().trim();
		var pass = $("#sy_pw").val().trim();
		if(subj == "")
		{
			alert("제목을 입력하세요.");
		}
		else if(cont == "") {
			alert("내용을 입력하세요.");
		}
		else if(pass == ""){
			alert("암호를 입력하세요.");
		}
		else{
			
			alert("ddd");
			var content = document.getElementById("sy_content").value;

			var subject = document.getElementById("sy_subject").value;
			var pw  = document.getElementById("sy_pw").value;

			
		 var form_data = { 
				fk_seq : "${fk_seq}",
				groupno : "${groupno}",
				depthno :  "${depthno}",
				content: content,
				subject : subject,
				pw:pw
				
		       };
		 
		 	 $.ajax({url: "/triplan/admin_writeOne.tp",
		    	 
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	$("#content").empty;
				$("#content").html(result);  			
				           
		      }// end of success----------------------
		  });// end of $.ajax();----------------------	
						
		}
	}
	
	function board() {
		
		$.ajax({
			
			url: "admin_list.tp",
			success: function(data){
			
				$("#yj_show").html(data);
			
			}
			
		})

	}	
	
</script>

<div class="clear_d">
	<h2>묻고 답하기</h2>
	
	<table id="table">
		<tr>
			<th>USERID</th>
			<td><input type="text" name="userid" class="short" value="admin" readonly /></td>   
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" id="sy_subject" name="subject" class="long" /></td>   
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="sy_content" name="content"  class="long" style="height: 200px;"></textarea></td>   
		</tr>
		
		<!-- #113. 파일첨부 타입 추가하기 -->
		<tr>
			<th>파일첨부</th>
			<td><input type="file" name="attach" id="attach" /></td>
		</tr>
		
		<tr>
			<th>암호</th>
			<td><input type="password" id="sy_pw" name="pw" class="short" /></td>   
		</tr>
	</table>
	
	<br/>
	
	
	<input type="button" value=" 쓰기 " onClick="goWrite();"/>
	<input type="button" value=" 취소 " onClick="board();"/>
	
	
</div>