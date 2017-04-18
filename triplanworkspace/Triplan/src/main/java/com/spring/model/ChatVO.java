package com.spring.model;

public class ChatVO {

	private String roomNo;
	private String userid;
	private String chatMsg;
	private String regDate;
	
	public ChatVO()
	{
		
	}
	
	public ChatVO(String roomNo, String userid, String chatMsg, String regDate)
	{
		this.roomNo = roomNo;
		this.userid = userid;
		this.chatMsg = chatMsg;
		this.regDate = regDate;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getChatMsg() {
		return chatMsg;
	}

	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	} 
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
