package com.spring.model;

public class WishListVO {

	private String userid;
	private String t_idx;
	
	public WishListVO()
	{
	
	}

	public WishListVO(String userid, String t_idx)
	{
		this.userid = userid;
		this.t_idx = t_idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getT_idx() {
		return t_idx;
	}

	public void setT_idx(String t_idx) {
		this.t_idx = t_idx;
	}
	
}
