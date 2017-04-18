package com.spring.model;

public class MemberVO {

	private String userid;
	private String password;
	private String name;
	private String gender;
	
	private String birth1;
	private String birth2;
	private String birth3;
	
	private String email;
	private String mobile;
	private String active;
	
	public MemberVO()
	{
		
	}

	public MemberVO(String userid, String password, String name, String gender,
			String birth1, String birth2, String birth3, String email,
			String mobile, String active) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth1 = birth1;
		this.birth2 = birth2;
		this.birth3 = birth3;
		this.email = email;
		this.mobile = mobile;
		this.active = active;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth1() {
		return birth1;
	}

	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}

	public String getBirth2() {
		return birth2;
	}

	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}

	public String getBirth3() {
		return birth3;
	}

	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	
}
