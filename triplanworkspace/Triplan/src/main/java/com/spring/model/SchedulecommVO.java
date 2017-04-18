package com.spring.model;

public class SchedulecommVO {

	private String userid;
	private String sc_idx;
	private String content;
	private String status;
	
	public SchedulecommVO()
	{
		
	}
	
	public SchedulecommVO(String userid, String sc_idx, String content,
			String status)
	{
		this.userid = userid;
		this.sc_idx = sc_idx;
		this.content = content;
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSc_idx() {
		return sc_idx;
	}

	public void setSc_idx(String sc_idx) {
		this.sc_idx = sc_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
