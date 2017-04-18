<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#gh_chatroom {
		width: 100%;
		height: 85%;
		border-bottom: 1px solid gray;
		overflow-y: auto;
	}
	
	#gh_chatinput {
		margin: 4% 0 0 4%;
		width: 100%;
	}
	
	#chatMsg {
		margin: 0 2% 0 1%;
		width: 65%;
	}
	
	.gh_date {
		text-align: center;
		color: gray;
	}
	
	.gh_send {
		padding: 3px 5px 3px 5px;
		background-color: pink;
		border-radius: 5px;
		float: right;
		margin-right: 3%;
	}
	
	.gh_sendTime {
		color: gray;
		float: right;
		margin-right: 3%;
	}
	
	.gh_receiveTime {
		color: gray;
		float: left;
		margin-left: 3%;
	}
	
	.gh_receive {
		padding: 3px 5px 3px 5px;
		background-color: pink;
		border-radius: 5px;
		float: left;
		margin-left: 3%;
	}
	
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
 
 	var temp = 0;
 	var send = 0;
 	var bfchatcount = 0;
 	var chatcount = 0;
 	
	$(document).ready(function(){
		
		startAjaxCalls();
		
		$("#chatMsg").focus(function(){
			
			$(this).keydown(function(event){
				if(event.keyCode == 13)
				{
					if(send == 0)
					{
						sendMsg();
						sned = 1;
					}
					event.preventDefault();
				}
			})
			
		})
			
	}); // end of $(document).ready() -------------
	
	function startAjaxCalls() {
		
		getChat();
		
 		setTimeout(function() {
				startAjaxCalls();
		} , 100); 
		
	}// end of startAjaxCalls()----------------
	
	function getChat()
	{
		$.ajax({
			 url: "/triplan/callChatroom.tp",
			 type: "POST",
			 data: 
				{ roomNo : $("#roomNo").val() },  // 전송해야할 데이터
			 dataType: "json", 
			 success: function(data) {
				 
				var html = "";
				var date = '';
				var time = '';
				var beforeDate = '';
				var msg = "";
				chatcount = 0;
				
				$.each(data, function(entryIndex, entry){
					
					date = entry.regDate.substring(0, 10);
					time = entry.regDate.substring(10, 16);
					
					if(date != beforeDate)
					{
						html += "<div class='gh_date'>" + date + "</div><br/>";
					}
					
					if(entry.userid == "${userid}") // 보낸 메세지일 경우
					{
						
						html += "<span class='gh_send'>" + entry.chatMsg + "</span> <br/>";
						html += "<div class='gh_sendTime'>" + time + "</div> <br/><br/>";
					}
						
					else if(entry.userid != "${userid}") // 받은 메세지일 경우
					{
						html += "<div class='gh_receiveId'>" + entry.userid + "&nbsp; </div>";
						html += "<div gh_sendMsg>";
						html += "<span class='gh_receive'>" + entry.chatMsg + "</span>";
						html += "<div class='gh_receiveTime'>" + time + "</div> <br/><br/>";
					}
					
					beforeDate = date;
					chatcount++;
					
				}); // end of each() -------------
				
				$("#gh_chatroom").html(html);
				if(bfchatcount != chatcount)
				{
					bfchatcount = chatcount;
					$("#gh_chatroom").scrollTop(99999999999999);
				}				
			 }
		});
		
	}
 </script>
 
 <script type="text/javascript">
 
 var send_count = 0;
 
    function sendMsg()
    {
    	if(send_count == 0)
    	{
    		send_count = 1;
	    	$.ajax({
				 url: "/triplan/sendMsg.tp",
				 type: "POST",
				 data: 
					{ 
						roomNo : $("#roomNo").val(), 
						chatMsg : $("#chatMsg").val()
					},  
				 success: function(data) {
					 getChat();
					 $("#chatMsg").val("");
					 send_count = 0;
				 }
			});
    	}
    }
    
</script>
</head>

<body>
 	<h1 style="text-align:center;">*** 채팅 ***</h1>
	<div id="gh_chatroom"></div>
	<div id="gh_chatinput">
		입력 : <input type="text" id="chatMsg" name="chatMsg" />
		<input type="hidden" id="roomNo" value="${sc_idx}" />
		<button type="button" class="btn" style="top:100%" onClick="sendMsg();">전송</button>
	</div>
</body>
</html>