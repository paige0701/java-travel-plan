package com.spring.model;

public class ScheduleVO {

	private String sc_idx;
	private String sc_name;
	private String sc_start_date;
	private String sc_end_date;
	private String sc_days;
	private String sc_tag;
	private String sc_likecount;
	private String sc_viewcount;
	
	public ScheduleVO()
	{
		
	}

	public ScheduleVO(String sc_idx, String sc_name, String sc_start_date,
			String sc_end_date, String sc_days, String sc_tag,
			String sc_likecount, String sc_viewcount)
	{
		this.sc_idx = sc_idx;
		this.sc_name = sc_name;
		this.sc_start_date = sc_start_date;
		this.sc_end_date = sc_end_date;
		this.sc_days = sc_days;
		this.sc_tag = sc_tag;
		this.sc_likecount = sc_likecount;
		this.sc_viewcount = sc_viewcount;
	}

	public String getSc_idx() {
		return sc_idx;
	}

	public void setSc_idx(String sc_idx) {
		this.sc_idx = sc_idx;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public String getSc_start_date() {
		return sc_start_date;
	}

	public void setSc_start_date(String sc_start_date) {
		this.sc_start_date = sc_start_date;
	}

	public String getSc_end_date() {
		return sc_end_date;
	}

	public void setSc_end_date(String sc_end_date) {
		this.sc_end_date = sc_end_date;
	}

	public String getSc_days() {
		return sc_days;
	}

	public void setSc_days(String sc_days) {
		this.sc_days = sc_days;
	}

	public String getSc_tag() {
		return sc_tag;
	}

	public void setSc_tag(String sc_tag) {
		this.sc_tag = sc_tag;
	}

	public String getSc_likecount() {
		return sc_likecount;
	}

	public void setSc_likecount(String sc_likecount) {
		this.sc_likecount = sc_likecount;
	}

	public String getSc_viewcount() {
		return sc_viewcount;
	}

	public void setSc_viewcount(String sc_viewcount) {
		this.sc_viewcount = sc_viewcount;
	}
	
}
