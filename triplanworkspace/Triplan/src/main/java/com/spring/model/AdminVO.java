package com.spring.model;

public class AdminVO {

	private String adminid;
	private String idx;
	private String password;
	
	public AdminVO()
	{
		
	}
	
	public AdminVO(String adminid, String idx, String password)
	{
		this.adminid = adminid;
		this.idx = idx;
		this.password = password;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getIdx() {
		return idx;
	}
	
	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
