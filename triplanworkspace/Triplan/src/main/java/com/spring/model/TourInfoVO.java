package com.spring.model;

public class TourInfoVO {

	private String t_idx;
	private String de_area_code;
	private String t_name;
	private String t_addr;
	private String t_type;
	private String t_rating;
	private String t_start_date;
	private String t_end_date;
	private String t_detail;
	private String tx;
	private String ty;
	private String commentcount;
	
	public TourInfoVO()
	{
		
	}
	
	public TourInfoVO(String t_idx, String de_area_code, String t_name,
			String t_addr, String t_type, String t_rating, String t_start_date,
			String t_end_date, String t_detail, String tx, String ty, String commentcount)
	{
		this.t_idx = t_idx;
		this.de_area_code = de_area_code;
		this.t_name = t_name;
		this.t_addr = t_addr;
		this.t_type = t_type;
		this.t_rating = t_rating;
		this.t_start_date = t_start_date;
		this.t_end_date = t_end_date;
		this.t_detail = t_detail;
		this.tx = tx;
		this.ty = ty;
		this.commentcount = commentcount;
	}

	public String getT_idx() {
		return t_idx;
	}

	public void setT_idx(String t_idx) {
		this.t_idx = t_idx;
	}

	public String getDe_area_code() {
		return de_area_code;
	}

	public void setDe_area_code(String de_area_code) {
		this.de_area_code = de_area_code;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_addr() {
		return t_addr;
	}

	public void setT_addr(String t_addr) {
		this.t_addr = t_addr;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
	}

	public String getT_rating() {
		return t_rating;
	}

	public void setT_rating(String t_rating) {
		this.t_rating = t_rating;
	}

	public String getT_start_date() {
		return t_start_date;
	}

	public void setT_start_date(String t_start_date) {
		this.t_start_date = t_start_date;
	}

	public String getT_end_date() {
		return t_end_date;
	}

	public void setT_end_date(String t_end_date) {
		this.t_end_date = t_end_date;
	}

	public String getT_detail() {
		return t_detail;
	}

	public void setT_detail(String t_detail) {
		this.t_detail = t_detail;
	}

	public String getTx() {
		return tx;
	}

	public void setTx(String tx) {
		this.tx = tx;
	}

	public String getTy() {
		return ty;
	}

	public void setTy(String ty) {
		this.ty = ty;
	}
	
	public String getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}
	
}
