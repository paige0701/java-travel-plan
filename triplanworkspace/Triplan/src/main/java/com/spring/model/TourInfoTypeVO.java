package com.spring.model;

public class TourInfoTypeVO {

	private String type_idx;
	private String type_name;
	
	public TourInfoTypeVO()
	{
		
	}
	
	public TourInfoTypeVO(String type_idx, String type_name)
	{
		this.type_idx = type_idx;
		this.type_name = type_name;
	}

	public String getType_idx()
	{
		return type_idx;
	}

	public void setType_idx(String type_idx)
	{
		this.type_idx = type_idx;
	}

	public String getType_name()
	{
		return type_name;
	}

	public void setType_name(String type_name)
	{
		this.type_name = type_name;
	}
	
}
