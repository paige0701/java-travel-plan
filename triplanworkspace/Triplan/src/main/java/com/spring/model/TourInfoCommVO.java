package com.spring.model;

public class TourInfoCommVO {

	private String userid;
	private String t_idx;
	private String content;
	private String status;
	private String regDate;
	private String rating;
	
	public TourInfoCommVO()
	{
		
	}
	
	public TourInfoCommVO(String userid, String t_idx, String content, String status, String regDate, String rating) 
	{
		this.userid = userid;
		this.t_idx = t_idx;
		this.content = content;
		this.status = status;
		this.regDate = regDate;
		this.rating = rating;
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
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
}
