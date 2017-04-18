package com.spring.model;

public class AreaDetailVO {

	private String area_code;
	private String de_area_code;
	private String de_area_name;
	private String x;
	private String y;
	
	public AreaDetailVO() 
	{
	
	}

	public AreaDetailVO(String area_code, String de_area_code,
			String de_area_name, String x, String y)
	{
		this.area_code = area_code;
		this.de_area_code = de_area_code;
		this.de_area_name = de_area_name;
		this.x = x;
		this.y = y;
	}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	public String getDe_area_code() {
		return de_area_code;
	}

	public void setDe_area_code(String de_area_code) {
		this.de_area_code = de_area_code;
	}

	public String getDe_area_name() {
		return de_area_name;
	}

	public void setDe_area_name(String de_area_name) {
		this.de_area_name = de_area_name;
	}
	
	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}
	
}
