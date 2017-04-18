package com.spring.model;

public class InviteVO {

	private String userid;
	private String sc_idx;
	
	public InviteVO()
	{
		
	}
	
	public InviteVO(String userid, String sc_idx)
	{
		this.userid = userid;
		this.sc_idx = sc_idx;
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

}
